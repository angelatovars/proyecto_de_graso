from backend.flask import Blueprint, request, jsonify
from backend.controllers.auth_controller import AuthController
from backend.flask_jwt_extended import jwt_required
from backend.models.user_model import UserModel

api = Blueprint('auth', __name__)

@api.route('/register', methods=['POST'])
def register():
    data = request.get_json()
    nombre = data.get('nombre')
    correo = data.get('correo')
    contraseña = data.get('contraseña')
    edad = data.get('edad')
    return AuthController.register(nombre, correo, contraseña, edad)

@api.route('/login', methods=['POST'])
def login():
    data = request.get_json()
    correo = data.get('correo')
    contraseña = data.get('contraseña')
    return AuthController.login(correo, contraseña)
# Ruta para cambiar la contraseña
@api.route('/change-password', methods=['PUT'])
@jwt_required()
def change_password():
    return AuthController.change_password()

    
@api.route('/logout', methods=['POST'])
@jwt_required()  # Requiere el token JWT para que el usuario pueda cerrar sesión
def logout():
    return AuthController.logout()

@api.route('/verificar-correo', methods=['POST'])
def verificar_correo():
    data = request.get_json()
    correo = data.get('correo')
    
    # Usar el método existente get_user_by_email
    usuario = UserModel.get_user_by_email(correo)
    
    return jsonify({
        'existe': usuario is not None
    })
