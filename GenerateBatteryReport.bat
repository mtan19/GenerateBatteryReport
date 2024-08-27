echo off

REM Create FolderName and Folder
set FolderName=%USERPROFILE%\Desktop\battery-report
if exist %FolderName% ( echo:Folder "%FolderName%" Already Exists ) else ( echo:Folder "%FolderName%" Doesn't Exist, Creating Folder & mkdir "%FolderName%")

REM Create TimeStamp
set FormattedTime=%time%
set FormattedTime=%FormattedTime::=%
set FormattedTime=%FormattedTime:.=%
set FormattedTime=%FormattedTime: =%
set FormattedTime=%FormattedTime:-=%
REM tried to filter out for characters that cannot exist in a windows file name (<,>,/,\,|,?,*,") but caused the program to malfunction
set FormattedDate=%date%
set FormattedDate=%FormattedDate::=%
set FormattedDate=%FormattedDate:.=%
set FormattedDate=%FormattedDate: =%
set FormattedDate=%FormattedDate:-=%
set TimeStamp=%FormattedDate%-%FormattedTime%

REM Create FilePath (name for the html file)
set FilePath=%FolderName%\battery-report-%TimeStamp%.html

REM Run powercfg /batteryreport
powercfg /batteryreport /output "%FilePath%"

REM Open html file
%FilePath%

echo:Done