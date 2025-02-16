@REM this calls the python sript to bundle this mod into a zip and put it in the Factorio mods directory

@echo off
@REM python ".\mod-updater.py" --factoriodir="%appdata%/Factorio"
python ".\mod-updater.py" 
echo mod updated; zip folder placed in C:/Development/Modding/b41-bomb
echo
PAUSE
