--@Autores:         Jorge Cárdenas Cárdenas
--                  Samuel Arturo Garrido Sánchez
--@Fecha creación:  16/08/2021
--@Descripción:     Creación de fragmentos NETMAX_4

CREATE TABLE PAIS_R_SGS_S2(
    PAIS_ID       NUMBER(2, 0)    NOT NULL,
    CLAVE         VARCHAR2(4)     NOT NULL,
    NOMBRE        VARCHAR2(50)    NOT NULL,
    CONTINENTE    VARCHAR2(3)     NOT NULL,
    CONSTRAINT PAIS_R_SGS_S2_PK 
    PRIMARY KEY (PAIS_ID)
);

CREATE TABLE STATUS_PROGRAMA_SGS_S2(
    STATUS_PROGRAMA_ID    NUMBER(2, 0)     NOT NULL,
    DESCRIPCION           VARCHAR2(500)     NOT NULL,
    CLAVE                 VARCHAR2(40)    NOT NULL,
    CONSTRAINT STATUS_PROGRAMA_SGS_S2_PK 
    PRIMARY KEY (STATUS_PROGRAMA_ID)
);

CREATE TABLE PROGRAMA_F3_SGS_S2(
    PROGRAMA_ID           NUMBER(10, 0)    NOT NULL,
    FOLIO                 VARCHAR2(13)     NOT NULL,
    NOMBRE                VARCHAR2(100)    NOT NULL,
    DESCRIPCION           VARCHAR2(500)    NOT NULL,
    FECHA_STATUS          DATE             NOT NULL,
    TIPO                  CHAR(1)          NOT NULL,
    STATUS_PROGRAMA_ID    NUMBER(2, 0)     NOT NULL,
    CONSTRAINT PROGRAMA_F3_SGS_S2_PK PRIMARY KEY (PROGRAMA_ID), 
    CONSTRAINT PROGRAMA_F3_SGS_S2_STATUS_PROGRAMA_ID_FK FOREIGN KEY (STATUS_PROGRAMA_ID)
    REFERENCES STATUS_PROGRAMA_SGS_S2(STATUS_PROGRAMA_ID)
    ON DELETE CASCADE
);

CREATE TABLE DOCUMENTAL_F3_SGS_S2(
    PROGRAMA_ID    NUMBER(10, 0)    NOT NULL,
    TEMATICA       VARCHAR2(100)    NOT NULL,
    DURACION       NUMBER(5, 2)     NOT NULL,
    TRAILER        BLOB             NOT NULL,
    PAIS_ID        NUMBER(2, 0)     NOT NULL,
    CONSTRAINT DOCUMENTAL_F3_SGS_S2_PK PRIMARY KEY (PROGRAMA_ID), 
    CONSTRAINT DOCUMENTAL_F3_SGS_S2_PAIS_ID_FK FOREIGN KEY (PAIS_ID)
    REFERENCES PAIS_R_SGS_S2(PAIS_ID)
    ON DELETE CASCADE,
    CONSTRAINT DOCUMENTAL_F3_SGS_S2_PROGRAMA_ID_FK FOREIGN KEY (PROGRAMA_ID)
    REFERENCES PROGRAMA_F3_SGS_S2(PROGRAMA_ID)
    ON DELETE CASCADE
);

CREATE TABLE HISTORICO_STATUS_PROGRAMA_SGS_S2(
    HISTORICO_STATUS_PROG_ID    NUMBER(10, 0)    NOT NULL,
    FECHA_STATUS                DATE             NOT NULL,
    STATUS_PROGRAMA_ID          NUMBER(2, 0)     NOT NULL,
    PROGRAMA_ID                 NUMBER(10, 0)    NOT NULL,
    CONSTRAINT HISTORICO_STATUS_PROGRAMA_SGS_S2_PK 
    PRIMARY KEY (HISTORICO_STATUS_PROG_ID)
);

CREATE TABLE PELICULA_F3_SGS_S2(
    PROGRAMA_ID                NUMBER(10, 0)    NOT NULL,
    DURACION                   NUMBER(5, 2)     NOT NULL,
    SINOPSIS                   VARCHAR2(500)    NOT NULL,
    CLASIFICACION              CHAR(1)          NOT NULL,
    PELICULA_ANTECEDENTE_ID    NUMBER(10, 0),
    CONSTRAINT PELICULA_F3_SGS_S2_PK PRIMARY KEY (PROGRAMA_ID), 
    CONSTRAINT PELICULA_F3_SGS_S2_PROGRAMA_ID_FK 
    FOREIGN KEY (PROGRAMA_ID)
    REFERENCES PROGRAMA_F3_SGS_S2(PROGRAMA_ID)
    ON DELETE CASCADE
);

CREATE TABLE TIPO_CUENTA_R_SGS_S2(
    TIPO_CUENTA_ID    NUMBER(2, 0)     NOT NULL,
    CLAVE             VARCHAR2(40)     NOT NULL,
    DESCRIPCION       VARCHAR2(500)    NOT NULL,
    COSTO_MENSUAL     NUMBER(10, 2)    NOT NULL,
    CONSTRAINT TIPO_CUENTA_R_SGS_S2_PK 
    PRIMARY KEY (TIPO_CUENTA_ID)
);


CREATE TABLE USUARIO_F2_SGS_S2(
    USUARIO_ID          NUMBER(10, 0)    NOT NULL,
    EMAIL               VARCHAR2(200)    NOT NULL,
    NOMBRE              VARCHAR2(40)     NOT NULL,
    AP_PATERNO          VARCHAR2(40)     NOT NULL,
    AP_MATERNO          VARCHAR2(40)     NOT NULL,
    FECHA_INGRESO       DATE             NOT NULL,
    FECHA_CUENTA_FIN    DATE,
    VIGENTE             NUMBER(1, 0)     NOT NULL,
    TIPO_CUENTA_ID      NUMBER(2, 0)     NOT NULL,
    CONSTRAINT USUARIO_F2_SGS_S2_PK PRIMARY KEY (USUARIO_ID), 
    CONSTRAINT USUARIO_F2_SGS_S2_TIPO_CUENTA_ID_FK FOREIGN KEY (TIPO_CUENTA_ID)
    REFERENCES TIPO_CUENTA_R_SGS_S2(TIPO_CUENTA_ID)
    ON DELETE CASCADE
);

CREATE TABLE PLAYLIST_F1_SGS_S2(
    PLAYLIST_ID           NUMBER(10, 0)    NOT NULL,
    CALIFICACION          NUMBER(1, 0)     NOT NULL,
    INDICE                NUMBER(10, 0)    NOT NULL,
    NUM_REPRODUCCIONES    NUMBER(10, 0)    NOT NULL,
    PROGRAMA_ID           NUMBER(10, 0)    NOT NULL,
    USUARIO_ID            NUMBER(10, 0)    NOT NULL,
    CONSTRAINT PLAYLIST_F1_SGS_S2_PK PRIMARY KEY (PLAYLIST_ID), 
    CONSTRAINT PLAYLIST_F1_SGS_S2_USUARIO_ID_FK FOREIGN KEY (USUARIO_ID)
    REFERENCES USUARIO_F2_SGS_S2(USUARIO_ID)
    ON DELETE CASCADE
);

CREATE TABLE TIPO_SERIE_R_SGS_S2(
    TIPO_SERIE_ID    NUMBER(2, 0)     NOT NULL,
    CLAVE            VARCHAR2(40)     NOT NULL,
    DESCRIPCION      VARCHAR2(500)    NOT NULL,
    CONSTRAINT TIPO_SERIE_R_SGS_S2_PK 
    PRIMARY KEY (TIPO_SERIE_ID)
);

CREATE TABLE SERIE_F3_SGS_S2(
    PROGRAMA_ID          NUMBER(10, 0)    NOT NULL,
    NUM_CAPITULOS        NUMBER(3, 0)     NOT NULL,
    DURACION_CAPITULO    NUMBER(5, 2)     NOT NULL,
    TIPO_SERIE_ID        NUMBER(2, 0)     NOT NULL,
    CONSTRAINT SERIE_F3_SGS_S2_PK PRIMARY KEY (PROGRAMA_ID), 
    CONSTRAINT SERIE_F3_SGS_S2_TIPO_SERIE_ID_FK FOREIGN KEY (TIPO_SERIE_ID)
    REFERENCES TIPO_SERIE_R_SGS_S2(TIPO_SERIE_ID)
    ON DELETE CASCADE,
    CONSTRAINT SERIE_F3_SGS_S2_PROGRAMA_ID_FK FOREIGN KEY (PROGRAMA_ID)
    REFERENCES PROGRAMA_F3_SGS_S2(PROGRAMA_ID)
    ON DELETE CASCADE
);

CREATE INDEX PLAYLIST_F1_SGS_S2_USUARIO_ID_IX ON PLAYLIST_F1_SGS_S2(USUARIO_ID);

CREATE INDEX SERIE_F3_SGS_S2_TIPO_SERIE_ID_IX ON SERIE_F3_SGS_S2(TIPO_SERIE_ID);
