var express = require('express');
var mysql = require('mysql2'); // Usamos mysql2
var cors = require('cors');

var app = express();
app.use(express.json());

// Habilitamos CORS
app.use(cors()); 

// --- Configuración de la Conexión a la Base de Datos (MySQL) ---
var con = mysql.createConnection({
    host: "10.11.0.173", 
    user: "edorta",
    password: "Betisware5",
    database: "Betisware"
});

// Establecer conexión
con.connect(function(err) {
    if (err) {
        console.error("❌ Error al conectar con la base de datos:", err.message);
        return;
    }
    console.log("✅ Conexión a la Base de Datos establecida.");
});

// --- Definición del Endpoint de la API ---
// Única ruta que el cliente usará, ahora con lógica para diferentes acciones
app.get('/api/api.js', (req, res) => {
    // Determinar la acción a realizar: 'proyectos' o 'informes'
    const accion = req.query.accion; 
    let query = '';

    if (accion === 'proyectos') {
        // Nueva Consulta SQL para obtener los proyectos
        query = `
            SELECT 
                codProyecto AS id, 
                Nombre AS nombre, 
                Presupuesto_Restante AS presupuesto, 
                Fecha_Iniciacion AS inicio, 
                Fecha_Limite AS fin 
            FROM PROYECTOS 
            ORDER BY id ASC;
        `;
    } else if (accion === 'informes' || !accion) {
        // Consulta original para los informes (o si no se especifica acción)
        query = 'SELECT Nombre AS nombre_idea, Estado, Puntuacion_Total from IDEAS;';
    } else {
        // Si la acción no es reconocida
        return res.status(400).send({ message: "Acción no válida." });
    }

    // Ejecutar la consulta
    con.query(query, (err, filas) => {
        if (err) {
            console.error("❌ Error al ejecutar la consulta SQL:", err);
            return res.status(500).send({ message: "Error al recuperar los datos." });
        }
        res.send(filas);
    });
});

// --- Inicio del Servidor ---
const port = 3000;
app.listen(port, () => {
    console.log(`Servidor API Node.js escuchando en http://10.11.0.173:${port}`);
});