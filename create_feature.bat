@echo off
set /p parentFolder=Enter the name of the feature: 

REM Define the full path
set "basePath=lib\app\features\%parentFolder%"

REM Create the main parent folder inside lib\app\features
mkdir "%basePath%"

REM Create main subfolders inside the parent folder
mkdir "%basePath%\data"
mkdir "%basePath%\logic"
mkdir "%basePath%\ui"

REM Create subfolders inside data
mkdir "%basePath%\data\model"
echo # model > "%basePath%\data\model\readme.md"
mkdir "%basePath%\data\sources"
echo # sources > "%basePath%\data\sources\readme.md"

REM Create subfolders inside logic
mkdir "%basePath%\logic\cubits"
echo # cubits > "%basePath%\logic\cubits\readme.md"
mkdir "%basePath%\logic\states"
echo # states > "%basePath%\logic\states\readme.md"

REM Create subfolder inside ui
mkdir "%basePath%\ui\widgets"
echo # widgets > "%basePath%\ui\widgets\readme.md"

echo Folder structure with readme.md files created successfully inside "%basePath%"!
pause