// ===============================================
// LÓGICA DE PERSISTENCIA (LOCALSTORAGE)
// ===============================================

// Función para cargar usuarios desde localStorage. 
function loadUsers() {
    const storedUsers = localStorage.getItem('appUsers');
    if (storedUsers) {
        return JSON.parse(storedUsers);
    }
    
    // Lista de usuarios iniciales, con el patrón: usuario + 123
    return [
        { usuario: 'edorta', password: 'edorta123', email: 'edorta@ejemplo.com', nombre: 'Edorta' },
        { usuario: 'mario', password: 'mario123', email: 'mario@ejemplo.com', nombre: 'Mario' },
        { usuario: 'ricardo', password: 'ricardo123', email: 'ricardo@ejemplo.com', nombre: 'Ricardo' },
        { usuario: 'jon', password: 'jon123', email: 'jon@ejemplo.com', nombre: 'Jon' }
    ];
}

// Función para guardar el arreglo de usuarios actualizado en localStorage
function saveUsers(currentUsers) {
    localStorage.setItem('appUsers', JSON.stringify(currentUsers));
}

// Variable global que carga los usuarios persistentes.
let users = loadUsers();

/**
 * Muestra un mensaje de estado en la página de Login o Registro.
 * @param {string} id - ID del elemento <p> donde se mostrará el mensaje (login-message o register-message).
 * @param {string} message - El texto del mensaje.
 * @param {string} color - El color del mensaje ('green' para éxito, 'red' para error).
 */
function displayMessage(id, message, color) {
    const msgElement = document.getElementById(id);
    if (msgElement) {
        msgElement.textContent = message;
        msgElement.style.color = color;
    }
}

/**
 * Maneja el envío del formulario de INICIO DE SESIÓN.
 * @param {Event} event - El evento de envío del formulario.
 * @returns {boolean} Falso para prevenir el envío normal del formulario.
 */
function handleLogin(event) {
    event.preventDefault(); // Detiene el envío del formulario al servidor

    const usernameInput = document.getElementById('username').value;
    const passwordInput = document.getElementById('password').value;

    const userFound = users.find(user => user.usuario === usernameInput);

    if (userFound) {
        if (userFound.password === passwordInput) {
            displayMessage('login-message', '¡Inicio de sesión exitoso! Redirigiendo...', 'green');
            
            // Lógica de redirección
            setTimeout(() => {
                // 1. Mostrar el alert.
                alert(`Bienvenido, ${userFound.nombre}`); 
                // 2. Después de que el usuario hace clic en Aceptar, se ejecuta la redirección.
                window.location.href = 'index.html'; 
            }, 1500); // 1.5 segundos de retraso para que el usuario lea el mensaje de éxito en pantalla
            
        } else {
            displayMessage('login-message', 'Contraseña incorrecta.', 'red');
        }
    } else {
        displayMessage('login-message', 'Usuario no encontrado.', 'red');
    }
    return false; 
}

/**
 * Maneja el envío del formulario de REGISTRO.
 * @param {Event} event - El evento de envío del formulario.
 * @returns {boolean} Falso para prevenir el envío normal del formulario.
 */
function handleRegister(event) {
    event.preventDefault(); // Detiene el envío del formulario al servidor

    const nombre = document.getElementById('nombre').value;
    const email = document.getElementById('email').value;
    const usuario = document.getElementById('usuario').value;
    const password = document.getElementById('password').value;
    const confirmar = document.getElementById('confirmar').value;

    // 1. Verificar si las contraseñas coinciden
    if (password !== confirmar) {
        displayMessage('register-message', 'Las contraseñas no coinciden.', 'red');
        return false;
    }

    // 2. Verificar si el usuario ya existe
    const userExists = users.some(user => user.usuario === usuario || user.email === email);
    if (userExists) {
        displayMessage('register-message', 'El usuario o correo electrónico ya está registrado.', 'red');
        return false;
    }

    // 3. Crear nuevo usuario, agregarlo al arreglo y GUARDAR en localStorage
    const newUser = {
        nombre: nombre,
        email: email,
        usuario: usuario,
        password: password 
    };

    users.push(newUser);
    saveUsers(users); 

    displayMessage('register-message', '¡Registro exitoso! Ahora puedes volver a iniciar sesión.', 'green');

    // Opcional: Limpiar el formulario
    event.target.reset();

    return false; 
}


// EL CÓDIGO INICIAL QUE MANEJA EL BOTÓN VOLVER ARRIBA Y PROYECTOS
document.addEventListener('DOMContentLoaded', () => {
  // Botón "Volver arriba" (añadido dinámicamente)
  const back = document.createElement('button');
  back.type = 'button';
  back.className = 'back-to-top'; // Usa la clase CSS
  back.setAttribute('aria-label', 'Volver arriba');
  back.innerText = '↑';

  document.body.appendChild(back);

  // Mostrar/ocultar según scroll
  const showAfter = 250;
  window.addEventListener('scroll', () => {
    const shouldShow = window.scrollY > showAfter;
    back.style.display = shouldShow ? 'inline-flex' : 'none'; // Se mantiene la manipulación de display
    back.setAttribute('aria-hidden', String(!shouldShow));
  }, { passive: true });

  // Al hacer click, scroll suave arriba y foco a la estructura principal
  back.addEventListener('click', () => {
    window.scrollTo({ top: 0, behavior: 'smooth' });
    const target = document.querySelector('main') || document.querySelector('h1') || document.body;
    if (target) {
      if (!target.hasAttribute('tabindex')) target.setAttribute('tabindex', '-1');
      target.focus({ preventScroll: true });
      target.addEventListener('blur', function cleanup() {
        if (target.getAttribute('tabindex') === '-1') target.removeAttribute('tabindex');
        target.removeEventListener('blur', cleanup);
      });
    }
    back.blur();
  });

  // Mejora adicional no disruptiva: navegación suave para enlaces internos (href="#id")
  document.querySelectorAll('a[href^="#"]').forEach(a => {
    a.addEventListener('click', (ev) => {
      const href = a.getAttribute('href');
      if (!href || href === '#') return;
      const el = document.querySelector(href);
      if (!el) return;
      ev.preventDefault();
      el.scrollIntoView({ behavior: 'smooth', block: 'start' });
      if (!el.hasAttribute('tabindex')) el.setAttribute('tabindex', '-1');
      el.focus();
      el.addEventListener('blur', function cleanup() {
        if (el.getAttribute('tabindex') === '-1') el.removeAttribute('tabindex');
        el.removeEventListener('blur', cleanup);
      });
      history.replaceState(null, '', href);
    });
  });
});

document.querySelectorAll(".proyecto").forEach(proyecto => {
    const titulo = proyecto.querySelector(".proyecto-titulo");

    titulo.addEventListener("click", () => {
        proyecto.classList.toggle("expanded");
    });
});


// ===============================================
// LÓGICA DE VISIBILIDAD DE CONSULTAS SQL (API.HTML) - CORREGIDA CON JQUERY
// ===============================================

// Usamos $(document).ready() para asegurar que el DOM esté cargado y que jQuery esté disponible
$(document).ready(function() {
    // Selecciona todos los botones con la clase 'toggle-btn'
    $('.toggle-btn').on('click', function() {
        // Obtenemos el selector del target usando el atributo data-target
        const targetId = '#' + $(this).data('target');
        const $targetElement = $(targetId);

        // Usamos .slideToggle() para un efecto más agradable y gestión automática de 'display'
        // Esto alterna la visibilidad (display: none/block) del elemento objetivo.
        $targetElement.slideToggle(300);

        // Cambiamos el texto del botón
        if ($(this).text() === 'Mostrar Resultado') {
            $(this).text('Ocultar Resultado');
        } else {
            $(this).text('Mostrar Resultado');
        }
    });
});