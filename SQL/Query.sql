-- Realizar una consulta que permita conocer en que zapatos
-- fue usado determinado molde.

select * from Produccion.zapato pz
where molde_id = 1;

SELECT 
    Produccion.Zapato.*,         -- Selecciona todos los campos de la tabla zapato
    Produccion.Modelo_molde.*    -- Selecciona todos los campos de la tabla modelo_molde
FROM 
    Produccion.Zapato
JOIN 
    Produccion.Modelo_molde
ON 
    Produccion.Zapato.modelo_id = Produccion.Modelo_molde.modelo_id
WHERE molde_id =4; 


-- Realizar una consulta que permita conocer que lotes de
-- material fueron usados en la construcción de un zapato.




-- Realizar un consulta que permita conocer cuanto zapatos se
-- crearon para un diseño determinado.

SELECT 
    modelo_id,                 -- Campo para agrupar por modelo
    COUNT(*) AS total_zapatos  -- Cuenta el total de zapatos
FROM 
    Produccion.Zapato
WHERE 
	modelo_id = 1  -- Modelo a contar la cantidad
GROUP BY 
    modelo_id;

