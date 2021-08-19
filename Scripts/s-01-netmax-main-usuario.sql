--@Autores:         Jorge Cárdenas Cárdenas
--                  Samuel Arturo Garrido Sánchez
--@Fecha creación:  16/08/2021
--@Descripción:     Creación de usuarios en cada sitio.

prompt Inciando creacion/eliminacion de usuarios.
-- NETMAX_1
prompt =====================================
prompt Creando usuario en netmax_s1
connect admin/JorgeBDD12345@jccbdd_s1
@COMMON\s-01-netmax-usuario.sql

-- NETMAX_2
prompt =====================================
prompt Creando usuario en netmax_s2
connect admin/JorgeBDD12345@jccbdd_s2
@COMMON\s-01-netmax-usuario.sql

-- NETMAX_3
prompt =====================================
prompt Creando usuario en netmax_s3
connect admin/Minecraft+12345@sgsbdd_s1
@COMMON\s-01-netmax-usuario.sql

-- NETMAX_4
prompt =====================================
prompt Creando usuario en netmax_s4
connect admin/Minecraft+12345@sgsbdd_s2
@COMMON\s-01-netmax-usuario.sql