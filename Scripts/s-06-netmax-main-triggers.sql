--@Autores:         Jorge Cárdenas Cárdenas
--                  Samuel Arturo Garrido Sánchez
--@Fecha creación:  16/08/2021
--@Descripción:     Main Triggers

prompt ===================================== 
prompt Creando triggers para netmax_1
prompt ===================================== 
connect netmax_bdd/N3tm4x4dm1n123@netmax_1

@NETMAX_1/s-06-netmax-trigger-usuario.sql
@NETMAX_1/s-06-netmax-trigger-programa.sql 
@NETMAX_1/s-06-netmax-trigger-jcc-s1-serie.sql 
@NETMAX_1/s-06-netmax-trigger-jcc-s1-pelicula.sql 
@NETMAX_1/s-06-netmax-trigger-jcc-s1-documental.sql 
@NETMAX_1/s-06-netmax-trigger-jcc-s1-archivo-programa.sql 
@NETMAX_1/s-06-netmax-trigger-jcc-s1-playlist.sql 
@NETMAX_1/s-06-netmax-trigger-tipo-cuenta.sql 
@NETMAX_1/s-06-netmax-trigger-tipo-serie.sql 
@NETMAX_1/s-06-netmax-trigger-pais.sql

prompt ===================================== 
prompt Creando triggers para netmax_2
prompt ===================================== 
connect netmax_bdd/N3tm4x4dm1n123@netmax_2

@NETMAX_2/s-06-netmax-trigger-usuario.sql 
@NETMAX_2/s-06-netmax-trigger-programa.sql 
@NETMAX_2/s-06-netmax-trigger-jcc-s2-serie.sql 
@NETMAX_2/s-06-netmax-trigger-jcc-s2-pelicula.sql
@NETMAX_2/s-06-netmax-trigger-jcc-s2-documental.sql 
@NETMAX_2/s-06-netmax-trigger-jcc-s2-archivo-programa.sql 
@NETMAX_2/s-06-netmax-trigger-jcc-s2-playlist.sql 
@NETMAX_2/s-06-netmax-trigger-tipo-cuenta.sql 
@NETMAX_2/s-06-netmax-trigger-tipo-serie.sql 
@NETMAX_2/s-06-netmax-trigger-pais.sql


prompt ===================================== 
prompt Creando triggers para netmax_3
prompt ===================================== 
connect netmax_bdd/N3tm4x4dm1n123@netmax_3

@NETMAX_3/s-06-netmax-trigger-usuario.sql 
@NETMAX_3/s-06-netmax-trigger-programa.sql 
@NETMAX_3/s-06-netmax-trigger-sgs-s1-serie.sql 
@NETMAX_3/s-06-netmax-trigger-sgs-s1-pelicula.sql 
@NETMAX_3/s-06-netmax-trigger-sgs-s1-documental.sql 
@NETMAX_3/s-06-netmax-trigger-sgs-s1-archivo-programa.sql 
@NETMAX_3/s-06-netmax-trigger-sgs-s1-playlist.sql 
@NETMAX_3/s-06-netmax-trigger-tipo-cuenta.sql 
@NETMAX_3/s-06-netmax-trigger-tipo-serie.sql 
@NETMAX_3/s-06-netmax-trigger-pais.sql

prompt ===================================== 
prompt Creando triggers para netmax_4
prompt ===================================== 
connect netmax_bdd/N3tm4x4dm1n123@netmax_4

@NETMAX_4/s-06-netmax-trigger-usuario.sql 
@NETMAX_4/s-06-netmax-trigger-programa.sql 
@NETMAX_4/s-06-netmax-trigger-sgs-s2-serie.sql 
@NETMAX_4/s-06-netmax-trigger-sgs-s2-pelicula.sql 
@NETMAX_4/s-06-netmax-trigger-sgs-s2-documental.sql 
@NETMAX_4/s-06-netmax-trigger-sgs-s2-archivo-programa.sql 
@NETMAX_4/s-06-netmax-trigger-sgs-s2-playlist.sql 
@NETMAX_4/s-06-netmax-trigger-tipo-cuenta.sql 
@NETMAX_4/s-06-netmax-trigger-tipo-serie.sql
@NETMAX_4/s-06-netmax-trigger-pais.sql