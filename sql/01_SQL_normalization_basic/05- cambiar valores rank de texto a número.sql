USE [FSI-JUAN];
GO

-- 05- cambiar valores rank de texto a n�mero--

-- Paso 1: Agregar nueva columna de tipo entero--
-- La columna 'rank_num' para guardar el valor num�rico extra�do de 'rank'
ALTER TABLE FSI_NORMALIZADO ADD rank_num INT;

select * from FSI_Normalizado

-- Paso 2: Extraer los d�gitos de 'rank' y convertirlos en entero-- 

UPDATE FSI_NORMALIZADO
SET rank_num = TRY_CAST(LEFT(rank, PATINDEX('%[^0-9]%', rank + 'x') - 1) AS INT);

-- Paso 3: Verificar los resultados de la transformaci�n

SELECT DISTINCT rank, rank_num
FROM FSI_NORMALIZADO
ORDER BY rank_num;
