@echo off
cls
echo Siga el proceso de instalacion SIN CAMBIAR NADA...

:: Guardar la carpeta actual del script
set "scriptdir=%~dp0"
cd /d "%scriptdir%"

:: Borrar archivo de log anterior si existe
if exist "%scriptdir%instalacion.log" del /f /q "%scriptdir%instalacion.log"

:: Ejecutar instalador en modo completamente silencioso y esperar a que finalice
start /wait "" "%scriptdir%unified.exe" ^
/VERYSILENT ^
/NORESTART ^
/SUPPRESSMSGBOXES ^
/SP- ^
/CLOSEAPPLICATIONS ^
/LOG="%scriptdir%instalacion.log"

echo Instalación finalizada. Procediendo a limpiar accesos y archivos...

:: Eliminar carpeta 'Unified Remote 3' del Menú Inicio (ProgramData)
rmdir /s /q "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Unified Remote 3"

:: Eliminar carpeta 'Unified Remote' de Documentos
rmdir /s /q "%USERPROFILE%\Documents\Unified Remote"

:: Eliminar acceso directo del Escritorio, por si queda
del "%USERPROFILE%\Desktop\Unified Remote 3.lnk" /f

echo Limpieza completada.
exit
