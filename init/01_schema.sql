CREATE DATABASE IF NOT EXISTS entidadesTerritorialesColombia;
USE entidadesTerritorialesColombia;

CREATE TABLE IF NOT EXISTS region (
    idRegion INT PRIMARY KEY AUTO_INCREMENT,
    nombreRegion VARCHAR(250) NOT NULL
);

CREATE TABLE IF NOT EXISTS departamento (
    idDepartamento INT PRIMARY KEY,
    idRegion INT,
    nombreDepartamento VARCHAR(250) NOT NULL,
    CONSTRAINT fk_departamento_region
        FOREIGN KEY (idRegion) REFERENCES region(idRegion)
);

CREATE TABLE IF NOT EXISTS municipio (
    idMunicipio varchar(20) PRIMARY KEY,
    idDepartamento INT,
    nombreMunicipio VARCHAR(250) NOT NULL,
    CONSTRAINT fk_municipio_departamento
        FOREIGN KEY (idDepartamento) REFERENCES departamento(idDepartamento)
);

CREATE TABLE IF NOT EXISTS datosTemporales (
    nombreRegion varchar(250),
    codigoDepartamento varchar(250),
    nombreDepartamento varchar(250),
    codigoMunicipio varchar(250),
    nombreMunicipio varchar(250)
);

LOAD DATA INFILE '/var/lib/mysql-files/Departamentos_y_municipios_de_Colombia_20241031.csv'
INTO TABLE datosTemporales
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(nombreRegion, codigoDepartamento, nombreDepartamento, codigoMunicipio, nombreMunicipio);

INSERT INTO region (nombreRegion)
SELECT DISTINCT nombreRegion
FROM datosTemporales;

INSERT INTO departamento (idDepartamento, idRegion, nombreDepartamento)
SELECT DISTINCT
    CAST(dt.codigoDepartamento AS UNSIGNED),
    r.idRegion,
    dt.nombreDepartamento
FROM datosTemporales dt
INNER JOIN region r 
    ON r.nombreRegion = dt.nombreRegion;

INSERT INTO municipio (idMunicipio, idDepartamento, nombreMunicipio)
SELECT DISTINCT
    REPLACE(dt.codigoMunicipio, '.', '-') AS idMunicipio,
    CAST(SUBSTRING_INDEX(dt.codigoMunicipio, '.', 1) AS UNSIGNED) AS idDepartamento,
    dt.nombreMunicipio
FROM datosTemporales dt;

DROP TABLE datosTemporales;