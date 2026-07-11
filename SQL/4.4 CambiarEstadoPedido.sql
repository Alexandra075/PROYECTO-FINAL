USE tienda_online;

DROP PROCEDURE IF EXISTS CambiarEstadoPedido;
DELIMITER //

CREATE PROCEDURE CambiarEstadoPedido (
    IN p_pedido_id INT,
    IN p_nuevo_estado VARCHAR(20)
)
BEGIN
    -- Actualizamos el estado del pedido al nuevo valor solicitado
    UPDATE pedidos
    SET estado = p_nuevo_estado
    WHERE id_pedido = p_pedido_id;
END //

DELIMITER ;