--@Autores:         Jorge Cárdenas Cárdenas
--                  Samuel Arturo Garrido Sánchez
--@Fecha creación:  16/08/2021
--@Descripción:     Creación de ligas

-- Creación de las credenciales del usuario al que se va a conectar, igual para 
-- todos los sitios. 
declare
  v_count number(1,0);
begin
  select count(*) into v_count
  from user_credentials where credential_name = 'NETMAX';
  -- Elimina la credencial si es que existe
  if v_count > 0 then
    dbms_cloud.drop_credential(credential_name => 'NETMAX');
  end if;
  dbms_cloud.create_credential(
    credential_name => 'NETMAX',
    username => 'NETMAX_BDD',
    password => 'N3tm4x4dm1n123'
  );
end;
/

-- Creación de database links --------------------------------------------------

-- NETMAX_2 (JCCBDD_S2)
begin
  dbms_cloud_admin.create_database_link(
    db_link_name => 'NETMAX_S2',
    hostname => 'adb.us-sanjose-1.oraclecloud.com',
    port => '1522',
    service_name => 'g3afff37ee06990_jccbdds2_high.adb.oraclecloud.com',
    ssl_server_cert_dn => 'CN=adb.us-sanjose-1.oraclecloud.com,OU=Oracle ADB SANJOSE,O=Oracle Corporation,L=Redwood City,ST=California,C=US',
    credential_name => 'NETMAX',
    directory_name => 'NETMAX_JCC_WALLET_DIR'
  );
end;
/
-- Comprobación del funcionamiento de la liga
select sysdate from dual@NETMAX_S2;

-- NETMAX_3 (SGSBDD_S1)
begin
  dbms_cloud_admin.create_database_link(
    db_link_name => 'NETMAX_S3',
    hostname => 'adb.us-sanjose-1.oraclecloud.com',
    port => '1522',
    service_name => 'gccc793cac8fd59_sgsbdds1_high.adb.oraclecloud.com',
    ssl_server_cert_dn => 'CN=adb.us-sanjose-1.oraclecloud.com,OU=Oracle ADB SANJOSE,O=Oracle Corporation,L=Redwood City,ST=California,C=US',
    credential_name => 'NETMAX',
    directory_name => 'NETMAX_SGS_WALLET_DIR'
  );
end;
/
-- Comprobación del funcionamiento de la liga
select sysdate from dual@NETMAX_S3;

-- NETMAX_4 (SGSBDD_S2)
begin
  dbms_cloud_admin.create_database_link(
    db_link_name => 'NETMAX_S4',
    hostname => 'adb.us-sanjose-1.oraclecloud.com',
    port => '1522',
    service_name => 'gccc793cac8fd59_sgsbdds2_high.adb.oraclecloud.com',
    ssl_server_cert_dn => 'CN=adb.us-sanjose-1.oraclecloud.com,OU=Oracle ADB SANJOSE,O=Oracle Corporation,L=Redwood City,ST=California,C=US',
    credential_name => 'NETMAX',
    directory_name => 'NETMAX_SGS_WALLET_DIR'
  );
end;
/
-- Comprobación del funcionamiento de la liga
select sysdate from dual@NETMAX_S4;