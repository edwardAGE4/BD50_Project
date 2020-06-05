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

DROP TABLE CARTE_BANCAIRE CASCADE CONSTRAINTS;

DROP TABLE CONTENU CASCADE CONSTRAINTS;

DROP TABLE FORMATEUR CASCADE CONSTRAINTS;

DROP TABLE PROMOTION CASCADE CONSTRAINTS;

DROP TABLE SECTIONS CASCADE CONSTRAINTS;

DROP TABLE CLIENT CASCADE CONSTRAINTS;

DROP TABLE FORMATION CASCADE CONSTRAINTS;

DROP TABLE CATEGORIE CASCADE CONSTRAINTS;

DROP TABLE SOUS_CATEGORIES CASCADE CONSTRAINTS;

DROP TABLE ACHAT CASCADE CONSTRAINTS;

DROP TABLE CONCERNER CASCADE CONSTRAINTS;

DROP TABLE EFFECTUER CASCADE CONSTRAINTS;

PURGE RECYCLEBIN;

-- -----------------------------------------------------------------------------
--       TABLE : CARTE_BANCAIRE
-- -----------------------------------------------------------------------------

CREATE TABLE CARTE_BANCAIRE
   (
    CLT_NUMI NUMBER(8)  NOT NULL,
    CB_NUMI NUMBER(8)  NOT NULL,
    CB_NP VARCHAR2(60)  NOT NULL,
    CB_NUM VARCHAR2(15)  NOT NULL,
    CB_DTE VARCHAR2(5)  NOT NULL,
    CB_CDE NUMBER(3)  NULL
,   CONSTRAINT PK_CARTE_BANCAIRE PRIMARY KEY (CLT_NUMI, CB_NUMI)  USING INDEX TABLESPACE BD50_IND 
   ) ;

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE CARTE_BANCAIRE
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_CARTE_BANCAIRE_CLIENT
     ON CARTE_BANCAIRE (CLT_NUMI ASC)
   TABLESPACE BD50_IND ;

-- -----------------------------------------------------------------------------
--       TABLE : CONTENU
-- -----------------------------------------------------------------------------

CREATE TABLE CONTENU
   (
    FRM_CDE NUMBER(7)  NOT NULL,
    SCT_CDE NUMBER(7)  NOT NULL,
    CTN_CDE NUMBER(8)  NOT NULL,
    CTN_TYP VARCHAR2(20)  NOT NULL,
    CTN_LIN VARCHAR2(128)  NOT NULL,
    CTN_DSC VARCHAR2(255)  NOT NULL,
    CTN_DRE VARCHAR2(8)  NOT NULL
,   CONSTRAINT PK_CONTENU PRIMARY KEY (FRM_CDE, SCT_CDE, CTN_CDE)  USING INDEX TABLESPACE BD50_IND 
   ) ;

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE CONTENU
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_CONTENU_SECTIONS
     ON CONTENU (FRM_CDE ASC, SCT_CDE ASC)
   TABLESPACE BD50_IND ;

-- -----------------------------------------------------------------------------
--       TABLE : FORMATEUR
-- -----------------------------------------------------------------------------

CREATE TABLE FORMATEUR
   (
    FMT_CDE NUMBER(6)  NOT NULL,
    FMT_NOM AV(30)  NOT NULL,
    FMT_PNM AV(30)  NOT NULL,
    FMT_EML VARCHAR2(50)  NOT NULL,
    FMT_NUM VARCHAR2(13)  NOT NULL,
    FMT_LOG AV(20)  NOT NULL,
    FMT_MDP AV(20)  NOT NULL
,   CONSTRAINT PK_FORMATEUR PRIMARY KEY (FMT_CDE)  USING INDEX TABLESPACE BD50_IND 
   ) ;

-- -----------------------------------------------------------------------------
--       TABLE : PROMOTION
-- -----------------------------------------------------------------------------

CREATE TABLE PROMOTION
   (
    PMT_CDE NUMBER(3)  NOT NULL,
    PMT_LIB VARCHAR2(60)  NOT NULL,
    PMT_PRCT NUMBER(3,2)  NOT NULL,
    PMT_DEBUT DATE  NOT NULL,
    PMT_FIN DATE  NOT NULL
,   CONSTRAINT PK_PROMOTION PRIMARY KEY (PMT_CDE)  USING INDEX TABLESPACE BD50_IND 
   ) ;

-- -----------------------------------------------------------------------------
--       TABLE : SECTIONS
-- -----------------------------------------------------------------------------

CREATE TABLE SECTIONS
   (
    FRM_CDE NUMBER(7)  NOT NULL,
    SCT_CDE NUMBER(7)  NOT NULL,
    SCT_LIB VARCHAR2(60)  NOT NULL,
    SCT_DSC VARCHAR2(128)  NULL
,   CONSTRAINT PK_SECTIONS PRIMARY KEY (FRM_CDE, SCT_CDE)  USING INDEX TABLESPACE BD50_IND 
   ) ;

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE SECTIONS
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_SECTIONS_FORMATION
     ON SECTIONS (FRM_CDE ASC)
   TABLESPACE BD50_IND ;

-- -----------------------------------------------------------------------------
--       TABLE : CLIENT
-- -----------------------------------------------------------------------------

CREATE TABLE CLIENT
   (
    CLT_NUMI NUMBER(8)  NOT NULL,
    CLT_NOM AV(30)  NOT NULL,
    CLT_PNM VARCHAR2(30)  NOT NULL,
    CLT_EML VARCHAR2(50)  NOT NULL,
    CLT_NUM VARCHAR2(13)  NOT NULL,
    CLT_LOG VARCHAR2(30)  NOT NULL,
    CLT_MDP VARCHAR2(30)  NOT NULL
,   CONSTRAINT PK_CLIENT PRIMARY KEY (CLT_NUMI)  USING INDEX TABLESPACE BD50_IND 
   ) ;

-- -----------------------------------------------------------------------------
--       TABLE : FORMATION
-- -----------------------------------------------------------------------------

CREATE TABLE FORMATION
   (
    FRM_CDE NUMBER(7)  NOT NULL,
    FMT_CDE NUMBER(6)  NOT NULL,
    CTG_CDE NUMBER(2)  NOT NULL,
    SCG_CDE NUMBER(3)  NOT NULL,
    FRM_LIB VARCHAR2(120)  NOT NULL,
    FRM_DSC VARCHAR2(255)  NOT NULL,
    FRM_DRE VARCHAR2(128)  NOT NULL,
    FRM_DTC DATE  NOT NULL,
    FRM_PRXHT NUMBER(13,2)  NOT NULL,
    FRM_TAXE NUMBER(3,2)  NOT NULL,
    FRM_PTTC NUMBER(13,2)  NOT NULL
,   CONSTRAINT PK_FORMATION PRIMARY KEY (FRM_CDE)  USING INDEX TABLESPACE BD50_IND 
   ) ;

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE FORMATION
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_FORMATION_FORMATEUR
     ON FORMATION (FMT_CDE ASC)
   TABLESPACE BD50_IND ;

CREATE  INDEX I_FK_FORMATION_SOUS_CATEGORIES
     ON FORMATION (CTG_CDE ASC, SCG_CDE ASC)
   TABLESPACE BD50_IND ;

-- -----------------------------------------------------------------------------
--       TABLE : CATEGORIE
-- -----------------------------------------------------------------------------

CREATE TABLE CATEGORIE
   (
    CTG_CDE NUMBER(2)  NOT NULL,
    CTG_LIB VARCHAR2(60)  NOT NULL,
    CTG_DSC VARCHAR2(255)  NULL
,   CONSTRAINT PK_CATEGORIE PRIMARY KEY (CTG_CDE)  USING INDEX TABLESPACE BD50_IND 
   ) ;

-- -----------------------------------------------------------------------------
--       TABLE : SOUS_CATEGORIES
-- -----------------------------------------------------------------------------

CREATE TABLE SOUS_CATEGORIES
   (
    CTG_CDE NUMBER(2)  NOT NULL,
    SCG_CDE NUMBER(3)  NOT NULL,
    SCG_LIB VARCHAR2(60)  NOT NULL,
    SCG_DSC VARCHAR2(128)  NULL
,   CONSTRAINT PK_SOUS_CATEGORIES PRIMARY KEY (CTG_CDE, SCG_CDE)  USING INDEX TABLESPACE BD50_IND 
   ) ;

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE SOUS_CATEGORIES
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_SOUS_CATEGORIES_CATEGORIE
     ON SOUS_CATEGORIES (CTG_CDE ASC)
   TABLESPACE BD50_IND ;

-- -----------------------------------------------------------------------------
--       TABLE : ACHAT
-- -----------------------------------------------------------------------------

CREATE TABLE ACHAT
   (
    ACH_CDE NUMBER(8)  NOT NULL,
    CLT_NUMI NUMBER(8)  NOT NULL,
    CB_NUMI NUMBER(8)  NOT NULL,
    ACH_DATE DATE  NOT NULL,
    ACH_TTC NUMBER(8,2)  NOT NULL,
    ACH_NBTOT NUMBER(13,2)  NOT NULL,
    ACH_STT VARCHAR2(20)  NOT NULL
,   CONSTRAINT PK_ACHAT PRIMARY KEY (ACH_CDE)  USING INDEX TABLESPACE BD50_IND 
   ) ;

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE ACHAT
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_ACHAT_CARTE_BANCAIRE
     ON ACHAT (CLT_NUMI ASC, CB_NUMI ASC)
   TABLESPACE BD50_IND ;

-- -----------------------------------------------------------------------------
--       TABLE : CONCERNER
-- -----------------------------------------------------------------------------

CREATE TABLE CONCERNER
   (
    PMT_CDE NUMBER(3)  NOT NULL,
    FRM_CDE NUMBER(7)  NOT NULL
,   CONSTRAINT PK_CONCERNER PRIMARY KEY (PMT_CDE, FRM_CDE)  USING INDEX TABLESPACE BD50_IND 
   ) ;

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE CONCERNER
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_CONCERNER_PROMOTION
     ON CONCERNER (PMT_CDE ASC)
   TABLESPACE BD50_IND ;

CREATE  INDEX I_FK_CONCERNER_FORMATION
     ON CONCERNER (FRM_CDE ASC)
   TABLESPACE BD50_IND ;

-- -----------------------------------------------------------------------------
--       TABLE : EFFECTUER
-- -----------------------------------------------------------------------------

CREATE TABLE EFFECTUER
   (
    ACH_CDE NUMBER(8)  NOT NULL,
    FRM_CDE NUMBER(7)  NOT NULL,
    EFF_PACHATHT NUMBER(13,2)  NOT NULL,
    EFF_TVA NUMBER(3,2)  NOT NULL,
    EFF_PACHATTTC NUMBER(13,2)  NOT NULL,
    EFF_CODEPROMO NUMBER(3)  NULL,
    EFF_AVISCLT VARCHAR2(128)  NULL
,   CONSTRAINT PK_EFFECTUER PRIMARY KEY (ACH_CDE, FRM_CDE)  USING INDEX TABLESPACE BD50_IND 
   ) ;

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE EFFECTUER
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_EFFECTUER_ACHAT
     ON EFFECTUER (ACH_CDE ASC)
   TABLESPACE BD50_IND ;

CREATE  INDEX I_FK_EFFECTUER_FORMATION
     ON EFFECTUER (FRM_CDE ASC)
   TABLESPACE BD50_IND ;


-- -----------------------------------------------------------------------------
--       CREATION DES REFERENCES DE TABLE
-- -----------------------------------------------------------------------------


ALTER TABLE CARTE_BANCAIRE ADD (
     CONSTRAINT FK_CARTE_BANCAIRE_CLIENT
          FOREIGN KEY (CLT_NUMI)
               REFERENCES CLIENT (CLT_NUMI)) ;

ALTER TABLE CONTENU ADD (
     CONSTRAINT FK_CONTENU_SECTIONS
          FOREIGN KEY (FRM_CDE, SCT_CDE)
               REFERENCES SECTIONS (FRM_CDE, SCT_CDE)) ;

ALTER TABLE SECTIONS ADD (
     CONSTRAINT FK_SECTIONS_FORMATION
          FOREIGN KEY (FRM_CDE)
               REFERENCES FORMATION (FRM_CDE)) ;

ALTER TABLE FORMATION ADD (
     CONSTRAINT FK_FORMATION_FORMATEUR
          FOREIGN KEY (FMT_CDE)
               REFERENCES FORMATEUR (FMT_CDE)) ;

ALTER TABLE FORMATION ADD (
     CONSTRAINT FK_FORMATION_SOUS_CATEGORIES
          FOREIGN KEY (CTG_CDE, SCG_CDE)
               REFERENCES SOUS_CATEGORIES (CTG_CDE, SCG_CDE)) ;

ALTER TABLE SOUS_CATEGORIES ADD (
     CONSTRAINT FK_SOUS_CATEGORIES_CATEGORIE
          FOREIGN KEY (CTG_CDE)
               REFERENCES CATEGORIE (CTG_CDE)) ;

ALTER TABLE ACHAT ADD (
     CONSTRAINT FK_ACHAT_CARTE_BANCAIRE
          FOREIGN KEY (CLT_NUMI, CB_NUMI)
               REFERENCES CARTE_BANCAIRE (CLT_NUMI, CB_NUMI)) ;

ALTER TABLE CONCERNER ADD (
     CONSTRAINT FK_CONCERNER_PROMOTION
          FOREIGN KEY (PMT_CDE)
               REFERENCES PROMOTION (PMT_CDE)
                    ON DELETE CASCADE
) ;

ALTER TABLE CONCERNER ADD (
     CONSTRAINT FK_CONCERNER_FORMATION
          FOREIGN KEY (FRM_CDE)
               REFERENCES FORMATION (FRM_CDE)
                    ON DELETE CASCADE
) ;

ALTER TABLE EFFECTUER ADD (
     CONSTRAINT FK_EFFECTUER_ACHAT
          FOREIGN KEY (ACH_CDE)
               REFERENCES ACHAT (ACH_CDE)
                    ON DELETE CASCADE
) ;

ALTER TABLE EFFECTUER ADD (
     CONSTRAINT FK_EFFECTUER_FORMATION
          FOREIGN KEY (FRM_CDE)
               REFERENCES FORMATION (FRM_CDE)
                    ON DELETE CASCADE
) ;


-- -----------------------------------------------------------------------------
--                FIN DE GENERATION
-- -----------------------------------------------------------------------------