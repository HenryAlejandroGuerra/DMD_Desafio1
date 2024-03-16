--- SE CAMBIAN LOS NOMBRES DE LOS CAMPOS PARA QUE AL UNIFICAR LAS TABLAS NO DE ERROR
-- SAN MIGUEL
BEGIN TRANSACTION
SET QUOTED_IDENTIFIER ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
COMMIT
BEGIN TRANSACTION
GO
EXECUTE sp_rename N'dbo.SanMiguel_j20191007.fOrquÃ­dias', N'Tmp_Orquidias_1', 'COLUMN' 
GO
EXECUTE sp_rename N'dbo.SanMiguel_j20191007.[CarmesÃ­]', N'Tmp_Carmesi_2', 'COLUMN' 
GO
EXECUTE sp_rename N'dbo.SanMiguel_j20191007.ListÃ³n', N'Tmp_Liston_3', 'COLUMN' 
GO
EXECUTE sp_rename N'dbo.SanMiguel_j20191007.Tmp_Orquidias_1', N'Orquidias', 'COLUMN' 
GO
EXECUTE sp_rename N'dbo.SanMiguel_j20191007.Tmp_Carmesi_2', N'Carmesi', 'COLUMN' 
GO
EXECUTE sp_rename N'dbo.SanMiguel_j20191007.Tmp_Liston_3', N'Liston', 'COLUMN' 
GO
ALTER TABLE dbo.SanMiguel_j20191007 SET (LOCK_ESCALATION = TABLE)
GO
COMMIT

-- SAN SALVADOR
BEGIN TRANSACTION
SET QUOTED_IDENTIFIER ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
COMMIT
BEGIN TRANSACTION
GO
EXECUTE sp_rename N'dbo.SanSalvador_i20191007.fOrquÃ­dias', N'Tmp_Orquidias_4', 'COLUMN' 
GO
EXECUTE sp_rename N'dbo.SanSalvador_i20191007.[CarmesÃ­]', N'Tmp_Carmesi_5', 'COLUMN' 
GO
EXECUTE sp_rename N'dbo.SanSalvador_i20191007.ListÃ³n', N'Tmp_Liston_6', 'COLUMN' 
GO
EXECUTE sp_rename N'dbo.SanSalvador_i20191007.Tmp_Orquidias_4', N'Orquidias', 'COLUMN' 
GO
EXECUTE sp_rename N'dbo.SanSalvador_i20191007.Tmp_Carmesi_5', N'Carmesi', 'COLUMN' 
GO
EXECUTE sp_rename N'dbo.SanSalvador_i20191007.Tmp_Liston_6', N'Liston', 'COLUMN' 
GO
ALTER TABLE dbo.SanSalvador_i20191007 SET (LOCK_ESCALATION = TABLE)
GO
COMMIT

-- SANTA ANA
BEGIN TRANSACTION
SET QUOTED_IDENTIFIER ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
COMMIT
BEGIN TRANSACTION
GO
EXECUTE sp_rename N'dbo.SantaAna_c20191007.fOrquÃ­dias', N'Tmp_Orquidias_7', 'COLUMN' 
GO
EXECUTE sp_rename N'dbo.SantaAna_c20191007.[CarmesÃ­]', N'Tmp_Carmesi_8', 'COLUMN' 
GO
EXECUTE sp_rename N'dbo.SantaAna_c20191007.ListÃ³n', N'Tmp_Liston_9', 'COLUMN' 
GO
EXECUTE sp_rename N'dbo.SantaAna_c20191007.Tmp_Orquidias_7', N'Orquidias', 'COLUMN' 
GO
EXECUTE sp_rename N'dbo.SantaAna_c20191007.Tmp_Carmesi_8', N'Carmesi', 'COLUMN' 
GO
EXECUTE sp_rename N'dbo.SantaAna_c20191007.Tmp_Liston_9', N'Liston', 'COLUMN' 
GO
ALTER TABLE dbo.SantaAna_c20191007 SET (LOCK_ESCALATION = TABLE)
GO
COMMIT

--- SE UNIFICAN LAS TRES TABLAS EN UNA
SELECT *
INTO [Desafio1DMD].[dbo].[Departamentos]
FROM (
    SELECT id, Rosas, Claveles, Macetas, Tierra, Girasoles, Hortensia, Globos, Tarjetas, Orquidias, Carmesi, Lirios, Aurora, Tulipanes, Liston
    FROM [Desafio1DMD].[dbo].[SanMiguel_j20191007]

    UNION ALL

    SELECT id, Rosas, Claveles, Macetas, Tierra, Girasoles, Hortensia, Globos, Tarjetas, Orquidias, Carmesi, Lirios, Aurora, Tulipanes, Liston
    FROM [Desafio1DMD].[dbo].[SanSalvador_i20191007]

    UNION ALL

    SELECT id, Rosas, Claveles, Macetas, Tierra, Girasoles, Hortensia, Globos, Tarjetas, Orquidias, Carmesi, Lirios, Aurora, Tulipanes, Liston
    FROM [Desafio1DMD].[dbo].[SantaAna_c20191007]
) AS Tabla_Combinada;

-- SAN MIGUEL (TODOS LOS PRODUCTOS)
SELECT 'Rosas' AS Producto, COUNT(*) AS Ventas FROM [Desafio1DMD].[dbo].[SanMiguel_j20191007] WHERE Rosas = '1'
UNION ALL
SELECT 'Claveles' AS Producto, COUNT(*) AS Ventas FROM [Desafio1DMD].[dbo].[SanMiguel_j20191007] WHERE Claveles = '1'
UNION ALL
SELECT 'Macetas' AS Producto, COUNT(*) AS Ventas FROM [Desafio1DMD].[dbo].[SanMiguel_j20191007] WHERE Macetas = '1'
UNION ALL
SELECT 'Tierra' AS Producto, COUNT(*) AS Ventas FROM [Desafio1DMD].[dbo].[SanMiguel_j20191007] WHERE Tierra = '1'
UNION ALL
SELECT 'Girasoles' AS Producto, COUNT(*) AS Ventas FROM [Desafio1DMD].[dbo].[SanMiguel_j20191007] WHERE Girasoles = '1'
UNION ALL
SELECT 'Hortensia' AS Producto, COUNT(*) AS Ventas FROM [Desafio1DMD].[dbo].[SanMiguel_j20191007] WHERE Hortensia = '1'
UNION ALL
SELECT 'Globos' AS Producto, COUNT(*) AS Ventas FROM [Desafio1DMD].[dbo].[SanMiguel_j20191007] WHERE Globos = '1'
UNION ALL
SELECT 'Tarjetas' AS Producto, COUNT(*) AS Ventas FROM [Desafio1DMD].[dbo].[SanMiguel_j20191007] WHERE Tarjetas = '1'
UNION ALL
SELECT 'Orquidias' AS Producto, COUNT(*) AS Ventas FROM [Desafio1DMD].[dbo].[SanMiguel_j20191007] WHERE Orquidias = '1'
UNION ALL
SELECT 'Carmesi' AS Producto, COUNT(*) AS Ventas FROM [Desafio1DMD].[dbo].[SanMiguel_j20191007] WHERE Carmesi = '1'
UNION ALL
SELECT 'Lirios' AS Producto, COUNT(*) AS Ventas FROM [Desafio1DMD].[dbo].[SanMiguel_j20191007] WHERE Lirios = '1'
UNION ALL
SELECT 'Aurora' AS Producto, COUNT(*) AS Ventas FROM [Desafio1DMD].[dbo].[SanMiguel_j20191007] WHERE Aurora = '1'
UNION ALL
SELECT 'Tulipanes' AS Producto, COUNT(*) AS Ventas FROM [Desafio1DMD].[dbo].[SanMiguel_j20191007] WHERE Tulipanes = '1'
UNION ALL
SELECT 'Liston' AS Producto, COUNT(*) AS Ventas FROM [Desafio1DMD].[dbo].[SanMiguel_j20191007] WHERE Liston = '1'
ORDER BY ventas DESC;

-- SAN SALVADOR (TODOS LOS PRODUCTOS)
SELECT 'Rosas' AS Producto, COUNT(*) AS Ventas FROM [Desafio1DMD].[dbo].[SanSalvador_i20191007] WHERE Rosas = '1'
UNION ALL
SELECT 'Claveles' AS Producto, COUNT(*) AS Ventas FROM [Desafio1DMD].[dbo].[SanSalvador_i20191007] WHERE Claveles = '1'
UNION ALL
SELECT 'Macetas' AS Producto, COUNT(*) AS Ventas FROM [Desafio1DMD].[dbo].[SanSalvador_i20191007] WHERE Macetas = '1'
UNION ALL
SELECT 'Tierra' AS Producto, COUNT(*) AS Ventas FROM [Desafio1DMD].[dbo].[SanSalvador_i20191007] WHERE Tierra = '1'
UNION ALL
SELECT 'Girasoles' AS Producto, COUNT(*) AS Ventas FROM [Desafio1DMD].[dbo].[SanSalvador_i20191007] WHERE Girasoles = '1'
UNION ALL
SELECT 'Hortensia' AS Producto, COUNT(*) AS Ventas FROM [Desafio1DMD].[dbo].[SanSalvador_i20191007] WHERE Hortensia = '1'
UNION ALL
SELECT 'Globos' AS Producto, COUNT(*) AS Ventas FROM [Desafio1DMD].[dbo].[SanSalvador_i20191007] WHERE Globos = '1'
UNION ALL
SELECT 'Tarjetas' AS Producto, COUNT(*) AS Ventas FROM [Desafio1DMD].[dbo].[SanSalvador_i20191007] WHERE Tarjetas = '1'
UNION ALL
SELECT 'Orquidias' AS Producto, COUNT(*) AS Ventas FROM [Desafio1DMD].[dbo].[SanSalvador_i20191007] WHERE Orquidias = '1'
UNION ALL
SELECT 'Carmesi' AS Producto, COUNT(*) AS Ventas FROM [Desafio1DMD].[dbo].[SanSalvador_i20191007] WHERE Carmesi = '1'
UNION ALL
SELECT 'Lirios' AS Producto, COUNT(*) AS Ventas FROM [Desafio1DMD].[dbo].[SanSalvador_i20191007] WHERE Lirios = '1'
UNION ALL
SELECT 'Aurora' AS Producto, COUNT(*) AS Ventas FROM [Desafio1DMD].[dbo].[SanSalvador_i20191007] WHERE Aurora = '1'
UNION ALL
SELECT 'Tulipanes' AS Producto, COUNT(*) AS Ventas FROM [Desafio1DMD].[dbo].[SanSalvador_i20191007] WHERE Tulipanes = '1'
UNION ALL
SELECT 'Liston' AS Producto, COUNT(*) AS Ventas FROM [Desafio1DMD].[dbo].[SanSalvador_i20191007] WHERE Liston = '1'
ORDER BY ventas DESC;

-- SANTA ANA (TODOS LOS PRODUCTOS)
SELECT 'Rosas' AS Producto, COUNT(*) AS Ventas FROM [Desafio1DMD].[dbo].[SantaAna_c20191007] WHERE Rosas = '1'
UNION ALL
SELECT 'Claveles' AS Producto, COUNT(*) AS Ventas FROM [Desafio1DMD].[dbo].[SantaAna_c20191007] WHERE Claveles = '1'
UNION ALL
SELECT 'Macetas' AS Producto, COUNT(*) AS Ventas FROM [Desafio1DMD].[dbo].[SantaAna_c20191007] WHERE Macetas = '1'
UNION ALL
SELECT 'Tierra' AS Producto, COUNT(*) AS Ventas FROM [Desafio1DMD].[dbo].[SantaAna_c20191007] WHERE Tierra = '1'
UNION ALL
SELECT 'Girasoles' AS Producto, COUNT(*) AS Ventas FROM [Desafio1DMD].[dbo].[SantaAna_c20191007] WHERE Girasoles = '1'
UNION ALL
SELECT 'Hortensia' AS Producto, COUNT(*) AS Ventas FROM [Desafio1DMD].[dbo].[SantaAna_c20191007] WHERE Hortensia = '1'
UNION ALL
SELECT 'Globos' AS Producto, COUNT(*) AS Ventas FROM [Desafio1DMD].[dbo].[SantaAna_c20191007] WHERE Globos = '1'
UNION ALL
SELECT 'Tarjetas' AS Producto, COUNT(*) AS Ventas FROM [Desafio1DMD].[dbo].[SantaAna_c20191007] WHERE Tarjetas = '1'
UNION ALL
SELECT 'Orquidias' AS Producto, COUNT(*) AS Ventas FROM [Desafio1DMD].[dbo].[SantaAna_c20191007] WHERE Orquidias = '1'
UNION ALL
SELECT 'Carmesi' AS Producto, COUNT(*) AS Ventas FROM [Desafio1DMD].[dbo].[SantaAna_c20191007] WHERE Carmesi = '1'
UNION ALL
SELECT 'Lirios' AS Producto, COUNT(*) AS Ventas FROM [Desafio1DMD].[dbo].[SantaAna_c20191007] WHERE Lirios = '1'
UNION ALL
SELECT 'Aurora' AS Producto, COUNT(*) AS Ventas FROM [Desafio1DMD].[dbo].[SantaAna_c20191007] WHERE Aurora = '1'
UNION ALL
SELECT 'Tulipanes' AS Producto, COUNT(*) AS Ventas FROM [Desafio1DMD].[dbo].[SantaAna_c20191007] WHERE Tulipanes = '1'
UNION ALL
SELECT 'Liston' AS Producto, COUNT(*) AS Ventas FROM [Desafio1DMD].[dbo].[SantaAna_c20191007] WHERE Liston = '1'
ORDER BY ventas DESC;

--- MOSTRAR EL PRODUCTO MÁS VENDIDO POR DEPARTAMENTO EN UNA SOLA CONSULTA
WITH p as(
	-- SAN MIGUEL
	SELECT TOP 1
		Departamento,
		Producto,
		COUNT(*) AS Ventas
	FROM
		(
			SELECT 'San Miguel' AS Departamento, 'Rosas' AS Producto FROM [Desafio1DMD].[dbo].[SanMiguel_j20191007] WHERE Rosas = '1'
			UNION ALL
			SELECT 'San Miguel' AS Departamento, 'Claveles' AS Producto FROM [Desafio1DMD].[dbo].[SanMiguel_j20191007] WHERE Claveles = '1'
			UNION ALL
			SELECT 'San Miguel' AS Departamento, 'Macetas' AS Producto FROM [Desafio1DMD].[dbo].[SanMiguel_j20191007] WHERE Macetas = '1'
			UNION ALL
			SELECT 'San Miguel' AS Departamento, 'Tierra' AS Producto FROM [Desafio1DMD].[dbo].[SanMiguel_j20191007] WHERE Tierra = '1'
			UNION ALL
			SELECT 'San Miguel' AS Departamento, 'Girasoles' AS Producto FROM [Desafio1DMD].[dbo].[SanMiguel_j20191007] WHERE Girasoles = '1'
			UNION ALL
			SELECT 'San Miguel' AS Departamento, 'Hortensia' AS Producto FROM [Desafio1DMD].[dbo].[SanMiguel_j20191007] WHERE Hortensia = '1'
			UNION ALL
			SELECT 'San Miguel' AS Departamento, 'Globos' AS Producto FROM [Desafio1DMD].[dbo].[SanMiguel_j20191007] WHERE Globos = '1'
			UNION ALL
			SELECT 'San Miguel' AS Departamento, 'Tarjetas' AS Producto FROM [Desafio1DMD].[dbo].[SanMiguel_j20191007] WHERE Tarjetas = '1'
			UNION ALL
			SELECT 'San Miguel' AS Departamento, 'Orquidias' AS Producto FROM [Desafio1DMD].[dbo].[SanMiguel_j20191007] WHERE Orquidias = '1'
			UNION ALL
			SELECT 'San Miguel' AS Departamento, 'Carmesi' AS Producto FROM [Desafio1DMD].[dbo].[SanMiguel_j20191007] WHERE Carmesi = '1'
			UNION ALL
			SELECT 'San Miguel' AS Departamento, 'Lirios' AS Producto FROM [Desafio1DMD].[dbo].[SanMiguel_j20191007] WHERE Lirios = '1'
			UNION ALL
			SELECT 'San Miguel' AS Departamento, 'Aurora' AS Producto FROM [Desafio1DMD].[dbo].[SanMiguel_j20191007] WHERE Aurora = '1'
			UNION ALL
			SELECT 'San Miguel' AS Departamento, 'Tulipanes' AS Producto FROM [Desafio1DMD].[dbo].[SanMiguel_j20191007] WHERE Tulipanes = '1'
			UNION ALL
			SELECT 'San Miguel' AS Departamento, 'Liston' AS Producto FROM [Desafio1DMD].[dbo].[SanMiguel_j20191007] WHERE Liston = '1'
		) AS subquery
	GROUP BY Departamento, Producto
	ORDER BY COUNT(*) DESC
	-- UNIR
	UNION
	-- SAN SALVADOR
	SELECT TOP 1
		Departamento,
		Producto,
		COUNT(*) AS Ventas
	FROM
		(
			SELECT 'San Salvador' AS Departamento, 'Rosas' AS Producto FROM [Desafio1DMD].[dbo].[SanSalvador_i20191007] WHERE Rosas = '1'
			UNION ALL
			SELECT 'San Salvador' AS Departamento, 'Claveles' AS Producto FROM [Desafio1DMD].[dbo].[SanSalvador_i20191007] WHERE Claveles = '1'
			UNION ALL
			SELECT 'San Salvador' AS Departamento, 'Macetas' AS Producto FROM [Desafio1DMD].[dbo].[SanSalvador_i20191007] WHERE Macetas = '1'
			UNION ALL
			SELECT 'San Salvador' AS Departamento, 'Tierra' AS Producto FROM [Desafio1DMD].[dbo].[SanSalvador_i20191007] WHERE Tierra = '1'
			UNION ALL
			SELECT 'San Salvador' AS Departamento, 'Girasoles' AS Producto FROM [Desafio1DMD].[dbo].[SanSalvador_i20191007] WHERE Girasoles = '1'
			UNION ALL
			SELECT 'San Salvador' AS Departamento, 'Hortensia' AS Producto FROM [Desafio1DMD].[dbo].[SanSalvador_i20191007] WHERE Hortensia = '1'
			UNION ALL
			SELECT 'San Salvador' AS Departamento, 'Globos' AS Producto FROM [Desafio1DMD].[dbo].[SanSalvador_i20191007] WHERE Globos = '1'
			UNION ALL
			SELECT 'San Salvador' AS Departamento, 'Tarjetas' AS Producto FROM [Desafio1DMD].[dbo].[SanSalvador_i20191007] WHERE Tarjetas = '1'
			UNION ALL
			SELECT 'San Salvador' AS Departamento, 'Orquidias' AS Producto FROM [Desafio1DMD].[dbo].[SanSalvador_i20191007] WHERE Orquidias = '1'
			UNION ALL
			SELECT 'San Salvador' AS Departamento, 'Carmesi' AS Producto FROM [Desafio1DMD].[dbo].[SanSalvador_i20191007] WHERE Carmesi = '1'
			UNION ALL
			SELECT 'San Salvador' AS Departamento, 'Lirios' AS Producto FROM [Desafio1DMD].[dbo].[SanSalvador_i20191007] WHERE Lirios = '1'
			UNION ALL
			SELECT 'San Salvador' AS Departamento, 'Aurora' AS Producto FROM [Desafio1DMD].[dbo].[SanSalvador_i20191007] WHERE Aurora = '1'
			UNION ALL
			SELECT 'San Salvador' AS Departamento, 'Tulipanes' AS Producto FROM [Desafio1DMD].[dbo].[SanSalvador_i20191007] WHERE Tulipanes = '1'
			UNION ALL
			SELECT 'San Salvador' AS Departamento, 'Liston' AS Producto FROM [Desafio1DMD].[dbo].[SanSalvador_i20191007] WHERE Liston = '1'
		) AS subquery
	GROUP BY Departamento, Producto
	ORDER BY COUNT(*) DESC
	-- UNIR
	UNION
	-- SANTA ANA
	SELECT TOP 1
		Departamento,
		Producto,
		COUNT(*) AS Ventas
	FROM
		(
			SELECT 'Santa Ana' AS Departamento, 'Rosas' AS Producto FROM [Desafio1DMD].[dbo].[SantaAna_c20191007] WHERE Rosas = '1'
			UNION ALL
			SELECT 'Santa Ana' AS Departamento, 'Claveles' AS Producto FROM [Desafio1DMD].[dbo].[SantaAna_c20191007] WHERE Claveles = '1'
			UNION ALL
			SELECT 'Santa Ana' AS Departamento, 'Macetas' AS Producto FROM [Desafio1DMD].[dbo].[SantaAna_c20191007] WHERE Macetas = '1'
			UNION ALL
			SELECT 'Santa Ana' AS Departamento, 'Tierra' AS Producto FROM [Desafio1DMD].[dbo].[SantaAna_c20191007] WHERE Tierra = '1'
			UNION ALL
			SELECT 'Santa Ana' AS Departamento, 'Girasoles' AS Producto FROM [Desafio1DMD].[dbo].[SantaAna_c20191007] WHERE Girasoles = '1'
			UNION ALL
			SELECT 'Santa Ana' AS Departamento, 'Hortensia' AS Producto FROM [Desafio1DMD].[dbo].[SantaAna_c20191007] WHERE Hortensia = '1'
			UNION ALL
			SELECT 'Santa Ana' AS Departamento, 'Globos' AS Producto FROM [Desafio1DMD].[dbo].[SantaAna_c20191007] WHERE Globos = '1'
			UNION ALL
			SELECT 'Santa Ana' AS Departamento, 'Tarjetas' AS Producto FROM [Desafio1DMD].[dbo].[SantaAna_c20191007] WHERE Tarjetas = '1'
			UNION ALL
			SELECT 'Santa Ana' AS Departamento, 'Orquidias' AS Producto FROM [Desafio1DMD].[dbo].[SantaAna_c20191007] WHERE Orquidias = '1'
			UNION ALL
			SELECT 'Santa Ana' AS Departamento, 'Carmesi' AS Producto FROM [Desafio1DMD].[dbo].[SantaAna_c20191007] WHERE Carmesi = '1'
			UNION ALL
			SELECT 'Santa Ana' AS Departamento, 'Lirios' AS Producto FROM [Desafio1DMD].[dbo].[SantaAna_c20191007] WHERE Lirios = '1'
			UNION ALL
			SELECT 'Santa Ana' AS Departamento, 'Aurora' AS Producto FROM [Desafio1DMD].[dbo].[SantaAna_c20191007] WHERE Aurora = '1'
			UNION ALL
			SELECT 'Santa Ana' AS Departamento, 'Tulipanes' AS Producto FROM [Desafio1DMD].[dbo].[SantaAna_c20191007] WHERE Tulipanes = '1'
			UNION ALL
			SELECT 'Santa Ana' AS Departamento, 'Liston' AS Producto FROM [Desafio1DMD].[dbo].[SantaAna_c20191007] WHERE Liston = '1'
		) AS subquery
	GROUP BY Departamento, Producto
	ORDER BY COUNT(*) DESC
) SELECT Distinct(p.Departamento), p.Producto, p.Ventas FROM p GROUP BY p.Departamento, p.Producto, p.Ventas;

--- MOSTRAR EL PRODUCTO MÁS VENDIDO DE TODOS LOS DEPARTAMENTOS EN LA TABLA UNIFICADA
-- TODOS LOS PRODUCTOS
SELECT 'Rosas' AS Producto, COUNT(*) AS Ventas FROM [Desafio1DMD].[dbo].[Departamentos] WHERE Rosas = '1'
UNION ALL
SELECT 'Claveles' AS Producto, COUNT(*) AS Ventas FROM [Desafio1DMD].[dbo].[Departamentos] WHERE Claveles = '1'
UNION ALL
SELECT 'Macetas' AS Producto, COUNT(*) AS Ventas FROM [Desafio1DMD].[dbo].[Departamentos] WHERE Macetas = '1'
UNION ALL
SELECT 'Tierra' AS Producto, COUNT(*) AS Ventas FROM [Desafio1DMD].[dbo].[Departamentos] WHERE Tierra = '1'
UNION ALL
SELECT 'Girasoles' AS Producto, COUNT(*) AS Ventas FROM [Desafio1DMD].[dbo].[Departamentos] WHERE Girasoles = '1'
UNION ALL
SELECT 'Hortensia' AS Producto, COUNT(*) AS Ventas FROM [Desafio1DMD].[dbo].[Departamentos] WHERE Hortensia = '1'
UNION ALL
SELECT 'Globos' AS Producto, COUNT(*) AS Ventas FROM [Desafio1DMD].[dbo].[Departamentos] WHERE Globos = '1'
UNION ALL
SELECT 'Tarjetas' AS Producto, COUNT(*) AS Ventas FROM [Desafio1DMD].[dbo].[Departamentos] WHERE Tarjetas = '1'
UNION ALL
SELECT 'Orquidias' AS Producto, COUNT(*) AS Ventas FROM [Desafio1DMD].[dbo].[Departamentos] WHERE Orquidias = '1'
UNION ALL
SELECT 'Carmesi' AS Producto, COUNT(*) AS Ventas FROM [Desafio1DMD].[dbo].[Departamentos] WHERE Carmesi = '1'
UNION ALL
SELECT 'Lirios' AS Producto, COUNT(*) AS Ventas FROM [Desafio1DMD].[dbo].[Departamentos] WHERE Lirios = '1'
UNION ALL
SELECT 'Aurora' AS Producto, COUNT(*) AS Ventas FROM [Desafio1DMD].[dbo].[Departamentos] WHERE Aurora = '1'
UNION ALL
SELECT 'Tulipanes' AS Producto, COUNT(*) AS Ventas FROM [Desafio1DMD].[dbo].[Departamentos] WHERE Tulipanes = '1'
UNION ALL
SELECT 'Liston' AS Producto, COUNT(*) AS Ventas FROM [Desafio1DMD].[dbo].[Departamentos] WHERE Liston = '1'
ORDER BY ventas DESC;

-- SOLO EL PRODUCTO MÁS VENDIDO
SELECT TOP 1
    Departamento,
    Producto,
    COUNT(*) AS Ventas
FROM
    (
        SELECT 'País' AS Departamento, 'Rosas' AS Producto FROM [Desafio1DMD].[dbo].[Departamentos] WHERE Rosas = '1'
        UNION ALL
        SELECT 'País' AS Departamento, 'Claveles' AS Producto FROM [Desafio1DMD].[dbo].[Departamentos] WHERE Claveles = '1'
        UNION ALL
        SELECT 'País' AS Departamento, 'Macetas' AS Producto FROM [Desafio1DMD].[dbo].[Departamentos] WHERE Macetas = '1'
        UNION ALL
        SELECT 'País' AS Departamento, 'Tierra' AS Producto FROM [Desafio1DMD].[dbo].[Departamentos] WHERE Tierra = '1'
        UNION ALL
        SELECT 'País' AS Departamento, 'Girasoles' AS Producto FROM [Desafio1DMD].[dbo].[Departamentos] WHERE Girasoles = '1'
        UNION ALL
        SELECT 'País' AS Departamento, 'Hortensia' AS Producto FROM [Desafio1DMD].[dbo].[Departamentos] WHERE Hortensia = '1'
        UNION ALL
        SELECT 'País' AS Departamento, 'Globos' AS Producto FROM [Desafio1DMD].[dbo].[Departamentos] WHERE Globos = '1'
        UNION ALL
        SELECT 'País' AS Departamento, 'Tarjetas' AS Producto FROM [Desafio1DMD].[dbo].[Departamentos] WHERE Tarjetas = '1'
        UNION ALL
        SELECT 'País' AS Departamento, 'Orquidias' AS Producto FROM [Desafio1DMD].[dbo].[Departamentos] WHERE Orquidias = '1'
		UNION ALL
        SELECT 'País' AS Departamento, 'Carmesi' AS Producto FROM [Desafio1DMD].[dbo].[Departamentos] WHERE Carmesi = '1'
        UNION ALL
        SELECT 'País' AS Departamento, 'Lirios' AS Producto FROM [Desafio1DMD].[dbo].[Departamentos] WHERE Lirios = '1'
        UNION ALL
        SELECT 'País' AS Departamento, 'Aurora' AS Producto FROM [Desafio1DMD].[dbo].[Departamentos] WHERE Aurora = '1'
        UNION ALL
        SELECT 'País' AS Departamento, 'Tulipanes' AS Producto FROM [Desafio1DMD].[dbo].[Departamentos] WHERE Tulipanes = '1'
        UNION ALL
        SELECT 'País' AS Departamento, 'Liston' AS Producto FROM [Desafio1DMD].[dbo].[Departamentos] WHERE Liston = '1'
    ) AS subquery
GROUP BY Departamento, Producto
ORDER BY COUNT(*) DESC;

--- MOSTRAR LA MEJOR COMBINACIÓN DE PRODUCTOS
-- SAN MIGUEL
SELECT TOP 5
    Departamento,
    Producto,
    COUNT(*) AS Ventas
FROM
    (
        SELECT 'San Miguel' AS Departamento, 'Rosas' AS Producto FROM [Desafio1DMD].[dbo].[SanMiguel_j20191007] WHERE Rosas = '1'
        UNION ALL
        SELECT 'San Miguel' AS Departamento, 'Claveles' AS Producto FROM [Desafio1DMD].[dbo].[SanMiguel_j20191007] WHERE Claveles = '1'
        UNION ALL
        SELECT 'San Miguel' AS Departamento, 'Macetas' AS Producto FROM [Desafio1DMD].[dbo].[SanMiguel_j20191007] WHERE Macetas = '1'
        UNION ALL
        SELECT 'San Miguel' AS Departamento, 'Tierra' AS Producto FROM [Desafio1DMD].[dbo].[SanMiguel_j20191007] WHERE Tierra = '1'
        UNION ALL
        SELECT 'San Miguel' AS Departamento, 'Girasoles' AS Producto FROM [Desafio1DMD].[dbo].[SanMiguel_j20191007] WHERE Girasoles = '1'
        UNION ALL
        SELECT 'San Miguel' AS Departamento, 'Hortensia' AS Producto FROM [Desafio1DMD].[dbo].[SanMiguel_j20191007] WHERE Hortensia = '1'
        UNION ALL
        SELECT 'San Miguel' AS Departamento, 'Globos' AS Producto FROM [Desafio1DMD].[dbo].[SanMiguel_j20191007] WHERE Globos = '1'
        UNION ALL
        SELECT 'San Miguel' AS Departamento, 'Tarjetas' AS Producto FROM [Desafio1DMD].[dbo].[SanMiguel_j20191007] WHERE Tarjetas = '1'
        UNION ALL
        SELECT 'San Miguel' AS Departamento, 'Orquidias' AS Producto FROM [Desafio1DMD].[dbo].[SanMiguel_j20191007] WHERE Orquidias = '1'
		UNION ALL
        SELECT 'San Miguel' AS Departamento, 'Carmesi' AS Producto FROM [Desafio1DMD].[dbo].[SanMiguel_j20191007] WHERE Carmesi = '1'
        UNION ALL
        SELECT 'San Miguel' AS Departamento, 'Lirios' AS Producto FROM [Desafio1DMD].[dbo].[SanMiguel_j20191007] WHERE Lirios = '1'
        UNION ALL
        SELECT 'San Miguel' AS Departamento, 'Aurora' AS Producto FROM [Desafio1DMD].[dbo].[SanMiguel_j20191007] WHERE Aurora = '1'
        UNION ALL
        SELECT 'San Miguel' AS Departamento, 'Tulipanes' AS Producto FROM [Desafio1DMD].[dbo].[SanMiguel_j20191007] WHERE Tulipanes = '1'
        UNION ALL
        SELECT 'San Miguel' AS Departamento, 'Liston' AS Producto FROM [Desafio1DMD].[dbo].[SanMiguel_j20191007] WHERE Liston = '1'
    ) AS subquery
GROUP BY Departamento, Producto
ORDER BY COUNT(*) DESC;

-- SAN SALVADOR
SELECT TOP 5
    Departamento,
    Producto,
    COUNT(*) AS Ventas
FROM
    (
        SELECT 'San Salvador' AS Departamento, 'Rosas' AS Producto FROM [Desafio1DMD].[dbo].[SanSalvador_i20191007] WHERE Rosas = '1'
        UNION ALL
        SELECT 'San Salvador' AS Departamento, 'Claveles' AS Producto FROM [Desafio1DMD].[dbo].[SanSalvador_i20191007] WHERE Claveles = '1'
        UNION ALL
        SELECT 'San Salvador' AS Departamento, 'Macetas' AS Producto FROM [Desafio1DMD].[dbo].[SanSalvador_i20191007] WHERE Macetas = '1'
        UNION ALL
        SELECT 'San Salvador' AS Departamento, 'Tierra' AS Producto FROM [Desafio1DMD].[dbo].[SanSalvador_i20191007] WHERE Tierra = '1'
        UNION ALL
        SELECT 'San Salvador' AS Departamento, 'Girasoles' AS Producto FROM [Desafio1DMD].[dbo].[SanSalvador_i20191007] WHERE Girasoles = '1'
        UNION ALL
        SELECT 'San Salvador' AS Departamento, 'Hortensia' AS Producto FROM [Desafio1DMD].[dbo].[SanSalvador_i20191007] WHERE Hortensia = '1'
        UNION ALL
        SELECT 'San Salvador' AS Departamento, 'Globos' AS Producto FROM [Desafio1DMD].[dbo].[SanSalvador_i20191007] WHERE Globos = '1'
        UNION ALL
        SELECT 'San Salvador' AS Departamento, 'Tarjetas' AS Producto FROM [Desafio1DMD].[dbo].[SanSalvador_i20191007] WHERE Tarjetas = '1'
        UNION ALL
        SELECT 'San Salvador' AS Departamento, 'Orquidias' AS Producto FROM [Desafio1DMD].[dbo].[SanSalvador_i20191007] WHERE Orquidias = '1'
		UNION ALL
        SELECT 'San Salvador' AS Departamento, 'Carmesi' AS Producto FROM [Desafio1DMD].[dbo].[SanSalvador_i20191007] WHERE Carmesi = '1'
        UNION ALL
        SELECT 'San Salvador' AS Departamento, 'Lirios' AS Producto FROM [Desafio1DMD].[dbo].[SanSalvador_i20191007] WHERE Lirios = '1'
        UNION ALL
        SELECT 'San Salvador' AS Departamento, 'Aurora' AS Producto FROM [Desafio1DMD].[dbo].[SanSalvador_i20191007] WHERE Aurora = '1'
        UNION ALL
        SELECT 'San Salvador' AS Departamento, 'Tulipanes' AS Producto FROM [Desafio1DMD].[dbo].[SanSalvador_i20191007] WHERE Tulipanes = '1'
        UNION ALL
        SELECT 'San Salvador' AS Departamento, 'Liston' AS Producto FROM [Desafio1DMD].[dbo].[SanSalvador_i20191007] WHERE Liston = '1'
    ) AS subquery
GROUP BY Departamento, Producto
ORDER BY COUNT(*) DESC;

-- SANTA ANA
SELECT TOP 5
    Departamento,
    Producto,
    COUNT(*) AS Ventas
FROM
    (
        SELECT 'Santa Ana' AS Departamento, 'Rosas' AS Producto FROM [Desafio1DMD].[dbo].[SantaAna_c20191007] WHERE Rosas = '1'
        UNION ALL
        SELECT 'Santa Ana' AS Departamento, 'Claveles' AS Producto FROM [Desafio1DMD].[dbo].[SantaAna_c20191007] WHERE Claveles = '1'
        UNION ALL
        SELECT 'Santa Ana' AS Departamento, 'Macetas' AS Producto FROM [Desafio1DMD].[dbo].[SantaAna_c20191007] WHERE Macetas = '1'
        UNION ALL
        SELECT 'Santa Ana' AS Departamento, 'Tierra' AS Producto FROM [Desafio1DMD].[dbo].[SantaAna_c20191007] WHERE Tierra = '1'
        UNION ALL
        SELECT 'Santa Ana' AS Departamento, 'Girasoles' AS Producto FROM [Desafio1DMD].[dbo].[SantaAna_c20191007] WHERE Girasoles = '1'
        UNION ALL
        SELECT 'Santa Ana' AS Departamento, 'Hortensia' AS Producto FROM [Desafio1DMD].[dbo].[SantaAna_c20191007] WHERE Hortensia = '1'
        UNION ALL
        SELECT 'Santa Ana' AS Departamento, 'Globos' AS Producto FROM [Desafio1DMD].[dbo].[SantaAna_c20191007] WHERE Globos = '1'
        UNION ALL
        SELECT 'Santa Ana' AS Departamento, 'Tarjetas' AS Producto FROM [Desafio1DMD].[dbo].[SantaAna_c20191007] WHERE Tarjetas = '1'
        UNION ALL
        SELECT 'Santa Ana' AS Departamento, 'Orquidias' AS Producto FROM [Desafio1DMD].[dbo].[SantaAna_c20191007] WHERE Orquidias = '1'
		UNION ALL
        SELECT 'Santa Ana' AS Departamento, 'Carmesi' AS Producto FROM [Desafio1DMD].[dbo].[SantaAna_c20191007] WHERE Carmesi = '1'
        UNION ALL
        SELECT 'Santa Ana' AS Departamento, 'Lirios' AS Producto FROM [Desafio1DMD].[dbo].[SantaAna_c20191007] WHERE Lirios = '1'
        UNION ALL
        SELECT 'Santa Ana' AS Departamento, 'Aurora' AS Producto FROM [Desafio1DMD].[dbo].[SantaAna_c20191007] WHERE Aurora = '1'
        UNION ALL
        SELECT 'Santa Ana' AS Departamento, 'Tulipanes' AS Producto FROM [Desafio1DMD].[dbo].[SantaAna_c20191007] WHERE Tulipanes = '1'
        UNION ALL
        SELECT 'Santa Ana' AS Departamento, 'Liston' AS Producto FROM [Desafio1DMD].[dbo].[SantaAna_c20191007] WHERE Liston = '1'
    ) AS subquery
GROUP BY Departamento, Producto
ORDER BY COUNT(*) DESC;

-- POR PAIS (TODOS LOS DEPARTAMENTOS)
SELECT TOP 5
    Departamento,
    Producto,
    COUNT(*) AS Ventas
FROM
    (
        SELECT 'Santa Ana' AS Departamento, 'Rosas' AS Producto FROM [Desafio1DMD].[dbo].[Departamentos] WHERE Rosas = '1'
        UNION ALL
        SELECT 'Santa Ana' AS Departamento, 'Claveles' AS Producto FROM [Desafio1DMD].[dbo].[Departamentos] WHERE Claveles = '1'
        UNION ALL
        SELECT 'Santa Ana' AS Departamento, 'Macetas' AS Producto FROM [Desafio1DMD].[dbo].[Departamentos] WHERE Macetas = '1'
        UNION ALL
        SELECT 'Santa Ana' AS Departamento, 'Tierra' AS Producto FROM [Desafio1DMD].[dbo].[Departamentos] WHERE Tierra = '1'
        UNION ALL
        SELECT 'Santa Ana' AS Departamento, 'Girasoles' AS Producto FROM [Desafio1DMD].[dbo].[Departamentos] WHERE Girasoles = '1'
        UNION ALL
        SELECT 'Santa Ana' AS Departamento, 'Hortensia' AS Producto FROM [Desafio1DMD].[dbo].[Departamentos] WHERE Hortensia = '1'
        UNION ALL
        SELECT 'Santa Ana' AS Departamento, 'Globos' AS Producto FROM [Desafio1DMD].[dbo].[Departamentos] WHERE Globos = '1'
        UNION ALL
        SELECT 'Santa Ana' AS Departamento, 'Tarjetas' AS Producto FROM [Desafio1DMD].[dbo].[Departamentos] WHERE Tarjetas = '1'
        UNION ALL
        SELECT 'Santa Ana' AS Departamento, 'Orquidias' AS Producto FROM [Desafio1DMD].[dbo].[Departamentos] WHERE Orquidias = '1'
		UNION ALL
        SELECT 'Santa Ana' AS Departamento, 'Carmesi' AS Producto FROM [Desafio1DMD].[dbo].[Departamentos] WHERE Carmesi = '1'
        UNION ALL
        SELECT 'Santa Ana' AS Departamento, 'Lirios' AS Producto FROM [Desafio1DMD].[dbo].[Departamentos] WHERE Lirios = '1'
        UNION ALL
        SELECT 'Santa Ana' AS Departamento, 'Aurora' AS Producto FROM [Desafio1DMD].[dbo].[Departamentos] WHERE Aurora = '1'
        UNION ALL
        SELECT 'Santa Ana' AS Departamento, 'Tulipanes' AS Producto FROM [Desafio1DMD].[dbo].[Departamentos] WHERE Tulipanes = '1'
        UNION ALL
        SELECT 'Santa Ana' AS Departamento, 'Liston' AS Producto FROM [Desafio1DMD].[dbo].[Departamentos] WHERE Liston = '1'
    ) AS subquery
GROUP BY Departamento, Producto
ORDER BY COUNT(*) DESC;