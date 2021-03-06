USE [ControlEscolar]
GO
/****** Object:  StoredProcedure [dbo].[MateriasGetNoAsignadas]    Script Date: 10/1/2021 12:47:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[MateriasGetNoAsignadas]
@IdAlumno INT 
AS
	SELECT Materia.IdMateria
		  ,Materia.Nombre
	      ,Materia.Costo 
	FROM  Materia 
		WHERE Materia.IdMateria NOT IN 
		(SELECT AlumnoMateria.IdMateria 
		FROM AlumnoMateria 
		WHERE AlumnoMateria.IdAlumno = @IdAlumno) 