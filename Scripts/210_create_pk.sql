-- -----------------------------------------------------------------------------
--       TABLE : CARTE_BANCAIRE
-- -----------------------------------------------------------------------------
ALTER TABLE CARTE_BANCAIRE
	ADD CONSTRAINT PK_CARTE_BANCAIRE PRIMARY KEY (CLT_NUMI, CB_NUMI)
		USING INDEX TABLESPACE BD50_IND;

-- -----------------------------------------------------------------------------
--       TABLE : CONTENU
-- -----------------------------------------------------------------------------
ALTER TABLE CONTENU
	ADD CONSTRAINT PK_CONTENU PRIMARY KEY (FRM_CDE, SCT_CDE, CTN_CDE)
		USING INDEX TABLESPACE BD50_IND;

-- -----------------------------------------------------------------------------
--       TABLE : FORMATEUR
-- -----------------------------------------------------------------------------
ALTER TABLE FORMATEUR
	ADD CONSTRAINT PK_FORMATEUR PRIMARY KEY (FMT_CDE)
		USING INDEX TABLESPACE BD50_IND;

-- -----------------------------------------------------------------------------
--       TABLE : PROMOTION
-- -----------------------------------------------------------------------------
ALTER TABLE PROMOTION
	ADD CONSTRAINT PK_PROMOTION PRIMARY KEY (PMT_CDE)
		USING INDEX TABLESPACE BD50_IND;

-- -----------------------------------------------------------------------------
--       TABLE : SECTIONS
-- -----------------------------------------------------------------------------
ALTER TABLE SECTIONS
	ADD CONSTRAINT PK_SECTIONS PRIMARY KEY (FRM_CDE, SCT_CDE)
		USING INDEX TABLESPACE BD50_IND;

-- -----------------------------------------------------------------------------
--       TABLE : CLIENT
-- -----------------------------------------------------------------------------
ALTER TABLE CLIENT
	ADD CONSTRAINT PK_CLIENT PRIMARY KEY (CLT_NUMI)
		USING INDEX TABLESPACE BD50_IND;

-- -----------------------------------------------------------------------------
--       TABLE : FORMATION
-- -----------------------------------------------------------------------------
ALTER TABLE FORMATION
	ADD CONSTRAINT PK_FORMATION PRIMARY KEY (FRM_CDE)
		USING INDEX TABLESPACE BD50_IND;

-- -----------------------------------------------------------------------------
--       TABLE : CATEGORIE
-- -----------------------------------------------------------------------------
ALTER TABLE CATEGORIE
	ADD CONSTRAINT PK_CATEGORIE PRIMARY KEY (CTG_CDE)
		USING INDEX TABLESPACE BD50_IND;

-- -----------------------------------------------------------------------------
--       TABLE : SOUS_CATEGORIES
-- -----------------------------------------------------------------------------
ALTER TABLE SOUS_CATEGORIES
	ADD CONSTRAINT PK_SOUS_CATEGORIES PRIMARY KEY (CTG_CDE, SCG_CDE)
		USING INDEX TABLESPACE BD50_IND;

-- -----------------------------------------------------------------------------
--       TABLE : ACHAT
-- -----------------------------------------------------------------------------
ALTER TABLE ACHAT
	ADD CONSTRAINT PK_ACHAT PRIMARY KEY (ACH_CDE)
		USING INDEX TABLESPACE BD50_IND;

-- -----------------------------------------------------------------------------
--       TABLE : EFFECTUER
-- -----------------------------------------------------------------------------
ALTER TABLE EFFECTUER
	ADD CONSTRAINT PK_EFFECTUER PRIMARY KEY (ACH_CDE, FRM_CDE)
		USING INDEX TABLESPACE BD50_IND;