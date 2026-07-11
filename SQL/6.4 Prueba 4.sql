USE tienda_online;
-- Prueba del Procedimiento 4: Cambiar el estado de un pedido
-- Primero revisamos que el pedido esta pendiente
SELECT id_pedido, id_cliente, estado FROM pedidos WHERE id_pedido = 1;

-- Usamos el procedimiento para avanzar su estado a enviado
CALL CambiarEstadoPedido(1, 'enviado');

-- Comprobamos que se haya realizado la actualizacion 
SELECT id_pedido, id_cliente, estado FROM pedidos WHERE id_pedido = 1;