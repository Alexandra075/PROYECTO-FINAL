USE tienda_online;

-- Mostrar los productos disponibles y ordenarlos de acuerdo a su precio
SELECT c.nombre AS categoria, p.nombre AS producto, p.precio, p.stock
FROM productos p
JOIN categorias c ON p.id_categoria = c.id_categoria
WHERE p.stock > 0
ORDER BY c.nombre ASC, p.precio ASC;