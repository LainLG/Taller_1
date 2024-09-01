-- Insertamos a siete personas

INSERT INTO RecursosHumanos.Persona (id_persona, nombre, apellido, cedula, fecha_nacimiento) 
VALUES
    (1, 'Juan', 'Pérez', 12345678, '1980-05-15'),
    (2, 'Ana', 'Gómez', 87654321, '1990-08-22'),
    (3, 'Luis', 'Rodríguez', 11223344, '1985-12-01'),
    (4, 'María', 'Fernández', 22334455, '1982-03-10'),
    (5, 'Carlos', 'Hernández', 55443322, '1979-11-25'),
    (6, 'Laura', 'Martínez', 66778899, '1992-06-30'),
    (7, 'Miguel', 'Sánchez', 99887766, '1987-09-14');


-- Insertamos los tres cargos

INSERT INTO RecursosHumanos.Cargo (id_cargo,nombre)
VALUES
    (1,'Maestro Zapatero'),
    (2,'Cortador'),
    (3,'Ayudante');

-- Asignando cargos a las personas  3 - Maestros zapateros  2- Cortadores 2- Ayudantes

INSERT INTO RecursosHumanos.Persona_Cargo(id_persona_cargo,persona_id,cargo_id,salario,fecha_inicio)
VALUES 
    (1,1,2,1300000,'2023-08-01'),
    (2,2,3,800000,'2022-05-08'),
    (3,3,3,850000,'2024-01-11'),
    (4,4,1,2000000,'2021-07-01'),
    (5,5,2,1250000,'2023-01-14'),
    (6,6,1,1800000,'2018-03-20'),
    (7,7,1,2200000,'2024-02-06');




-- Creaccion de 4 Proveedores 


INSERT INTO Inventario.Proveedor (id_proveedor, nombre) 
VALUES 
    (1, 'Proveedor A'),
    (2, 'Proveedor B'),
    (3, 'Proveedor C'),
    (4, 'Proveedor D');


-- Creaccion de 10 lotes 

INSERT INTO Inventario.Lote (id_lote, proveedor_id, fecha_entrega)
VALUES 
    (1, 1, '2024-08-01'),
    (2, 1, '2024-08-02'),
    (3, 2, '2024-08-03'),
    (4, 2, '2024-08-04'),
    (5, 3, '2024-08-05'),
    (6, 3, '2024-08-06'),
    (7, 4, '2024-08-07'),
    (8, 4, '2024-08-08'),
    (9, 1, '2024-08-09'),
    (10, 2, '2024-08-10');

--- Creaccion de diferentes moldes 

INSERT INTO Inventario.Molde (id_molde, cantidad, tipo, talla)
VALUES 
    (1, 50, 'Deportivo', 36),
    (2, 45, 'Deportivo', 37),
    (3, 40, 'Deportivo', 38),
    (4, 35, 'Deportivo', 39),
    (5, 30, 'Deportivo', 40),
    (6, 25, 'Deportivo', 41),
    (7, 20, 'Deportivo', 42),
    (8, 15, 'Deportivo', 43),
    (9, 10, 'Deportivo', 44),
    (10, 5, 'Deportivo', 45),
    (11, 50, 'Casual', 36),
    (12, 45, 'Casual', 37),
    (13, 40, 'Casual', 38),
    (14, 35, 'Casual', 39),
    (15, 30, 'Casual', 40),
    (16, 25, 'Casual', 41),
    (17, 20, 'Casual', 42),
    (18, 15, 'Casual', 43),
    (19, 10, 'Casual', 44),
    (20, 5, 'Casual', 45);


-- Creacion de diferentes suelas

INSERT INTO Inventario.Suela (id_suela, cantidad, tipo, talla)
VALUES 
    (1, 100, 'Espuma', 39),
    (2, 90, 'Espuma', 40),
    (3, 80, 'Espuma', 41),
    (4, 70, 'Plástico', 42),
    (5, 60, 'Plástico', 43),
    (6, 50, 'Plástico', 44),
    (7, 110, 'Goma', 36),
    (8, 100, 'Goma', 37),
    (9, 90, 'Goma', 38),
    (10, 80, 'Goma', 39);


--- Creaccion de Accesorios

INSERT INTO Inventario.Accesorio (id_accesorio, cantidad, material)
VALUES 
    (1, 100, 'Cordón de algodón'),
    (2, 150, 'Hebilla de metal'),
    (3, 200, 'Ojales de plástico'),
    (4, 250, 'Plantilla de espuma'),
    (5, 300, 'Logotipo bordado'),
    (6, 350, 'Cierre de velcro'),
    (7, 400, 'Decoración de tela'),
    (8, 450, 'Aplique de goma'),
    (9, 500, 'Etiqueta de cuero'),
    (10, 550, 'Protectores de talón');


--- Creacion de Materiales

INSERT INTO Inventario.Material (id_material, cantidad, tipo)
VALUES 
    (1, 1000, 'Cuero'),
    (2, 1500, 'Nylon'),
    (3, 2000, 'Suede'),
    (4, 1200, 'Lona'),
    (5, 1800, 'Cuero Sintetico'),
    (6, 1600, 'Gamuza'),
    (7, 1400, 'Microfibra'),
    (8, 1700, 'Vinilo'),
    (9, 1300, 'Tela'),
    (10, 1100, 'Algodón');

-- Insertar relaciones entre lotes y materiales

INSERT INTO Inventario.Lote_Material (lote_id, material_id)
VALUES 
    (1, 1),  -- Lote 1 tiene Material 1
    (1, 2),  -- Lote 1 tiene Material 2
    (2, 3),  -- Lote 2 tiene Material 3
    (2, 4),  -- Lote 2 tiene Material 4
    (3, 5),  -- Lote 3 tiene Material 5
    (3, 6),  -- Lote 3 tiene Material 6
    (4, 7),  -- Lote 4 tiene Material 7
    (4, 8),  -- Lote 4 tiene Material 8
    (5, 9),  -- Lote 5 tiene Material 9
    (5, 10), -- Lote 5 tiene Material 10
    (6, 1),  -- Lote 6 tiene Material 1
    (6, 2),  -- Lote 6 tiene Material 2
    (7, 3),  -- Lote 7 tiene Material 3
    (7, 4),  -- Lote 7 tiene Material 4
    (8, 5),  -- Lote 8 tiene Material 5
    (8, 6),  -- Lote 8 tiene Material 6
    (9, 7),  -- Lote 9 tiene Material 7
    (9, 8),  -- Lote 9 tiene Material 8
    (10, 9), -- Lote 10 tiene Material 9
    (10, 10);-- Lote 10 tiene Material 10


-- Insertar relaciones entre lotes y suelas

INSERT INTO Inventario.Lote_Suela (lote_id, suela_id)
VALUES 
    (1, 1),  -- Lote 1 tiene Suela 1
    (1, 2),  -- Lote 1 tiene Suela 2
    (2, 3),  -- Lote 2 tiene Suela 3
    (2, 4),  -- Lote 2 tiene Suela 4
    (3, 5),  -- Lote 3 tiene Suela 5
    (3, 6),  -- Lote 3 tiene Suela 6
    (4, 7),  -- Lote 4 tiene Suela 7
    (4, 8),  -- Lote 4 tiene Suela 8
    (5, 9),  -- Lote 5 tiene Suela 9
    (5, 10), -- Lote 5 tiene Suela 10
    (6, 1),  -- Lote 6 tiene Suela 1
    (6, 2),  -- Lote 6 tiene Suela 2
    (7, 3),  -- Lote 7 tiene Suela 3
    (7, 4),  -- Lote 7 tiene Suela 4
    (8, 5),  -- Lote 8 tiene Suela 5
    (8, 6),  -- Lote 8 tiene Suela 6
    (9, 7),  -- Lote 9 tiene Suela 7
    (9, 8),  -- Lote 9 tiene Suela 8
    (10, 9), -- Lote 10 tiene Suela 9
    (10, 10);-- Lote 10 tiene Suela 10

-- Insertar relaciones entre lotes y moldes

INSERT INTO Inventario.Lote_Molde (lote_id, molde_id)
VALUES 
    (1, 1),  -- Lote 1 tiene Molde 1
    (1, 2),  -- Lote 1 tiene Molde 2
    (2, 3),  -- Lote 2 tiene Molde 3
    (2, 4),  -- Lote 2 tiene Molde 4
    (3, 5),  -- Lote 3 tiene Molde 5
    (3, 6),  -- Lote 3 tiene Molde 6
    (4, 7),  -- Lote 4 tiene Molde 7
    (4, 8),  -- Lote 4 tiene Molde 8
    (5, 9),  -- Lote 5 tiene Molde 9
    (5, 10), -- Lote 5 tiene Molde 10
    (6, 1),  -- Lote 6 tiene Molde 1
    (6, 2),  -- Lote 6 tiene Molde 2
    (7, 3),  -- Lote 7 tiene Molde 3
    (7, 4),  -- Lote 7 tiene Molde 4
    (8, 5),  -- Lote 8 tiene Molde 5
    (8, 6),  -- Lote 8 tiene Molde 6
    (9, 7),  -- Lote 9 tiene Molde 7
    (9, 8),  -- Lote 9 tiene Molde 8
    (10, 9), -- Lote 10 tiene Molde 9
    (10, 10);-- Lote 10 tiene Molde 10


-- Insertar relaciones entre lotes y accesorios

INSERT INTO Inventario.Lote_Accesorio (lote_id, accesorio_id)
VALUES 
    (1, 1),  -- Lote 1 tiene Accesorio 1
    (1, 2),  -- Lote 1 tiene Accesorio 2
    (2, 3),  -- Lote 2 tiene Accesorio 3
    (2, 4),  -- Lote 2 tiene Accesorio 4
    (3, 5),  -- Lote 3 tiene Accesorio 5
    (3, 6),  -- Lote 3 tiene Accesorio 6
    (4, 7),  -- Lote 4 tiene Accesorio 7
    (4, 8),  -- Lote 4 tiene Accesorio 8
    (5, 9),  -- Lote 5 tiene Accesorio 9
    (5, 10), -- Lote 5 tiene Accesorio 10
    (6, 1),  -- Lote 6 tiene Accesorio 1
    (6, 2),  -- Lote 6 tiene Accesorio 2
    (7, 3),  -- Lote 7 tiene Accesorio 3
    (7, 4),  -- Lote 7 tiene Accesorio 4
    (8, 5),  -- Lote 8 tiene Accesorio 5
    (8, 6),  -- Lote 8 tiene Accesorio 6
    (9, 7),  -- Lote 9 tiene Accesorio 7
    (9, 8),  -- Lote 9 tiene Accesorio 8
    (10, 9), -- Lote 10 tiene Accesorio 9
    (10, 10);-- Lote 10 tiene Accesorio 10

-- Asignar ayudantes a lotes 

INSERT INTO Inventario.Lote_Ayudante (lote_id, ayudante_id)
VALUES
    (1, 3),
    (1, 2),
    (2, 2),
    (3, 3),
    (4, 3),
    (5, 2),
    (5, 3),
    (6, 2),
    (7, 3),
    (8, 3),
    (9, 2),
    (10,3);


-- Insertar cortes

INSERT INTO Produccion.Corte (id_corte, tipo, dimensiones, cortador_id, material_id)
VALUES
    (1, 'A', '10x20', 1, 1),
    (2, 'A', '15x25', 1, 2),
    (3, 'A', '20x30', 1, 3),
    (4, 'B', '25x35', 1, 4),
    (5, 'B', '30x40', 1, 5),
    (6, 'C', '35x45', 5, 6),
    (7, 'C', '40x50', 5, 7),
    (8, 'D', '45x55', 5, 8),
    (9, 'D', '50x60', 5, 9),
    (10, 'E', '55x65', 5, 10);

-- Diseño

INSERT INTO Produccion.Modelo (id_modelo, nombre,fecha)
VALUES
    (1, 'Sneakers', '2024-08-25');


INSERT INTO Produccion.Modelo_Corte(modelo_id,corte_id)
VALUES
    (1, 1),
    (1, 2),
    (1, 3);

INSERT INTO Produccion.Modelo_Suela(modelo_id,suela_id)
VALUES
    (1, 7),
    (1, 8),
    (1, 10);

INSERT INTO Produccion.Modelo_Molde(modelo_id,molde_id)
VALUES
    (1, 1),
    (1, 2),
    (1, 4);


INSERT INTO Produccion.Modelo_Accesorio(modelo_id,accesorio_id)
VALUES
    (1, 1),
    (1, 3);


INSERT INTO Distribucion.Lote_zapato(id_lote_zapato,fecha)
VALUES
    (1,'2024-09-05');

-- Insetar zapatos 

INSERT INTO Produccion.Zapato (id_zapato, maestro_zapatero_id, ayudante_id, modelo_id,lote_zapato_id)
VALUES
(1, 4, 2, 1, 1),
(2, 6, 3, 1, 1),
(3, 6, 2, 1, 1),
(4, 7, 3, 1, 1),
(5, 4, 3, 1, 1),
(6, 4, 3, 1, 1),
(7, 6, 2, 1, 1),
(8, 6, 2, 1, 1),
(9, 7, 3, 1, 1),
(10,4, 2, 1, 1);



-- Cambiar el cargo del ayudante con id_persona = 2 a maestro zapatero

UPDATE RecursosHumanos.Persona_Cargo
SET cargo_antiguo_id = cargo_id,  -- ID del cargo de maestro zapatero
    fecha_fin = CURRENT_DATE,
    cargo_id = 1    
WHERE persona_id = 2 AND cargo_id = 3;  -- ID del ayudante


-- insertar nuevo rol

INSERT INTO RecursosHumanos.Persona_Cargo (persona_id, cargo_id, salario, fecha_inicio)
VALUES (2, 1, 1500000, CURRENT_DATE); -- Ejemplo de salario

-- Actualiza diseño agregando un accesorio nuevo

INSERT INTO Produccion.Modelo_Accesorio(modelo_id,accesorio_id)
VALUES
    (1, 4),

INSERT INTO Produccion.Modelo_Corte(modelo_id,corte_id)
VALUES
    (1, 5);


-- Eliminar un zapato 

DELETE FROM Produccion.Zapato
WHERE id_zapato = 10;


-- Diseño

INSERT INTO Produccion.Modelo (id_modelo,nombre,fecha)
VALUES
    (2, 'Oxford','2024-09-01');


INSERT INTO Produccion.Modelo_Corte(modelo_id,corte_id)
VALUES
    (2, 1),
    (2, 2);

INSERT INTO Produccion.Modelo_Suela(modelo_id,suela_id)
VALUES
    (2, 7);

INSERT INTO Produccion.Modelo_Molde(modelo_id,molde_id)
VALUES
    (2, 1);

INSERT INTO Produccion.Modelo_Accesorio(modelo_id,accesorio_id)
VALUES
    (2, 2);

INSERT INTO Distribucion.Lote_zapato(id_lote_zapato,cantidad,fecha)
VALUES
    (2,0,'2024-09-01');

-- Crear diez zapatos

INSERT INTO Produccion.Zapato (id_zapato, maestro_zapatero_id, ayudante_id, modelo_id,lote_zapato_id) VALUES
(11, 4, 2, 2, 2),
(12, 6, 3, 2, 2),
(13, 6, 2, 2, 2),
(14, 7, 3, 2, 2),
(15, 4, 3, 2, 2),
(16, 4, 3, 2, 2),
(17, 6, 2, 2, 2),
(18, 6, 2, 2, 2),
(19, 7, 3, 2, 2),
(20,4, 2, 2, 2);


DELETE FROM Produccion.Modelo
WHERE id_modelo = 2;

-- Insertar un nuevo modelo

INSERT INTO Produccion.Modelo (id_modelo,nombre,fecha)
VALUES
    (2, 'Oxford','2024-09-01');

-- Insertar un accesorio al modelo

INSERT INTO Produccion.Modelo_Accesorio(modelo_id,accesorio_id)
VALUES
    (2, 1);
