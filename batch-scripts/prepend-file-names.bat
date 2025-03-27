@echo off
setlocal enabledelayedexpansion

rem Change to the directory where the script is run
cd /d "%~dp0"

rem Loop through all files in the directory (use *.* for all files)
for %%f in (*) do (
    rem Check if it's a file (not a directory)
    if not "%%f"=="%~nx0" (
        rem Get the file name without extension
        set "filename=%%~nf"
        rem Get the file extension
        set "extension=%%~xf"

        rem Prepend "test-2-" to the file name and rename
        ren "%%f" "test-2-!filename!!extension!"
    )
)

echo All file names have been updated.
pause
