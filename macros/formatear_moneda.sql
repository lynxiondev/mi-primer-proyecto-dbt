{% macro formatear_monto(columna, decimales=2) %}
    ROUND(CAST({{ columna }} AS FLOAT64), {{ decimales }})
{% endmacro %} 