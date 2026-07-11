USE tienda_online;
-- Prueba del Procedimiento 5: Eliminar reseña y ver nuevo promedio

-- Primero validamos que exista la resena que vamos a borrar
SELECT id_resena, id_producto, calificacion FROM resenas WHERE id_producto = 1;

-- Despues eliminamos la resena usando el procedimiento para ver el nuevo promedio
CALL EliminarResena(901);

-- A continuacion comprobamos que la resena se borro correctamente
SELECT id_resena, id_producto, calificacion FROM resenas WHERE id_producto = 1;