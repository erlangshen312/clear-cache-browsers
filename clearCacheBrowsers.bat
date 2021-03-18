@echo off
echo -------------------SHUTDOWN CHROME AND FIREFOX-------------------
taskkill /F /IM chrome.exe /T > nul
taskkill /t /im firefox.exe /im crashreporter.exe >nul 

@echo off
echo -------------------CLEAR CHROME-------------------
set ChromeDir=C:\Users\%USERNAME%\AppData\Local\Google\Chrome\User Data
del /q /s /f "%ChromeDir%"
rd /s /q "%ChromeDir%"

@echo off
echo -------------------CLEAR FIREFOX-------------------
set DataDir=C:\Users\%USERNAME%\AppData\Local\Mozilla\Firefox\Profiles
del /q /s /f "%DataDir%"
rd /s /q "%DataDir%"
for /d %%x in (C:\Users\%USERNAME%\AppData\Roaming\Mozilla\Firefox\Profiles\*) do del /q /s /f %%x\*sqlite

@echo off
timeout /t 5
echo -------------------START FIREFOX-------------------
start firefox.exe javascript:document. http://mothercare.ru 
