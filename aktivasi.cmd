@echo off
setlocal
title Activation Setup

set "REG_URL=https://raw.githubusercontent.com/luqmanhaidar/activation/main/aktivasi.reg"
set "TEMP_REG=%TEMP%\nawasoft-aktivasi.reg"

echo.
echo ======================================
echo       ACTIVATION SETUP
echo ======================================
echo.

where curl >nul 2>&1
if errorlevel 1 (
  echo ERROR: curl tidak ditemukan. Gunakan Windows 10/11 terbaru.
  pause
  exit /b 1
)

echo ambil aktivasi
curl -fL "%REG_URL%" -o "%TEMP_REG%"
if errorlevel 1 (
  echo ERROR: Gagal mengambil file REG.
  del "%TEMP_REG%" >nul 2>&1
  pause
  exit /b 1
)

echo Mengimpor konfigurasi ke Registry pengguna...
reg import "%TEMP_REG%"
if errorlevel 1 (
  echo ERROR: Import Registry gagal.
  del "%TEMP_REG%" >nul 2>&1
  pause
  exit /b 1
)

del "%TEMP_REG%" >nul 2>&1
echo.
echo Konfigurasi berhasil dipasang.
echo Buka aplikasi untuk melanjutkan validasi lisensi online.
echo.
pause
endlocal
