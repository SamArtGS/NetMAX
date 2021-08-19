--@Autores:         Jorge Cárdenas Cárdenas
--                  Samuel Arturo Garrido Sánchez
--@Fecha creación:  16/08/2021
--@Descripción:     Creación de credenciales y directorios previo a la creación
--                  de ligas.

declare
  v_count number(1,0);
begin
  select count(*) into v_count
  from user_credentials where credential_name = 'CRED_NETMAX';
  -- Elimina la credencial si es que existe
  if v_count > 0 then
    dbms_cloud.drop_credential(credential_name => 'CRED_NETMAX');
  end if;
  -- Creación de credenciales
  dbms_cloud.create_credential(
    credential_name => 'CRED_NETMAX',
    username => 'jorgecrdenas@comunidad.unam.mx',
    password => 'aSu+8sACvlt{_BGSeUj+'
  );

end;
/

declare
  v_count number(1,0);
begin
  -- JCC_WALLET
  select count(*) into v_count
  from all_directories where directory_name = 'NETMAX_JCC_WALLET_DIR';
  if v_count > 0 then
    execute immediate 'drop directory NETMAX_JCC_WALLET_DIR';
  end if;
  -- SGS_WALLET
  select count(*) into v_count
  from all_directories where directory_name = 'NETMAX_SGS_WALLET_DIR';
  if v_count > 0 then
    execute immediate 'drop directory NETMAX_SGS_WALLET_DIR';
  end if;
end;
/
-- Creación de directorios
create directory NETMAX_JCC_WALLET_DIR as 'NETMAX_JCC/wallet';
create directory NETMAX_SGS_WALLET_DIR as 'NETMAX_SGS/wallet';
  
-- Descarga de los archivos wallet.sso
begin
  -- JCC_WALLET
  dbms_cloud.get_object(
    credential_name => 'CRED_NETMAX',
    object_uri => 'https://objectstorage.us-sanjose-1.oraclecloud.com/n/axcovwgbfgjn/b/bucket-jcc/o/cwallet.sso',
    directory_name => 'NETMAX_JCC_WALLET_DIR'
  );
  -- SGS_WALLET
  dbms_cloud.get_object(
    credential_name => 'CRED_NETMAX',
    object_uri => 'https://objectstorage.us-sanjose-1.oraclecloud.com/n/axcovwgbfgjn/b/bucket-sgs/o/cwallet.sso',
    directory_name => 'NETMAX_SGS_WALLET_DIR'
  );
end;
/

-- Privilegios particulares de ORACLE CLOUD
grant read, write on directory netmax_jcc_wallet_dir to netmax_bdd;
grant read, write on directory netmax_sgs_wallet_dir to netmax_bdd;