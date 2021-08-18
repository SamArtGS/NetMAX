import cx_Oracle as oracle
import config

connection = oracle.connect(
  config.username, config.password, dsn="jccbdd_s1", encoding="UTF-8"
)
cur = connection.cursor()

inst_blob = "insert into test(id, foto) values(:1, :2)"
qry_blob = "select foto from test where id = :1"

def uploadImage(id, image_path):
  with open(image_path, 'rb') as f:
    img_data = f.read()
    cur.execute(inst_blob, (id, img_data))
    connection.commit()

def downloadImage(id, image_path):
  cur.execute(qry_blob, (id,))
  foto, = cur.fetchone()
  with open(image_path, 'wb') as f: 
     f.write(foto.read())

def showTest():
  for row in cur.execute("select * from test"):
    print(row)

showTest()
#uploadImage(1, "img/prueba.jpg")
downloadImage(1, "img/disculpeProfesor.jpg")

cur.close()