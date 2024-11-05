import pymysql
from settings.config import Config

def create_connection():
    try:
        return pymysql.connect(
            host=Config.MYSQL_HOST,
            user=Config.MYSQL_USER,
            password=Config.MYSQL_PASSWORD,
            db=Config.MYSQL_DB,
            cursorclass=pymysql.cursors.DictCursor
        )
    except pymysql.Error as e:
        print(f"Error conectando a la base de datos: {e}")
        return None

# Verificar conexión
if __name__ == '__main__':
    create_connection()