from flask import jsonify, request
from database.db import connectdb
from utils.jwt import decode_jwt


# Obtain all categories

def get_categories():
    conn = connectdb()
    cur = conn.cursor()
    cur.execute('SELECT * FROM categorias')
    categorias = cur.fetchall()
    data = [{'idcat': dato[0], 'descripcion': dato[1]} for dato in categorias]
    conn.close()
    return jsonify(data)

#Agregar una categoria
def add_categoria():
    conn = connectdb()
    cur = conn.cursor()
    data = request.get_json()

    idcat = data['idcat']
    descripcion = data['descripcion']

    cur.execute('INSERT INTO categorias (idcat, descripcion) VALUES (%s, %s)', (idcat, descripcion))
    conn.commit()
    conn.close()                                                            
    print('Categoria agregada')                                 
    return "Categoria agregada"

#Delete one category by its id
def delete_category_by_id(idcat):
    conn = connectdb()
    cur = conn.cursor()
    cur.execute('DELETE FROM categorias WHERE idcat = %s', (idcat,))
    conn.commit()
    conn.close()
    print("The category was deleted !!")
    return ""

#########Funciones para tabla productos##############

#Get one product by id
def get_product_by_id(id):
    conn = connectdb()
    cur = conn.cursor()
    cur.execute('SELECT * FROM productos WHERE id = %s', (id,))
    dato_producto = cur.fetchone()
    conn.close()
    
    if dato_producto:
        producto = {
            'id': dato_producto[0],
            'nombre': dato_producto[1],
            'precio': dato_producto[2],
            'img': dato_producto[3],
            'idcat': dato_producto[4]
        }
        return jsonify(producto)
    else:
        return 'El producto no fue encontrado'
    
#Get all products
def get_todo_products():
    conn = connectdb()
    cur = conn.cursor()
    cur.execute('SELECT * FROM productos ')
    productos = cur.fetchall()
    data = [{'id':dato[0],'nombre': dato[1], 'precio': dato[2], 'img': dato[3], 'idcat': dato[4]} for dato in productos]
    conn.close()
    return jsonify(data)
    
#Agregar un producto
def add_producto():
    conn = connectdb()
    cur = conn.cursor()
    data = request.json
    img = data.get('img')
    idcat = data.get('idcat')
    nombre = data.get('nombre')
    precio = data.get('precio')

    cur.execute('INSERT INTO productos (nombre, precio, img, idcat) VALUES (%s, %s, %s, %s)', (nombre, precio, img, idcat))
    conn.commit()
    conn.close()                                                            
    print('Producto agregado ')
    response = {'message': 'Producto agregrado'}                                
    return jsonify(response)


#Update un producto

def update_producto(id):
    conn = connectdb()
    cur = conn.cursor()

    data = request.get_json()

    if "nombre" in data:
        nombre = data["nombre"]
        cur.execute('UPDATE productos SET nombre = %s WHERE id = %s', (nombre, id))

    if "precio" in data:
        precio = data["precio"]
        cur.execute('UPDATE productos SET precio = %s WHERE id = %s', (precio, id))

    if "img" in data:
        img = data["img"]
        cur.execute('UPDATE productos SET img = %s WHERE id = %s', (img, id))

    if "idcat" in data:
        idcat = data["idcat"]
        cur.execute('UPDATE productos SET idcat = %s WHERE id = %s', (idcat, id))
      
    conn.commit()
    conn.close()

    return 'Producto modified'


#Delete one product by its id
def delete_producto_by_id(id):
    conn = connectdb()
    cur = conn.cursor()
    cur.execute('DELETE FROM productos WHERE id = %s', (id,))
    conn.commit()
    conn.close()
    print("The prodcut was deleted !!")
    return "The product was deleted !!"



#Get all products grouped by category
def get_products_by_category(idcat):
    conn = connectdb()
    cur = conn.cursor()
    cur.execute('SELECT * FROM productos where idcat = %s', (idcat,))
    productos = cur.fetchall()
    data = [{'id': dato[0],'nombre': dato[1], 'precio': dato[2], 'img': dato[3]} for dato in productos]
    conn.close()
    return jsonify(data)


########Usuarios##########

#Add User
def add_user():
    conn = connectdb()
    cur = conn.cursor()
    data = request.get_json()

    nombre = data['nombre']
    apellido = data['apellido']
    email = data['email']
    password = data['password']
    print (email, password,nombre,apellido)

    cur.execute('INSERT INTO usuarios (nombre, apellido, email, password) VALUES (%s, %s, %s, %s)', (nombre, apellido, email,  password))
    conn.commit()
    conn.close()                                                            
    print('Usuario agregado ')                                 
    return "Usuario agregado"

#Get user
def get_user(id):
    conn = connectdb()
    cur = conn.cursor()
    cur.execute('SELECT * FROM usuarios WHERE iduser = %s', (id,))
    dato_usuario = cur.fetchone()
    conn.close()
    
    if dato_usuario:
        usuario = {
            'nombre': dato_usuario[1],
            'apellido': dato_usuario[2],
            'email': dato_usuario[3],
            'password': dato_usuario[4]
        }
        return jsonify(usuario)
    else:
        return 'El usuario no fue encontrado'
    
## Get all users
def get_usuarios():
    conn = connectdb()
    cur = conn.cursor()
    cur.execute('SELECT * FROM usuarios ')
    usuarios = cur.fetchall()
    data = [{'nombre': dato[1], 'apellido': dato[2], 'email': dato[3], 'rol': dato[4], 'password': dato[5]} for dato in usuarios]
    conn.close()
    return jsonify(data)

#Update un usuario
def update_usuario(id):
    conn = connectdb()
    cur = conn.cursor()

    data = request.get_json()

    if "nombre" in data:
        nombre = data["nombre"]
        cur.execute('UPDATE usuarios SET nombre = %s WHERE iduser = %s', (nombre, id))

    if "apellido" in data:
        apellido = data["apellido"]
        cur.execute('UPDATE usuarios SET apellido = %s WHERE iduser = %s', (apellido, id))

    if "email" in data:
        email = data["email"]
        cur.execute('UPDATE usuarios SET email = %s WHERE iduser = %s', (email, id))

    if "password" in data:
        password = data["password"]
        cur.execute('UPDATE usuarios SET password = %s WHERE iduser = %s', (password, id))

    conn.commit()
    conn.close()

    return 'Usuario modificado'


#Delete one user by its id
def delete_usuario_by_id(id):
    conn = connectdb()
    cur = conn.cursor()
    cur.execute('DELETE FROM usuarios WHERE iduser = %s', (id,))
    conn.commit()
    conn.close()
    print("The user was deleted !!")
    return "The user was deleted !!"
