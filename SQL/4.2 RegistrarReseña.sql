USE tienda_online;
DROP PROCEDURE IF EXISTS RegistrarResena;
DELIMITER //

CREATE PROCEDURE RegistrarResena (
    IN p_cliente_id INT,
    IN p_producto_id INT,
    IN p_calificacion INT,
    IN p_comentario TEXT
)
BEGIN
    -- Declaramos una variable para guardar la cantidad de veces que ha comprado el producto
    DECLARE v_comprado INT;

    -- Primero buscamos en los pedidos para confirmar que el cliente realmente compro este producto
    SELECT COUNT(*) INTO v_comprado
    FROM pedidos p
    JOIN detalles_pedido dp ON p.id_pedido = dp.id_pedido
    WHERE p.id_cliente = p_cliente_id AND dp.id_producto = p_producto_id;

    -- Ponemos las condiciones para saber si se puede continuar
    IF v_comprado = 0 THEN
        -- Si no lo ha comprado, le mandamos un error
        SIGNAL SQLSTATE '45003' SET MESSAGE_TEXT = 'Error: No se puede dar resena de un producto no comprado';
        
    ELSE
        -- Si se llego a este punto entonces guardamos la resena en la tabla
        INSERT INTO resenas (id_cliente, id_producto, calificacion, comentario)
        VALUES (p_cliente_id, p_producto_id, p_calificacion, p_comentario);
        
    END IF;
END //

DELIMITER ;