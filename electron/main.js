const { app, BrowserWindow, dialog } = require("electron");
const { spawn } = require("node:child_process");
const http = require("node:http");
const path = require("node:path");

const ROOT = path.resolve(__dirname, "..");
const PORT = Number(process.env.PORT || 4783);
const BASE_URL = `http://127.0.0.1:${PORT}`;
const READY_TIMEOUT_MS = 30000;
const READY_INTERVAL_MS = 200;

let mainWindow = null;
let serverProcess = null;
let shuttingDown = false;

const gotLock = app.requestSingleInstanceLock();
if (!gotLock) {
  app.quit();
} else {
  app.on("second-instance", () => {
    if (mainWindow) {
      if (mainWindow.isMinimized()) mainWindow.restore();
      mainWindow.focus();
    }
  });

  app.whenReady().then(boot).catch(failAndQuit);

  app.on("window-all-closed", () => {
    app.quit();
  });

  app.on("before-quit", () => {
    shuttingDown = true;
    stopServer();
  });
}

async function boot() {
  await startServer();
  await waitForReady();
  createWindow();
}

function startServer() {
  return new Promise((resolve, reject) => {
    serverProcess = spawn("node", ["server.js"], {
      cwd: ROOT,
      env: {
        ...process.env,
        STUDY_DESKTOP: "1",
        PORT: String(PORT)
      },
      stdio: ["ignore", "pipe", "pipe"],
      shell: process.platform === "win32",
      windowsHide: true
    });

    let settled = false;
    const settleOk = () => {
      if (settled) return;
      settled = true;
      resolve();
    };
    const settleErr = err => {
      if (settled) return;
      settled = true;
      reject(err);
    };

    serverProcess.stdout.on("data", chunk => {
      process.stdout.write(chunk);
      if (String(chunk).includes("已启动")) settleOk();
    });
    serverProcess.stderr.on("data", chunk => {
      process.stderr.write(chunk);
    });
    serverProcess.on("error", settleErr);
    serverProcess.on("exit", code => {
      if (shuttingDown) return;
      settleErr(new Error(`本地服务意外退出（code ${code ?? "?"}）`));
      if (mainWindow) {
        dialog.showErrorBox("公考学习追踪", "本地服务已退出，窗口将关闭。");
        app.quit();
      }
    });

    // spawn 成功即可继续轮询端口；「已启动」日志只是加速
    setTimeout(settleOk, 50);
  });
}

function waitForReady() {
  const deadline = Date.now() + READY_TIMEOUT_MS;
  return new Promise((resolve, reject) => {
    const tryOnce = () => {
      if (shuttingDown) {
        reject(new Error("启动已取消"));
        return;
      }
      const req = http.get(`${BASE_URL}/`, res => {
        res.resume();
        if (res.statusCode && res.statusCode < 500) {
          resolve();
          return;
        }
        retry();
      });
      req.on("error", retry);
      req.setTimeout(1000, () => {
        req.destroy();
        retry();
      });
    };
    const retry = () => {
      if (Date.now() >= deadline) {
        reject(new Error(`等待本地服务超时（${BASE_URL}）`));
        return;
      }
      setTimeout(tryOnce, READY_INTERVAL_MS);
    };
    tryOnce();
  });
}

function createWindow() {
  mainWindow = new BrowserWindow({
    width: 1280,
    height: 800,
    minWidth: 960,
    minHeight: 640,
    title: "公考学习追踪",
    show: false,
    webPreferences: {
      nodeIntegration: false,
      contextIsolation: true
    }
  });

  mainWindow.once("ready-to-show", () => {
    mainWindow.show();
  });

  mainWindow.on("closed", () => {
    mainWindow = null;
  });

  mainWindow.loadURL(BASE_URL);
}

function stopServer() {
  if (!serverProcess || serverProcess.killed) return;
  const child = serverProcess;
  serverProcess = null;
  try {
    if (process.platform === "win32" && child.pid) {
      // /T 结束整棵进程树，避免关窗后 node 仍占端口
      spawn("taskkill", ["/pid", String(child.pid), "/T", "/F"], {
        stdio: "ignore",
        windowsHide: true
      });
    } else {
      child.kill("SIGTERM");
    }
  } catch {
    // ignore
  }
}

async function failAndQuit(error) {
  console.error(error);
  stopServer();
  await dialog.showErrorBox(
    "公考学习追踪启动失败",
    error?.message || String(error)
  );
  app.exit(1);
}
