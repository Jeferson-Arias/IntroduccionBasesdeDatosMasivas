# Proyecto: Contenedor MariaDB + Automatización de Base de Datos

## 📌 Objetivo del Proyecto

El propósito de este proyecto es desplegar un contenedor Docker que ejecute un Sistema Gestor de Base de Datos (SGBD), específicamente MariaDB.

El flujo automatizado permite:

- Crear la base de datos.
- Ejecutar scripts SQL iniciales.
- Distribuir la información en sus respectivas tablas.
- Eliminar datos redundantes.
- Garantizar que todo el proceso se ejecute de forma controlada y repetible.

Toda la ejecución se encuentra orquestada mediante archivos `.bat`, permitiendo automatizar el ciclo completo desde Windows.

---

## Arquitectura General

El proyecto trabaja bajo el siguiente esquema:

1. Inicialización de Docker.
2. Construcción y levantamiento del contenedor MariaDB.
3. Ejecución automática del script `database.sql`.
4. Procesamiento y normalización de datos.
5. Finalización con entorno listo para consultas.

---

## ⚙️ Requisitos Previos

Antes de ejecutar el proyecto, asegúrese de tener instalado:

- Docker Desktop
- Visual Studio Code (opcional, pero recomendado)
- Sistema operativo Windows

Verifique que Docker se encuentre en ejecución antes de iniciar el proceso. (Aunque el `.bat` se encarga de abrir docker de manera inicial)

---

## Ejecución del Proyecto

El proyecto se ejecuta desde el archivo principal:

### `01_encadenador.bat`

Desde la raíz del proyecto, abra una terminal (CMD o PowerShell) y ejecute:

```bash
.\01_encadenador.bat