rmdir /Q /S vm
mkdir vm

move cgame.qvm vm
move qagame.qvm vm
move ui.qvm vm

del /f qpak0.pk3
rem ren "vm.zip" "qpak0.pk3"

powershell Compress-Archive vm qpak0.zip
ren "qpak0.zip" "qpak0.pk3"

del cgame.jts
del qagame.jts
del ui.jts

rmdir /s /q cgame
rmdir /s /q game
rmdir /s /q ui

rmdir /s /q vm

copy /Y "qpak0.pk3" "C:\travail\Quake3e_VRAPI\app\android_folder_pk3"

move /Y "qpak0.pk3" "C:\travail\Quake3e_VRAPI\app\src\main\jni\Quake3e-master\code\win32\msvc2017\output\baseq3"