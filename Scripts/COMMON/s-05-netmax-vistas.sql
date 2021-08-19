--@Autores:         Jorge Cárdenas Cárdenas
--                  Samuel Arturo Garrido Sánchez
--@Fecha creación:  16/08/2021
--@Descripción:     Creación de vistas comunes a todos los nodos 
--                  Se excluyen las vistas que contienen columnas BLOB

-- USUARIO
prompt Creando la vista USUARIO
create or replace view usuario as
  select u1.usuario_id, email, nombre, ap_paterno, ap_materno, password, 
    fecha_ingreso, fecha_cuenta_fin, vigente, num_tarjeta, tipo_cuenta_id
  from usuario_f1 u1, (
    select usuario_id, email, nombre, ap_paterno, ap_materno, fecha_ingreso, 
      fecha_cuenta_fin, vigente, tipo_cuenta_id
    from usuario_f2
    union all
    select usuario_id, email, nombre, ap_paterno, ap_materno, fecha_ingreso, 
      fecha_cuenta_fin, vigente, tipo_cuenta_id
    from usuario_f3
    union all
    select usuario_id, email, nombre, ap_paterno, ap_materno, fecha_ingreso, 
      fecha_cuenta_fin, vigente, tipo_cuenta_id
    from usuario_f4
    union all
    select usuario_id, email, nombre, ap_paterno, ap_materno, fecha_ingreso, 
      fecha_cuenta_fin, vigente, tipo_cuenta_id
    from usuario_f5
  ) u2
  where u1.usuario_id = u2.usuario_id
;
prompt Probando la vista USUARIO
select count(*) from usuario;

prompt Creando la vista PROGRAMA
-- PROGRAMA
create or replace view programa as
  select programa_id, folio, nombre, descripcion, fecha_status, tipo, status_programa_id
  from programa_f1
  union all
  select programa_id, folio, nombre, descripcion, fecha_status, tipo, status_programa_id
  from programa_f2
  union all
  select programa_id, folio, nombre, descripcion, fecha_status, tipo, status_programa_id
  from programa_f3
;
prompt Probando la vista PROGRAMA
select count(*) from programa;

prompt Creando la vista PELICULA
-- PELICULA
create or replace view pelicula as
  select programa_id, duracion, sinopsis, clasificacion, pelicula_antecedente_id
  from pelicula_f1
  union all
  select programa_id, duracion, sinopsis, clasificacion, pelicula_antecedente_id
  from pelicula_f2
  union all
  select programa_id, duracion, sinopsis, clasificacion, pelicula_antecedente_id
  from pelicula_f3
;
prompt Probando la vista PELICULA
select count(*) from pelicula;

prompt Creando la vista SERIE
-- SERIE
create or replace view serie as
  select programa_id, num_capitulos, duracion_capitulo, tipo_serie_id
  from serie_f1
  union all
  select programa_id, num_capitulos, duracion_capitulo, tipo_serie_id
  from serie_f2
  union all
  select programa_id, num_capitulos, duracion_capitulo, tipo_serie_id
  from serie_f3
;
prompt Probando la vista SERIE
select count(*) from serie;

prompt Creando la vista PLAYLIST
-- PLAYLIST
create or replace view playlist as
  select playlist_id, calificacion, indice, num_reproducciones, programa_id, usuario_id
  from playlist_f1
  union all
  select playlist_id, calificacion, indice, num_reproducciones, programa_id, usuario_id
  from playlist_f2
  union all
  select playlist_id, calificacion, indice, num_reproducciones, programa_id, usuario_id
  from playlist_f3
  union all
  select playlist_id, calificacion, indice, num_reproducciones, programa_id, usuario_id
  from playlist_f4
;
prompt Probando la vista PLAYLIST
select count(*) from playlist;

prompt Creando la vista STATUS_PROGRAMA
-- STATUS_PROGRAMA
create or replace view status_programa as
  select status_programa_id, clave, descripcion
  from status_programa_r1
;
prompt Probando la STATUS_PROGRAMA
select count(*) from status_programa;

prompt Creando la vista TIPO_CUENTA
-- TIPO_CUENTA
create or replace view tipo_cuenta as
  select tipo_cuenta_id, clave, descripcion, costo_mensual
  from tipo_cuenta_r1
;
prompt Probando la vista TIPO_CUENTA
select count(*) from tipo_cuenta;

prompt Creando la vista PAIS
-- PAIS
create or replace view pais as
  select pais_id, clave, nombre, continente
  from pais_r1
;
prompt Probando la vista PAIS
select count(*) from pais;

prompt Creando la vista TIPO_SERIE
-- TIPO_SERIE
create or replace view tipo_serie as
  select tipo_serie_id, clave, descripcion
  from tipo_serie_r1
;
prompt Probando la vista TIPO_SERIE
select count(*) from tipo_cuenta;


prompt creando la vista historico_status_programa
-- tipo_serie
create or replace view historico_status_programa as
  select historico_status_prog_id, fecha_status, 
  status_programa_id,programa_id
  from historico_status_programa_f1
;
prompt probando la vista historico_status_programa
select count(*) from historico_status_programa;

prompt listo!