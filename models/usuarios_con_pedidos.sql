WITH usuarios AS (
    SELECT * FROM {{ ref('stg_usuarios_limpios') }}
),

pedidos AS (
    SELECT 
        id_usuario, 
        SUM(monto) AS total_gastado,
        COUNT(id_pedido) AS cantidad_pedidos
    FROM {{ ref('stg_pedidos') }}
    GROUP BY 1
)

SELECT 
    u.id_usuario,
    u.nombre_limpio,
    COALESCE(p.total_gastado, 0) AS total_gastado,
    COALESCE(p.cantidad_pedidos, 0) AS total_pedidos
FROM usuarios u
LEFT JOIN pedidos p ON u.id_usuario = p.id_usuario