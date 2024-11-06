import os 
import sys
sys.patch.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

from flask import Flask
from flask_cors import CORS
from flask_jwt_extended import JWTManager
from datetime import timedelta
from settings.config import Config
from routes.profile_routes import api as profile_api
from routes.auth_routes import api as auth_api
from routes.ranking_routes import ranking_bp # Añadimos la importación del admin
from utils.db_config import create_connection

# Crear la aplicación de Flask
app = Flask(__name__)

# Configuración de la aplicación
app.config.from_object(Config)
app.config['JWT_SECRET_KEY'] = 'tu-clave-secreta'
app.config['JWT_ACCESS_TOKEN_EXPIRES'] = timedelta(hours=1)

# Habilitar CORS
CORS(app, resources={
    r"/api/*": {
        "origins": "*",
        "methods": ["GET", "POST", "PUT", "DELETE", "OPTIONS"],
        "allow_headers": ["Content-Type", "Authorization"]
    }
})

# Inicializar JWT
jwt = JWTManager(app)

# Registrar todos los Blueprints
app.register_blueprint(profile_api, url_prefix="/")
app.register_blueprint(auth_api, url_prefix='/auth')
app.register_blueprint(ranking_bp, url_prefix='/api')

# Importar y registrar las demás rutas
from routes.activity_routes import api as activity_api
from routes.game_routes import api as game_api
from routes.results_routes import api as results_api

app.register_blueprint(auth_api, url_prefix='/api/auth')
app.register_blueprint(activity_api, url_prefix='/api/activities')
app.register_blueprint(game_api, url_prefix='/api/games')
app.register_blueprint(profile_api, url_prefix='/api/profile')
app.register_blueprint(results_api, url_prefix='/api/results')

# Verificación de tokens revocados
@jwt.token_in_blocklist_loader
def check_if_token_revoked(jwt_header, jwt_payload):
    jti = jwt_payload["jti"]
    connection = create_connection()
    try:
        with connection.cursor() as cursor:
            query = "SELECT * FROM RevokedTokens WHERE jti = %s"
            cursor.execute(query, (jti,))
            result = cursor.fetchone()
            return result is not None
    except Exception as e:
        print(f"Error al verificar si el token está revocado: {e}")
        return True
    finally:
        if connection:
            connection.close()

# Manejador de errores para tokens expirados
@jwt.expired_token_loader
def expired_token_callback(jwt_header, jwt_payload):
    return {
        'message': 'El token ha expirado',
        'error': 'token_expired'
    }, 401

# Manejador de errores para tokens inválidos
@jwt.invalid_token_loader
def invalid_token_callback(error):
    return {
        'message': 'Token inválido',
        'error': 'invalid_token'
    }, 401

# Manejador para cuando no se proporciona token
@jwt.unauthorized_loader
def missing_token_callback(error):
    return {
        'message': 'No se proporcionó token de acceso',
        'error': 'authorization_required'
    }, 401

if __name__ == "__main__":
    # Verificar la conexión a la base de datos al iniciar
    connection = create_connection()
    if connection:
        print("Conexión a la base de datos establecida correctamente")
        connection.close()
    else:
        print("Error al conectar con la base de datos")
    
    app.run(debug=True)
