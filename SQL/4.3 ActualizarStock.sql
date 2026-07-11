USE tienda_online;
DROP PROCEDURE IF EXISTS ActualizarStock;
DELIMITER //

CREATE PROCEDURE ActualizarStock (
    IN p_producto_id INT,
    IN p_cantidad INT
)
BEGIN
    -- Descontamos la cantidad solicitada del inventario actual del producto
    UPDATE productos
    SET stock = stock - p_cantidad
    WHERE id_producto = p_producto_id;
END //

DELIMITER ;