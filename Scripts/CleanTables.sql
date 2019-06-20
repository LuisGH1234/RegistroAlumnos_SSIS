use RegistroAlumnos_DW;
-- Drop constraint Matricula - Alumno
IF EXISTS (
	SELECT * FROM sys.foreign_keys 
	WHERE object_id = OBJECT_ID(N'dbo.Matricula_Alumno')
	AND parent_object_id = OBJECT_ID(N'dbo.Matricula')
)
ALTER TABLE [Matricula] DROP CONSTRAINT [Matricula_Alumno];
-- END

-- Drop constraint Matricula - Carrera
IF EXISTS (
	SELECT * FROM sys.foreign_keys 
	WHERE object_id = OBJECT_ID(N'dbo.Matricula_Carrera')
	AND parent_object_id = OBJECT_ID(N'dbo.Matricula')
)
ALTER TABLE [Matricula] DROP CONSTRAINT [Matricula_Carrera];
-- END

-- Drop constraint Matricula - Curso
IF EXISTS (
	SELECT * FROM sys.foreign_keys 
	WHERE object_id = OBJECT_ID(N'dbo.Matricula_Curso')
	AND parent_object_id = OBJECT_ID(N'dbo.Matricula')
)
ALTER TABLE [Matricula] DROP CONSTRAINT [Matricula_Curso];
-- END

-- Drop constraint Matricula - Fecha
IF EXISTS (
	SELECT * FROM sys.foreign_keys 
	WHERE object_id = OBJECT_ID(N'dbo.Matricula_Fecha')
	AND parent_object_id = OBJECT_ID(N'dbo.Matricula')
)
ALTER TABLE [Matricula] DROP CONSTRAINT [Matricula_Fecha];
-- END

-- Drop constraint Matricula - Sede
IF EXISTS (
	SELECT * FROM sys.foreign_keys 
	WHERE object_id = OBJECT_ID(N'dbo.Matricula_Sede')
	AND parent_object_id = OBJECT_ID(N'dbo.Matricula')
)
ALTER TABLE [Matricula] DROP CONSTRAINT [Matricula_Sede];
-- END

-- Drop constraint Ponderado_alumno - Alumno
IF EXISTS (
	SELECT * FROM sys.foreign_keys 
	WHERE object_id = OBJECT_ID(N'dbo.Ponderado_Alumno_Alumno')
	AND parent_object_id = OBJECT_ID(N'dbo.Ponderado_Alumno')
)
ALTER TABLE [Ponderado_Alumno] DROP CONSTRAINT [Ponderado_Alumno_Alumno];
-- END

-- Drop constraint Ponderado_alumno - Carrera
IF EXISTS (
	SELECT * FROM sys.foreign_keys 
	WHERE object_id = OBJECT_ID(N'dbo.Ponderado_Alumno_Carrera')
	AND parent_object_id = OBJECT_ID(N'dbo.Ponderado_Alumno')
)
ALTER TABLE [Ponderado_Alumno] DROP CONSTRAINT [Ponderado_Alumno_Carrera];
-- END

-- Drop constraint Ponderado_alumno - Fecha
IF EXISTS (
	SELECT * FROM sys.foreign_keys 
	WHERE object_id = OBJECT_ID(N'dbo.Ponderado_Alumno_Fecha')
	AND parent_object_id = OBJECT_ID(N'dbo.Ponderado_Alumno')
)
ALTER TABLE [Ponderado_Alumno] DROP CONSTRAINT [Ponderado_Alumno_Fecha];
-- END

-- Drop constraint Promedio_Curso_Alumno - Alumno
IF EXISTS (
	SELECT * FROM sys.foreign_keys 
	WHERE object_id = OBJECT_ID(N'dbo.Promedio_Curso_Alumno_Alumno')
	AND parent_object_id = OBJECT_ID(N'dbo.Promedio_Curso_Alumno')
)
ALTER TABLE [Promedio_Curso_Alumno] DROP CONSTRAINT [Promedio_Curso_Alumno_Alumno];
-- END

-- Drop constraint Promedio_Curso_Alumno - Carrera
IF EXISTS (
	SELECT * FROM sys.foreign_keys 
	WHERE object_id = OBJECT_ID(N'dbo.Promedio_Curso_Alumno_Carrera')
	AND parent_object_id = OBJECT_ID(N'dbo.Promedio_Curso_Alumno')
)
ALTER TABLE [Promedio_Curso_Alumno] DROP CONSTRAINT [Promedio_Curso_Alumno_Carrera];
-- END

-- Drop constraint Promedio_Curso_Alumno - Curso
IF EXISTS (
	SELECT * FROM sys.foreign_keys 
	WHERE object_id = OBJECT_ID(N'dbo.Promedio_Curso_Alumno_Curso')
	AND parent_object_id = OBJECT_ID(N'dbo.Promedio_Curso_Alumno')
)
ALTER TABLE [Promedio_Curso_Alumno] DROP CONSTRAINT [Promedio_Curso_Alumno_Curso];
-- END


-- Drop constraint Promedio_Curso_Alumno - Estado_Matricula
IF EXISTS (
	SELECT * FROM sys.foreign_keys 
	WHERE object_id = OBJECT_ID(N'dbo.Promedio_Curso_Alumno_Estado_Matricula')
	AND parent_object_id = OBJECT_ID(N'dbo.Promedio_Curso_Alumno')
)
ALTER TABLE [Promedio_Curso_Alumno] DROP CONSTRAINT [Promedio_Curso_Alumno_Estado_Matricula];
-- END

-- Drop constraint Promedio_Curso_Alumno - Fecha
IF EXISTS (
	SELECT * FROM sys.foreign_keys 
	WHERE object_id = OBJECT_ID(N'dbo.Promedio_Curso_Alumno_Fecha')
	AND parent_object_id = OBJECT_ID(N'dbo.Promedio_Curso_Alumno')
)
ALTER TABLE [Promedio_Curso_Alumno] DROP CONSTRAINT [Promedio_Curso_Alumno_Fecha];
-- END

-- Drop constraint Promedio_Curso_Alumno - Fecha
IF EXISTS (
	SELECT * FROM sys.foreign_keys 
	WHERE object_id = OBJECT_ID(N'dbo.Promedio_Curso_Alumno_Sede')
	AND parent_object_id = OBJECT_ID(N'dbo.Promedio_Curso_Alumno')
)
ALTER TABLE [Promedio_Curso_Alumno] DROP CONSTRAINT [Promedio_Curso_Alumno_Sede];
-- END

-- Truncate All Tables
TRUNCATE TABLE Matricula;
TRUNCATE TABLE Ponderado_Alumno;
TRUNCATE TABLE Promedio_Curso_Alumno;
TRUNCATE TABLE Alumno;
TRUNCATE TABLE Carrera;
TRUNCATE TABLE Curso;
TRUNCATE TABLE Estado_Matricula;
TRUNCATE TABLE Fecha;
TRUNCATE TABLE Sede;
-- END

-- foreign keys
-- Reference: Matricula_Alumno (table: Matricula)
ALTER TABLE Matricula ADD CONSTRAINT Matricula_Alumno
    FOREIGN KEY (Sk_Alumno)
    REFERENCES Alumno (Sk_Alumno);

-- Reference: Matricula_Carrera (table: Matricula)
ALTER TABLE Matricula ADD CONSTRAINT Matricula_Carrera
    FOREIGN KEY (SK_Carrera)
    REFERENCES Carrera (SK_Carrera);

-- Reference: Matricula_Curso (table: Matricula)
ALTER TABLE Matricula ADD CONSTRAINT Matricula_Curso
    FOREIGN KEY (SK_Curso)
    REFERENCES Curso (SK_Curso);

-- Reference: Matricula_Fecha (table: Matricula)
ALTER TABLE Matricula ADD CONSTRAINT Matricula_Fecha
    FOREIGN KEY (SK_Periodo)
    REFERENCES Fecha (SK_Periodo);

-- Reference: Matricula_Sede (table: Matricula)
ALTER TABLE Matricula ADD CONSTRAINT Matricula_Sede
    FOREIGN KEY (SK_Sede)
    REFERENCES Sede (SK_Sede);

-- Reference: Ponderado_Alumno_Alumno (table: Ponderado_Alumno)
ALTER TABLE Ponderado_Alumno ADD CONSTRAINT Ponderado_Alumno_Alumno
    FOREIGN KEY (Sk_Alumno)
    REFERENCES Alumno (Sk_Alumno);

-- Reference: Ponderado_Alumno_Carrera (table: Ponderado_Alumno)
ALTER TABLE Ponderado_Alumno ADD CONSTRAINT Ponderado_Alumno_Carrera
    FOREIGN KEY (SK_Carrera)
    REFERENCES Carrera (SK_Carrera);

-- Reference: Ponderado_Alumno_Fecha (table: Ponderado_Alumno)
ALTER TABLE Ponderado_Alumno ADD CONSTRAINT Ponderado_Alumno_Fecha
    FOREIGN KEY (SK_Periodo)
    REFERENCES Fecha (SK_Periodo);

-- Reference: Promedio_Curso_Alumno_Alumno (table: Promedio_Curso_Alumno)
ALTER TABLE Promedio_Curso_Alumno ADD CONSTRAINT Promedio_Curso_Alumno_Alumno
    FOREIGN KEY (Sk_Alumno)
    REFERENCES Alumno (Sk_Alumno);

-- Reference: Promedio_Curso_Alumno_Carrera (table: Promedio_Curso_Alumno)
ALTER TABLE Promedio_Curso_Alumno ADD CONSTRAINT Promedio_Curso_Alumno_Carrera
    FOREIGN KEY (SK_Carrera)
    REFERENCES Carrera (SK_Carrera);

-- Reference: Promedio_Curso_Alumno_Curso (table: Promedio_Curso_Alumno)
ALTER TABLE Promedio_Curso_Alumno ADD CONSTRAINT Promedio_Curso_Alumno_Curso
    FOREIGN KEY (SK_Curso)
    REFERENCES Curso (SK_Curso);

-- Reference: Promedio_Curso_Alumno_Estado_Matricula (table: Promedio_Curso_Alumno)
ALTER TABLE Promedio_Curso_Alumno ADD CONSTRAINT Promedio_Curso_Alumno_Estado_Matricula
    FOREIGN KEY (SK_Estado_Matricula)
    REFERENCES Estado_Matricula (SK_Estado_Matricula);

-- Reference: Promedio_Curso_Alumno_Fecha (table: Promedio_Curso_Alumno)
ALTER TABLE Promedio_Curso_Alumno ADD CONSTRAINT Promedio_Curso_Alumno_Fecha
    FOREIGN KEY (SK_Periodo)
    REFERENCES Fecha (SK_Periodo);

-- Reference: Promedio_Curso_Alumno_Sede (table: Promedio_Curso_Alumno)
ALTER TABLE Promedio_Curso_Alumno ADD CONSTRAINT Promedio_Curso_Alumno_Sede
    FOREIGN KEY (SK_Sede)
    REFERENCES Sede (SK_Sede);
--END