USE tienda_online;

-- Mostrar los 5 productos mejor calificads 
SELECT p.nombre AS producto, ROUND(AVG(r.calificacion), 2) AS calificacion_promedio,
       COUNT(r.id_resena) AS total_resenas
FROM productos p
JOIN resenas r ON p.id_producto = r.id_producto
GROUP BY p.id_producto
ORDER BY calificacion_promedio DESC
LIMIT 5;