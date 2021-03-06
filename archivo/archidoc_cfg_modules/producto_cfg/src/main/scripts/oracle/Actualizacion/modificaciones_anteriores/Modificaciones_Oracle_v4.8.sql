--/*************************/
--/* Versión 4.7 > 4.8     */
--/*************************/

spool actualizacion48.log

INSERT INTO AGINFOSISTEMA (AUTID,NOMBRE,VALOR,FECHAACTUALIZACION) VALUES (SEQ_INFO.NextVal,'VERSIONBD','4.7->4.8',SYSDATE);


--Fecha devolución en prorroga
ALTER TABLE ASGPPRORROGA ADD (FECHAFINPRORROGA DATE);

--Motivo por el cual se solicita la prorroga
ALTER TABLE ASGPPRORROGA ADD (MOTIVOPRORROGA VARCHAR2(512));

DROP INDEX ASGFELIMSELUDOC1;
DROP INDEX ASGFELIMSELUDOC2;

--Modificar el nombre de la tabla ASGFELIMSELUDOC por ASGFELIMUDOCCONS
RENAME ASGFELIMSELUDOC TO ASGFELIMUDOCCONS;

-- Tabla: ASGFELIMSELUDOC
CREATE INDEX ASGFELIMUDOCCONS1 ON ASGFELIMUDOCCONS (IDELIMINACION) TABLESPACE &1;
CREATE INDEX ASGFELIMUDOCCONS2 ON ASGFELIMUDOCCONS (IDUDOC) TABLESPACE &1;


CREATE TABLE ASGFELIMSELUDOC(
    IDELIMINACION VARCHAR2(32) NOT NULL,
    IDUDOC VARCHAR2(32) NOT NULL,
    IDFONDO VARCHAR2(32),
    CODREFERENCIA VARCHAR2(1024),
    CODIGO VARCHAR2(128),
    SIGNATURAUDOC VARCHAR2(32),
    EXPEDIENTEUDOC VARCHAR2(256),
    TITULO VARCHAR2(1024),
    CODSISTPRODUCTOR VARCHAR2(16),
    TIPODOCUMENTAL VARCHAR2(254),
    IDUINSTALACION VARCHAR2(32),
    UBICACION VARCHAR2(512),
    FECHAINIUDOC DATE,
    FECHAFINUDOC DATE,
    NUMERO VARCHAR2(10)
);

-- Tabla: ASGFELIMSELUDOC
CREATE INDEX ASGFELIMSELUDOC1 ON ASGFELIMSELUDOC (IDELIMINACION) TABLESPACE &1;
CREATE INDEX ASGFELIMSELUDOC2 ON ASGFELIMSELUDOC (IDUDOC) TABLESPACE &1;

-- Tabla: ASGFUNIDADDOC
CREATE INDEX ASGFUNIDADDOC4 ON ASGFUNIDADDOC(IDFONDO) TABLESPACE &1;
spool off