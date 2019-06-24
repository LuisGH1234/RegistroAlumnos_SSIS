use RegistroAlumnos_DW;

select * from Alumno a left join Promedio_Curso_Alumno b on a.Sk_Alumno = b.Sk_Alumno
where a.Nombres like '%Kristel%' and a.Apellido_Paterno like '%Collazos%';

select b.SK_Periodo, a.MCOD_Alumno, a.Nombre_Completo, a.Des_Sexo, b.Promedio, c.Descripcion, b.Retirado, c.Cant_Creditos
from Alumno a left join Promedio_Curso_Alumno b on a.Sk_Alumno = b.Sk_Alumno
left join Curso c on b.SK_Curso = c.SK_Curso
where a.MCOD_Alumno = '199820090'
order by b.SK_Periodo desc
-- 201417394 kristell
-- 201523075 omar
-- 201511597 mauricio
-- 201516808 yo
select * from Alumno a left join Matricula b on a.Sk_Alumno = b.Sk_Alumno
where a.MCOD_Alumno = '201516808'

SELECT * FROM Alumno where MCOD_Alumno='199820090';

delete from Promedio_Curso_Alumno

DBCC CHECKIDENT ('[Promedio_Curso_Alumno]', RESEED, 0);
GO

select * from Promedio_Curso_Alumno