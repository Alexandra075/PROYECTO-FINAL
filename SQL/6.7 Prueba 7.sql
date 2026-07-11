USE tienda_online;
-- Prueba del Procedimiento 7: Actualizar la informacion de contacto de un cliente
-- Primero revisamos los datos actuales del cliente para ver su informacion original
SELECT id_cliente, nombre, telefono, direccion FROM clientes WHERE id_cliente = 1;

-- Despues usamos el procedimiento para modificar su telefono y direccion
CALL ActualizarCliente(1, '5599887766', 'Av. Vasco de Quiroga');

-- A continuacion comprobamos que los datos se guardaron correctamente en la base de datos
SELECT id_cliente, nombre, telefono, direccion FROM clientes WHERE id_cliente = 1;