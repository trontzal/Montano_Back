import jwt
from flask import current_app as app

def encode_jwt(payload):
    return jwt.encode(payload, app.secret_key, algorithm='HS256')

def decode_jwt(token):
    return jwt.decode(token, options={"verify_signature": False})