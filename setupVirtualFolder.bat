@echo off
REM ======================================================
REM  Setup Vitro ARG Commerce repo + symlink for AOSService
REM  Stops services safely, clones repo, creates symlink
REM ======================================================

SETLOCAL ENABLEDELAYEDEXPANSION
TITLE Setup Vitro ARG Commerce

REM --- Check for Administrator privileges ---
net session >nul 2>&1
if %errorLevel% NEQ 0 (
    echo ERROR: This script requires Administrator privileges.
    echo Please run as Administrator.
    pause
    exit /b 1
)

REM --- Configuration ---
SET AOS_PACKAGES_DIR=K:\AosService\PackagesLocalDirectory
SET TARGET_DIR=K:\VitroARG
SET SYMLINK_TARGET=K:\VitroARG\Metadata\VitroARG
SET SYMLINK_LINK=%AOS_PACKAGES_DIR%\VitroARG

REM --- Verify AosService directory exists ---
IF NOT EXIST "%AOS_PACKAGES_DIR%" (
    echo ERROR: PackagesLocalDirectory not found at %AOS_PACKAGES_DIR%
    echo This may not be a D365 F&O development VM or the path may be different.
    pause
    exit /b 1
)


echo.
echo ============================================
echo   STEP 3: Create symlink in PackagesLocalDirectory
echo ============================================

IF NOT EXIST "%SYMLINK_TARGET%" (
    echo ERROR: Target folder not found: %SYMLINK_TARGET%
    echo Repository structure may be incorrect.
    goto :cleanup
)

REM Backup existing folder if it's not a symlink
IF EXIST "%SYMLINK_LINK%" (
    fsutil reparsepoint query "%SYMLINK_LINK%" >nul 2>&1
    if %ERRORLEVEL% NEQ 0 (
        echo WARNING: %SYMLINK_LINK% exists and is NOT a symlink
        echo Creating backup at %SYMLINK_LINK%.backup
        move "%SYMLINK_LINK%" "%SYMLINK_LINK%.backup"
    ) else (
        echo Removing existing symlink at %SYMLINK_LINK%...
        rmdir "%SYMLINK_LINK%" 2>nul
    )
)

echo Creating symbolic link...
mklink /D "%SYMLINK_LINK%" "%SYMLINK_TARGET%"
if %ERRORLEVEL% NEQ 0 (
    echo ERROR: Failed to create symbolic link.
    echo Make sure you have Administrator privileges.
    goto :cleanup
)

echo.
echo ✅ Symlink created successfully:
echo     %SYMLINK_LINK%
echo     → %SYMLINK_TARGET%
echo.

:cleanup
echo.
echo ============================================
echo   STEP 4: Restart services
echo ============================================

sc query w3svc >nul 2>&1
if %ERRORLEVEL% EQU 0 (
    echo Starting IIS (w3svc) service...
    net start w3svc
    timeout /t 3 /nobreak >nul
)

sc query DynamicsAXBatch >nul 2>&1
if %ERRORLEVEL% EQU 0 (
    echo Starting DynamicsAXBatch service...
    net start DynamicsAXBatch
    timeout /t 3 /nobreak >nul
)

REM Verify services are running
sc query w3svc | findstr RUNNING >nul 2>&1
if %ERRORLEVEL% NEQ 0 (
    echo WARNING: w3svc service failed to start properly
    echo You may need to restart the VM or check IIS configuration
)

sc query DynamicsAXBatch | findstr RUNNING >nul 2>&1
if %ERRORLEVEL% NEQ 0 (
    echo WARNING: DynamicsAXBatch service failed to start properly
    echo You may need to restart the VM
)

echo.
echo ============================================
echo   Setup complete!
echo ============================================
echo.
echo Next steps:
echo 1. Open Visual Studio
echo 2. Build the VitroARG model
echo 3. Synchronize the database if needed
echo.
pause
ENDLOCAL