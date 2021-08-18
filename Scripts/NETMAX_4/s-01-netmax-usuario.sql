--@Autores:         Jorge Cárdenas Cárdenas
--                  Samuel Arturo Garrido Sánchez
--@Fecha creación:  16/08/2021
--@Descripción:     Creación y eliminación del usuario

-- Elimina el usuario si es que existe
declare
  v_count number(1,0);
begin
  select count(*) into v_count
  from dba_users where username = 'NETMAX_BDD';
  if v_count > 0 then
    execute immediate 'drop user netmax_bdd cascade';
  end if;
end;
/

-- Creación del usuario
create user netmax_bdd identified by N3tm4x4dm1n123 quota unlimited on data;
-- Asignación de privilegios
grant create session, 
  create table, 
  create procedure, 
  create sequence,
  create trigger, 
  create view, 
  create materialized view,
  create database link
to netmax_bdd; 
-- Privilegios particulares de ORACLE CLOUD
grant execute on dbms_cloud_admin to netmax_bdd;
grant execute on dbms_cloud to netmax_bdd;