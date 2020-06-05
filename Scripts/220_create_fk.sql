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