--@Autores:         Jorge Cárdenas Cárdenas
--                  Samuel Arturo Garrido Sánchez
--@Fecha creación:  16/08/2021
--@Descripción:     Creación de ligas en los 4 nodos.

clear screen
whenever sqlerror exit rollback;

-- NETMAX_1
prompt Creando ligas en netmax_s1
connect admin/JorgeBDD12345@jccbdd_s1
@NETMAX_1\s-02-netmax-ligas-sys.sql
connect netmax_bdd/N3tm4x4dm1n123@jccbdd_s1
@NETMAX_1\s-02-netmax-ligas.sql

-- NETMAX_2
prompt Creando ligas en netmax_s2
connect admin/JorgeBDD12345@jccbdd_s2
@NETMAX_1\s-02-netmax-ligas-sys.sql
connect netmax_bdd/N3tm4x4dm1n123@jccbdd_s2
@NETMAX_1\s-02-netmax-ligas.sql

-- NETMAX_3
prompt Creando ligas en netmax_s3
connect admin/Minecraft+12345@sgsbdd_s1
@NETMAX_1\s-02-netmax-ligas-sys.sql
connect netmax_bdd/N3tm4x4dm1n123@sgsbdd_s1
@NETMAX_1\s-02-netmax-ligas.sql

-- NETMAX_4
prompt Creando ligas en netmax_s4
connect admin/Minecraft+12345@sgsbdd_s2
@NETMAX_1\s-02-netmax-ligas-sys.sql
connect netmax_bdd/N3tm4x4dm1n123@sgsbdd_s2
@NETMAX_1\s-02-netmax-ligas.sql

prompt Listo!
exit