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
    // Selecciona todos los divs con la clase 'proyecto' 
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

    
    // Mostrar mensaje de carga inicial
    try{
        listaProyectos.innerHTML = '<p>Cargando proyectos...</p>';
    } catch (error){
        console.error("El contenedor de proyectos ('#lista-proyectos') no fue encontrado.")
        return
    }
    try {
        const response = await fetch("http://localhost/api/proyectos");
        
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
        console.error('Error al cargar los proyectos, es probable que node.js no esté corriendo', error);
        // Mostrar un mensaje de error en la página
        listaProyectos.innerHTML = `<p class="error-carga">Error al cargar los proyectos.</p>`;
    }
}

// Ejecutar la función principal al cargar el script
cargarProyectos();