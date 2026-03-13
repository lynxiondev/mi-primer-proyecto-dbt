SELECT 
    id_pedido,
    id_usuario,
    {{ formatear_monto('monto') }} as monto,
    fecha_pedido, 
    {{ obtener_fecha_carga() }} as cargado_at
FROM {{ source('bq_tienda', 'pedidos_raw') }} 