USE tienda_online;
DROP PROCEDURE IF EXISTS AgregarProducto;
DELIMITER //

CREATE PROCEDURE AgregarProducto (
    IN p_nombre VARCHAR(50),
    IN p_descripcion TEXT,
    IN p_precio DECIMAL(10,2),
    IN p_stock INT,
    IN p_categoria_id INT
)
BEGIN
    -- Declaramos una variable para comprobar si el producto ya esta registrado
    DECLARE v_existe INT;

    -- Primero contamos si hay algun producto que tenga exactamente el mismo nombre y categoria
    SELECT COUNT(*) INTO v_existe
    FROM productos
    WHERE nombre = p_nombre AND id_categoria = p_categoria_id;

    -- Ponemos la condicion para evitar duplicados
    IF v_existe > 0 THEN
        -- Si el contador detecta que ya existe, mandamos un error
        SIGNAL SQLSTATE '45004' SET MESSAGE_TEXT = 'Error: El producto ya existe en esta categoria';
        
    ELSE
        -- Si no existe, entonces lo insertamos normalmente en el inventario
        INSERT INTO productos (nombre, descripcion, precio, stock, id_categoria)
        VALUES (p_nombre, p_descripcion, p_precio, p_stock, p_categoria_id);
        
    END IF;
END //

DELIMITER ;