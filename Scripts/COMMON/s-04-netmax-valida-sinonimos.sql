--@Autores:         Jorge Cárdenas Cárdenas
--                  Samuel Arturo Garrido Sánchez
--@Fecha creación:  16/08/2021
--@Descripción:     Script de validacion de sinonimos

-- USUARIO
Prompt validando sinonimos para USUARIO 
select 
  (select count(*) from usuario_f1) as usuario_f1, 
  (select count(*) from usuario_f2) as usuario_f2, 
  (select count(*) from usuario_f3) as usuario_f3, 
  (select count(*) from usuario_f4) as usuario_f4, 
  (select count(*) from usuario_f5) as usuario_f5 
from dual; 

-- PROGRAMA
Prompt validando sinonimos para PROGRAMA
select
  (select count(*) from programa_f1) as programa_f1,
  (select count(*) from programa_f2) as programa_f2,
  (select count(*) from programa_f3) as programa_f3
from dual;

-- DOCUMENTAL
Prompt validando sinonimos para DOCUMENTAL
select
  (select count(*) from documental_f1) as documental_f1,
  (select count(*) from documental_f2) as documental_f2,
  (select count(*) from documental_f3) as documental_f3
from dual;

-- PELICULA
Prompt validando sinonimos para PELICULA
select
  (select count(*) from pelicula_f1) as pelicula_f1,
  (select count(*) from pelicula_f2) as pelicula_f2,
  (select count(*) from pelicula_f3) as pelicula_f3
from dual;

-- SERIE
Prompt validando sinonimos para SERIE
select
  (select count(*) from serie_f1) as serie_f1,
  (select count(*) from serie_f2) as serie_f2,
  (select count(*) from serie_f3) as serie_f3
from dual;

-- HISTORICO_STATUS_PROGRAMA
Prompt validando sinonimos para HISTORICO_STATUS_PROGRAMA
select count(*) from historico_status_programa_f1;

-- ARCHIVO_PROGRAMA
Prompt validando sinonimos para ARCHIVO_PROGRAMA
select
  (select count(*) from archivo_programa_f1) as archivo_programa_f1,
  (select count(*) from archivo_programa_f2) as archivo_programa_f2
from dual;

-- PLAY_LIST
Prompt validando sinonimos para PLAY_LIST
select
  (select count(*) from playlist_f1) as playlist_f1,
  (select count(*) from playlist_f2) as playlist_f2,
  (select count(*) from playlist_f3) as playlist_f3,
  (select count(*) from playlist_f4) as playlist_f4
from dual;

-- STATUS_PROGRAMA
Prompt validando sinonimos para STATUS_PROGRAMA
select
  (select count(*) from status_programa_r1) as status_programa_r1,
  (select count(*) from status_programa_r2) as status_programa_r2,
  (select count(*) from status_programa_r3) as status_programa_r3,
  (select count(*) from status_programa_r4) as status_programa_r4
from dual;

-- TIPO_CUENTA
Prompt validando sinonimos para TIPO_CUENTA
select
  (select count(*) from tipo_cuenta_r1) as tipo_cuenta_r1,
  (select count(*) from tipo_cuenta_r2) as tipo_cuenta_r2,
  (select count(*) from tipo_cuenta_r3) as tipo_cuenta_r3,
  (select count(*) from tipo_cuenta_r4) as tipo_cuenta_r4
from dual;

-- PAIS
Prompt validando sinonimos para PAIS
select
  (select count(*) from pais_r1) as pais_r1,
  (select count(*) from pais_r2) as pais_r2,
  (select count(*) from pais_r3) as pais_r3,
  (select count(*) from pais_r4) as pais_r4
from dual;

-- TIPO_SERIE
Prompt validando sinonimos para TIPO_SERIE
select
  (select count(*) from tipo_serie_r1) as tipo_serie_r1,
  (select count(*) from tipo_serie_r2) as tipo_serie_r2,
  (select count(*) from tipo_serie_r3) as tipo_serie_r3,
  (select count(*) from tipo_serie_r4) as tipo_serie_r4
from dual;

prompt listo!