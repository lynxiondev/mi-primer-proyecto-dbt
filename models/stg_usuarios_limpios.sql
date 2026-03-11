/* Este es un modelo de Staging. 
   Aquí limpiamos los datos antes de usarlos.
*/

{{ config(materialized='table') }}

WITH datos_crudos AS (
    SELECT 
        1 as id_usuario, 
        'lYnXiOn' as nombre_usuario, 
        '2026-03-06' as fecha_registro
)

SELECT 
    id_usuario,
    -- Ponemos el nombre en mayúsculas (Limpieza de datos!)
    UPPER(nombre_usuario) as nombre_limpio,
    -- Nos aseguramos de que la fecha sea tipo DATE
    CAST(fecha_registro AS DATE) as fecha_formateada
FROM datos_crudos