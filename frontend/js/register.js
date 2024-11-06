document.addEventListener('DOMContentLoaded', function() {
    const registerForm = document.getElementById('registerForm');
    
    registerForm.addEventListener('submit', function(event) {
        event.preventDefault();
        
        console.log('Iniciando registro...');

        const formData = {
            nombre: document.getElementById('nombre').value,
            correo: document.getElementById('correo').value,
            contraseña: document.getElementById('contraseña').value,
            edad: parseInt(document.getElementById('edad').value)
        };

        console.log('Datos a enviar:', formData);

        fetch('http://localhost:5000/api/auth/register', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(formData)
        })
        .then(response => response.json())
        .then(data => {
            console.log('Datos de respuesta:', data);
            if (data.success) {
                alert('Registro exitoso');
                window.location.href = 'login.html';
            } else {
                alert(data.message || 'Error en el registro');
            }
        })
        .catch(error => {
            console.error('Error en el registro:', error);
            alert('Error al intentar registrar. Por favor, intenta nuevamente.');
        });
    });
});