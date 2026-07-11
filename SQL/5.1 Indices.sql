USE tienda_online;

-- Creamos un indice para optimizar la busqueda de pedidos por cliente y su estado, esto acelera muchisimo el Procedimiento 1 que valida los 5 pedidos pendientes
CREATE INDEX idx_pedidos_cliente_estado ON pedidos (id_cliente, estado);

-- Despues creamos un indice compuesto para agilizar la Consulta 1 exigida, que busca productos por categoria y los ordena por precio
CREATE INDEX idx_productos_categoria_precio ON productos (id_categoria, precio);

-- A continuacion creamos un indice en los detalles del pedido para acelerar el Procedimiento 2, ya que cruza el id_pedido y el id_producto para validar si alguien compro un articulo
CREATE INDEX idx_detalles_pedido_producto ON detalles_pedido (id_pedido, id_producto);

-- Por ultimo creamos un indice en el nombre de los productos ya que es la busqueda mas comun que hara cualquier cliente en la tienda
CREATE INDEX idx_productos_nombre ON productos (nombre);