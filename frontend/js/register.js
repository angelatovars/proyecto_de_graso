document.getElementById('registerForm').addEventListener('submit', async (event) => {
    event.preventDefault();

    const nombre = document.getElementById('nombre').value;
    const correo = document.getElementById('correo').value;
    const contraseña = document.getElementById('contraseña').value;
    const confirmarContraseña = document.getElementById('confirmarContraseña').value;
    const edad = parseInt(document.getElementById('edad').value);

    // Validación de contraseñas
    if (contraseña !== confirmarContraseña) {
        alert('Las contraseñas no coinciden');
        return;
    }

    // Validación de edad
    if (edad < 17 || edad > 28) {
        alert('La edad debe estar entre 17 y 28 años.');
        return;
    }

    try {
        // Verificar si el correo ya existe
        const verificacionCorreo = await fetch('http://localhost:5000/api/auth/verificar-correo', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({ correo })
        });

        const resultadoVerificacion = await verificacionCorreo.json();

        if (resultadoVerificacion.exists) {
            alert('Este correo ya está registrado');
            return;
        }

        // Si el correo no existe, proceder con el registro
        const response = await fetch('http://localhost:5000/api/auth/register', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({ nombre, correo, contraseña, edad })
        });

        const data = await response.json();

        if (response.ok) {
            alert('Registro exitoso');
            window.location.href = '../pages/login.html';
        } else {
            alert(data.message || 'Error en el registro');
        }
    } catch (error) {
        console.error('Error:', error);
        alert('Error en la conexión. Inténtalo nuevamente.');
    }
});