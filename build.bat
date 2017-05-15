@echo off
call gradlew clean build


pack200 --no-gzip latest.jar.pack D:\WORKSPACE\GitHub\VAC-Launcher\launcher-fancy\build\libs\launcher-fancy-4.3-SNAPSHOT-all.jar

pause