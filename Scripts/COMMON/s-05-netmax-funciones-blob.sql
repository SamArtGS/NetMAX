--@Autores:         Jorge Cárdenas Cárdenas
--                  Samuel Arturo Garrido Sánchez
--@Fecha creación:  16/08/2021
--@Descripción:     Definición de funciones para acceso a BLOBs

Prompt funciones para acceso de blobs - DOCUMENTAL
-- TRAILER_F1
create or replace function get_remote_trailer_f1_by_id(v_id in number) 
  return blob is
  v_temp_trailer blob;
begin
  select trailer into v_temp_trailer
  from documental_f1 where programa_id = v_id;
  
  return v_temp_trailer;
end;
/
show errors;

-- TRAILER_F2
create or replace function get_remote_trailer_f2_by_id(v_id in number) 
  return blob is
  v_temp_trailer blob;
begin
  select trailer into v_temp_trailer
  from documental_f2 where programa_id = v_id;
  
  return v_temp_trailer;
end;
/
show errors;

-- TRAILER_F3
create or replace function get_remote_trailer_f3_by_id(v_id in number) 
  return blob is
  v_temp_trailer blob;
begin
  select trailer into v_temp_trailer
  from documental_f3 where programa_id = v_id;
  
  return v_temp_trailer;
end;
/
show errors;

Prompt funciones para acceso de blobs - ARCHIVO_PROGRAMA
-- ARCHIVO_PROGRAMA_F1
create or replace function get_remote_archivo_f1_by_id(
  v_num_archivo in number, v_programa_id in number
) return blob is
  v_temp_archivo blob;
begin
  select archivo into v_temp_archivo
  from archivo_programa_f1
  where num_archivo = v_num_archivo and programa_id = v_programa_id;
  
  return v_temp_archivo;
end;
/
show errors;

-- ARCHIVO_PROGRAMA_2
create or replace function get_remote_archivo_f2_by_id(
  v_num_archivo in number, v_programa_id in number
) return blob is
  v_temp_archivo blob;
begin
  select archivo into v_temp_archivo
  from archivo_programa_f2
  where num_archivo = v_num_archivo and programa_id = v_programa_id;
  
  return v_temp_archivo;
end;
/
show errors;