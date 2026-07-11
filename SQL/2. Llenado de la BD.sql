USE tienda_online;

-- Insertamos 5 datos para la tabla categorias
INSERT INTO categorias (nombre, descripcion) VALUES 
('Smartphones', 'Teléfonos móviles de última generación'),
('Laptops', 'Computadoras portátiles para trabajo y gaming'),
('Wearables', 'Relojes inteligentes y pulseras de actividad'),
('Audio', 'Audífonos, bocinas y equipos de sonido'),
('Accesorios', 'Cables, fundas, cargadores y mouses');

-- Insertamos los datos de 15 clientes
INSERT INTO clientes (nombre, correo, telefono, direccion) VALUES 
('Carlos Mendoza', 'carlos.m@cua.uam.mx', '5551234567', 'Av. Vasco de Quiroga 4871'),
('Ana Sofía López', 'ana.lopez@gmail.com', '5559876543', 'Col. Santa Fe, CDMX'),
('Luis Pérez', 'luis.perez@hotmail.com', '5551112233', 'Av. Constituyentes 100'),
('María García', 'maria.g@yahoo.com', '5554445566', 'Calle 10, Cuajimalpa'),
('Javier Hernández', 'javier.h@gmail.com', '5557778899', 'Bosques de las Lomas'),
('Laura Martínez', 'laura.m@outlook.com', '5550001122', 'Interlomas, Huixquilucan'),
('Roberto Gómez', 'roberto.g@gmail.com', '5553334455', 'Polanco, CDMX'),
('Diana Torres', 'diana.t@cua.uam.mx', '5556667788', 'Contadero, Cuajimalpa'),
('Fernando Ruiz', 'fernando.r@hotmail.com', '5559990011', 'Condesa, CDMX'),
('Carmen Silva', 'carmen.s@gmail.com', '5552223344', 'Roma Norte, CDMX'),
('Alejandro Vega', 'alejandro.v@yahoo.com', '5555556677', 'Del Valle, CDMX'),
('Patricia Castro', 'patricia.c@outlook.com', '5558889900', 'Narvarte, CDMX'),
('Ricardo Ortiz', 'ricardo.o@gmail.com', '5551239876', 'Coyoacán, CDMX'),
('Gabriela Navarro', 'gabriela.n@cua.uam.mx', '5554561239', 'San Ángel, CDMX'),
('Hugo Morales', 'hugo.m@hotmail.com', '5557894561', 'Tlalpan, CDMX');

-- Insertamos 30 productos
INSERT INTO productos (nombre, descripcion, precio, stock, id_categoria) VALUES 
('iPhone 15 Pro', '256GB, Titanio', 23999.00, 15, 1),
('Samsung Galaxy S24 Ultra', '512GB, IA integrada', 25999.00, 10, 1),
('Google Pixel 8', '128GB, Android Puro', 15499.00, 8, 1),
('Xiaomi 14', '256GB, Carga ultrarrápida', 18999.00, 20, 1),
('Motorola Edge 40', '256GB, Pantalla curva', 11999.00, 25, 1),
('MacBook Pro M3', '14 pulgadas, 16GB RAM', 34999.00, 5, 2),
('Dell XPS 15', 'Intel Core i9, 32GB RAM', 38500.00, 4, 2),
('Asus ROG Zephyrus', 'RTX 4070, 16GB RAM', 32999.00, 7, 2),
('Lenovo ThinkPad X1', 'Core i7, Ultraligera', 28999.00, 12, 2),
('HP Spectre x360', 'Convertible, 16GB RAM', 27500.00, 9, 2),
('Acer Swift 3', 'Core i5, 8GB RAM', 14500.00, 15, 2),
('Apple Watch Series 9', '41mm, Aluminio', 8999.00, 30, 3),
('Samsung Galaxy Watch 6', '44mm, Bluetooth', 5499.00, 22, 3),
('Garmin Forerunner 265', 'Reloj GPS para correr', 9500.00, 10, 3),
('Amazfit GTR 4', 'Batería de 14 días', 3499.00, 40, 3),
('Fitbit Charge 6', 'Pulsera de actividad avanzada', 3199.00, 35, 3),
('AirPods Pro 2', 'Cancelación de ruido activa', 5299.00, 50, 4),
('Sony WH-1000XM5', 'Diadema con noise cancelling', 6999.00, 18, 4),
('Bose QuietComfort Earbuds', 'In-ear premium', 5999.00, 12, 4),
('JBL Flip 6', 'Bocina Bluetooth resistente al agua', 2499.00, 45, 4),
('Samsung Galaxy Buds 2 Pro', 'Audio 360', 3899.00, 25, 4),
('Sennheiser Momentum 4', 'Batería de 60 horas', 7499.00, 8, 4),
('Logitech MX Master 3S', 'Mouse ergonómico', 2199.00, 30, 5),
('Cargador Anker Nano II', '65W, USB-C', 899.00, 60, 5),
('Cable Apple USB-C', 'Trenzado, 2 metros', 599.00, 100, 5),
('Funda Spigen iPhone 15', 'Transparente anti-amarillo', 450.00, 55, 5),
('Mochila Targus', 'Para laptop 15.6 pulgadas', 950.00, 20, 5),
('Teclado Keychron K2', 'Mecánico inalámbrico', 2100.00, 15, 5),
('Hub UGREEN USB-C', '7 en 1 con HDMI', 750.00, 40, 5),
('Base de carga Belkin', 'Inalámbrica 3 en 1', 2500.00, 10, 5);

-- Insertamos 20 pedidos para diferentes clientes
INSERT INTO pedidos (id_cliente, estado) VALUES 
(1, 'entregado'), 
(2, 'enviado'), 
(3, 'pendiente'), 
(4, 'entregado'), 
(5, 'pendiente'),
(1, 'pendiente'), 
(6, 'enviado'), 
(7, 'entregado'), 
(8, 'pendiente'), 
(9, 'entregado'),
(10, 'pendiente'), 
(11, 'enviado'), 
(12, 'entregado'), 
(13, 'pendiente'), 
(14, 'entregado'),
(15, 'pendiente'), 
(2, 'entregado'), 
(3, 'enviado'), 
(4, 'pendiente'), 
(5, 'entregado');

-- Insertamos los detalles de cada pedido
INSERT INTO detalles_pedido (id_pedido, id_producto, cantidad, precio_unitario) VALUES 
(1, 1, 1, 23999.00), (1, 26, 1, 450.00),  -- Cliente 1 compra iPhone y funda
(2, 6, 1, 34999.00),                       -- Cliente 2 compra MacBook
(3, 17, 1, 5299.00), (3, 25, 2, 599.00),  -- Cliente 3 compra AirPods y 2 cables
(4, 23, 1, 2199.00),                       -- Cliente 4 compra Mouse
(5, 12, 1, 8999.00),                       -- Cliente 5 compra Apple Watch
(6, 20, 2, 2499.00),                       -- Cliente 1 compra 2 bocinas JBL
(7, 2, 1, 25999.00),                       -- Cliente 6 compra Samsung Ultra
(8, 7, 1, 38500.00), (8, 27, 1, 950.00),  -- Cliente 7 compra Dell XPS y mochila
(9, 13, 1, 5499.00),                       -- Cliente 8 compra Galaxy Watch
(10, 18, 1, 6999.00),                      -- Cliente 9 compra Sony WH
(11, 3, 1, 15499.00),                      -- Cliente 10 compra Pixel 8
(12, 28, 1, 2100.00),                      -- Cliente 11 compra Teclado
(13, 8, 1, 32999.00),                      -- Cliente 12 compra Asus ROG
(14, 21, 1, 3899.00), (14, 24, 1, 899.00),-- Cliente 13 compra Galaxy Buds y cargador
(15, 4, 1, 18999.00),                      -- Cliente 14 compra Xiaomi 14
(16, 29, 1, 750.00),                       -- Cliente 15 compra Hub
(17, 19, 1, 5999.00),                      -- Cliente 2 compra Bose
(18, 5, 1, 11999.00),                      -- Cliente 3 compra Motorola
(19, 10, 1, 27500.00),                     -- Cliente 4 compra HP Spectre
(20, 14, 1, 9500.00), (20, 30, 1, 2500.00);-- Cliente 5 compra Garmin y Base de carga

-- Insrtamos las reseñas de cada cliente que YA haya comprado el producto 
INSERT INTO resenas (id_cliente, id_producto, calificacion, comentario) VALUES 
(1, 1, 5, 'Excelente teléfono, la cámara es increíble y la batería dura todo el día.'),
(1, 26, 4, 'Buena funda, protege bien pero se raya un poco.'),
(2, 6, 5, 'La mejor laptop que he tenido, súper rápida para programar.'),
(4, 23, 5, 'Súper cómodo para trabajar largas horas.'),
(7, 7, 4, 'Muy potente, pero se calienta un poco al jugar.'),
(7, 27, 5, 'Muy espaciosa y los materiales se sienten premium.'),
(9, 18, 5, 'La cancelación de ruido es brutal, 100% recomendados.'),
(12, 8, 5, 'Corre todos los juegos en ultra sin problemas.'),
(14, 4, 4, 'Carga rapidísimo, buen equipo por el precio.'),
(2, 19, 3, 'Suenan bien, pero a veces se desconecta el bluetooth.');