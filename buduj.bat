@ECHO OFF
notepad build.gradle
notepad E:\Remlas\VacActionSync\latest.json
notepad E:\Remlas\VacActionSync\VACPACK_NOSYNC\paczkuj.bat
echo ---------------BUDUJE---------------
call gradlew clean build
echo ---------------CZYSZCZE---------------
DEL !OUTPUT /Q
echo ---------------KOPIUJE...---------------
XCOPY launcher\build\libs\*-all.jar !OUTPUT\ /Y
XCOPY launcher-bootstrap\build\libs\*-all.jar !OUTPUT\ /Y
XCOPY launcher-builder\build\libs\*-all.jar !OUTPUT\ /Y
XCOPY launcher-fancy\build\libs\*-all.jar !OUTPUT\ /Y
echo ---------------ZMIENIAM LOKALIZACJE---------------
call cd !OUTPUT
echo ---------------ZMIENIAM NAZWY---------------
REN launcher-?.?.?-all.jar VAC-Launcher-Legacy.jar
REN launcher-bootstrap-?.?.?-all.jar VAC-Bootstrap.jar
REN launcher-builder-?.?.?-all.jar VAC-Builer.jar
REN launcher-fancy-?.?.?-all.jar VAC-Launcher.jar
echo ---------------KOPIUJE...---------------
XCOPY VAC-Bootstrap.jar ..\..\..\VacActionSync\launcher\ /Y
XCOPY VAC-Launcher.jar ..\..\..\VacActionSync\launcher\versions\ /Y
XCOPY VAC-Launcher-Legacy.jar ..\..\..\VacActionSync\launcher\versions\ /Y
XCOPY VAC-Builer.jar ..\..\..\VacActionSync\VACPACK_NOSYNC\ /Y
echo ---------------ZMIENIAM LOKALIZACJE---------------
call cd ..\..\..\VacActionSync\launcher\versions\
echo ---------------USTAWIAM PATH---------------
SET PATH=%path%;D:\Program Files\Java\jdk1.8.0_45\bin
echo ---------------PAKUJE LAUNCHER---------------
DEL latest.jar.pack /Q
pack200 --no-gzip latest.jar.pack VAC-Launcher.jar
echo ---------------PAKUJE PACZKE---------------
cd ..\..\VACPACK_NOSYNC\
call paczkuj.bat
cd ..\
XCOPY E:\Remlas\VacActionSync\VACPACK_NOSYNC\OUT /s /i /Y
echo ---------------MY JOB IS DONE---------------
PAUSE