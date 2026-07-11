USE tienda_online;
-- Prueba del Procedimiento 3: Actualizar stock manualmente
-- 1. Revisamos el stock inicial del producto 2
SELECT id_producto, nombre, stock FROM productos WHERE id_producto = 2;

-- 2. Descontamos 3 unidades usando el procedimiento
CALL ActualizarStock(2, 3);

-- 3. Comprobamos que el stock bajo correctamente
SELECT id_producto, nombre, stock FROM productos WHERE id_producto = 2;