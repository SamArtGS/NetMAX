--@Autores:         Jorge Cárdenas Cárdenas
--                  Samuel Arturo Garrido Sánchez
--@Fecha creación:  16/08/2021
--@Descripción:     Definición de tablas temporales para manejo de datos BLOB

declare 
  cursor cur_tablas is 
    select table_name from user_tables where table_name in (
      'TS_DOCUMENTAL_1', 'TS_DOCUMENTAL_2', 'TS_DOCUMENTAL_3', 
      'TI_DOCUMENTAL_1', 'TI_DOCUMENTAL_2', 'TI_DOCUMENTAL_3', 
      'TS_ARCHIVO_PROGRAMA_1', 'TS_ARCHIVO_PROGRAMA_2', 
      'TI_ARCHIVO_PROGRAMA_1', 'TI_ARCHIVO_PROGRAMA_2'
    ); 
begin 
  for r in cur_tablas loop 
    execute immediate 'drop table ' || r.table_name; 
  end loop; 
end; 
/

Prompt tablas temporales para transparencia - Select
-- DOCUMENTAL
create global temporary table ts_documental_1(
  programa_id number(10,0) constraint ts_documental_1_pk primary key, 
  trailer blob not null 
) on commit preserve rows;

create global temporary table ts_documental_2(
  programa_id number(10,0) constraint ts_documental_2_pk primary key, 
  trailer blob not null 
) on commit preserve rows;

create global temporary table ts_documental_3(
  programa_id number(10,0) constraint ts_documental_3_pk primary key, 
  trailer blob not null 
) on commit preserve rows;

-- ARCHIVO_PROGRAMA
create global temporary table ts_archivo_programa_1(
  num_archivo number(5,0), 
  programa_id number(10,0), 
  archivo blob not null, 
  constraint ts_archivo_programa_1_pk primary key(num_archivo,programa_id) 
) on commit preserve rows;

create global temporary table ts_archivo_programa_2(
  num_archivo number(5,0), 
  programa_id number(10,0), 
  archivo blob not null, 
  constraint ts_archivo_programa_2_pk primary key(num_archivo,programa_id) 
) on commit preserve rows;

Prompt Prompt tablas temporales para transparencia - Insert
-- DOCUMENTAL
create global temporary table ti_documental_1(
  programa_id number(10,0) constraint ti_documental_1_pk primary key,
  tematica varchar2(10,0)   not null,
  duracion number(5,2)      not null,
  trailer blob              not null,
  pais_id number(2,0)       not null
) on commit preserve rows;

create global temporary table ti_documental_2(
  programa_id number(10,0) constraint ti_documental_2_pk primary key, 
  tematica varchar2(10,0)   not null,
  duracion number(5,2)      not null,
  trailer blob              not null,
  pais_id number(2,0)       not null
) on commit preserve rows;

create global temporary table ti_documental_3(
  programa_id number(10,0) constraint ti_documental_3_pk primary key, 
  tematica varchar2(10,0)   not null,
  duracion number(5,2)      not null,
  trailer blob              not null,
  pais_id number(2,0)       not null 
) on commit preserve rows;

-- ARCHIVO_PROGRAMA
create global temporary table ti_archivo_programa_1(
  num_archivo number(5,0), 
  programa_id number(10,0), 
  archivo blob not null, 
  constraint ti_archivo_programa_1_pk primary key(num_archivo,programa_id) 
) on commit preserve rows;

create global temporary table ti_archivo_programa_2(
  num_archivo number(5,0), 
  programa_id number(10,0), 
  archivo blob not null, 
  constraint ti_archivo_programa_2_pk primary key(num_archivo,programa_id) 
) on commit preserve rows;
