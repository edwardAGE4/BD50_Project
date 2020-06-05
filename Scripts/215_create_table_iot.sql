-- -----------------------------------------------------------------------------
--             Génération d'une base de données pour
--                      Oracle Version 10g
--                        (19/5/2019 12:06:19)
-- -----------------------------------------------------------------------------
--      Nom de la base : FORMA
--      Projet : BD50_PROJET_FORMA
--      Auteur : Yovo
--      Date de dernière modification : 19/5/2019 12:05:05
-- -----------------------------------------------------------------------------

-- -----------------------------------------------------------------------------
--       TABLE : CONCERNER
-- -----------------------------------------------------------------------------

CREATE TABLE CONCERNER
   (
    PMT_CDE NUMBER(3)  NOT NULL,
    FRM_CDE NUMBER(7)  NOT NULL,
    CONSTRAINT PK_CONCERNER PRIMARY KEY (PMT_CDE, FRM_CDE)
      USING INDEX TABLESPACE BD50_IND
   )
   ORGANIZATION INDEX;