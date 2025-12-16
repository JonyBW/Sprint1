use betisware;
-- 1. MODIFICACIONES (UPDATE) --

-- 1.1 Modificación en PROYECTOS --
-- Fallo de gestión: El presupuesto restante del proyecto 1005 se calculó mal --
-- inicialmente y debe ser incrementado --
UPDATE PROYECTOS SET Presupuesto_Restante = Presupuesto_Restante + 5000.00, Fecha_Limite = '2025-12-31' WHERE codProyecto = 1005;

-- 1.2 Modificación en EMPLEADOS --
-- Corrección de tipografía: Se detecta que el salario anual del empleado 15003 estaba mal introducido --
-- y se corrige su apellido 1 --
UPDATE EMPLEADOS SET Salario_Anual = 46500.00, Apellido1 = 'Rodrigues' WHERE codEmpleado = 15003;

-- 1.3 Modificación en TALLERES --
-- Mantenimiento urgente: El Taller 203 pasa inmediatamente a estado 'en_mantenimiento' --
UPDATE TALLERES SET Estado = 'en_mantenimiento' WHERE codTaller = 203;

-- 2. ELIMINACIÓN DE REGISTROS (DELETE) --

-- 2.1 Eliminación en INVERSIONES --
-- Error de facturación: La inversión del inversor 505 en el proyecto 1003 fue un error de registro --
DELETE FROM INVERSIONES WHERE codInversor = 505 AND codProyecto = 1003;

-- 2.2 Eliminación en IDEAS --
-- Idea obsoleta: La idea 110008 se desecha por inviabilidad técnica --
-- Primero hay que eliminar la relación de esta idea con PROYECTOS --
-- y AMBITOS si existiera, para evitar fallos de FK --

-- Eliminando la inspiración --
DELETE FROM INSPIRACIONES_PROYECTOS WHERE codIdea = 110008;

-- Eliminando la pertenencia a ámbitos --
DELETE FROM PERTENENCIA_AMBITOS_IDEAS WHERE codIdea = 110008;

-- Eliminando la idea --
DELETE FROM IDEAS WHERE codIdea = 110008;

-- 3. NUEVOS REGISTROS (INSERT) --

-- 3.1 Nuevo Inversor --
-- Nuevo inversor clave: Se suma un inversor muy importante que no se registró inicialmente --
INSERT INTO INVERSORES (codInversor, Nombre, Apellido1, Apellido2, Cant_Invertida, codDireccion, Correo_Electrnoico, nTel) VALUES
(511, 'Gabriela', 'Rico', 'Navas', 500000.00, 3007, 'gabriela.rico@inv.com', '34602001122');

-- 3.2 Nueva Inversión --
-- Inversión del nuevo inversor: El inversor 511 realiza una inversión importante en el Proyecto 1009 --
INSERT INTO INVERSIONES (codInversor, codProyecto, Dinero, Fecha, Hora) VALUES
(511, 1009, 10000.00, '2025-12-08', '08:00:00');

-- 3.3 Regeneración en IDEAS y Ámbitos --
-- Nueva propuesta: Se incorpora una nueva idea (110011) en sustitución de la eliminada --
-- El proponente es 600011 --
INSERT INTO IDEAS (codIdea, Nombre, UID, Estado, Fecha_Creacion, Puntuacion_Total, Puntuacion_Social, Puntuacion_Medioambiental, Puntuacion_Economica) VALUES
(110011, 'App de Seguimiento Fitness Social', 600011, 'en_inspeccion', '2025-12-08', 85, 30, 5, 50);

-- Se añade la nueva idea a sus ámbitos (Informática y Social) --
INSERT INTO PERTENENCIA_AMBITOS_IDEAS (codIdea, codAmbito) VALUES
(110011, 401),
(110011, 402);

-- 3.4 Nuevo Empleado (15031) --
-- Insertar el registro CodHuella = 14031 --
-- Razón: Necesario para que EMPLEADOS  pueda referenciarlo --
INSERT INTO HUELLAS (codHuella, Huella) VALUES
(14031, UNHEX(SHA1('huella_empleado_14031')));

-- Nueva contratación: Se registra un nuevo desarrollador (15031) --
INSERT INTO EMPLEADOS (codEmpleado, Nombre, Apellido1, Apellido2, codSeguridad_Social, Fecha_Entrada, Salario_Anual, Fecha_Nacimiento, codPerfil, Dias_Vacaciones_Restantes, codDireccion, Correo_Electrnoico, codHuella, nTel) VALUES
(15031, 'Daniela', 'Vázquez', 'Ruiz', 1112233445, '2025-12-08', 38000.00, '1996-01-20', 1101, 30, 3001, 'daniela.vr@emp.com', 14031, '34800000031');


-- Consultas con ORDER BY, HAVING y GROUP by --

-- 1.1 GROUP BY y ORDER BY --
-- Calcular el total de dinero invertido en cada proyecto. Luego, ordenar los resultados para ver primero el proyecto que ha recibido la mayor cantidad de inversión --
SELECT P.Nombre AS Nombre_Proyecto, SUM(I.Dinero) AS Total_Invertido FROM PROYECTOS P INNER JOIN INVERSIONES I ON P.codProyecto = I.codProyecto GROUP BY P.Nombre ORDER BY Total_Invertido DESC;

-- 2 GROUP BY y HAVING --
-- Identificar qué perfiles de empleados han sido asignados a proyectos con un total de más de 300 horas invertidas por parte de todos los empleados de ese perfil --
SELECT PR.Perfil AS Nombre_Perfil, SUM(PE.Horas_Invertidas) AS Horas_Totales_Perfil FROM PERFILES PR INNER JOIN EMPLEADOS E ON PR.codPerfil = E.codPerfil INNER JOIN PROYECTOS_EMPLEADOS PE ON E.codEmpleado = PE.codEmpleado GROUP BY PR.Perfil HAVING Horas_Totales_Perfil > 300;

-- 3 ORDER BY --
-- Obtener una lista de todas las IDEAS que se encuentran en estado 'en_preparacion' y ordenarlas por su Puntuación Total de la más alta a la más baja --
SELECT Nombre AS Nombre_Idea, Estado, Puntuacion_Total FROM IDEAS WHERE Estado = 'en_preparacion' ORDER BY Puntuacion_Total DESC;

-- 4 Consulta con funciones nuevas --
-- Un ranking de los proyectos clasificados de mayor a menor según su duración planificada, y proporciona las fechas de inicio/fin, la duración calculada en días, y una etiqueta de reporte única --
SELECT P.Nombre AS Nombre_Proyecto, P.Fecha_Iniciacion, P.Fecha_Limite, DATEDIFF(P.Fecha_Limite, P.Fecha_Iniciacion) AS Duracion_Total_Dias, CONCAT(P.Nombre, ' - ', 'Iniciado el ', DATE_FORMAT(P.Fecha_Iniciacion, '%d/%m/%Y')) AS Nombre_Reporte_Unificado FROM PROYECTOS P ORDER BY Duracion_Total_Dias DESC;

-- 5 Consulta con 2 operadores lógicos --
-- Muestra una lista de los proyectos con presupuesto restante menor o igual a 40000 y empiezan por 'S' o por 'B' --
SELECT codProyecto, Nombre AS Nombre_Proyecto, Presupuesto_Restante FROM PROYECTOS WHERE Presupuesto_Restante <= 40000.00 AND (Nombre LIKE 'S%' OR Nombre LIKE 'B%');

-- 6 Consulta con INNER JOIN --
-- Mostrar el nombre completo del empleado junto con el nombre del perfil al que pertenece, pero solo para aquellos empleados que tienen un salario anual superior a 30000 --
SELECT E.Nombre, E.Apellido1, P.Perfil AS Nombre_del_Perfil, E.Salario_Anual FROM EMPLEADOS E INNER JOIN PERFILES P ON E.codPerfil = P.codPerfil WHERE E.Salario_Anual > 30000.00 ORDER BY E.Salario_Anual DESC;

-- 7 Consulta con COUNT --
-- Generar una lista de todos los proyectos y, para cada uno, mostrar el número total de empleados que tienen asignados --
SELECT P.Nombre AS Nombre_Proyecto, COUNT(PE.codEmpleado) AS Total_Empleados_Asignados FROM PROYECTOS P INNER JOIN PROYECTOS_EMPLEADOS PE ON P.codProyecto = PE.codProyecto GROUP BY P.Nombre ORDER BY Total_Empleados_Asignados DESC;

-- 8 Consulta con LEFT JOIN --
-- Para esta consulta voy a tener que meter algun dato en la base de datos extra para que me pueda aparecer algun campo en null y así funcione correctamente el left join --
-- Verificar la direccion que aun no tiene un inversor asignado--
INSERT INTO DIRECCIONES (codDireccion, Direccion) VALUES
(11, 'Av. Sin Asignacion 2026');
SELECT D.codDireccion, D.Direccion, I.Nombre AS Nombre_Inversor_Asignado FROM DIRECCIONES D left JOIN INVERSORES I ON D.codDireccion = I.codDireccion WHERE D.codDireccion = 11;

--  Consultas con INNER JOIN y GROUP BY --
-- 9 Mostrar el proyecto, el numero de empleados que trabajan y el total de horas que se han invertido --
SELECT P.Nombre AS Nombre_Proyecto, COUNT(PE.codEmpleado) AS Total_Empleados_Asignados, SUM(PE.Horas_Invertidas) AS Total_Horas_Invertidas FROM PROYECTOS P INNER JOIN PROYECTOS_EMPLEADOS PE ON P.codProyecto = PE.codProyecto INNER JOIN EMPLEADOS E ON PE.codEmpleado = E.codEmpleado GROUP BY P.Nombre;
-- 10 Mostrar segun el perfil en cuantos proyectos estan asignados agrupados por perfiles --
SELECT P.Perfil AS Perfiles, COUNT(DISTINCT PE.codProyecto) AS Total_Proyectos_Asignados FROM PERFILES P INNER JOIN EMPLEADOS E ON P.codPerfil = E.codPerfil INNER JOIN PROYECTOS_EMPLEADOS PE ON E.codEmpleado = PE.codEmpleado GROUP BY P.Perfil;

-- 11 Consulta separa de trimestres --
-- Mostrar la cantidad de inversiones que se han recibido segun el trimestre y la cantidad --
SELECT YEAR(Fecha) AS Año, CASE WHEN MONTH(Fecha) BETWEEN 1 AND 3 THEN 'T1 (Ene - Mar)' WHEN MONTH(Fecha) BETWEEN 4 AND 6 THEN 'T2 (Abr - Jun)' WHEN MONTH(Fecha) BETWEEN 7 AND 9 THEN 'T3 (Jul - Sep)' ELSE 'T4 (Oct - Dic)' END AS Etiqueta_Trimestre, SUM(Dinero) AS Total_Invertido_Trimestral, COUNT(*) AS Numero_Inversiones FROM INVERSIONES GROUP BY Año, Etiqueta_Trimestre;

