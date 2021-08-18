--@Autores:         Jorge Cárdenas Cárdenas
--                  Samuel Arturo Garrido Sánchez
--@Fecha creación:  16/08/2021
--@Descripción:     Creación de sinónimos - main

clear screen 
whenever sqlerror exit rollback; 

prompt ===================================== 
prompt Creando sinonimos para netmax_1 
prompt ===================================== 
connect netmax_bdd/N3tm4x4dm1n123@jccbdd_s1
@Scripts\NETMAX_1\s-04-netmax-sinonimos.sql
@Scripts\NETMAX_1\s-04-netmax-valida-sinonimos.sql

prompt ===================================== 
prompt creando sinonimos para netmax_2 
prompt ===================================== 
connect netmax_bdd/N3tm4x4dm1n123@jccbdd_s2
@Scripts\NETMAX_2\s-04-netmax-sinonimos.sql
@Scripts\NETMAX_2\s-04-netmax-valida-sinonimos.sql

prompt ===================================== 
prompt creando sinonimos para netmax_3 
prompt ===================================== 
connect netmax_bdd/N3tm4x4dm1n123@sgsbdd_s1
@Scripts\NETMAX_3\s-04-netmax-sinonimos.sql
@Scripts\NETMAX_3\s-04-netmax-valida-sinonimos.sql

prompt ===================================== 
prompt creando sinonimos para netmax_4 
prompt ===================================== 
connect netmax_bdd/N3tm4x4dm1n123@sgsbdd_s2
@Scripts\NETMAX_4\s-04-netmax-sinonimos.sql
@Scripts\NETMAX_4\s-04-netmax-valida-sinonimos.sql

prompt Listo!