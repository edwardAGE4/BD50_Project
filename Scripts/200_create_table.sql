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
   ) ;

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
   ) ;

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
   ) ;

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
   ) ;

-- -----------------------------------------------------------------------------
--       TABLE : CATEGORIE
-- -----------------------------------------------------------------------------

CREATE TABLE CATEGORIE
   (
    CTG_CDE NUMBER(2)  NOT NULL,
    CTG_LIB VARCHAR2(60)  NOT NULL,
    CTG_DSC VARCHAR2(255)  NULL 
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
   ) ;

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
   ) ;