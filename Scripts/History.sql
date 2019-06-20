use RegistroAlumnos_DW;
ALTER TABLE Alumno
  ADD Des_Sexo VARCHAR(10);

ALTER TABLE Alumno ALTER COLUMN Sexo VARCHAR(1);  

ALTER TABLE Curso ALTER COLUMN Descripcion nvarchar(100)  NOT NULL;

ALTER TABLE Ponderado_Alumno ADD Retirado varchar(2)  NOT NULL;