USE tienda_online;
DROP PROCEDURE IF EXISTS ReporteStockBajo;
DELIMITER //

CREATE PROCEDURE ReporteStockBajo ()
BEGIN
    -- Generamos un reporte mostrando los productos que tienen menos de 5 unidades en inventario
    SELECT id_producto, nombre, stock, id_categoria
    FROM productos
    WHERE stock < 5
    ORDER BY stock ASC;
END //

DELIMITER ;