use RegistroAlumnos_DW;
select * from Alumno;
select * from Carrera;
select * from Curso;
select * from Estado_Matricula;
select * from Fecha;
select * from Sede;

select * from Matricula;

select * from Ponderado_Alumno a left join Alumno b on a.Sk_Alumno=b.Sk_Alumno 
	left join Fecha c on a.SK_Periodo=c.SK_Periodo 
where b.MCOD_Alumno = '201511597';

select * from Promedio_Curso_Alumno;
