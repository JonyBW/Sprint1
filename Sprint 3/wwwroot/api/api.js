var express = require('express');
var mysql = require('mysql2'); // Usamos mysql2
var cors = require('cors');
const crypto = require('crypto');

var app = express();
app.use(express.json());

// Habilitamos CORS
app.use(cors()); 

// --- Configuración de la Conexión a la Base de Datos (MySQL) ---
var con = mysql.createPool({
    host: "10.11.0.200", 
    user: "api",
    password: "Betisware5",
    database: "Betisware"
});

// Establecer conexión
try {
    con.connect(
        function() {
            console.log("Conexión a la base de datos establecida.")
        }
    )
} catch (error){
    console.error("Ha habido un error al conectar con la base de datos")
}

// --- Definición del Endpoint de la API ---
// Única ruta que el cliente usará, ahora con lógica para diferentes acciones

function aesDecrypt(encryptedBuffer, key) {
  const keyBuffer = Buffer.alloc(16);
  Buffer.from(key, 'utf8').copy(keyBuffer);

  const decipher = crypto.createDecipheriv('aes-128-ecb', keyBuffer, null);
  decipher.setAutoPadding(true);

  const decrypted = Buffer.concat([
    decipher.update(encryptedBuffer),
    decipher.final()
  ]);

  return decrypted.toString('utf8');
}


//Función para comprobar si un usuario existe. En caso de que lo haga devuelve true.
app.get("/api/usuario/:Usuario", (req, res) => {
    const nombre = req.params.Usuario
    const sql = `select exists(select 1 from cuentas where nomUsuario = ?) as coincide`
    con.query (
        sql, [nombre], (err, filas) => {
            if (err) {
                console.error(err.message)
            }
            if (filas) {
                let coincide = (filas[0].coincide == 1)
                res.json(coincide)
            }
        }
    )
}) 

//Función para obtener la contraseña de un usuario. Devuelve la contraseña
app.get("/api/contrasena/:Usuario", (req, res) => {
    const contrasena = req.params.Usuario
    const sql = `select contraseña from cuentas where nomUsuario = ?`
    con.query (
        sql, [contrasena], (err, filas) => {
            if (err) {
                console.error(err.message)
            }
            if (filas) {
                const decryptedPassword = aesDecrypt(filas[0].contraseña, 'key')
                res.json(decryptedPassword)
            }
        }
    )
})


//Función para obtener datos sobre ideas para el apartado de informes
app.get("/api/idea-informes/:codIdea", (req, res) => {
    const codIdea = req.params.codIdea
    const sql = `SELECT 
                    p.Nombre AS Proyecto,
                    presupuesto_restante(p.codProyecto) AS PresupuestoRestante,
                    FidelidadInversor((SELECT codInversor FROM INVERSIONES WHERE codProyecto = p.codProyecto ORDER BY Dinero DESC LIMIT 1)) AS MayorInversor,
                    COUNT(pe.codEmpleado) AS Staff
                FROM PROYECTOS p
                LEFT JOIN PROYECTOS_EMPLEADOS pe ON p.codProyecto = pe.codProyecto
                WHERE p.codProyecto = ?
                GROUP BY p.codProyecto`;
    con.query (
        sql, [codIdea], (err, filas) => {
            if (err) {
                console.error(err.message)
            }
            if (filas) {
                res.json(filas[0])
            }
        }
    )
})

app.get ("/api/proyectos", (req, res) => {
    const sql = `
        SELECT
            p.codProyecto AS id,
            p.Nombre AS nombre,
            sum(i.Dinero) AS presupuesto,
            p.Fecha_Iniciacion AS inicio,
            p.Fecha_Limite AS fin
        from proyectos p
        left join inversiones i
            on p.codProyecto = i.codProyecto
        group by id
    `
    con.query (
        sql, (err, filas) => {
            if (err) {
                console.error(err.message)
            }
            if (filas) {
                res.json(filas)
            }
        }
    )
})

// --- Inicio del Servidor ---
const port = 3000;
app.listen(port, () => {
    console.log(`Servidor API Node.js escuchando en http://10.11.0.200:${port}`);
});