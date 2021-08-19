--@Autores:         Jorge Cárdenas Cárdenas
--                  Samuel Arturo Garrido Sánchez
--@Fecha creación:  16/08/2021
--@Descripción:     Creación de ligas en los 4 nodos.

-- NETMAX_1
prompt =====================================
prompt Creando ligas en netmax_s1
prompt =====================================
connect admin/JorgeBDD12345@jccbdd_s1
@COMMON\s-02-netmax-ligas-sys.sql
connect netmax_bdd/N3tm4x4dm1n123@jccbdd_s1
@NETMAX_1\s-02-netmax-ligas.sql

-- NETMAX_2
prompt =====================================
prompt Creando ligas en netmax_s2
prompt =====================================
connect admin/JorgeBDD12345@jccbdd_s2
@COMMON\s-02-netmax-ligas-sys.sql
connect netmax_bdd/N3tm4x4dm1n123@jccbdd_s2
@NETMAX_2\s-02-netmax-ligas.sql

-- NETMAX_3
prompt =====================================
prompt Creando ligas en netmax_s3
prompt =====================================
connect admin/Minecraft+12345@sgsbdd_s1
@COMMON\s-02-netmax-ligas-sys.sql
connect netmax_bdd/N3tm4x4dm1n123@sgsbdd_s1
@NETMAX_3\s-02-netmax-ligas.sql

-- NETMAX_4
prompt =====================================
prompt Creando ligas en netmax_s4
prompt =====================================
connect admin/Minecraft+12345@sgsbdd_s2
@COMMON\s-02-netmax-ligas-sys.sql
connect netmax_bdd/N3tm4x4dm1n123@sgsbdd_s2
@NETMAX_4\s-02-netmax-ligas.sql