DROP DATABASE IF EXISTS tienda_online; -- Limpiamos la base de datos por si nos hemos equivocado anteriormente
CREATE DATABASE tienda_online;
USE tienda_online;

-- Creamos la tabla de categorias
CREATE TABLE categorias (
    id_categoria INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    descripcion TEXT
);

-- Creamos la tabla de clientes 
CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    correo VARCHAR(30) NOT NULL UNIQUE, -- Ponemos UNIQUE para que no puedan exitir varios registros con el mismo correo
    telefono VARCHAR(10),
    direccion TEXT
);

-- Creaos la tabla de los productos
CREATE TABLE productos (
    id_producto INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    descripcion TEXT,
    precio DECIMAL(10,2) NOT NULL,
    stock INT NOT NULL CHECK (stock >= 0), -- Establecemos que el stock debe ser igual o mayor a 0, esto para evitar que sea negativo
    id_categoria INT NOT NULL,
    FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria) -- Esto funciona como puente donde decimos que los valores de la columna id_categoria en esta tabla (FK) dependen del id_categoria de la tabla de categorias
);

-- Creamos la tabla de pedidos
CREATE TABLE pedidos (
    id_pedido INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    id_cliente INT NOT NULL,
    fecha_pedido DATETIME DEFAULT CURRENT_TIMESTAMP,
    estado ENUM('pendiente', 'enviado', 'entregado') DEFAULT 'pendiente', -- ENUM nos sirve para poner una restrccion de que en la columna "estado" solo aceptamos las palabras señaladas entre parentesis
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente) -- Establecemos que cada pedido tendra un identificador del cliente que lo pidio como una FK, esto depende del id del cleinte en la tabla de clientes
);

-- Creamos la tabla para especificar los detalles de cada pedido 
CREATE TABLE detalles_pedido (
    id_detalle INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    id_pedido INT NOT NULL,
    id_producto INT NOT NULL,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido) ON DELETE CASCADE, -- Establecemos el puente de la FK del id de los pedidos con la tabla pedidos, ademas agregamos la condicion de "ON DELETE CASCADE" para que en caso de que borren cualquier pedido se borre tambien cualquier detalle sobre dicho pedido de manera automatica y nos ahorra el trabajo manual
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);

-- Creamos la tbla para las reseñas de los clientes
CREATE TABLE resenas (
    id_resena INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    id_cliente INT NOT NULL,
    id_producto INT NOT NULL,
    calificacion INT NOT NULL CHECK (calificacion BETWEEN 1 AND 5), -- Decimos que aqui solamente se aceptan valores desde el 1 al 5 incluyendo a dichos numeros
    comentario TEXT,
    fecha_resena DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);