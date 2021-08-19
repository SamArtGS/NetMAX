--@Autores:         Jorge Cárdenas Cárdenas
--                  Samuel Arturo Garrido Sánchez
--@Fecha creación:  16/08/2021
--@Descripción:     Creación de ligas en los 4 nodos.

-- NETMAX_1
prompt ===================================== 
prompt Creando fragmentos para NETMAX_1
prompt =====================================
connect netmax_bdd/N3tm4x4dm1n123@jccbdd_s1
@NETMAX_1/s-03-netmax-1-ddl.sql

-- NETMAX_2
prompt ===================================== 
prompt Creando fragmentos para NETMAX_2
prompt =====================================
connect netmax_bdd/N3tm4x4dm1n123@jccbdd_s2
@NETMAX_2/s-03-netmax-2-ddl.sql


-- NETMAX_3
prompt ===================================== 
prompt Creando fragmentos para NETMAX_3
prompt =====================================
connect netmax_bdd/N3tm4x4dm1n123@sgsbdd_s1
@NETMAX_3/s-03-netmax-3-ddl.sql


-- NETMAX_4
prompt ===================================== 
prompt Creando fragmentos para NETMAX_4
prompt =====================================
connect netmax_bdd/N3tm4x4dm1n123@sgsbdd_s2
@NETMAX_4/s-03-netmax-4-ddl.sql