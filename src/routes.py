from flask import Flask, jsonify, request, session
from flask_cors import CORS
from database.db import connectdb
from utils.jwt import encode_jwt, decode_jwt
from src.models import *
import jwt

app = Flask(__name__)
CORS(app, resources={r"/*": {"origins": "http://localhost:8080"}})

app.secret_key = "secretkey"

@app.route("/")
def bienvenido():
    return "Bienvenido al proyecto Escuela Montaño"


#get all categories
@app.route("/categorias", methods=['GET'])
def all_categories():
    data = get_categories()
    return data

#Add a categoria - Funciona
@app.route("/add_categoria", methods=['POST'])
def new_categoria():
    add_categoria()
    return "Categoria agregada"

#delete one categorie by id - funciona
@app.route("/categorias/<idcat>", methods=['DELETE'])
def delete_category(idcat):
    delete_category_by_id(idcat)
    return "Category deleted"

#Get all products grouped by category - funciona
@app.route("/productos/<idcat>", methods=['GET'])
def get_products(idcat):
    data = get_products_by_category(idcat)
    return data

#Get one product - funciona
@app.route("/producto_by_id/<id>", methods=['GET'])
def get_product(id):
    data = get_product_by_id(id)
    return data

# Get all products -funciona
@app.route("/all_products", methods=['GET'])
def get_productos():
    data = get_todo_products()
    return data

#Add a product - funciona
@app.route("/add_producto", methods=['POST'])
def new_product():
    add_producto()
    return "Producto agregado"

#Update one product - funciona
@app.route("/update_producto/<id>", methods=['PATCH'])
def update_product(id):
    data= update_producto(id)
    return data

#Delete one product - funciona
@app.route("/delete_producto/<id>", methods=['DELETE'])
def delete_product(id):
    delete_producto_by_id(id)
    return "Producto was deleted"


##########Rutas Usuarios#############

#Add user - funciona
@app.route("/add_user", methods=['POST'])
def new_user():
    add_user()
    return "Usuario agregado"


#get one user by id - funciona
@app.route("/get_user/<id>", methods=['GET'])
def obtener_user(id):
    data = get_user(id)
    return data

#get all users - funciona
@app.route("/usuarios", methods=['GET'])
def all_users():
    data = get_usuarios()
    return data


#update one user by id - funciona
@app.route("/update_usuario/<id>", methods=['PATCH'])
def update_usuario_route(id):
    data = update_usuario(id)
    return data


#delete a user - funciona
@app.route("/delete_usuario/<id>", methods=['DELETE'])
def delete_usuario(id):
    delete_usuario_by_id(id)
    return "Usuario was deleted"

# Ruta para el inicio de sesión (autenticación)
@app.route("/login", methods=['POST'])
def login():
    
    data = request.get_json()
    email = data.get('email')
    password = data.get('password')
    
    con = connectdb()
    cursor = con.cursor()
    cursor.execute("SELECT * FROM usuarios WHERE email = %s", (email,))
    row = cursor.fetchone()
    
    email_db = row[3]
    password_Db = row[4]
    
    if email_db == email and password_Db == password:
        token = jwt.encode({'email': email}, app.secret_key, algorithm='HS256')
        sesion = session["token"] = token
        print(token)
        return sesion 
   
    return jsonify({'message': 'Bienvenido', 'email': email, 'password': password})
    
    
@app.route("/intranet", methods=['GET'])
def intranet():
    try:
        # Verificar el token JWT antes de permitir el acceso
        token = request.headers.get('Authorization')
        if not token:
            return jsonify({'message': 'Token de autenticación faltante'}), 401

        # Verificar el token JWT y obtener el usuario autenticado
        decoded_token = decode_jwt(token)
        
        # Si el token es válido, se permite el acceso a la zona protegida
        return jsonify({'message': 'Bienvenido a la zona protegida'}), 200

    except Exception as e:
        return jsonify({'message': str(e)}), 400









if __name__ == "__main__":
    app.run(debug=True)