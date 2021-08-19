--@Autores:         Jorge Cárdenas Cárdenas
--                  Samuel Arturo Garrido Sánchez
--@Fecha creación:  16/08/2021
--@Descripción:     Creación de sinonimos

-- USUARIO
create or replace synonym usuario_f1 for usuario_f1_sgs_s1@netmax_s3;
create or replace synonym usuario_f2 for usuario_f2_sgs_s2@netmax_s4;
create or replace synonym usuario_f3 for usuario_f3_jcc_s1@netmax_s1;
create or replace synonym usuario_f4 for usuario_f4_sgs_s1@netmax_s3;
create or replace synonym usuario_f5 for usuario_f5_jcc_s2;

-- PROGRAMA
create or replace synonym programa_f1 for programa_f1_jcc_s1@netmax_s1;
create or replace synonym programa_f2 for programa_f2_sgs_s1@netmax_s3;
create or replace synonym programa_f3 for programa_f3_sgs_s2@netmax_s4;

-- DOCUMENTAL
create or replace synonym documental_f1 for documental_f1_jcc_s1@netmax_s1;
create or replace synonym documental_f2 for documental_f2_sgs_s1@netmax_s3;
create or replace synonym documental_f3 for documental_f3_sgs_s2@netmax_s4;

-- PELICULA
create or replace synonym pelicula_f1 for pelicula_f1_jcc_s1@netmax_s1;
create or replace synonym pelicula_f2 for pelicula_f2_sgs_s1@netmax_s3;
create or replace synonym pelicula_f3 for pelicula_f3_sgs_s2@netmax_s4;

-- SERIE
create or replace synonym serie_f1 for serie_f1_jcc_s1@netmax_s1;
create or replace synonym serie_f2 for serie_f2_sgs_s1@netmax_s3;
create or replace synonym serie_f3 for serie_f3_sgs_s2@netmax_s4;

-- HISTORICO_STATUS_PROGRAMA
create or replace synonym historico_status_programa_f1 for historico_status_programa_sgs_s2@netmax_s4;

-- ARCHIVO_PROGRAMA
create or replace synonym archivo_programa_f1 for archivo_programa_f1_jcc_s2;
create or replace synonym archivo_programa_f2 for archivo_programa_f2_sgs_s1@netmax_s3;

-- PLAYLIST
create or replace synonym playlist_f1 for playlist_f1_sgs_s2@netmax_s4;
create or replace synonym playlist_f2 for playlist_f2_jcc_s1@netmax_s1;
create or replace synonym playlist_f3 for playlist_f3_sgs_s1@netmax_s3;
create or replace synonym playlist_f4 for playlist_f4_jcc_s2;


-- TIPO_CUENTA
create or replace synonym tipo_cuenta_r1 for tipo_cuenta_r_jcc_s1@netmax_s1;
create or replace synonym tipo_cuenta_r2 for tipo_cuenta_r_jcc_s2;
create or replace synonym tipo_cuenta_r3 for tipo_cuenta_r_sgs_s1@netmax_s3;
create or replace synonym tipo_cuenta_r4 for tipo_cuenta_r_sgs_s2@netmax_s4;

-- PAIS
create or replace synonym pais_r1 for pais_r_jcc_s1@netmax_s1;
create or replace synonym pais_r2 for pais_r_jcc_s2;
create or replace synonym pais_r3 for pais_r_sgs_s1@netmax_s3;
create or replace synonym pais_r4 for pais_r_sgs_s2@netmax_s4;

-- TIPO_SERIE
create or replace synonym tipo_serie_r1 for tipo_serie_r_jcc_s1@netmax_s1;
create or replace synonym tipo_serie_r2 for tipo_serie_r_jcc_s2;
create or replace synonym tipo_serie_r3 for tipo_serie_r_sgs_s1@netmax_s3;
create or replace synonym tipo_serie_r4 for tipo_serie_r_sgs_s2@netmax_s4;
