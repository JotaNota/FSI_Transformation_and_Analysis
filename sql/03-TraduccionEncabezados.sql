USE [FSI-JUAN];
GO

-- 03-TraducirColumnas.sql

-- Sin corchetes por: cumple reglas de identificador regular.
EXEC sp_rename 'FSI_NORMALIZADO.pais', 'pais', 'COLUMN';
EXEC sp_rename 'FSI_NORMALIZADO.year', 'year', 'COLUMN';
EXEC sp_rename 'FSI_NORMALIZADO.Rank', 'rank', 'COLUMN';

 -- Con corchetes por: contiene espacios.
EXEC sp_rename 'FSI_NORMALIZADO.[Security Apparatus]', 'aparato_seguridad', 'COLUMN';
EXEC sp_rename 'FSI_NORMALIZADO.[Factionalized Elites]', 'elites_faccionadas', 'COLUMN';
EXEC sp_rename 'FSI_NORMALIZADO.[Group Grievance]', 'agravio_grupal', 'COLUMN';
EXEC sp_rename 'FSI_NORMALIZADO.Economy', 'economia', 'COLUMN';
EXEC sp_rename 'FSI_NORMALIZADO.[Economic Inequality]', 'desigualdad_economica', 'COLUMN';
EXEC sp_rename 'FSI_NORMALIZADO.[Human Flight and Brain Drain]', 'fuga_talentos', 'COLUMN';
EXEC sp_rename 'FSI_NORMALIZADO.[State Legitimacy]', 'legitimidad_estado', 'COLUMN';
EXEC sp_rename 'FSI_NORMALIZADO.[Public Services]', 'servicios_publicos', 'COLUMN';
EXEC sp_rename 'FSI_NORMALIZADO.[Human Rights]', 'derechos_humanos', 'COLUMN';
EXEC sp_rename 'FSI_NORMALIZADO.[Demographic Pressures]', 'presion_demografica', 'COLUMN';
EXEC sp_rename 'FSI_NORMALIZADO.[Refugees and IDPs]', 'refugiados_desplazados', 'COLUMN';
EXEC sp_rename 'FSI_NORMALIZADO.[External Intervention]', 'intervencion_externa', 'COLUMN';
EXEC sp_rename 'FSI_NORMALIZADO.total_fsi', 'total_fsi', 'COLUMN';
GO



-- Verifica una fila de la tabla usando el esquema dbo
SELECT TOP 1 *
FROM dbo.FSI_NORMALIZADO;

-- Lista los nombres de las columnas de la tabla FSI_NORMALIZADO en una sola columna
SELECT COLUMN_NAME AS encabezado
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'FSI_NORMALIZADO'
ORDER BY ORDINAL_POSITION;
