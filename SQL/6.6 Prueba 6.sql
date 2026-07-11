USE tienda_online;
-- Prueba del Procedimiento 6: No permitir agregar dos productos nuevos que sean iguales
-- Primero agregamos un nuevo producto al inventario
CALL AgregarProducto('Teclado Mecanico', 'Teclado RGB switch rojo', 850.50, 15, 1);

-- Despues intentamos agregar exactamente el mismo producto para forzar el error de duplicado
CALL AgregarProducto('Teclado Mecanico', 'Teclado RGB switch rojo', 850.50, 15, 1);

-- A continuacion verificamos que el producto solo se guardo una vez en la base de datos
SELECT id_producto, nombre, stock, id_categoria FROM productos WHERE nombre = 'Teclado Mecanico';