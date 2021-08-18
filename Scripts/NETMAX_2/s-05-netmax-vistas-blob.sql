--@Autores:         Jorge Cárdenas Cárdenas
--                  Samuel Arturo Garrido Sánchez
--@Fecha creación:  16/08/2021
--@Descripción:     Definición de vistas con columnas BLOB para netmax_s1

--DOCUMENTAL 
prompt creando vista DOCUMENTAL
create or replace view documental as
  select programa_id, tematica, duracion, 
    get_remote_trailer_f1_by_id(programa_id) as trailer, pais_id
  from documental_f1
  union all
  select programa_id, tematica, duracion, 
    get_remote_trailer_f2_by_id(programa_id) as trailer, pais_id
  from documental_f2
  union all
  select programa_id, tematica, duracion, 
    get_remote_trailer_f3_by_id(programa_id) as trailer, pais_id
  from documental_f3
;
select * from documental;

-- ARCHIVO_PROGRAMA
prompt creando vista ARCHIVO_PROGRAMA
create or replace view archivo_programa as
  select num_archivo, programa_id, archivo, tamanio
  from archivo_programa_f1;
  union all
  select num_archivo, programa_id, 
    get_remote_archivo_f2_by_id(num_archivo, programa_id) as archivo, tamanio
  from archivo_programa_f2
;
select * from archivo_programa;