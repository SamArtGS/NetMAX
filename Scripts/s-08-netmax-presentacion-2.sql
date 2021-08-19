--@Autores:         Jorge Cárdenas Cárdenas
--                  Samuel Arturo Garrido Sánchez
--@Fecha creación:  16/08/2021
--@Descripción:     Archivo de carga inicial

clear screen 
whenever sqlerror exit rollback;

Prompt ====================================== 
Prompt Cargando catalogos replicados en NETMAX_1 
Prompt ====================================== 
connect netmax_bdd/N3tm4x4dm1n123@jccbdd_s1
delete from status_programa; 
@carga-inicial/netmax-carga-inicial-status-programa.sql 
commit;

Prompt ====================================== 
Prompt Cargando catalogos replicados en NETMAX_2 
Prompt ====================================== 
connect netmax_bdd/N3tm4x4dm1n123@jccbdd_s2
delete from status_programa; 
@carga-inicial/netmax-carga-inicial-status-programa.sql 
commit;

Prompt ====================================== 
Prompt Cargando catalogos replicados en NETMAX_3 
Prompt ====================================== 
connect netmax_bdd/N3tm4x4dm1n123@sgsbdd_s1
delete from status_programa; 
@carga-inicial/netmax-carga-inicial-status-programa.sql 
commit;

Prompt ====================================== 
Prompt Cargando catalogos replicados en NETMAX_4
Prompt ====================================== 
connect netmax_bdd/N3tm4x4dm1n123@sgsbdd_s2
delete from status_programa; 
@carga-inicial/netmax-carga-inicial-status-programa.sql 
commit;

Prompt Carga de datos replicados exitosa!. 
exit