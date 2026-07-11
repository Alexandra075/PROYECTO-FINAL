Use tienda_online;
DROP PROCEDURE IF EXISTS EliminarResena;
DELIMITER //

CREATE PROCEDURE EliminarResena (
    IN p_resena_id INT
)
BEGIN
    -- Declaramos una variable para guardar el producto al que pertenece la resena
    DECLARE v_producto_id INT;

    -- Primero obtenemos el id del producto antes de borrar la resena para no perder el dato
    SELECT id_producto INTO v_producto_id
    FROM resenas
    WHERE id_resena = p_resena_id;

    -- Despues eliminamos la resena de la tabla
    DELETE FROM resenas
    WHERE id_resena = p_resena_id;

    -- A continuacion calculamos y mostramos el nuevo promedio de ese producto actualizado
    SELECT id_producto, AVG(calificacion) AS nuevo_promedio
    FROM resenas
    WHERE id_producto = v_producto_id
    GROUP BY id_producto;
END //

DELIMITER ;