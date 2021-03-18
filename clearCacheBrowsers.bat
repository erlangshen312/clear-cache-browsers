@echo off
taskkill /F /IM chrome.exe /T > nul
taskkill /t /im firefox.exe /im crashreporter.exe >nul 

@echo off
set ChromeDir=C:\Users\%USERNAME%\AppData\Local\Google\Chrome\User Data
del /q /s /f "%ChromeDir%"
rd /s /q "%ChromeDir%"

@echo off
set DataDir=C:\Users\%USERNAME%\AppData\Local\Mozilla\Firefox\Profiles
del /q /s /f "%DataDir%"
rd /s /q "%DataDir%"
for /d %%x in (C:\Users\%USERNAME%\AppData\Roaming\Mozilla\Firefox\Profiles\*) do del /q /s /f %%x\*sqlite

@echo off
timeout /t 60
start firefox.exe javascript:document. http://localhost 
