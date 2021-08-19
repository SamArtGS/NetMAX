--@Autores:         Jorge Cárdenas Cárdenas
--                  Samuel Arturo Garrido Sánchez
--@Fecha creación:  16/08/2021
--@Descripción:     Script principal empleado para configurar el soporte 
--                  de datos BLOB en los 4 nodos.


prompt ===================================== 
prompt Configurando soporte BLOB para netmax_1 
prompt ===================================== 
connect netmax_bdd/N3tm4x4dm1n123@jccbdd_s1
@COMMON\s-07-netmax-configuracion-soporte-blobs.sql

prompt ===================================== 
prompt Configurando soporte BLOB para netmax_2 
prompt ===================================== 
connect netmax_bdd/N3tm4x4dm1n123@jccbdd_s2
@COMMON\s-07-netmax-configuracion-soporte-blobs.sql

prompt ===================================== 
prompt Configurando soporte BLOB para netmax_3 
prompt ===================================== 
connect netmax_bdd/N3tm4x4dm1n123@sgsbdd_s1
@COMMON\s-07-netmax-configuracion-soporte-blobs.sql

prompt ===================================== 
prompt Configurando soporte BLOB para netmax_4 
prompt ===================================== 
connect netmax_bdd/N3tm4x4dm1n123@sgsbdd_s2 
@COMMON\s-07-netmax-configuracion-soporte-blobs.sql