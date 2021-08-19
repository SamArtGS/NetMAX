--@Autores:         Jorge Cárdenas Cárdenas
--                  Samuel Arturo Garrido Sánchez
--@Fecha creación:  16/08/2021
--@Descripción:     Script encargado de crear la BDD

clear screen
whenever sqlerror exit rollback;
set serveroutput on
set feedback off


prompt =========================================================================
prompt CREACION DE USUARIOS 
prompt =========================================================================
@s-01-netmax-main-usuario.sql

prompt =========================================================================
prompt CREACION DE LIGAS
prompt =========================================================================
@s-02-netmax-main-ligas.sql

prompt =========================================================================
prompt CREACION DE FRAGMENTOS
prompt =========================================================================
@s-03-netmax-main-ddl.sql

prompt =========================================================================
prompt CREACION DE SINONIMOS
prompt =========================================================================
@s-04-netmax-main-sinonimos.sql

prompt =========================================================================
prompt CREACION DE VISTAS
prompt =========================================================================
@s-05-netmax-main-vistas.sql

prompt =========================================================================
prompt CREACION DE TRIGGERS
prompt =========================================================================
@s-06-netmax-main-triggers.sql

prompt =========================================================================
prompt SOPORTE PARA BLOBS
prompt =========================================================================
@s-07-netmax-main-soporte-blobs.sql

prompt Listo!
exit