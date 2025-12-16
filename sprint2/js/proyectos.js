// --- CONFIGURACIÓN ---
// URL completa para la API de proyectos (usando el host y puerto de api.js)
const API_URL = 'http://10.11.0.173:3000/api/api.js?accion=proyectos';
const listaProyectos = document.getElementById('lista-proyectos');

// --- FUNCIONES DE RENDERIZADO Y LÓGICA ---

/**
 * Crea el elemento HTML para un proyecto.
 * @param {object} proyecto - Objeto con {id, nombre, presupuesto, inicio, fin}.
 * @returns {HTMLElement} El div completo del proyecto.
 */
function crearHTMLProyecto(proyecto) {
    // Formatear el presupuesto como moneda (€)
    const presupuestoFormateado = new Intl.NumberFormat('es-ES', { 
        style: 'currency', 
        currency: 'EUR',
        minimumFractionDigits: 2 
    }).format(proyecto.presupuesto);

    const proyectoDiv = document.createElement('div');
    proyectoDiv.classList.add('proyecto');
    
    // El servidor Node.js devuelve fechas con formato largo. Usamos .substring(0, 10) para limpiar (YYYY-MM-DD).
    const fechaInicio = proyecto.inicio ? String(proyecto.inicio).substring(0, 10) : 'N/A';
    const fechaFin = proyecto.fin ? String(proyecto.fin).substring(0, 10) : 'N/A';

    proyectoDiv.innerHTML = `
        <button class="proyecto-titulo">${proyecto.nombre}</button>
        <div class="proyecto-detalles">
            <p><strong>ID:</strong> ${proyecto.id}</p>
            <p><strong>Presupuesto:</strong> ${presupuestoFormateado}</p>
            <p><strong>Inicio:</strong> ${fechaInicio}</p>
            <p><strong>Fin:</strong> ${fechaFin}</p>
        </div>
    `;
    return proyectoDiv;
}

/**
 * Inicializa los oyentes de eventos para el despliegue de detalles.
 */
function inicializarOyentes() {
    // Selecciona todos los divs con la clase 'proyecto' (los que acabamos de crear)
    document.querySelectorAll(".proyecto").forEach(proyecto => {
        const titulo = proyecto.querySelector(".proyecto-titulo");

        titulo.addEventListener("click", () => {
            proyecto.classList.toggle("expanded");
        });
    });
}

/**
 * Función principal para cargar los proyectos desde la API y mostrarlos.
 */
async function cargarProyectos() {
    if (!listaProyectos) {
        console.error("El contenedor de proyectos ('#lista-proyectos') no fue encontrado.");
        return;
    }
    
    // Mostrar mensaje de carga inicial
    listaProyectos.innerHTML = '<p>Cargando proyectos...</p>';

    try {
        const response = await fetch(API_URL);
        
        if (!response.ok) {
            throw new Error(`Error HTTP: ${response.status} - ${response.statusText}`);
        }
        
        const proyectos = await response.json();

        // Limpiar el contenido de carga
        listaProyectos.innerHTML = ''; 
        
        if (proyectos.length === 0) {
            listaProyectos.innerHTML = '<p>No hay proyectos disponibles en este momento.</p>';
            return;
        }

        // 1. Crear y añadir los elementos de proyecto al DOM
        proyectos.forEach(proyecto => {
            const proyectoElemento = crearHTMLProyecto(proyecto);
            listaProyectos.appendChild(proyectoElemento);
        });

        // 2. Inicializar los oyentes de eventos
        inicializarOyentes();

    } catch (error) {
        console.error('Error al cargar los proyectos:', error);
        // Mostrar un mensaje de error en la página
        listaProyectos.innerHTML = `<p class="error-carga">Error al cargar los proyectos. Por favor, asegúrate de que el servidor Node.js esté corriendo.</p>`;
    }
}

// Ejecutar la función principal al cargar el script
cargarProyectos();