@echo off
setlocal
set "script_dir=%~dp0"
set "config_path=%APPDATA%\Realera\Realera"

:: Create a backup of the config.otml file
echo Creating backup of config.otml...
copy "%config_path%\config.otml" "%config_path%\config_backup.otml"

:: Modify the content of the config.otml file using PowerShell
powershell -NoProfile -Command ^
  "$text = Get-Content '%config_path%\config.otml' -Raw; $replacement = Get-Content '%script_dir%map_rocks.yaml' -Raw; $text = $text.Replace('rocks_bigos', $replacement); Set-Content '%config_path%\config.otml' $text"

echo Backup completed. Changes have been applied to config.otml.
pause
