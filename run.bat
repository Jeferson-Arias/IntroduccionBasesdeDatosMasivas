@echo off
echo INICIANDO PROGRAMAS

start "" "C:\Program Files\Docker\Docker\Docker Desktop.exe"
start "" code .

echo.
echo Esperando a que Docker Desktop este listo...

:waitDocker
docker info >nul 2>nul
if errorlevel 1 (
    timeout /t 3 /nobreak >nul
    goto waitDocker
)

echo.
echo Docker listo.

echo.
echo 0) Baja todos los contenedores activos...
docker compose down -v

echo.
echo 1) Eliminando carpeta data...
rmdir /s /q data
mkdir data

echo.
echo 2) Levantando contenedor...
docker compose up -d

echo.
echo 3) Esperando a que MySQL inicie...
timeout /t 10 /nobreak > nul

echo.
echo 4) Entrando a la terminal de MySQL...
docker exec -it mysql_db mysql -u root -proot123