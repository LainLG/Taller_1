-- Creamos los diferentes esquemas de la base de datos

CREATE SCHEMA Inventario;
CREATE SCHEMA RecursosHumanos;
CREATE SCHEMA Produccion;
CREATE SCHEMA Distribucion;

-- Empezamos a crear las diferentes entidades de nuestra base de datos

CREATE TABLE RecursosHumanos.Persona(
    id_persona INT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    cedula INT NOT NULL,
    fecha_nacimiento DATE NOT NULL
);

CREATE TABLE RecursosHumanos.Cargo(
    id_cargo INT PRIMARY KEY,
    nombre VARCHAR(30) NOT NULL
);

CREATE TABLE RecursosHumanos.Persona_Cargo(
    id_persona_cargo INT PRIMARY KEY,
    persona_id INT,
    cargo_id INT,
    salario INT,
    fecha_inicio DATE DEFAULT CURRENT_DATE,
    fecha_fin DATE DEFAULT NULL,
    cargo_antiguo_id INT NULL,
    
    CONSTRAINT fk_persona_id FOREIGN KEY (persona_id) REFERENCES RecursosHumanos.Persona(id_persona),
    CONSTRAINT fk_cargo_id FOREIGN KEY (cargo_id) REFERENCES RecursosHumanos.Cargo(id_cargo),
    CONSTRAINT fk_cargo_antiguo_id FOREIGN KEY (cargo_antiguo_id) REFERENCES RecursosHumanos.Cargo(id_cargo)  
  
);

CREATE TABLE Inventario.Proveedor(
    id_proveedor INT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

CREATE TABLE Inventario.Lote(
    id_lote INT PRIMARY KEY,
    proveedor_id INT,
    fecha_entrega DATE DEFAULT CURRENT_DATE,

    CONSTRAINT fk_proveedor_id FOREIGN KEY (proveedor_id) REFERENCES Inventario.Proveedor(id_proveedor)
);

CREATE TABLE Inventario.Lote_Ayudante(
    lote_id INT,
    ayudante_id INT,

    PRIMARY KEY (lote_id,ayudante_id),
    CONSTRAINT fk_lote_id FOREIGN KEY (lote_id) REFERENCES Inventario.Lote (id_lote),
    CONSTRAINT fk_ayudante_id FOREIGN KEY (ayudante_id) REFERENCES RecursosHumanos.Persona_Cargo (id_persona_cargo)
);

CREATE TABLE Inventario.Material(
    id_material INT PRIMARY KEY,
    cantidad REAL NOT NULL,
    tipo VARCHAR(40)
);

CREATE TABLE Inventario.Molde(
    id_molde INT PRIMARY KEY,
    cantidad INT NOT NULL,
    tipo VARCHAR(40),
    talla INT NOT NULL
);

CREATE TABLE Inventario.Suela(
    id_suela INT PRIMARY KEY,
    cantidad INT NOT NULL,
    tipo VARCHAR(40) NOT NULL,
    talla INT NOT NULL
);

CREATE TABLE Inventario.Accesorio(
    id_accesorio INT PRIMARY KEY,
    cantidad INT NOT NULL,
    material VARCHAR(40)
);

CREATE TABLE Inventario.Lote_Material(
    lote_id INT,
    material_id INT,

    PRIMARY KEY (lote_id,material_id),
    CONSTRAINT fk_lote_id FOREIGN KEY (lote_id) REFERENCES Inventario.Lote (id_lote),
    CONSTRAINT fk_material_id FOREIGN KEY (material_id) REFERENCES Inventario.Material (id_material)
);


CREATE TABLE Inventario.Lote_Molde(
    lote_id INT,
    molde_id INT,

    PRIMARY KEY (lote_id,molde_id),
    CONSTRAINT fk_lote_id FOREIGN KEY (lote_id) REFERENCES Inventario.Lote (id_lote),
    CONSTRAINT fk_molde_id FOREIGN KEY (molde_id) REFERENCES Inventario.Molde (id_molde)
);

CREATE TABLE Inventario.Lote_Suela(
    lote_id INT,
    suela_id INT,

    PRIMARY KEY (lote_id,suela_id),
    CONSTRAINT fk_lote_id FOREIGN KEY (lote_id) REFERENCES Inventario.Lote (id_lote),
    CONSTRAINT fk_suela_id FOREIGN KEY (suela_id) REFERENCES Inventario.Suela (id_suela)
);


CREATE TABLE Inventario.Lote_Accesorio(
    lote_id INT,
    accesorio_id INT,

    PRIMARY KEY (lote_id,accesorio_id),
    CONSTRAINT fk_lote_id FOREIGN KEY (lote_id) REFERENCES Inventario.Lote(id_lote),
    CONSTRAINT fk_accesorio_id FOREIGN KEY (accesorio_id) REFERENCES Inventario.Accesorio (id_accesorio)
);

CREATE TABLE Produccion.Corte(
    id_corte INT PRIMARY KEY,
    tipo VARCHAR(30) NOT NULL,
    dimensiones VARCHAR(30) NOT NULL,
    cortador_id INT,
    material_id INT,

    CONSTRAINT fk_cortador_id FOREIGN KEY (cortador_id) REFERENCES RecursosHumanos.Persona_Cargo(id_persona_cargo),
    CONSTRAINT fk_material_id FOREIGN KEY (material_id) REFERENCES Inventario.Material (id_material)
);


CREATE TABLE Produccion.Modelo(
    id_modelo INT PRIMARY KEY,
    nombre VARCHAR(40),
    fecha DATE DEFAULT CURRENT_DATE
);

CREATE TABLE Produccion.Modelo_Molde(
    modelo_id INT,
    molde_id INT,
    PRIMARY KEY (modelo_id,molde_id),
    CONSTRAINT fk_modelo_id FOREIGN KEY (modelo_id) REFERENCES Produccion.Modelo (id_modelo) ON DELETE CASCADE,
    CONSTRAINT fk_molde_id FOREIGN KEY (molde_id) REFERENCES Inventario.Molde (id_molde)

);

CREATE TABLE Produccion.Modelo_Suela(
    modelo_id INT,
    suela_id INT,
    PRIMARY KEY (modelo_id,suela_id),
    CONSTRAINT fk_modelo_id FOREIGN KEY (modelo_id) REFERENCES Produccion.Modelo (id_modelo) ON DELETE CASCADE,
    CONSTRAINT fk_suela_id FOREIGN KEY (suela_id) REFERENCES Inventario.Suela (id_suela)

);

CREATE TABLE Distribucion.Lote_zapato(
    id_lote_zapato INT PRIMARY KEY,
    cantidad INT NOT NULL,
    fecha DATE DEFAULT CURRENT_DATE
);

CREATE TABLE Produccion.Zapato(
    id_zapato INT PRIMARY KEY,
    maestro_zapatero_id INT,
    ayudante_id INT,
    modelo_id INT,
    lote_zapato_id INT NULL,
    
    CONSTRAINT fk_maestro_zapatero_id FOREIGN KEY (maestro_zapatero_id) REFERENCES RecursosHumanos.Persona_Cargo (id_persona_cargo),
    CONSTRAINT fk_ayudante_id FOREIGN KEY (ayudante_id) REFERENCES RecursosHumanos.Persona_Cargo (id_persona_cargo),
    CONSTRAINT fk_modelo_id FOREIGN KEY (modelo_id) REFERENCES Produccion.Modelo (id_modelo) ON DELETE CASCADE,
    CONSTRAINT fk_lote_zapato_id FOREIGN KEY (lote_zapato_id) REFERENCES Distribucion.Lote_zapato (id_lote_zapato)

);


CREATE TABLE Produccion.Modelo_Corte(
    modelo_id INT,
    corte_id INT,
    PRIMARY KEY (modelo_id,corte_id),
    CONSTRAINT fk_modelo_id FOREIGN KEY (modelo_id) REFERENCES Produccion.Modelo (id_modelo) ON DELETE CASCADE,
    CONSTRAINT fk_corte_id FOREIGN KEY (corte_id) REFERENCES Produccion.Corte (id_corte)
);


CREATE TABLE Produccion.Modelo_Accesorio(
    modelo_id INT,
    accesorio_id INT,
    PRIMARY KEY (modelo_id,accesorio_id),
    CONSTRAINT fk_modelo_id FOREIGN KEY (modelo_id) REFERENCES Produccion.Modelo (id_modelo) ON DELETE CASCADE,
    CONSTRAINT fk_accesorio_id FOREIGN KEY (accesorio_id) REFERENCES Inventario.Accesorio (id_accesorio)
);


CREATE OR REPLACE FUNCTION incrementar_cantidad_lote()
RETURNS TRIGGER AS $$
BEGIN
    UPDATE Distribucion.Lote_zapato
    SET cantidad = cantidad + 1
    WHERE id_lote_zapato = NEW.lote_zapato_id;  -- Actualiza solo el lote específico
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_incrementar_cantidad_lote
AFTER INSERT ON Produccion.Zapato
FOR EACH ROW EXECUTE FUNCTION incrementar_cantidad_lote();


CREATE OR REPLACE FUNCTION decrementar_cantidad_lote()
RETURNS TRIGGER AS $$
BEGIN
    UPDATE Distribucion.Lote_zapato
    SET cantidad = cantidad - 1
    WHERE id_lote_zapato = OLD.lote_zapato_id;  -- Actualiza solo el lote específico
    RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_decrementar_cantidad_lote
AFTER DELETE ON Produccion.Zapato
FOR EACH ROW EXECUTE FUNCTION decrementar_cantidad_lote();
