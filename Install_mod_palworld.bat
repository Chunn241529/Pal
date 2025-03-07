@echo off
chcp 65001 >nul

:: Kiểm tra các đường dẫn mặc định
set "steam_path=C:\Program Files (x86)\Steam"
if not exist "%steam_path%\steamapps\common\Palworld" (
    set "steam_path=C:\Program Files\Steam"
    if not exist "%steam_path%\steamapps\common\Palworld" (
        :: Kiểm tra registry
        for /f "tokens=2*" %%a in ('reg query "HKLM\SOFTWARE\WOW6432Node\Valve\Steam" /v InstallPath 2^>nul') do set "steam_path=%%b"
        if not defined steam_path (
            for /f "tokens=2*" %%a in ('reg query "HKLM\SOFTWARE\Valve\Steam" /v InstallPath 2^>nul') do set "steam_path=%%b"
        )
        if not defined steam_path (
            :: Yêu cầu người dùng nhập đường dẫn
            set /p steam_path="Không thể tìm thấy thư mục Steam. Vui lòng nhập đường dẫn đến thư mục Steam: "
        )
    )
)

:: Kiểm tra xem thư mục Palworld có tồn tại không
if not exist "%steam_path%\steamapps\common\Palworld" (
    echo Lỗi: Không thể tìm thấy thư mục Palworld trong "%steam_path%\steamapps\common"
    exit /b 1
)

echo Bắt đầu tải xuống file video_sẽgay.zip...
curl -L --progress-bar "https://drive.usercontent.google.com/download?id=1PCaIfbCpJ0vU56qJzldJtWuvxEYjEsnR&export=download&authuser=0&confirm=t&uuid=ee4d9ea5-908e-47b8-91ab-5589e605cb29&at=AEz70l4vzKPxKsmRZtEaK8NAjcuQ:1741339478139" -o palworld.zip
if %errorlevel% neq 0 (
    echo Lỗi: Không thể tải xuống file.
    exit /b 1
)

echo Tải xuống thành công.
echo Bắt đầu giải nén file...
powershell -Command "Expand-Archive -Path palworld.zip -DestinationPath '%steam_path%\steamapps\common\Palworld' -Force"
if %errorlevel% neq 0 (
    echo Lỗi: Không thể giải nén file.
    exit /b 1
)
echo Giải nén thành công.

echo Xóa file zip...
del palworld.zip
if %errorlevel% neq 0 (
    echo Cảnh báo: Không thể xóa file zip.
) else (
    echo Đã xóa file zip.
)

echo Hoàn tất.