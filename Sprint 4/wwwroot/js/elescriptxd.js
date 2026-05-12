////////////////////////////////////////////////////////////////////////////
////////////////////////////// GENERAL /////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
// Botón de volver arriba
const boton = document.createElement('button')
document.addEventListener('DOMContentLoaded', function(){
    boton.type = 'button'
    boton.className = 'back-to-top'
    boton.setAttribute('aria-label', 'Volver arriba')
    boton.innerText = '↑'

    document.body.appendChild(boton)

    window.addEventListener(
        'scroll', function() {
            boton.style.display = window.scrollY > 250 ? 'inline-flex' : 'none'
            boton.setAttribute('aria-hidden', String(!window.scrollY > 250))
        }, { passive: true }
    )

    boton.addEventListener(
        'click', function() {
            window.scrollTo({ top: 0, behavior: 'smooth' })
            const target = document.querySelector('main') || document.querySelector('h1') || document.body
            if (target) {
                if (!target.hasAttribute('tabindex')){
                    target.setAttribute('tabindex', '-1')
                }
                target.focus({ preventScroll: true })
                target.addEventListener(
                    'blur', function cleanup() {
                        if (target.getAttribute('tabindex') === '-1') target.removeAttribute('tabindex')
                        target.removeEventListener('blur', cleanup)
                    }
                )
            }
        boton.blur()
        }
    )

  document.querySelectorAll('a[href^="#"]').forEach(a => {
    a.addEventListener('click', (ev) => {
      if (!a.getAttribute('href') || a.getAttribute('href') === '#') return
      const el = document.querySelector(a.getAttribute('href'))
      if (!el) return
      ev.preventDefault()
      el.scrollIntoView({ behavior: 'smooth', block: 'start' })
      if (!el.hasAttribute('tabindex')) el.setAttribute('tabindex', '-1')
      el.focus()
      el.addEventListener('blur', function cleanup() {
        if (el.getAttribute('tabindex') === '-1') el.removeAttribute('tabindex')
        el.removeEventListener('blur', cleanup)
      })
      history.replaceState(null, '', a.getAttribute('href'))
    })
  })
})


//Función de usuario. Llama a la consulta que mira si un usuario existe en la base de datos y devualve un booleano. 
async function encontrarUsuario(usuario) {
    try {
        const response = await fetch("http://10.11.0.200:3000/api/usuario/" + usuario)
        const data = await response.json()
        return data
    } catch (err) {
        alert("Ha habido un error localizando el usuario")
        console.error(err.message)
    }
}

//Función de contraseña. Llama a la consulta que mira la contraseña de un usuario y la devuelve.
//Aunque tenga como variable un usuario, sigue devolviendo la contraseña; pasa que no sé hacer llamadas de dos variables
async function encontrarContrasena(usuario) {
    try {
        const response = await fetch("http://10.11.0.200:3000/api/contrasena/" + usuario)
        const data = await response.json()
        return data
    } catch (err) {
        alert("Ha habido un error comprobando la contraseña")
        console.error(err.message)
    }
}


////////////////////////////////////////////////////////////////////////////
/////////////////////////// INICIAR SESIÓN /////////////////////////////////
////////////////////////////////////////////////////////////////////////////


function displayMessage(id, message, color) {
    if (document.getElementById(id)) {
        document.getElementById(id).textContent = message
        document.getElementById(id).style.color = color
    }
}

async function login (usuario, contrasena) {
    try {
        if (await encontrarUsuario(usuario) === true) {
            if (await encontrarContrasena(usuario) == contrasena) {
                displayMessage("login-message", "Login exitoso", "green")
                alert("Inicio de sesión correcto")
            } else {
                displayMessage("login-message", "Contraseña incorrecta", "red")
                alert("Contraseña incorrecta")
            }
        } else {
            displayMessage("login-message", "Usuario incorrecto", "red")
            alert("Usuario incorrercto")
        }
    } catch (err) {
        displayMessage("login-message", "Ha ocurrido un error iniciando sesión", "red")
        console.error(err.message)
    }
}

    



////////////////////////////////////////////////////////////
/////////////////// PROYECTOS //////////////////////////////
////////////////////////////////////////////////////////////

async function cargarProyectos() {
    try {
        const response = await fetch ("http://10.11.0.200:3000/api/proyectos")
        const data = await response.json()
        proyecto = data
        const listaProyectos = document.getElementById("lista-proyectos")
        listaProyectos.innerHTML = ""
        if (proyecto.length > 0) {
            const crearCabeza = document.createElement("tr")
            crearCabeza.innerHTML = "<th>Número</th><th>Nombre</th><th>Presupuesto</th><th>Fecha de inicio</th><th>Fecha final</th>"
            document.getElementById("lista-proyectos").appendChild(crearCabeza)
            for (i of proyecto) {
                const crearCuerpo = document.createElement("tr")
                crearCuerpo.innerHTML = `<td>${i.id}</td><td>${i.nombre}</td><td>${i.presupuesto}</td><td>${i.inicio}</td><td>${i.fin}</td>`
                crearCuerpo.className = "proyecto-detalles"
                document.getElementById("lista-proyectos").appendChild(crearCuerpo)
            }
        }
        else {
            listaProyectos.innerHTML = "No hay proyectos que enseñar"
        }
    }
    catch (err) {
        console.error(err.message)
    }
}




document.querySelectorAll(".proyecto").forEach(proyecto => {
    const titulo = proyecto.querySelector(".proyecto-titulo")

    titulo.addEventListener("click", () => {
        proyecto.classList.toggle("expanded")
    })
})


////////////////////////////////////////////////////////////
//////////////////// INFORMES //////////////////////////////
////////////////////////////////////////////////////////////

document.addEventListener("DOMContentLoaded", () => {
    document.querySelectorAll(".toggle-btn").forEach(btn => {
        btn.addEventListener("click", function() {
            const target = document.getElementById(this.dataset.target);

            if (target.style.display === "none" || target.style.display === "") {
                target.style.display = "block"
                this.textContent = "Ocultar Resultado"
            } else {
                target.style.display = "none"
                this.textContent = "Mostrar Resultado"
            }
        })
    })
})

async function cargarInformes(codProyecto) {
    try {
        const response = await fetch('http://10.11.0.200:3000/api/idea-informes/' + codProyecto)
        const data = await response.json()
        const respuesta = data
        let fila = document.createElement("tr")
        fila.innerHTML = `<td>${respuesta.Proyecto}</td><td>${respuesta.PresupuestoRestante}</td><td>${respuesta.MayorInversor}</td><td>${respuesta.Staff}</td>`
        document.getElementById("ContenidoTablaInformes").appendChild(fila)
    }
    catch (err) {
        alert("Ha ocurrido un error cargando los informes")
        console.error(err.message)
    }
}