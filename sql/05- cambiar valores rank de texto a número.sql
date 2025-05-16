USE [FSI-JUAN];
GO

-- 05- cambiar valores rank de texto a número--

-- Paso 1: Agregar nueva columna de tipo entero--
-- La columna 'rank_num' para guardar el valor numérico extraído de 'rank'
ALTER TABLE FSI_NORMALIZADO ADD rank_num INT;

select * from FSI_Normalizado

-- Paso 2: Extraer los dígitos de 'rank' y convertirlos en entero-- 

UPDATE FSI_NORMALIZADO
SET rank_num = TRY_CAST(LEFT(rank, PATINDEX('%[^0-9]%', rank + 'x') - 1) AS INT);

-- Paso 3: Verificar los resultados de la transformación

SELECT DISTINCT rank, rank_num
FROM FSI_NORMALIZADO
ORDER BY rank_num;
