from werkzeug.security import generate_password_hash

# Generar el hash
password = "admin123"
hashed_password = generate_password_hash(password)
print("Hash generado:", hashed_password)