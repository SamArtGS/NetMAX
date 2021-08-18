--@Autores:         Jorge Cárdenas Cárdenas
--                  Samuel Arturo Garrido Sánchez
--@Fecha creación:  16/08/2021
--@Descripción:     Creación de fragmentos NETMAX_3


-- 
-- TABLE: ARCHIVO_PROGRAMA_F1_JCC 
--

CREATE TABLE ARCHIVO_PROGRAMA_F1_JCC(
    NUM_ARCHIVO    NUMBER(5, 0)     NOT NULL,
    PROGRAMA_ID    NUMBER(10, 0)    NOT NULL,
    ARCHIVO        BLOB             NOT NULL,
    TAMANIO        NUMBER(10, 2)    NOT NULL,
    CONSTRAINT ARCHIVO_PROGRAMA_F1_JCC_2_PK PRIMARY KEY (NUM_ARCHIVO, PROGRAMA_ID)
)
;



-- 
-- TABLE: USUARIO_F5_JCC_S2 
--

CREATE TABLE USUARIO_F5_JCC_S2(
    USUARIO_ID          NUMBER(10, 0)    NOT NULL,
    EMAIL               VARCHAR2(200)    NOT NULL,
    NOMBRE              VARCHAR2(40)     NOT NULL,
    AP_PATERNO          VARCHAR2(40)     NOT NULL,
    AP_MATERNO          VARCHAR2(40)     NOT NULL,
    FECHA_INGRESO       DATE             NOT NULL,
    FECHA_CUENTA_FIN    DATE,
    VIGENTE             NUMBER(1, 0)     NOT NULL,
    TIPO_CUENTA_ID      NUMBER(2, 0)     NOT NULL,
    CONSTRAINT USUARIO_F5_JCC_S2_PK PRIMARY KEY (USUARIO_ID)
)
;



-- 
-- TABLE: PLAYLIST_F4_JCC_S2 
--

CREATE TABLE PLAYLIST_F4_JCC_S2(
    PLAYLIST_ID           NUMBER(10, 0)    NOT NULL,
    CALIFICACION          NUMBER(1, 0)     NOT NULL,
    INDICE                NUMBER(10, 0)    NOT NULL,
    NUM_REPRODUCCIONES    NUMBER(10, 0)    NOT NULL,
    PROGRAMA_ID           NUMBER(10, 0)    NOT NULL,
    USUARIO_ID            NUMBER(10, 0)    NOT NULL,
    CONSTRAINT PLAYLIST_F4_JCC_S2_PK PRIMARY KEY (PLAYLIST_ID), 
    CONSTRAINT PLAYLIST_F4_USUARIO_ID_FK FOREIGN KEY (USUARIO_ID)
    REFERENCES USUARIO_F5_JCC_S2(USUARIO_ID)
)
;



-- 
-- TABLE: STATUS_PROGRAMA_JCC_S2 
--

CREATE TABLE STATUS_PROGRAMA_JCC_S2(
    STATUS_PROGRAMA_ID    NUMBER(2, 0)     NOT NULL,
    DESCRIPCION           VARCHAR2(40)     NOT NULL,
    CLAVE                 VARCHAR2(500)    NOT NULL,
    CONSTRAINT STATUS_PROGRAMA_JCC_S2_PK PRIMARY KEY (STATUS_PROGRAMA_ID)
)
;



-- 
-- INDEX: PLAYLIST_F4_USUARIO_ID_IX 
--

CREATE INDEX PLAYLIST_F4_USUARIO_ID_IX ON PLAYLIST_F4_JCC_S2(USUARIO_ID)
;
