echo off
set FolderName=%USERPROFILE%\Desktop\battery-report
if exist %FolderName% ( echo:Folder "%FolderName%" Already Exists ) else ( echo:Folder "%FolderName%" Doesn't Exist, Creating Folder & mkdir "%FolderName%")
set TimeStamp=%DATE:~0,2%%DATE:~3,3%%DATE:~7,2%-%time:~0,2%%time:~3,2%%time:~6,2%
set FilePath=%FolderName%\battery-report-%TimeStamp%.html
powercfg /batteryreport /output "%FilePath%"
%FilePath%
echo:Done