USE tienda_online;
-- Prueba del Procedimiento 2: Validacion de resena sin compra
-- Hacemos que el cliente 1 intente resenar un producto que jamas ha comprado (ejemplo: producto 15)
CALL RegistrarResena(1, 15, 5, 'Buen producto pero no lo compre');