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
   )
   PARTITION BY RANGE (ACH_DATE)
   INTERVAL (NUMTOYMINTERVAL(1, 'MONTH'))
   (
      PARTITION p_2017 VALUES
        LESS THAN (TO_DATE('01/01/18', 'DD/MM/YY')),
      PARTITION p_2018 VALUES
        LESS THAN (TO_DATE('01/01/19', 'DD/MM/YY')),
      PARTITION p_2019 VALUES
        LESS THAN (TO_DATE('01/01/20', 'DD/MM/YY'))
    );