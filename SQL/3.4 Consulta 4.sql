USE tienda_online;

-- Ver que productos es necesario reabastecer pronto
SELECT nombre, stock, id_categoria
FROM productos
WHERE stock < 5
ORDER BY stock ASC;