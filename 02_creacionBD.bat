echo.
echo 0) Baja todos los contenedores activos...
docker compose down -v

echo.
echo 1) Eliminando información de la carpeta data...
rmdir /s /q data
mkdir data

echo.
echo 2) Levantando contenedor...
docker compose up -d

echo.
echo 3) Esperando a que MariaDB inicie...
timeout /t 45 /nobreak > nul

echo.
echo 4) Entrando a la terminal de MySQL...
docker exec -it mariadb_db mariadb -u root -proot123 entidadesTerritorialesColombia
echo docker exec -it mariadb_db mariadb -u root -proot123 -D entidadesTerritorialesColombia -e "SHOW TABLES;"