USE [FSI-JUAN];
GO


-- 07 - Crear columna 'nivel' y asignar valores según el total_fsi

-- Agregar nueva columna 'nivel' (de tipo texto)

ALTER TABLE FSI_NORMALIZADO
ADD nivel NVARCHAR(10);

-- Asignar valores de nivel según el rango de total_fsi
-- Bajo: hasta 40
-- Medio: hasta 80
-- Alto: mayor a 80

UPDATE FSI_NORMALIZADO
SET nivel = 
    CASE 
        WHEN total_fsi <= 40 THEN 'Bajo'
        WHEN total_fsi <= 80 THEN 'Medio'
        ELSE 'Alto'
    END;

-- Revisar distribución de niveles
SELECT nivel, COUNT(*) AS cantidad
FROM FSI_NORMALIZADO
GROUP BY nivel
ORDER BY nivel;


SELECT 
    nivel,
    MIN(total_fsi) AS min_fsi,
    MAX(total_fsi) AS max_fsi,
    CASE 
        WHEN nivel = 'Bajo' THEN '0–40'
        WHEN nivel = 'Medio' THEN '41–80'
        WHEN nivel = 'Alto' THEN '81 o más'
        ELSE 'Sin clasificar'
    END AS rango_teorico
FROM dbo.FSI_NORMALIZADO
GROUP BY nivel
ORDER BY nivel;



Select * from FSI_Normalizado