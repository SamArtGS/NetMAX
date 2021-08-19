import cx_Oracle as oracle
import config

connection = oracle.connect(
  config.username, config.password, dsn="sgsbdd_s1", encoding="UTF-8"
)
cur = connection.cursor()

inst_blob = """
  insert into archivo_programa_f2(num_archivo, programa_id, archivo, tamanio) 
  values(:1, :2, :3, :4)
"""
qry_blob = """
  select archivo from archivo_programa 
  where num_archivo = :1 and programa_id = :2
"""

def uploadImage(id, image_path):
  with open(image_path, 'rb') as f:
    img_data = f.read()
    cur.execute(inst_blob, (1, 1, img_data, f.tell()))
    connection.commit()

def downloadImage(id, image_path):
  cur.execute(qry_blob, (1,1))
  foto, = cur.fetchone()
  with open(image_path, 'wb') as f: 
     f.write(foto.read())

def showTest():
  for row in cur.execute("select * from archivo_programa"):
    print(row)

showTest()
#uploadImage(1, "img/prueba.jpg")
downloadImage(1, "img/disculpeProfesorCreoSaberComoCrearBBD.jpg")

cur.close()