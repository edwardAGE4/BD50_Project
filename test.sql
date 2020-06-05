-- GetAllFormations
declare
	TYPE tformation IS RECORD(FRM_LIB FORMATION.FRM_LIB%TYPE
						, FRM_DSC FORMATION.FRM_DSC%TYPE
						, FRM_DRE FORMATION.FRM_DRE%TYPE
						, FRM_DTC FORMATION.FRM_DTC%TYPE
						, FRM_PRXHT FORMATION.FRM_PRXHT%TYPE
						, FRM_TAXE FORMATION.FRM_TAXE%TYPE
						, FRM_PTTC FORMATION.FRM_PTTC%TYPE
						, FMT_NOM FORMATEUR.FMT_NOM%TYPE
						, FMT_PNM FORMATEUR.FMT_PNM%TYPE
						, CTG_LIB CATEGORIE.CTG_LIB%TYPE
						, SCG_LIB SOUS_CATEGORIES.SCG_LIB%TYPE);
	TYPE formationcur IS REF CURSOR RETURN tformation;
	
	formations formationcur;
	rec formations%ROWTYPE;
begin
	formations := pa_app.GetAllFormations;
	fetch formations into rec;
	while (formations%FOUND) loop
		dbms_output.put_line('LIB : ' || rec.frm_lib);
		dbms_output.put_line('FORMATEUR : ' || rec.fmt_nom || ' ' || rec.fmt_pnm);
		dbms_output.put_line('');
		fetch formations into rec;
	end loop;
end;
/

-- GetAllCateg
declare
	type sqlcur is ref cursor;
	categs sqlcur;
	souscategs sqlcur;
	rec_cat CATEGORIE%ROWTYPE;
	rec_souscat SOUS_CATEGORIES%ROWTYPE;
begin
	categs := pa_app.GetAllCateg;
	fetch categs into rec_cat;
	while (categs%FOUND) loop
		dbms_output.put_line('CAT : ' || rec_cat.ctg_cde || ' ' || rec_cat.ctg_lib);
		
		souscategs := pa_app.GetAllSousCategByCateg(rec_cat.ctg_cde);
		fetch souscategs into rec_souscat;
		while (souscategs%FOUND) loop
			dbms_output.put_line('SOUS_CAT : ' || rec_souscat.scg_lib);
			fetch souscategs into rec_souscat;
		end loop;
		
		fetch categs into rec_cat;
	end loop;
end;
/

-- GetAllSousCategByCateg
declare
	type sqlcur is ref cursor;
	souscategs sqlcur;
	rec_souscat SOUS_CATEGORIES%ROWTYPE;
begin
	souscategs := pa_app.GetAllSousCategByCateg(1);
	fetch souscategs into rec_souscat;
	while (souscategs%FOUND) loop
		dbms_output.put_line('SOUS_CAT : ' || rec_souscat.scg_lib);
		fetch souscategs into rec_souscat;
	end loop;
end;
/

-- GetAllSectionsByFormation
declare
	type sqlcur is ref cursor;
	sects sqlcur;
	rec SECTIONS%ROWTYPE;
begin
	sects := pa_app.GetAllSectionsByFormation(1);
	fetch sects into rec;
	while (sects%FOUND) loop
		dbms_output.put_line('LIB : ' || rec.sct_lib);
		fetch sects into rec;
	end loop;
end;
/

-- GetAllContentsBySection
declare
	type sqlcur is ref cursor;
	contenus sqlcur;
	rec CONTENU%ROWTYPE;
begin
	contenus := pa_app.GetAllContentsBySection(1, 1);
	fetch contenus into rec;
	while (contenus%FOUND) loop
		dbms_output.put_line('TYPE : ' || rec.CTN_TYP);
		dbms_output.put_line('LIEN : ' || rec.CTN_LIN);
		dbms_output.put_line('DESCRIP : ' || rec.CTN_DSC);
		dbms_output.put_line('DUREE : ' || rec.CTN_DRE);
		dbms_output.put_line('-------------------');
		fetch contenus into rec;
	end loop;
end;
/