--@Autores:         Jorge Cárdenas Cárdenas
--                  Samuel Arturo Garrido Sánchez
--@Fecha creación:  16/08/2021
--@Descripción:     Script empleado para configurar el Soporte de datos BLOB.

declare
  v_count number(1,0);
begin
  select count(*) into v_count
  from user_credentials where credential_name = 'OBJ_STORE_CRED';
  -- Elimina la credencial si es que existe
  if v_count > 0 then
    dbms_cloud.drop_credential(credential_name => 'OBJ_STORE_CRED');
  end if;
  -- Creación de credenciales
  dbms_cloud.create_credential(
    credential_name => 'OBJ_STORE_CRED',
    username => 'jorgecrdenas@comunidad.unam.mx',
    password => 'aSu+8sACvlt{_BGSeUj+'
  );
end;
/

-- Creación de directorios
create or replace directory PROY_FINAL_PDFS_DIR as 'NETMAX_OBJ/pdfs';
create or replace directory PROY_FINAL_TRAILERS_DIR as 'NETMAX_OBJ/trailers';

create or replace function fx_carga_blob( 
  p_directory_name in varchar2, 
  p_src_file_name in varchar2 
) return blob is
-- variables
v_src_blob bfile;
v_dest_blob blob := empty_blob(); 
v_src_offset number := 1; 
v_dest_offset number :=1; 
v_src_blob_size number;

begin
  -- Obtiene el archivo del bucket
  begin
    dbms_cloud.get_object(
      credential_name => 'OBJ_STORE_CRED',
      object_uri => 'https://objectstorage.us-sanjose-1.oraclecloud.com/n/axcovwgbfgjn/b/bucket-objects/o/' 
        || p_src_file_name,
      directory_name => upper(p_directory_name)
    );
  exception
    when others then
      raise_application_error(-20001, 
        p_src_file_name 
        ||' El archivo ' 
        ||p_src_file_name 
        ||' no existe en ' 
        ||p_directory_name 
      );
  end;

   -- Validación de que el archivo exista
  v_src_blob := bfilename(upper(p_directory_name), p_src_file_name);

  if dbms_lob.isopen(v_src_blob) = 0 then 
    dbms_lob.open(v_src_blob,dbms_lob.LOB_READONLY); 
  end if;

  v_src_blob_size := dbms_lob.getlength(v_src_blob);

  --crea un objeto lob temporal 
  dbms_lob.createtemporary(
    lob_loc => v_dest_blob , 
    cache => true , 
    dur => dbms_lob.call 
  );

  --lee el archivo y escribe en el 
  dbms_lob.loadblobfromfile( 
    dest_lob => v_dest_blob, 
    src_bfile => v_src_blob, 
    amount => dbms_lob.getlength(v_src_blob), 
    dest_offset => v_dest_offset, 
    src_offset => v_src_offset 
  );

  dbms_lob.close(v_src_blob);

  if v_src_blob_size<> dbms_lob.getlength(v_dest_blob) then 
    raise_application_error(-20104, 
      'Numero de byes leidos VS escritos no coinciden: ' 
      || v_src_blob_size
      || ', actual: '
      || dbms_lob.getlength(v_dest_blob)
    ); 
  end if; 
  return v_dest_blob;
end;
/
show errors;

-- Comprobación de funcionamiento
prompt Comprobacion de funcionamiento
select dbms_lob.getlength(fx_carga_blob(
  p_directory_name =>'PROY_FINAL_PDFS_DIR', 
  p_src_file_name => 'prueba.jpg')
) len_blob from dual;


-- select * from table(dbms_cloud.list_files('PROY_FINAL_PDFS_DIR'));