--@Autores:         Jorge Cárdenas Cárdenas
--                  Samuel Arturo Garrido Sánchez
--@Fecha creación:  16/08/2021
--@Descripción:     Creación de sinónimos - main

prompt ===================================== 
prompt Creando sinonimos para netmax_1 
prompt ===================================== 
connect netmax_bdd/N3tm4x4dm1n123@jccbdd_s1
@NETMAX_1/s-04-netmax-sinonimos.sql
@COMMON/s-04-netmax-valida-sinonimos.sql

prompt ===================================== 
prompt creando sinonimos para netmax_2 
prompt ===================================== 
connect netmax_bdd/N3tm4x4dm1n123@jccbdd_s2
@NETMAX_2/s-04-netmax-sinonimos.sql
@COMMON/s-04-netmax-valida-sinonimos.sql

prompt ===================================== 
prompt creando sinonimos para netmax_3 
prompt ===================================== 
connect netmax_bdd/N3tm4x4dm1n123@sgsbdd_s1
@NETMAX_3/s-04-netmax-sinonimos.sql
@COMMON/s-04-netmax-valida-sinonimos.sql

prompt ===================================== 
prompt creando sinonimos para netmax_4 
prompt ===================================== 
connect netmax_bdd/N3tm4x4dm1n123@sgsbdd_s2
@NETMAX_4/s-04-netmax-sinonimos.sql
@COMMON/s-04-netmax-valida-sinonimos.sql