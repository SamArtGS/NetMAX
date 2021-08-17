--@Autores:         Jorge Cárdenas Cárdenas
--                  Samuel Arturo Garrido Sánchez
--@Fecha creación:  16/08/2021
--@Descripción:     Creación de usuarios en cada sitio.

clear screen
whenever sqlerror exit rollback;
set serveroutput on

prompt Inciando creacion/eliminacion de usuarios.
prompt =====================================
prompt Creando usuario en netmax_s1
prompt =====================================
connect admin/JorgeBDD12345@jccbdd_s1
@NETMAX_1/s-01-netmax-usuario.sql
prompt =====================================
prompt Creando usuario en netmax_s2
prompt =====================================
connect admin/JorgeBDD12345@jccbdd_s2
@s-01-netmax-usuario.sql
prompt =====================================
prompt Creando usuario en netmax_s3
prompt =====================================
connect admin/Minecraft+12345@sgsbdd_s1
@s-01-netmax-usuario.sql
prompt =====================================
prompt Creando usuario en netmax_s4
prompt =====================================
connect admin/Minecraft+12345@sgsbdd_s2
@s-01-netmax-usuario.sql

Prompt Listo!
exit