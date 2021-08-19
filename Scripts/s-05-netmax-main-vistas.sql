--@Autores:         Jorge Cárdenas Cárdenas
--                  Samuel Arturo Garrido Sánchez
--@Fecha creación:  16/08/2021
--@Descripción:     Creación de sinónimos - main


prompt ===================================== 
prompt Creando vistas para netmax_1 
prompt ===================================== 
connect netmax_bdd/N3tm4x4dm1n123@jccbdd_s1
@COMMON/s-05-netmax-vistas.sql
@COMMON/s-05-netmax-tablas-temporales.sql
@COMMON/s-05-netmax-funciones-blob.sql
@NETMAX_1/s-05-netmax-vistas-blob.sql

prompt ===================================== 
prompt Creando vistas para netmax_2 
prompt ===================================== 
connect netmax_bdd/N3tm4x4dm1n123@jccbdd_s2
@COMMON/s-05-netmax-vistas.sql
@COMMON/s-05-netmax-tablas-temporales.sql
@COMMON/s-05-netmax-funciones-blob.sql
@NETMAX_2/s-05-netmax-vistas-blob.sql

prompt ===================================== 
prompt Creando vistas para netmax_3 
prompt ===================================== 
connect netmax_bdd/N3tm4x4dm1n123@sgsbdd_s1
@COMMON/s-05-netmax-vistas.sql
@COMMON/s-05-netmax-tablas-temporales.sql
@COMMON/s-05-netmax-funciones-blob.sql
@NETMAX_3/s-05-netmax-vistas-blob.sql

prompt ===================================== 
prompt Creando vistas para netmax_4 
prompt ===================================== 
connect netmax_bdd/N3tm4x4dm1n123@sgsbdd_s2 
@COMMON/s-05-netmax-vistas.sql
@COMMON/s-05-netmax-tablas-temporales.sql
@COMMON/s-05-netmax-funciones-blob.sql
@NETMAX_4/s-05-netmax-vistas-blob.sql