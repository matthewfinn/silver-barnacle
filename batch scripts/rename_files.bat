@echo off
:: Enable delayed variable expansion for string manipulation
setlocal enabledelayedexpansion

:: Loop through all files in the current folder that contain "-" or "_"
for %%F in (*-*.txt *-*.jpg *_*.txt *_*.jpg *_*.pdf) do (
    :: Store the original filename in a variable
    set "newname=%%F"

    :: Replace underscores (_) with spaces
    set "newname=!newname:_= !"

    :: Replace hyphens (-) with spaces
    set "newname=!newname:-= !"

    :: Rename the file if the new name is different
    ren "%%F" "!newname!"
)

:: Notify the user that renaming is complete
echo Renaming completed.
pause
