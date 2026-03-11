{{ config(materialized='view') }}

SELECT 
    id_pedido,
    id_usuario,
    monto,
    fecha_pedido
FROM `mi-primer-laboratorio-data.laboratorio_lynxion.pedidos_raw`