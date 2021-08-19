--@Autores:         Jorge Cárdenas Cárdenas
--                  Samuel Arturo Garrido Sánchez
--@Fecha creación:  16/08/2021
--@Descripción:     Archivo de carga inicial

connect netmax_bdd/N3tm4x4dm1n123@jccbdd_s1
set serveroutput on 
Prompt Eliminando datos ...

declare 
  v_formato varchar2(50) := 'yyy-mm-dd hh24:mi:ss';
begin
  -- ARCHIVO_PROGRAMA
  dbms_output.put_line(to_char(sysdate, v_formato) 
    || ' Eliminando datos de archivo_programa'
  ); 
  delete from archivo_programa;

  -- DOCUMENTAL
  dbms_output.put_line(to_char(sysdate, v_formato) 
    || ' Eliminando datos de documental'
  ); 
  delete from documental;

  -- PAIS
  dbms_output.put_line(to_char(sysdate, v_formato) 
    || ' Eliminando datos de pais'
  ); 
  delete from pais;

    -- PELICULA
  dbms_output.put_line(to_char(sysdate, v_formato) 
    || ' Eliminando datos de pelicula'
  ); 
  delete from pelicula;

    -- SERIE
  dbms_output.put_line(to_char(sysdate, v_formato) 
    || ' Eliminando datos de serie'
  ); 
  delete from serie;

  -- TIPO_SERIE
  dbms_output.put_line(to_char(sysdate, v_formato) 
    || ' Eliminando datos de tipo_serie'
  ); 
  delete from tipo_serie;

  -- PLAYLIST
  dbms_output.put_line(to_char(sysdate, v_formato) 
    || ' Eliminando datos de playlist'
  ); 
  delete from playlist;
  
  -- USUARIO
  dbms_output.put_line(to_char(sysdate, v_formato) 
    || ' Eliminando datos de documental'
  ); 
  delete from documental;

  -- TIPO_CUENTA
  dbms_output.put_line(to_char(sysdate, v_formato) 
    || ' Eliminando datos de tipo_cuenta'
  ); 
  delete from tipo_cuenta;

  -- HISTORICO_STATUS_PROGRAMA
  dbms_output.put_line(to_char(sysdate, v_formato) 
    || ' Eliminando datos de historico_status_programa'
  ); 
  delete from historico_status_programa;

  -- PROGRAMA
  dbms_output.put_line(to_char(sysdate, v_formato) 
    || ' Eliminando datos de programa'
  ); 
  delete from programa;
  
  -- STATUS_PROGRAMA
  dbms_output.put_line(to_char(sysdate, v_formato) 
    || ' Eliminando datos de status_programa'
  ); 
  delete from status_programa;

  exception 
    when others then 
      dbms_output.put_line('Errores detectados al realizar la eliminacion'); 
      dbms_output.put_line('Se hara rollback'); 
      rollback; 
      raise;
end;
/