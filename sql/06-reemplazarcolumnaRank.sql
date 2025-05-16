USE [FSI-JUAN];
GO

-- 06-reemplazar columna Rank.sql
-- Eliminar columna original 'rank' (tipo texto) 
-- renombrar 'rank_num' como 'rank' (tipo entero)


-- Paso 1: Eliminar columna de texto'rank'

ALTER TABLE FSI_NORMALIZADO DROP COLUMN rank;

-- Paso 2: Renombrar 'rank_num' a 'rank'
EXEC sp_rename 'FSI_NORMALIZADO.rank_num', 'rank', 'COLUMN';

select * from FSI_Normalizado
