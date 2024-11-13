CREATE DATABASE Panificacion;
GO

USE Panificacion;
GO

-- Tabla: ap_referencias
CREATE TABLE ap_referencias (
    id INT IDENTITY(1,1) PRIMARY KEY,
    descripcion VARCHAR(255),
    temperatura_maxima DECIMAL(10,3),
    temperatura_minima DECIMAL(10,3)
);
GO

-- Tabla: ap_coches
CREATE TABLE ap_coches (
    codigo CHAR(10) PRIMARY KEY,
    estado VARCHAR(50)
);
GO

-- Tabla: ap_procesos
CREATE TABLE ap_procesos (
    id INT IDENTITY(1,1) PRIMARY KEY,
    referencia_id INT FOREIGN KEY REFERENCES ap_referencias(id),
    coche_codigo CHAR(10) FOREIGN KEY REFERENCES ap_coches(codigo),
    comentario VARCHAR(255),
    hora_inicio TIME,
    hora_fin TIME
);
GO

-- Tabla: ap_fermentacion
CREATE TABLE ap_fermentacion (
    id INT PRIMARY KEY IDENTITY,
    coche_codigo CHAR(10) FOREIGN KEY REFERENCES ap_coches(codigo),
    hora_entrada TIME,
    hora_salida TIME
);
GO

-- Tabla: ap_horno
CREATE TABLE ap_horno (
    id INT PRIMARY KEY IDENTITY,
    coche_codigo CHAR(10) FOREIGN KEY REFERENCES ap_coches(codigo),
    referencia_id INT FOREIGN KEY REFERENCES ap_referencias(id),
    hora_entrada TIME
);
GO

-- Procedimiento almacenado: sp_ap_agregarProceso
CREATE PROCEDURE sp_ap_agregarProceso
    @referencia_id INT,
    @coche_codigo CHAR(10),
    @comentario NVARCHAR(MAX) = NULL
AS
BEGIN
    INSERT INTO ap_procesos (referencia_id, coche_codigo, comentario, hora_inicio, hora_fin)
    VALUES (
        @referencia_id,
        @coche_codigo,
        @comentario,
        GETDATE(),
        NULL
    );
END;



select * from ap_referencias
select * from ap_coches
select * from ap_procesos

insert into ap_referencias values ('prueba', 100.0, 200.0)
INSERT INTO ap_coches Values (2)

EXEC sp_ap_agregarProceso @referencia_id = 1, @coche_id = 1;