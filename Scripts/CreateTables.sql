
		CREATE DATABASE RegistroAlumnos_DW;
		USE RegistroAlumnos_DW;
		SET DATEFORMAT dmy;
		-- SELECT SERVERPROPERTY('Collation');
		-- tables
		-- Table: Alumno
		CREATE TABLE Alumno (
			Sk_Alumno int identity(1,1)  NOT NULL,
			MCOD_Alumno varchar(55)  NOT NULL,
			Nombres nvarchar(255)  NOT NULL,
			Apellido_Paterno nvarchar(255)  NOT NULL,
			Apellido_Materno nvarchar(255)  NOT NULL,
			Nombre_Completo nvarchar(255)  NOT NULL,
			Sexo varchar(10)  NOT NULL,
			CONSTRAINT Alumno_pk PRIMARY KEY  (Sk_Alumno)
		);

		-- Table: Carrera
		CREATE TABLE Carrera (
			SK_Carrera int identity(1,1) NOT NULL,
			Nombre nvarchar(50)  NOT NULL,
			Codigo int  NOT NULL,
			Promedio_Beca decimal(4,2) NULL,
			CONSTRAINT Carrera_pk PRIMARY KEY  (SK_Carrera)
		);

		-- Table: Curso
		CREATE TABLE Curso (
			SK_Curso int identity(1,1) NOT NULL,
			COD_Curso varchar(25)  NOT NULL,
			Descripcion nvarchar(50)  NOT NULL,
			Nivel_Curso_Malla int  NOT NULL,
			Cant_Creditos int  NOT NULL,
			CONSTRAINT Curso_pk PRIMARY KEY  (SK_Curso)
		);

		-- Table: Estado_Matricula
		CREATE TABLE Estado_Matricula (
			SK_Estado_Matricula int identity(1,1) NOT NULL,
			COD_Estado_Matricula char(1)  NOT NULL,
			Descripcion varchar(55)  NOT NULL,
			CONSTRAINT Estado_Matricula_pk PRIMARY KEY  (SK_Estado_Matricula)
		);

		-- Table: Fecha
		CREATE TABLE Fecha (
			SK_Periodo int  NOT NULL,
			Nro_Periodo int  NOT NULL,
			Anio int  NOT NULL,
			Periodo nvarchar(7) NOT NULL,
			Descripcion nvarchar(150) NOT NULL,
			CONSTRAINT Fecha_pk PRIMARY KEY  (SK_Periodo)
		);

		-- Table: Matricula
		CREATE TABLE Matricula (
			SK_Matricula int identity(1,1) NOT NULL,
			SK_Curso int  NOT NULL,
			SK_Sede int  NOT NULL,
			Sk_Alumno int  NOT NULL,
			SK_Carrera int  NOT NULL,
			SK_Periodo int  NOT NULL,
			Veces int  NOT NULL DEFAULT 1,
			CONSTRAINT Matricula_pk PRIMARY KEY  (SK_Matricula)
		);

		-- Table: Ponderado_Alumno
		CREATE TABLE Ponderado_Alumno (
			SK_Ponderado_Alumno int identity(1,1) NOT NULL,
			SK_Carrera int  NOT NULL,
			Sk_Alumno int  NOT NULL,
			SK_Periodo int  NOT NULL,
			Ponderado decimal(4,2)  NOT NULL,
			Ponderado_Beca decimal(4,2) NULL,
			Veces int  NOT NULL DEFAULT 1,
			CONSTRAINT Ponderado_Alumno_pk PRIMARY KEY  (SK_Ponderado_Alumno)
		);

		-- Table: Promedio_Curso_Alumno
		CREATE TABLE Promedio_Curso_Alumno (
			SK_Promedio_Curso_Alumno int identity(1,1) NOT NULL,
			SK_Estado_Matricula int  NOT NULL,
			SK_Curso int  NOT NULL,
			Sk_Alumno int  NOT NULL,
			SK_Carrera int  NOT NULL,
			SK_Sede int  NOT NULL,
			SK_Periodo int  NOT NULL,
			Promedio decimal(4,2)  NOT NULL,
			Nro_Vez_Curso int  NOT NULL,
			Retirado varchar(2)  NOT NULL,
			Veces int  NOT NULL DEFAULT 1,
			CONSTRAINT Promedio_Curso_Alumno_pk PRIMARY KEY  (SK_Promedio_Curso_Alumno)
		);

		-- Table: Sede
		CREATE TABLE Sede (
			SK_Sede int identity(1,1) NOT NULL,
			Nombre varchar(25)  NOT NULL,
			CONSTRAINT Sede_pk PRIMARY KEY  (SK_Sede)
		);

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

		-- End of file.