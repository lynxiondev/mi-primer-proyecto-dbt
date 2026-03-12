/* Este es un modelo de Staging. 
   Aquí limpiamos los datos antes de usarlos.
*/

{{ config(materialized='table') }}



SELECT 
    id as id_usuario,
    -- Ponemos el nombre en mayúsculas (Limpieza de datos!)
    UPPER(nombre) as nombre_limpio,
    -- Nos aseguramos de que la fecha sea tipo DATE
    CAST(fecha_registro AS DATE) as fecha_formateada
FROM {{ source('bq_tienda', 'usuarios_raw') }} 