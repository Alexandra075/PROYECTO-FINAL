USE tienda_online;

-- Primero revisamos cuanto stock tiene el producto 1 antes de la compra
SELECT id_producto, nombre, stock FROM productos WHERE id_producto = 1;

-- Despues ejecutamos el procedimiento haciendo que el cliente 1 compre 2 unidades del producto 1
CALL RegistrarNuevoPedido(1, 1, 2);

-- A continuacion mostramos el pedido recien creado para comprobar que se registro exitosamente
SELECT * FROM pedidos ORDER BY id_pedido DESC LIMIT 1;

-- Por ultimo revisamos nuevamente el stock del producto 1 para demostrar que si disminuyo
SELECT id_producto, nombre, stock FROM productos WHERE id_producto = 1;