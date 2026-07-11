USE tienda_online;
DROP PROCEDURE IF EXISTS RegistrarNuevoPedido;
DELIMITER //

CREATE PROCEDURE RegistrarNuevoPedido (
    IN p_cliente_id INT,
    IN p_producto_id INT,
    IN p_cantidad INT
)
BEGIN
    -- Declaramos variables para guardar lo que vamos a consultar
    DECLARE v_pendientes INT;
    DECLARE v_stock_actual INT;
    DECLARE v_precio DECIMAL(10,2);
    DECLARE v_nuevo_pedido_id INT;

    -- Primero verificamos la cantidad de pedidos pendientes que tiene el cliente
    SELECT COUNT(*) INTO v_pendientes
    FROM pedidos
    WHERE id_cliente = p_cliente_id AND estado = 'pendiente';

    -- Verificamos el stock y precio del producto slicitado 
    SELECT stock, precio INTO v_stock_actual, v_precio
    FROM productos
    WHERE id_producto = p_producto_id;

   -- Ponemos las condiciones para saber si se puede continuar o no con la compra
    IF v_pendientes >= 5 THEN
        -- Si tiene 5 pedidos pendientes, le mandamos un error
        SIGNAL SQLSTATE '45001' SET MESSAGE_TEXT = 'Error: Ya se tiene el maximo de pedidos pendientes';
        
    ELSEIF v_stock_actual < p_cantidad THEN
        -- Si pno tenemos stock suficiente, le mandamos un error
        SIGNAL SQLSTATE '45002' SET MESSAGE_TEXT = 'Error: Stock insuficiente para realizar el pedido.';
        
    ELSE
        -- Si se llego a este punto entonces realizamos el pedido 
        INSERT INTO pedidos (id_cliente, estado) VALUES (p_cliente_id, 'pendiente');
        
        -- Obtenemos el ID del pedido que se acaba de crear para poder usarlo como llave foranea 
        SET v_nuevo_pedido_id = LAST_INSERT_ID();

        -- Insertamos la nueva informacion en la tabla de detalles_pedido
        INSERT INTO detalles_pedido (id_pedido, id_producto, cantidad, precio_unitario)
        VALUES (v_nuevo_pedido_id, p_producto_id, p_cantidad, v_precio);

        -- Decrementamos el stock para futuras compras 
        UPDATE productos
        SET stock = stock - p_cantidad
        WHERE id_producto = p_producto_id;
        
    END IF;
END //

DELIMITER ;