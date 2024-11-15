from werkzeug.security import generate_password_hash

class AdminConfig:
    ADMIN_EMAIL = 'admin@gmail.com'
    ADMIN_PASSWORD = 'admin123'
    ADMIN_PASSWORD_HASH = generate_password_hash(ADMIN_PASSWORD)
    ADMIN_NAME = 'Administrador'
    ADMIN_AGE = 25