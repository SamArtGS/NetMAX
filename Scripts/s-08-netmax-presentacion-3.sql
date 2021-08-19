--@Autores:         Jorge Cárdenas Cárdenas
--                  Samuel Arturo Garrido Sánchez
--@Fecha creación:  16/08/2021
--@Descripción:     Archivo de carga inicial - fragmentos

clear screen
sqlerror exit rollback

Prompt ====================================== 
Prompt Preparando carga de Datos 
Prompt ======================================

connect netmax_bdd/N3tm4x4dm1n123@jccbdd_s1

Prompt Personalizando el formato de fechas 
alter session set nls_date_format='yyyy-mm-dd hh24:mi:ss';

Prompt ================================================== 
Prompt ¿ Listo para Iniciar con la carga ? 
Prompt ================================================== 
Pause => Presionar Enter para Iniciar, Ctrl-C para cancelar

--------------------------------------------------------------------------------
Prompt => Realizando limpieza inicial .... 
set feedback off 

Prompt Eliminando datos de PLAYLIST 
delete from playlist;

Prompt Eliminando datos de USUARIO 
delete from usuario; 

Prompt Eliminando datos de SERIE 
delete from serie; 

Prompt Eliminando datos de PELICULA 
delete from pelicula; 

Prompt Eliminando datos de DOCUMENTAL 
delete from documental; 

Prompt Eliminando datos de HISTORICO 
delete from historico_status_programa; 

Prompt Eliminando datos de ARCHIVO_PROGRAMA 
delete from archivo_programa; 

Prompt Eliminando datos de PROGRAMA 
delete from programa; 

Prompt Eliminando datos de PAIS 
delete from pais; 

Prompt Eliminando datos de TIPO_CUENTA 
delete from tipo_cuenta; 

Prompt Eliminando datos de TIPO_SERIE 
delete from tipo_serie;

--------------------------------------------------------------------------------
Prompt => Realizando Carga de datos .... 

Prompt Cargando PAIS 
@carga-inicial/netmax-carga-inicial-pais.sql

Prompt Cargando TIPO_SERIE 
@carga-inicial/netmax-carga-inicial-tipo-serie.sql 

Prompt Cargando TIPO_CUENTA 
@carga-inicial/netmax-carga-inicial-tipo-cuenta.sql 

Prompt Cargando USUARIO 
@carga-inicial/netmax-carga-inicial-usuario.sql 

Prompt Cargando PROGRAMA (DOCUMENTAL) 
@carga-inicial/netmax-carga-inicial-programa-documental.sql 

Prompt Cargando PROGRAMA (PELICULA) 
@carga-inicial/netmax-carga-inicial-programa-pelicula.sql 

Prompt Cargando PROGRAMA (SERIE) 
@carga-inicial/netmax-carga-inicial-programa-serie.sql 

Prompt Cargando HISTORICO_STATUS_PROGRAMA
@carga-inicial/netmax-carga-inicial-historico-status-prog.sql

Prompt Cargando DOCUMENTAL (con datos BLOB) 
@carga-inicial/netmax-carga-inicial-documental-empty-blob.sql 
--@carga-inicial/netmax-carga-inicial-documental.sql

Prompt Cargando SERIE 
@carga-inicial/netmax-carga-inicial-serie.sql 

Prompt Cargando PELICULA 
@carga-inicial/netmax-carga-inicial-pelicula.sql 

Prompt Cargando PLAYLIST 
@carga-inicial/netmax-carga-inicial-playlist.sql

Prompt cargando ARCHIVO_PROGRAMA (con datos BLOB) 
--@carga-inicial/netmax-carga-inicial-archivo-programa.sql 
@carga-inicial/netmax-carga-inicial-archivo-programa-empty-blob.sql

Prompt Carga de datos replicados exitosa, haciendo commit!.
commit;
exit