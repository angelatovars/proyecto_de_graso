import sys
import os
sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

from flask import Flask
from flask_cors import CORS
from flask_jwt_extended import JWTManager
from datetime import timedelta

app = Flask(__name__)

# Configuración de la aplicación
app.config['JWT_SECRET_KEY'] = 'tu-clave-secreta'
app.config['JWT_ACCESS_TOKEN_EXPIRES'] = timedelta(hours=1)

# Habilitar CORS
CORS(app)

# Inicializar JWT
jwt = JWTManager(app)

@app.route('/')
def home():
    return {"message": "API funcionando"}

if __name__ == "__main__":
    app.run()
