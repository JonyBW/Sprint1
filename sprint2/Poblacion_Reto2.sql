use Betisware;

-- INSERCION DE DATOS --

/* 1. PROYECTOS (10 registros) */
INSERT INTO PROYECTOS (codProyecto, Nombre, Presupuesto_Restante, Fecha_Iniciacion, Fecha_Limite) VALUES
(1001, 'Plataforma de E-Learning', 50000.00, '2025-01-15', '2025-12-31'),
(1002, 'App de Reciclaje Urbano', 35000.50, '2025-02-20', '2026-06-15'),
(1003, 'Sistema de Gestión Interna', 15000.75, '2025-03-01', '2025-10-01'),
(1004, 'Banco de Alimentos Digital', 40000.00, '2025-04-10', '2026-03-20'),
(1005, 'Optimización de Consumo', 22000.00, '2025-05-05', '2025-11-30'),
(1006, 'Portal de Voluntariado', 18000.00, '2025-06-01', '2026-01-31'),
(1007, 'Análisis de Datos IoT', 60000.00, '2025-07-10', '2026-07-10'),
(1008, 'Web Corporativa 2.0', 12000.50, '2025-08-01', '2025-11-01'),
(1009, 'Juego Educativo Móvil', 28000.00, '2025-09-15', '2026-04-30'),
(1010, 'Monitoreo de Calidad del Aire', 45000.00, '2025-10-01', '2026-08-01');

/* 2. TALLERES (5 registros) */
INSERT INTO TALLERES (codTaller, Estado, Hora_Apertura, Hora_Cierre, Fecha_Inspeccion) VALUES
(201, 'abierto', '08:00:00', '18:00:00', '2025-11-20'),
(202, 'en_mantenimiento', '09:00:00', '17:00:00', '2025-12-05'),
(203, 'cerrado', '10:00:00', '14:00:00', '2026-01-10'),
(204, 'en_inspeccion', '07:30:00', '16:30:00', '2025-10-15'),
(205, 'abierto', '08:30:00', '19:00:00', '2025-12-01');

/* 3. DIRECCIONES (10 registros) */
INSERT INTO DIRECCIONES (codDireccion, Direccion) VALUES
(3001, 'C/ Falsa, 123, Madrid'),
(3002, 'Av. de la Innovación, 45, Barcelona'),
(3003, 'Plaza Mayor, 1, Sevilla'),
(3004, 'Ronda de Poniente, 8, Valencia'),
(3005, 'C/ del Sol Naciente, 22, Málaga'),
(3006, 'Paseo de las Palmeras, 7, Bilbao'),
(3007, 'Bulevar Central, 10, Zaragoza'),
(3008, 'Vía Láctea, 5, A Coruña'),
(3009, 'Alameda Principal, 15, Palma'),
(3010, 'C/ de los Sueños, 3, Granada');

/* 4. AMBITOS (6 registros) */
INSERT INTO AMBITOS (codAmbito, Ambito) VALUES
(401, 'Informatica'),
(402, 'Social'),
(403, 'Otros'),
(404, 'Administración'),
(405, 'Sostenibilidad'),
(406, 'Desarrollo');

/* 5. INVERSORES (10 registros) */
INSERT INTO INVERSORES (codInversor, Nombre, Apellido1, Apellido2, Cant_Invertida, codDireccion, Correo_Electronico, nTel) VALUES
(501, 'Elena', 'Pérez', 'García', 150000.00, 3001, 'elena.perez@inv.com', '34600111222'),
(502, 'Marcos', 'López', 'Ruiz', 80000.50, 3002, 'marcos.lopez@inv.com', '34600333444'),
(503, 'Sofía', 'Martínez', 'Vidal', 50000.00, 3003, 'sofia.m@inv.com', '34600555666'),
(504, 'Javier', 'Sánchez', 'Pascual', 200000.00, 3004, 'javier.s@inv.com', '34600777888'),
(505, 'Lucía', 'Fernández', 'Blanco', 10000.00, 3005, 'lucia.f@inv.com', '34600999000'),
(506, 'Carlos', 'Gómez', 'Diez', 30000.00, 3006, 'carlos.g@inv.com', '34601112233'),
(507, 'Ana', 'Díaz', 'Moreno', 75000.00, 3007, 'ana.d@inv.com', '34601334455'),
(508, 'David', 'Herrera', 'Cano', 120000.00, 3008, 'david.h@inv.com', '34601556677'),
(509, 'Eva', 'Morales', 'Ramos', 90000.00, 3009, 'eva.m@inv.com', '34601778899'),
(510, 'Pablo', 'Velasco', 'Soto', 45000.00, 3010, 'pablo.v@inv.com', '34601990011');

/* 6. CUENTAS (30 registros) */
INSERT INTO CUENTAS (UID, Nombre, Apellido1, Apellido2, codDireccion, Correo_Electronico, nTel, nomUsuario, Contraseña) VALUES
(600001, 'Miguel', 'Ángel', 'Vargas', 3001, 'miguel.a@ejemplo.com', '34700000001', 'mvargas', AES_ENCRYPT('pass123', 'key')),
(600002, 'Laura', 'García', 'Sanz', 3002, 'laura.g@ejemplo.com', '34700000002', 'lgarcia', AES_ENCRYPT('pass123', 'key')),
(600003, 'Alejandro', 'Ruiz', 'Pérez', 3003, 'alejandro.r@ejemplo.com', '34700000003', 'aruiz', AES_ENCRYPT('pass123', 'key')),
(600004, 'Nuria', 'Díaz', 'López', 3004, 'nuria.d@ejemplo.com', '34700000004', 'ndiaz', AES_ENCRYPT('pass123', 'key')),
(600005, 'Roberto', 'Moreno', 'Torres', 3005, 'roberto.m@ejemplo.com', '34700000005', 'rmoreno', AES_ENCRYPT('pass123', 'key')),
(600006, 'Cristina', 'Navarro', 'Gil', 3006, 'cristina.n@ejemplo.com', '34700000006', 'cnava', AES_ENCRYPT('pass123', 'key')),
(600007, 'Andrés', 'Vega', 'Ramos', 3007, 'andres.v@ejemplo.com', '34700000007', 'avega', AES_ENCRYPT('pass123', 'key')),
(600008, 'Beatriz', 'Pascual', 'Santos', 3008, 'beatriz.p@ejemplo.com', '34700000008', 'bpascual', AES_ENCRYPT('pass123', 'key')),
(600009, 'Francisco', 'Giménez', 'Costa', 3009, 'fran.g@ejemplo.com', '34700000009', 'fgimenez', AES_ENCRYPT('pass123', 'key')),
(600010, 'Isabel', 'Vidal', 'Herrera', 3010, 'isabel.v@ejemplo.com', '34700000010', 'ividal', AES_ENCRYPT('pass123', 'key')),
(600011, 'Sergio', 'Peña', 'Molina', 3001, 'sergio.p@ejemplo.com', '34700000011', 'spenya', AES_ENCRYPT('pass123', 'key')),
(600012, 'Marta', 'Flores', 'Bravo', 3002, 'marta.f@ejemplo.com', '34700000012', 'mflores', AES_ENCRYPT('pass123', 'key')),
(600013, 'Rubén', 'Soto', 'Rey', 3003, 'ruben.s@ejemplo.com', '34700000013', 'rsoto', AES_ENCRYPT('pass123', 'key')),
(600014, 'Paula', 'Iglesias', 'Lorenzo', 3004, 'paula.i@ejemplo.com', '34700000014', 'piglesias', AES_ENCRYPT('pass123', 'key')),
(600015, 'Jorge', 'Hernández', 'Castro', 3005, 'jorge.h@ejemplo.com', '34700000015', 'jhernandez', AES_ENCRYPT('pass123', 'key')),
(600016, 'Diana', 'Ferrer', 'Roca', 3006, 'diana.f@ejemplo.com', '34700000016', 'dferrer', AES_ENCRYPT('pass123', 'key')),
(600017, 'Adrián', 'Gil', 'Marín', 3007, 'adrian.g@ejemplo.com', '34700000017', 'agil', AES_ENCRYPT('pass123', 'key')),
(600018, 'Marina', 'Cano', 'Garrido', 3008, 'marina.c@ejemplo.com', '34700000018', 'mcano', AES_ENCRYPT('pass123', 'key')),
(600019, 'Héctor', 'Ramírez', 'Lara', 3009, 'hector.r@ejemplo.com', '34700000019', 'hramirez', AES_ENCRYPT('pass123', 'key')),
(600020, 'Elena', 'Castro', 'Méndez', 3010, 'elena.c@ejemplo.com', '34700000020', 'ecastro', AES_ENCRYPT('pass123', 'key')),
(600021, 'Guillermo', 'Sainz', 'Moya', 3001, 'guillermo.s@ejemplo.com', '34700000021', 'gsainz', AES_ENCRYPT('pass123', 'key')),
(600022, 'Lucía', 'Garrido', 'Rico', 3002, 'lucia.g@ejemplo.com', '34700000022', 'lgarrido', AES_ENCRYPT('pass123', 'key')),
(600023, 'Jesús', 'Vázquez', 'Soler', 3003, 'jesus.v@ejemplo.com', '34700000023', 'jvasquez', AES_ENCRYPT('pass123', 'key')),
(600024, 'Raquel', 'Melero', 'Cruz', 3004, 'raquel.m@ejemplo.com', '34700000024', 'rmelero', AES_ENCRYPT('pass123', 'key')),
(600025, 'Daniel', 'Pérez', 'Santos', 3005, 'daniel.p@ejemplo.com', '34700000025', 'dperez', AES_ENCRYPT('pass123', 'key')),
(600026, 'Sara', 'López', 'Gil', 3006, 'sara.l@ejemplo.com', '34700000026', 'slopez', AES_ENCRYPT('pass123', 'key')),
(600027, 'Mario', 'Martínez', 'Vargas', 3007, 'mario.m@ejemplo.com', '34700000027', 'mmartinez', AES_ENCRYPT('pass123', 'key')),
(600028, 'Nerea', 'Sánchez', 'Pascual', 3008, 'nerea.s@ejemplo.com', '34700000028', 'nsanchez', AES_ENCRYPT('pass123', 'key')),
(600029, 'Pedro', 'Fernández', 'Blanco', 3009, 'pedro.f@ejemplo.com', '34700000029', 'pfernandez', AES_ENCRYPT('pass123', 'key')),
(600030, 'Olivia', 'Gómez', 'Diez', 3010, 'olivia.g@ejemplo.com', '34700000030', 'ogomez', AES_ENCRYPT('pass123', 'key'));

/* 7. PERTENENCIA_AMBITOS_PROYECTOS (10 registros, uno o dos ámbitos por proyecto) */
INSERT INTO PERTENENCIA_AMBITOS_PROYECTOS (codProyecto, codAmbito) VALUES
(1001, 401), /* Plataforma E-Learning -> Informatica */
(1002, 405), /* App Reciclaje Urbano -> Sostenibilidad */
(1002, 402), /* App Reciclaje Urbano -> Social */
(1003, 404), /* Sistema Gestión Interna -> Administración */
(1004, 402), /* Banco Alimentos Digital -> Social */
(1005, 405), /* Optimización Consumo -> Sostenibilidad */
(1006, 402), /* Portal Voluntariado -> Social */
(1007, 401), /* Análisis IoT -> Informatica */
(1008, 406), /* Web Corporativa -> Desarrollo */
(1009, 406); /* Juego Educativo -> Desarrollo */

/* 8. MATERIALES (30 registros) */
INSERT INTO MATERIALES (codMaterial, Nombre, codTaller, Cant_Total) VALUES
(8001, 'Arduino UNO', 201, 50),
(8002, 'Raspberry Pi 4', 201, 30),
(8003, 'Sensor de temperatura', 201, 100),
(8004, 'Cable Ethernet (m)', 201, 500),
(8005, 'Resistencias 1K ohm', 201, 2000),
(8006, 'Destornillador Phillips', 202, 40),
(8007, 'Kit de soldadura', 202, 15),
(8008, 'Multímetro digital', 202, 25),
(8009, 'Fuente de alimentación', 202, 10),
(8010, 'Alicates de corte', 202, 35),
(8011, 'Impresora 3D (PLA)', 203, 5),
(8012, 'Filamento PLA (kg)', 203, 50),
(8013, 'Láser de corte', 203, 2),
(8014, 'Madera contrachapada', 203, 80),
(8015, 'Pintura acrílica (l)', 203, 10),
(8016, 'Tablón de anuncios', 204, 5),
(8017, 'Rotuladores permanentes', 204, 100),
(8018, 'Sillas ergonómicas', 204, 60),
(8019, 'Mesas de trabajo', 204, 30),
(8020, 'Proyector multimedia', 204, 5),
(8021, 'Servidor Blade', 205, 10),
(8022, 'Switch de red 48p', 205, 8),
(8023, 'Disco SSD 1TB', 205, 20),
(8024, 'Módulos de RAM 16GB', 205, 40),
(8025, 'Estación de trabajo PC', 205, 15),
(8026, 'Componentes electrónicos', 201, 1000),
(8027, 'Tornillería variada', 202, 300),
(8028, 'Escáner 3D', 203, 1),
(8029, 'Pizarra blanca', 204, 10),
(8030, 'Monitor 27 pulgadas', 205, 20);


/* 9. INVERSIONES (30 registros) */
INSERT INTO INVERSIONES (codInversor, codProyecto, Dinero, Fecha, Hora) VALUES
(501, 1001, 30000.00, '2025-01-05', '10:30:00'),
(502, 1001, 20000.00, '2025-01-10', '11:00:00'),
(503, 1002, 10000.00, '2025-02-01', '12:00:00'),
(504, 1002, 25000.50, '2025-02-15', '14:30:00'),
(505, 1003, 5000.75, '2025-02-25', '09:00:00'),
(506, 1003, 10000.00, '2025-03-05', '15:15:00'),
(507, 1004, 40000.00, '2025-04-01', '16:00:00'),
(508, 1005, 15000.00, '2025-05-01', '10:00:00'),
(509, 1005, 7000.00, '2025-05-10', '11:30:00'),
(510, 1006, 18000.00, '2025-05-20', '13:45:00'),
(501, 1007, 30000.00, '2025-06-01', '09:30:00'),
(502, 1007, 30000.00, '2025-06-15', '14:00:00'),
(503, 1008, 12000.50, '2025-07-01', '10:45:00'),
(504, 1009, 28000.00, '2025-08-01', '11:00:00'),
(505, 1010, 45000.00, '2025-09-01', '15:00:00'),
(506, 1001, 10000.00, '2025-10-01', '16:30:00'),
(507, 1002, 5000.00, '2025-10-05', '08:30:00'),
(508, 1003, 2000.00, '2025-10-10', '12:45:00'),
(509, 1004, 10000.00, '2025-10-15', '13:00:00'),
(510, 1005, 5000.00, '2025-10-20', '14:15:00'),
(501, 1006, 3000.00, '2025-11-01', '10:10:00'),
(502, 1008, 2000.00, '2025-11-05', '11:20:00'),
(503, 1009, 4000.00, '2025-11-10', '15:30:00'),
(504, 1010, 10000.00, '2025-11-15', '16:40:00'),
(505, 1007, 5000.00, '2025-11-20', '17:00:00'),
(506, 1004, 8000.00, '2025-11-25', '18:15:00'),
(507, 1005, 3000.00, '2025-11-28', '19:00:00'),
(508, 1006, 2000.00, '2025-12-01', '09:00:00'),
(509, 1008, 1000.00, '2025-12-05', '11:00:00'),
(510, 1009, 2000.00, '2025-12-10', '12:00:00');

/* 10. IDEAS (10 registros) */
INSERT INTO IDEAS (codIdea, Nombre, UID, Estado, Fecha_Creacion, Puntuacion_Total, Puntuacion_Social, Puntuacion_Medioambiental, Puntuacion_Economica) VALUES
(110001, 'Sistema de riego inteligente', 600001, 'en_preparacion', '2024-10-01', 95, 20, 40, 35),
(110002, 'Red de apoyo vecinal', 600002, 'en_espera', '2024-10-15', 78, 35, 10, 33),
(110003, 'Taller de reparación de PCs', 600003, 'sin_inspeccionar', '2024-10-20', 60, 20, 20, 20),
(110004, 'Plataforma de Trueque de servicios', 600004, 'en_inspeccion', '2024-11-01', 88, 30, 25, 33),
(110005, 'App de gestión de residuos', 600005, 'en_preparacion', '2024-11-10', 92, 15, 50, 27),
(110006, 'Curso online de programación', 600006, 'en_espera', '2024-11-25', 85, 25, 10, 50),
(110007, 'Banco de tiempo digital', 600007, 'en_preparacion', '2024-12-01', 80, 40, 5, 35),
(110008, 'Prototipo de drone de vigilancia', 600008, 'sin_inspeccionar', '2024-12-10', 70, 10, 10, 50),
(110009, 'Jardín vertical comunitario', 600009, 'en_inspeccion', '2024-12-15', 83, 25, 40, 18),
(110010, 'Filtro de agua ecológico', 600010, 'en_preparacion', '2025-01-01', 90, 15, 45, 30);


/* 11. PERFILES (6 registros) */
INSERT INTO PERFILES (codPerfil, Perfil) VALUES
(1101, 'Desarrollador Senior'),
(1102, 'Analista de Datos'),
(1103, 'Ingeniero de Sistemas'),
(1104, 'Diseñador UX/UI'),
(1105, 'Gestor de Proyectos'),
(1106, 'Técnico de Mantenimiento');

/* 12. PROYECTOS_TALLERES (15 registros, cada proyecto en 1 o 2 talleres) */
INSERT INTO PROYECTOS_TALLERES (codTaller, codProyecto, Fecha_Asignacion, Horas_Invertidas) VALUES
(201, 1001, '2025-01-16', 150.50), /* Plataforma -> Taller 201 (Electrónica) */
(204, 1001, '2025-02-01', 80.00), /* Plataforma -> Taller 204 (Oficina) */
(202, 1002, '2025-02-21', 120.75), /* Reciclaje -> Taller 202 (Mecánica) */
(203, 1002, '2025-03-01', 45.00), /* Reciclaje -> Taller 203 (Impresión 3D) */
(204, 1003, '2025-03-02', 200.00), /* Gestión Interna -> Taller 204 (Oficina) */
(205, 1003, '2025-04-01', 90.50), /* Gestión Interna -> Taller 205 (Servidores) */
(204, 1004, '2025-04-11', 180.00), /* Banco Alimentos -> Taller 204 (Oficina) */
(201, 1005, '2025-05-06', 75.25), /* Optimización -> Taller 201 (Electrónica) */
(204, 1006, '2025-06-02', 100.00), /* Voluntariado -> Taller 204 (Oficina) */
(205, 1007, '2025-07-11', 250.00), /* Análisis IoT -> Taller 205 (Servidores) */
(201, 1007, '2025-08-01', 50.00), /* Análisis IoT -> Taller 201 (Electrónica) */
(204, 1008, '2025-08-02', 130.00), /* Web Corporativa -> Taller 204 (Oficina) */
(203, 1009, '2025-09-16', 60.50), /* Juego Educativo -> Taller 203 (Impresión 3D) */
(201, 1010, '2025-10-02', 95.00), /* Calidad Aire -> Taller 201 (Electrónica) */
(202, 1010, '2025-11-01', 30.00); /* Calidad Aire -> Taller 202 (Mecánica) */

/* 13. INSPIRACIONES_PROYECTOS (10 registros) */
INSERT INTO INSPIRACIONES_PROYECTOS (codIdea, codProyecto) VALUES
(110006, 1001), /* Curso online -> Plataforma E-Learning */
(110005, 1002), /* App gestión residuos -> App Reciclaje Urbano */
(110003, 1003), /* Taller reparación PCs (base para gestión interna) */
(110002, 1004), /* Red apoyo vecinal -> Banco Alimentos Digital */
(110001, 1005), /* Riego inteligente -> Optimización Consumo */
(110007, 1006), /* Banco de tiempo digital -> Portal de Voluntariado */
(110008, 1007), /* Drone vigilancia (usa IoT) -> Análisis de Datos IoT */
(110004, 1008), /* Trueque de servicios (web) -> Web Corporativa 2.0 */
(110009, 1009), /* Jardín vertical (temática ambiental) -> Juego Educativo Móvil */
(110010, 1010); /* Filtro ecológico -> Monitoreo de Calidad del Aire */

/* 14. HUELLAS (30 registros) */
INSERT INTO HUELLAS (codHuella, Huella) VALUES
(14001, UNHEX(SHA1('huella_empleado_14001'))),
(14002, UNHEX(SHA1('huella_empleado_14002'))),
(14003, UNHEX(SHA1('huella_empleado_14003'))),
(14004, UNHEX(SHA1('huella_empleado_14004'))),
(14005, UNHEX(SHA1('huella_empleado_14005'))),
(14006, UNHEX(SHA1('huella_empleado_14006'))),
(14007, UNHEX(SHA1('huella_empleado_14007'))),
(14008, UNHEX(SHA1('huella_empleado_14008'))),
(14009, UNHEX(SHA1('huella_empleado_14009'))),
(14010, UNHEX(SHA1('huella_empleado_14010'))),
(14011, UNHEX(SHA1('huella_empleado_14011'))),
(14012, UNHEX(SHA1('huella_empleado_14012'))),
(14013, UNHEX(SHA1('huella_empleado_14013'))),
(14014, UNHEX(SHA1('huella_empleado_14014'))),
(14015, UNHEX(SHA1('huella_empleado_14015'))),
(14016, UNHEX(SHA1('huella_empleado_14016'))),
(14017, UNHEX(SHA1('huella_empleado_14017'))),
(14018, UNHEX(SHA1('huella_empleado_14018'))),
(14019, UNHEX(SHA1('huella_empleado_14019'))),
(14020, UNHEX(SHA1('huella_empleado_14020'))),
(14021, UNHEX(SHA1('huella_empleado_14021'))),
(14022, UNHEX(SHA1('huella_empleado_14022'))),
(14023, UNHEX(SHA1('huella_empleado_14023'))),
(14024, UNHEX(SHA1('huella_empleado_14024'))),
(14025, UNHEX(SHA1('huella_empleado_14025'))),
(14026, UNHEX(SHA1('huella_empleado_14026'))),
(14027, UNHEX(SHA1('huella_empleado_14027'))),
(14028, UNHEX(SHA1('huella_empleado_14028'))),
(14029, UNHEX(SHA1('huella_empleado_14029'))),
(14030, UNHEX(SHA1('huella_empleado_14030')));


/* 15. EMPLEADOS (30 registros) */
INSERT INTO EMPLEADOS (codEmpleado, Nombre, Apellido1, Apellido2, codSeguridad_Social, Fecha_Entrada, Salario_Anual, Fecha_Nacimiento, codPerfil, Dias_Vacaciones_Restantes, codDireccion, Correo_Electronico, codHuella, nTel) VALUES
(15001, 'Javier', 'García', 'López', 1234567890, '2023-01-15', 35000.00, '1990-05-20', 1101, 22, 3001, 'javier.gl@emp.com', 14001, '34800000001'),
(15002, 'Sara', 'Martín', 'Díaz', 1345678901, '2023-02-20', 32000.00, '1995-11-01', 1104, 25, 3002, 'sara.md@emp.com', 14002, '34800000002'),
(15003, 'David', 'Rodríguez', 'Pérez', 1456789012, '2023-03-01', 45000.00, '1985-08-10', 1105, 18, 3003, 'david.rp@emp.com', 14003, '34800000003'),
(15004, 'Laura', 'Sánchez', 'Vidal', 1567890123, '2023-04-10', 38000.00, '1992-03-25', 1102, 20, 3004, 'laura.sv@emp.com', 14004, '34800000004'),
(15005, 'Alejandro', 'Ruiz', 'Gómez', 1678901234, '2023-05-05', 40000.00, '1988-12-12', 1101, 24, 3005, 'alejandro.rg@emp.com', 14005, '34800000005'),
(15006, 'Elena', 'Pérez', 'Blanco', 1789012345, '2023-06-01', 28000.00, '1998-01-30', 1104, 28, 3006, 'elena.pb@emp.com', 14006, '34800000006'),
(15007, 'Carlos', 'López', 'Fernández', 1890123456, '2023-07-10', 50000.00, '1980-06-18', 1103, 15, 3007, 'carlos.lf@emp.com', 14007, '34800000007'),
(15008, 'Marta', 'Díaz', 'Morales', 1901234567, '2023-08-01', 33000.00, '1994-04-05', 1102, 21, 3008, 'marta.dm@emp.com', 14008, '34800000008'),
(15009, 'Pablo', 'Jiménez', 'Castro', 2012345678, '2023-09-15', 30000.00, '1996-09-22', 1106, 26, 3009, 'pablo.jc@emp.com', 14009, '34800000009'),
(15010, 'Sofía', 'Vargas', 'Ramos', 2123456789, '2023-10-01', 42000.00, '1983-02-14', 1105, 19, 3010, 'sofia.vr@emp.com', 14010, '34800000010'),
(15011, 'Antonio', 'Moreno', 'Torres', 1112345678, '2024-01-05', 36000.00, '1991-07-07', 1101, 23, 3001, 'antonio.mt@emp.com', 14011, '34800000011'),
(15012, 'Lucía', 'Navarro', 'Gil', 1223456789, '2024-02-10', 31000.00, '1997-10-18', 1104, 27, 3002, 'lucia.ng@emp.com', 14012, '34800000012'),
(15013, 'Rubén', 'Vega', 'Santos', 1334567890, '2024-03-05', 48000.00, '1984-04-29', 1103, 17, 3003, 'ruben.vs@emp.com', 14013, '34800000013'),
(15014, 'Nerea', 'Pascual', 'Costa', 1445678901, '2024-04-01', 34000.00, '1993-09-11', 1102, 20, 3004, 'nerea.pc@emp.com', 14014, '34800000014'),
(15015, 'Fran', 'Giménez', 'Herrera', 1556789012, '2024-05-15', 37000.00, '1987-12-03', 1101, 22, 3005, 'fran.gh@emp.com', 14015, '34800000015'),
(15016, 'Isabel', 'Vidal', 'Peña', 1667890123, '2024-06-01', 29000.00, '1999-07-28', 1104, 26, 3006, 'isabel.vp@emp.com', 14016, '34800000016'),
(15017, 'Sergio', 'Flores', 'Bravo', 1778901234, '2024-07-01', 52000.00, '1982-03-17', 1103, 16, 3007, 'sergio.fb@emp.com', 14017, '34800000017'),
(15018, 'Diana', 'Soto', 'Rey', 1889012345, '2024-08-05', 35500.00, '1996-01-24', 1102, 21, 3008, 'diana.sr@emp.com', 14018, '34800000018'),
(15019, 'Adrián', 'Iglesias', 'Lorenzo', 1990123456, '2024-09-10', 30500.00, '1990-10-09', 1106, 25, 3009, 'adrian.il@emp.com', 14019, '34800000019'),
(15020, 'Marina', 'Hernández', 'Castro', 1001234567, '2024-10-01', 43000.00, '1986-05-13', 1105, 18, 3010, 'marina.hc@emp.com', 14020, '34800000020'),
(15021, 'Jorge', 'Ferrer', 'Roca', 1012345678, '2024-10-15', 36500.00, '1994-08-20', 1101, 22, 3001, 'jorge.fr@emp.com', 14021, '34800000021'),
(15022, 'Héctor', 'Gil', 'Marín', 1023456789, '2024-11-01', 31500.00, '1998-02-28', 1104, 27, 3002, 'hector.gm@emp.com', 14022, '34800000022'),
(15023, 'Eva', 'Cano', 'Garrido', 1034567890, '2024-12-05', 46000.00, '1981-11-04', 1103, 17, 3003, 'eva.cg@emp.com', 14023, '34800000023'),
(15024, 'Raúl', 'Ramírez', 'Lara', 1045678901, '2025-01-01', 34500.00, '1995-06-16', 1102, 20, 3004, 'raul.rl@emp.com', 14024, '34800000024'),
(15025, 'Olivia', 'Castro', 'Méndez', 1056789012, '2025-02-10', 38500.00, '1989-03-08', 1101, 23, 3005, 'olivia.cm@emp.com', 14025, '34800000025'),
(15026, 'Guillermo', 'Sainz', 'Moya', 1067890123, '2025-03-01', 29500.00, '1997-01-01', 1104, 26, 3006, 'guillermo.sm@emp.com', 14026, '34800000026'),
(15027, 'Lucía', 'Garrido', 'Rico', 1078901234, '2025-04-05', 51000.00, '1983-10-21', 1103, 16, 3007, 'lucia.gr@emp.com', 14027, '34800000027'),
(15028, 'Jesús', 'Vázquez', 'Soler', 1089012345, '2025-05-10', 36000.00, '1992-12-07', 1102, 21, 3008, 'jesus.vs@emp.com', 14028, '34800000028'),
(15029, 'Paula', 'Melero', 'Cruz', 1090123456, '2025-06-01', 30000.00, '1991-04-14', 1106, 25, 3009, 'paula.mc@emp.com', 14029, '34800000029'),
(15030, 'Jorge', 'Daniel', 'Pérez', 1101234567, '2025-07-01', 44000.00, '1985-07-03', 1105, 19, 3010, 'jorge.dp@emp.com', 14030, '34800000030');

/* 16. PROYECTOS_EMPLEADOS (30 registros) */
INSERT INTO PROYECTOS_EMPLEADOS (codEmpleado, codProyecto, Fecha_Asignacion, Horas_Invertidas) VALUES
(15001, 1001, '2025-01-16', 80.00),
(15002, 1001, '2025-01-20', 60.00),
(15003, 1003, '2025-03-02', 120.00),
(15004, 1007, '2025-07-15', 90.00),
(15005, 1002, '2025-02-22', 75.50),
(15006, 1008, '2025-08-05', 40.00),
(15007, 1007, '2025-07-10', 110.00),
(15008, 1004, '2025-04-12', 50.00),
(15009, 1010, '2025-10-05', 30.00),
(15010, 1003, '2025-03-10', 85.00),
(15011, 1001, '2025-02-01', 70.00),
(15012, 1008, '2025-08-10', 55.00),
(15013, 1005, '2025-05-07', 65.00),
(15014, 1007, '2025-07-20', 88.00),
(15015, 1002, '2025-03-01', 72.50),
(15016, 1009, '2025-09-20', 45.00),
(15017, 1005, '2025-05-15', 95.00),
(15018, 1004, '2025-04-20', 60.00),
(15019, 1010, '2025-10-10', 35.00),
(15020, 1006, '2025-06-05', 78.00),
(15021, 1001, '2025-03-01', 68.00),
(15022, 1009, '2025-09-25', 52.00),
(15023, 1005, '2025-06-01', 82.00),
(15024, 1007, '2025-08-01', 70.00),
(15025, 1002, '2025-03-10', 78.00),
(15026, 1008, '2025-08-15', 45.00),
(15027, 1006, '2025-06-10', 88.00),
(15028, 1004, '2025-05-01', 55.00),
(15029, 1010, '2025-10-15', 40.00),
(15030, 1003, '2025-04-01', 92.00);

/* 17. PERTENENCIA_AMBITOS_IDEAS (20 registros) */
INSERT INTO PERTENENCIA_AMBITOS_IDEAS (codIdea, codAmbito) VALUES
(110001, 405), /* Riego inteligente -> Sostenibilidad */
(110001, 401), /* Riego inteligente -> Informatica */
(110002, 402), /* Red de apoyo vecinal -> Social */
(110003, 401), /* Taller reparación PCs -> Informatica */
(110004, 402), /* Plataforma Trueque -> Social */
(110004, 406), /* Plataforma Trueque -> Desarrollo */
(110005, 405), /* App gestión residuos -> Sostenibilidad */
(110006, 401), /* Curso programación -> Informatica */
(110006, 406), /* Curso programación -> Desarrollo */
(110007, 402), /* Banco de tiempo -> Social */
(110008, 401), /* Drone vigilancia -> Informatica */
(110009, 405), /* Jardín vertical -> Sostenibilidad */
(110010, 405), /* Filtro ecológico -> Sostenibilidad */
(110003, 403), /* Taller reparación PCs -> Otros */
(110007, 403), /* Banco de tiempo -> Otros */
(110008, 403), /* Drone vigilancia -> Otros */
(110001, 406), /* Riego inteligente -> Desarrollo */
(110002, 403), /* Red de apoyo vecinal -> Otros */
(110005, 406), /* App gestión residuos -> Desarrollo */
(110010, 403); /* Filtro ecológico -> Otros */