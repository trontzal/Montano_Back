import mysql.connector

def connectdb():
    try:
        conn = mysql.connector.connect(
            host='containers-us-west-21.railway.app',
            port=7404,
            user='root',
            password='Vrrgk9JpbEhUft4mmY2f',
            database='railway'
    )
        print('Connecting to MontañoDB')

    except Exception as e:
        print(f'Error connecting to MontañoDB: {e}')

    return conn

connectdb()