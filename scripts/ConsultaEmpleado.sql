SELECT emple.Id, emple.Nombre, emple.Apellidos, emple.FechaAlta, emple.FechaBaja
FROM GoalSystemsDb.dbo.Empleados AS emple
INNER JOIN GoalSystemsDb.dbo.Empresas empre
    ON empre.Id = emple.IdEmpresa
WHERE emple.Id = (SELECT b.IdEmpleado
FROM (SELECT TOP 1 a.IdEmpleado, COUNT(*) AS numero 
	FROM GoalSystemsDb.dbo.Incidencias as a
	WHERE DATEPART(MONTH, a.FechaAlta)= 5 AND DATEPART(YEAR, a.FechaAlta) = 2021
	GROUP BY a.IdEmpleado
	ORDER BY numero DESC) b)
AND empre.Nombre = 'Mutiny'