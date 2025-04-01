# ADB Commands


[adb-cheat-sheet](https://www.automatetheplanet.com/adb-cheat-sheet/)


adb shell
run-as app.package.name
cd /data/data/app.package.name/databases/

// -s to give device id -d to push over USB 
adb -s device-id -d install path-to-sdk.apk


adb -d shell "run-as app.package.name cat /data/data/ app.package.name/databases/locallogdb" > locallogdb.sqlite
