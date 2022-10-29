@echo off

platform-tools\adb.exe connect %1
echo Click [Allow] before continuing.
Pause

platform-tools\adb.exe install %2
Pause