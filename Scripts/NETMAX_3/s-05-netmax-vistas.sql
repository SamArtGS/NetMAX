--@Autores:         Jorge Cárdenas Cárdenas
--                  Samuel Arturo Garrido Sánchez
--@Fecha creación:  16/08/2021
--@Descripción:     Creación de vistas comunes a todos los nodos 
--                  Se excluyen las vistas que contienen columnas BLOB

-- USUARIO
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
select count(*) from usuario;

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
select count(*) from programa;

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
select count(*) from pelicula;

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
select count(*) from serie;

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
select count(*) from playlist;

-- STATUS_PROGRAMA
create or replace view status_programa as
  select status_programa_id, clave, descripcion
  from status_programa_r1
;
select count(*) from status_programa;

-- TIPO_CUENTA
create or replace view tipo_cuenta as
  select tipo_cuenta_id, clave, descripcion, costo_mensual
  from tipo_cuenta_r1
;

-- PAIS
create or replace view pais as
  select pais_id, clave, nombre, continente
  from pais_r1
;

-- TIPO_SERIE
create or replace view tipo_serie as
  select tipo_serie_id, clave, descripcion
  from tipo_serie_r1
;