@echo off
title AI Translator Launcher
echo 正在啟動本地翻譯伺服器...
echo 請確保電腦已安裝 Node.js (npx) 或 Python。
echo.

:: 嘗試使用 npx (Node.js) 啟動
where npx >nul 2>1
if %errorlevel% equ 0 (
    echo [偵測到 Node.js] 正在使用 npx serve 啟動...
    start http://localhost:3000
    npx -y serve . -p 3000
    goto end
)

:: 若無 Node.js，嘗試使用 Python
where python >nul 2>1
if %errorlevel% equ 0 (
    echo [偵測到 Python] 正在使用 http.server 啟動...
    start http://localhost:3000
    python -m http.server 3000
    goto end
)

echo [錯誤] 找不到 npx 或 python，請先安裝環境。
pause

:end
