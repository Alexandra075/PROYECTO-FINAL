USE tienda_online;
DROP PROCEDURE IF EXISTS ActualizarCliente;
DELIMITER //

CREATE PROCEDURE ActualizarCliente (
    IN p_cliente_id INT,
    IN p_telefono VARCHAR(10),
    IN p_direccion TEXT
)
BEGIN
    -- Actualizamos la informacion de contacto del cliente en la base de datos
    UPDATE clientes
    SET telefono = p_telefono, 
        direccion = p_direccion
    WHERE id_cliente = p_cliente_id;
END //

DELIMITER ;