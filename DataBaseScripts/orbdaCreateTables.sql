-- Table: bariatrics

-- DROP TABLE bariatrics;

CREATE TABLE bariatrics
(
  id_ serial, -- logical primary key
  estado character(2), -- state
  ap_coduni character varying(200), -- healthcare unit
  ap_cmp character varying(6), -- issue date
  ap_pripal character varying(10), -- performed procedure
  ap_cnspcn character varying(200), -- hashed patient identifier
  ap_nuidade character varying(2), -- age
  ap_sexo character varying(1), -- gender
  ap_racacor character varying(2), -- race
  ap_ufnacio character varying(3), -- nationality
  ap_tpaten character varying(2), -- reason for encounter
  ap_motsai character varying(2), -- reason for discharge
  ap_dtocor character varying(8), -- date of discharge
  ap_cidcas character varying(4), -- associated causes
  ap_cidpri character varying(4), -- main diagnosis
  ap_cidsec character varying(4), -- secondary diagnosis
  ap_etnia character varying(4), -- ethnic group
  ab_imc character varying(3), -- body mass index
  ab_dtcirur character varying(8), -- date of procedure
  ab_mesacom character varying(2), -- follow-up in months
  ab_pontbar character varying(1), -- Baros score
  ab_tabbarr character varying(1), -- Baros table
  CONSTRAINT id_bariatrica PRIMARY KEY (id_)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE bariatrics
  OWNER TO postgres;
COMMENT ON TABLE bariatrics
  IS 'Authorisation for Bariatric Procedure';
COMMENT ON COLUMN bariatrics.id_ IS 'logical primary key';
COMMENT ON COLUMN bariatrics.estado IS 'state ';
COMMENT ON COLUMN bariatrics.ap_coduni IS 'healthcare unit';
COMMENT ON COLUMN bariatrics.ap_cmp IS 'issue date';
COMMENT ON COLUMN bariatrics.ap_pripal IS 'performed procedure';
COMMENT ON COLUMN bariatrics.ap_cnspcn IS 'hashed patient identifier';
COMMENT ON COLUMN bariatrics.ap_nuidade IS 'age';
COMMENT ON COLUMN bariatrics.ap_sexo IS 'gender';
COMMENT ON COLUMN bariatrics.ap_racacor IS 'race';
COMMENT ON COLUMN bariatrics.ap_ufnacio IS 'nationality';
COMMENT ON COLUMN bariatrics.ap_tpaten IS 'reason for encounter';
COMMENT ON COLUMN bariatrics.ap_motsai IS 'reason for discharge';
COMMENT ON COLUMN bariatrics.ap_dtocor IS 'date of discharge';
COMMENT ON COLUMN bariatrics.ap_cidcas IS 'associated causes';
COMMENT ON COLUMN bariatrics.ap_cidpri IS 'main diagnosis';
COMMENT ON COLUMN bariatrics.ap_cidsec IS 'secondary diagnosis';
COMMENT ON COLUMN bariatrics.ap_etnia IS 'ethnic group';
COMMENT ON COLUMN bariatrics.ab_imc IS 'body mass index';
COMMENT ON COLUMN bariatrics.ab_dtcirur IS 'date of procedure';
COMMENT ON COLUMN bariatrics.ab_mesacom IS 'follow-up in months';
COMMENT ON COLUMN bariatrics.ab_pontbar IS 'Baros score';
COMMENT ON COLUMN bariatrics.ab_tabbarr IS 'Baros table';


-- Index: ix_bar_cnspcn

-- DROP INDEX ix_bar_cnspcn;

CREATE INDEX ix_bar_cnspcn
  ON bariatrics
  USING btree
  (ap_cnspcn);


-- Table: radiotherapy

-- DROP TABLE radiotherapy;

CREATE TABLE radiotherapy
(
  id_ serial, -- logical primary key
  estado character(2), -- state
  ap_coduni character varying(200), -- healthcare unit
  ap_cmp character varying(6), -- issue date
  ap_pripal character varying(10), -- performed procedure
  ap_cnspcn character varying(200), -- hashed patient identifier
  ap_nuidade character varying(2), -- age
  ap_sexo character varying(1), -- gender
  ap_racacor character varying(2), -- race
  ap_ufnacio character varying(3), -- nationality
  ap_tpaten character varying(2), -- reason for encounter
  ap_motsai character varying(2), -- reason for discharge
  ap_dtocor character varying(8), -- date of discharge
  ap_cidcas character varying(4), -- associated causes
  ap_cidpri character varying(4), -- main diagnosis
  ap_cidsec character varying(4), -- secondary diagnosis
  ap_etnia character varying(4), -- ethnic group
  ar_cid10 character varying(4), -- topography
  ar_linfin character varying(1), -- regional linphonodes
  ar_estadi character varying(1), -- tumour stage
  ar_grahis character varying(2), -- histopathological grading
  ar_dtiden character varying(8), -- date of pathological identification
  ar_dtintr character varying(8), -- date of begin of treatment
  ar_finali character varying(1), -- reason for treatment
  ar_cidtr1 character varying(4), -- irradiated area 1
  ar_cidtr2 character varying(4), -- irradiated area 2
  ar_cidtr3 character varying(4), -- irradiated area 3
  ar_numc1 character varying(3), -- number of fields/insertions
  ar_numc2 character varying(3), -- number of fields/insertions
  ar_numc3 character varying(3), -- number of fields/insertions
  CONSTRAINT id_radioterapia_2012 PRIMARY KEY (id_)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE radiotherapy
  OWNER TO postgres;
COMMENT ON TABLE radiotherapy
  IS 'Authorisation for Radiotherapy';
COMMENT ON COLUMN radiotherapy.id_ IS 'logical primary key';
COMMENT ON COLUMN radiotherapy.estado IS 'state ';
COMMENT ON COLUMN radiotherapy.ap_coduni IS 'healthcare unit';
COMMENT ON COLUMN radiotherapy.ap_cmp IS 'issue date';
COMMENT ON COLUMN radiotherapy.ap_pripal IS 'performed procedure';
COMMENT ON COLUMN radiotherapy.ap_cnspcn IS 'hashed patient identifier';
COMMENT ON COLUMN radiotherapy.ap_nuidade IS 'age';
COMMENT ON COLUMN radiotherapy.ap_sexo IS 'gender';
COMMENT ON COLUMN radiotherapy.ap_racacor IS 'race';
COMMENT ON COLUMN radiotherapy.ap_ufnacio IS 'nationality';
COMMENT ON COLUMN radiotherapy.ap_tpaten IS 'reason for encounter';
COMMENT ON COLUMN radiotherapy.ap_motsai IS 'reason for discharge';
COMMENT ON COLUMN radiotherapy.ap_dtocor IS 'date of discharge';
COMMENT ON COLUMN radiotherapy.ap_cidcas IS 'associated causes';
COMMENT ON COLUMN radiotherapy.ap_cidpri IS 'main diagnosis';
COMMENT ON COLUMN radiotherapy.ap_cidsec IS 'secondary diagnosis';
COMMENT ON COLUMN radiotherapy.ap_etnia IS 'ethnic group';
COMMENT ON COLUMN radiotherapy.ar_cid10 IS 'topography';
COMMENT ON COLUMN radiotherapy.ar_linfin IS 'regional linphonodes';
COMMENT ON COLUMN radiotherapy.ar_estadi IS 'tumour stage';
COMMENT ON COLUMN radiotherapy.ar_grahis IS 'histopathological grading';
COMMENT ON COLUMN radiotherapy.ar_dtiden IS 'date of pathological identification';
COMMENT ON COLUMN radiotherapy.ar_dtintr IS 'date of begin of treatment';
COMMENT ON COLUMN radiotherapy.ar_finali IS 'reason for treatment';
COMMENT ON COLUMN radiotherapy.ar_cidtr1 IS 'irradiated area 1';
COMMENT ON COLUMN radiotherapy.ar_cidtr2 IS 'irradiated area 2';
COMMENT ON COLUMN radiotherapy.ar_cidtr3 IS 'irradiated area 3';
COMMENT ON COLUMN radiotherapy.ar_numc1 IS 'number of fields/insertions';
COMMENT ON COLUMN radiotherapy.ar_numc2 IS 'number of fields/insertions';
COMMENT ON COLUMN radiotherapy.ar_numc3 IS 'number of fields/insertions';


-- Index: ix_rad_cnspcn

-- DROP INDEX ix_rad_cnspcn;

CREATE INDEX ix_rad_cnspcn
  ON radiotherapy
  USING btree
  (ap_cnspcn);


-- Table: chemotherapy

-- DROP TABLE chemotherapy;

CREATE TABLE chemotherapy
(
  id_ serial, -- logical primary key
  estado character(2), -- state
  ap_coduni character varying(200), -- healthcare unit
  ap_cmp character varying(6), -- issue date
  ap_pripal character varying(10), -- performed procedure
  ap_cnspcn character varying(200), -- hashed patient identifier
  ap_nuidade character varying(2), -- age
  ap_sexo character varying(1), -- gender
  ap_racacor character varying(2), -- race
  ap_ufnacio character varying(3), -- nationality
  ap_tpaten character varying(2), -- reason for encounter
  ap_motsai character varying(2), -- reason for discharge
  ap_dtocor character varying(8), -- date of discharge
  ap_cidcas character varying(4), -- associated causes
  ap_cidpri character varying(4), -- main diagnosis
  ap_cidsec character varying(4), -- secondary diagnosis
  ap_etnia character varying(4), -- ethnic group
  aq_cid10 character varying(4), -- topography
  aq_linfin character varying(1), -- regional linphonodes
  aq_estadi character varying(1), -- tumour stage
  aq_grahis character varying(2), -- histopathological grading
  aq_dtiden character varying(8), -- date of pathological identification
  aq_dtintr character varying(8), -- date of begin of treatment
  aq_esqu_p1 character varying(5), -- schema
  aq_totmpl character varying(3), -- duration of treatment (months)
  aq_esqu_p2 character varying(10), -- schema
  CONSTRAINT id_quimioterapia_2012 PRIMARY KEY (id_)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE chemotherapy
  OWNER TO postgres;
COMMENT ON TABLE chemotherapy
  IS 'Authorisation for Chemotherapy';
COMMENT ON COLUMN chemotherapy.id_ IS 'logical primary key';
COMMENT ON COLUMN chemotherapy.estado IS 'state ';
COMMENT ON COLUMN chemotherapy.ap_coduni IS 'healthcare unit';
COMMENT ON COLUMN chemotherapy.ap_cmp IS 'issue date';
COMMENT ON COLUMN chemotherapy.ap_pripal IS 'performed procedure';
COMMENT ON COLUMN chemotherapy.ap_cnspcn IS 'hashed patient identifier';
COMMENT ON COLUMN chemotherapy.ap_nuidade IS 'age';
COMMENT ON COLUMN chemotherapy.ap_sexo IS 'gender';
COMMENT ON COLUMN chemotherapy.ap_racacor IS 'race';
COMMENT ON COLUMN chemotherapy.ap_ufnacio IS 'nationality';
COMMENT ON COLUMN chemotherapy.ap_tpaten IS 'reason for encounter';
COMMENT ON COLUMN chemotherapy.ap_motsai IS 'reason for discharge';
COMMENT ON COLUMN chemotherapy.ap_dtocor IS 'date of discharge';
COMMENT ON COLUMN chemotherapy.ap_cidcas IS 'associated causes';
COMMENT ON COLUMN chemotherapy.ap_cidpri IS 'main diagnosis';
COMMENT ON COLUMN chemotherapy.ap_cidsec IS 'secondary diagnosis';
COMMENT ON COLUMN chemotherapy.ap_etnia IS 'ethnic group';
COMMENT ON COLUMN chemotherapy.aq_cid10 IS 'topography';
COMMENT ON COLUMN chemotherapy.aq_linfin IS 'regional linphonodes';
COMMENT ON COLUMN chemotherapy.aq_estadi IS 'tumour stage';
COMMENT ON COLUMN chemotherapy.aq_grahis IS 'histopathological grading';
COMMENT ON COLUMN chemotherapy.aq_dtiden IS 'date of pathological identification';
COMMENT ON COLUMN chemotherapy.aq_dtintr IS 'date of begin of treatment';
COMMENT ON COLUMN chemotherapy.aq_esqu_p1 IS 'schema';
COMMENT ON COLUMN chemotherapy.aq_totmpl IS 'duration of treatment (months)';
COMMENT ON COLUMN chemotherapy.aq_esqu_p2 IS 'schema';


-- Index: ix_qui_cnspcn

-- DROP INDEX ix_qui_cnspcn;

CREATE INDEX ix_qui_cnspcn
  ON chemotherapy
  USING btree
  (ap_cnspcn);

-- Table: hospitalisation

-- DROP TABLE hospitalisation;

CREATE TABLE hospitalisation
(
  id_ serial, -- logical primary key
  estado character(2), -- state
  ano_cmpt character varying(4), -- claim issue date year
  mes_cmpt character varying(2), -- claim issue date month
  espec character varying(2), -- specialty
  cgc_hosp character varying(200), -- healthcare unit
  n_aih character varying(200), -- hospitalisation identifier
  nasc character varying(8), -- birth date
  sexo character varying(1), -- gender
  uti_mes_to integer, -- ICU – total stay
  proc_rea character varying(10), -- performed procedure
  dt_inter character varying(8), -- admission date
  dt_saida character varying(8), -- discharge date
  diag_princ character varying(4), -- main diagnosis
  diag_secun character varying(4), -- secondary diagnosis
  cobranca character varying(2), -- claim reason
  morte integer, -- death indicator
  nacional character varying(3), -- nationality
  car_int character varying(2), -- type of hospitalisation
  instru character varying(1), -- educational level
  infehosp character varying(1), -- hospitalisation infection
  CONSTRAINT id_aih PRIMARY KEY (id_)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE hospitalisation
  OWNER TO postgres;
COMMENT ON TABLE hospitalisation
  IS 'Authorisation for Hospital Admission';
COMMENT ON COLUMN hospitalisation.id_ IS 'logical primary key';
COMMENT ON COLUMN hospitalisation.estado IS 'state ';
COMMENT ON COLUMN hospitalisation.ano_cmpt IS 'claim issue date';
COMMENT ON COLUMN hospitalisation.mes_cmpt IS 'claim issue date';
COMMENT ON COLUMN hospitalisation.espec IS 'speciality';
COMMENT ON COLUMN hospitalisation.cgc_hosp IS 'healthcare unit';
COMMENT ON COLUMN hospitalisation.n_aih IS 'hospitalisation identifier';
COMMENT ON COLUMN hospitalisation.nasc IS 'birth date';
COMMENT ON COLUMN hospitalisation.sexo IS 'gender';
COMMENT ON COLUMN hospitalisation.uti_mes_to IS 'ICU – total stay';
COMMENT ON COLUMN hospitalisation.proc_rea IS 'performed procedure';
COMMENT ON COLUMN hospitalisation.dt_inter IS 'admission date';
COMMENT ON COLUMN hospitalisation.dt_saida IS 'discharge date';
COMMENT ON COLUMN hospitalisation.diag_princ IS 'main diagnosis';
COMMENT ON COLUMN hospitalisation.diag_secun IS 'secondary diagnosis';
COMMENT ON COLUMN hospitalisation.cobranca IS 'claim reason';
COMMENT ON COLUMN hospitalisation.morte IS 'death indicator';
COMMENT ON COLUMN hospitalisation.nacional IS 'nationality';
COMMENT ON COLUMN hospitalisation.car_int IS 'type of hospitalisation';
COMMENT ON COLUMN hospitalisation.instru IS 'educational level';
COMMENT ON COLUMN hospitalisation.infehosp IS 'hospitalisation infection';


-- Index: ix_aih_cnspcn

-- DROP INDEX ix_aih_cnspcn;

CREATE INDEX ix_aih_cnspcn
  ON hospitalisation
  USING btree
  (n_aih);

-- Table: medication

-- DROP TABLE medication;

CREATE TABLE medication
(
  id_ serial, -- logical primary key
  estado character(2), -- state
  ap_coduni character varying(200), -- healthcare unit
  ap_cmp character varying(6), -- issue date
  ap_pripal character varying(10), -- performed procedure
  ap_cnspcn character varying(200), -- hashed patient identifier
  ap_nuidade character varying(2), -- age
  ap_sexo character varying(1), -- gender
  ap_racacor character varying(2), -- race
  ap_ufnacio character varying(3), -- nationality
  ap_tpaten character varying(2), -- reason for encounter
  ap_motsai character varying(2), -- reason for discharge
  ap_dtocor character varying(8), -- date of discharge
  ap_cidcas character varying(4), -- associated causes
  ap_cidpri character varying(4), -- main diagnosis
  ap_cidsec character varying(4), -- secondary diagnosis
  ap_etnia character varying(4), -- ethnic group
  am_peso character varying(3), -- weight
  am_altura character varying(3), -- height
  am_transpl character varying(1), -- indicator of transplantation
  am_qtdtran character varying(2), -- number of transplantations
  CONSTRAINT id_medicamentos PRIMARY KEY (id_)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE medication
  OWNER TO postgres;
COMMENT ON TABLE medication
  IS 'Authorisation for Medication';
COMMENT ON COLUMN medication.id_ IS 'logical primary key';
COMMENT ON COLUMN medication.estado IS 'state ';
COMMENT ON COLUMN medication.ap_coduni IS 'healthcare unit';
COMMENT ON COLUMN medication.ap_cmp IS 'issue date';
COMMENT ON COLUMN medication.ap_pripal IS 'performed procedure';
COMMENT ON COLUMN medication.ap_cnspcn IS 'hashed patient identifier';
COMMENT ON COLUMN medication.ap_nuidade IS 'age';
COMMENT ON COLUMN medication.ap_sexo IS 'gender';
COMMENT ON COLUMN medication.ap_racacor IS 'race';
COMMENT ON COLUMN medication.ap_ufnacio IS 'nationality';
COMMENT ON COLUMN medication.ap_tpaten IS 'reason for encounter';
COMMENT ON COLUMN medication.ap_motsai IS 'reason for discharge';
COMMENT ON COLUMN medication.ap_dtocor IS 'date of discharge';
COMMENT ON COLUMN medication.ap_cidcas IS 'associated causes';
COMMENT ON COLUMN medication.ap_cidpri IS 'main diagnosis';
COMMENT ON COLUMN medication.ap_cidsec IS 'secondary diagnosis';
COMMENT ON COLUMN medication.ap_etnia IS 'ethnic group';
COMMENT ON COLUMN medication.am_peso IS 'weight';
COMMENT ON COLUMN medication.am_altura IS 'height';
COMMENT ON COLUMN medication.am_transpl IS 'indicator of transplantation';
COMMENT ON COLUMN medication.am_qtdtran IS 'number of transplantations';


-- Index: ix_med_cnspcn

-- DROP INDEX ix_med_cnspcn;

CREATE INDEX ix_med_cnspcn
  ON medication
  USING btree
  (ap_cnspcn);


-- Table: miscellaneous

-- DROP TABLE miscellaneous;

CREATE TABLE miscellaneous
(
  id_ serial, -- logical primary key
  estado character(2), -- state
  ap_coduni character varying(200), -- healthcare unit
  ap_cmp character varying(6), -- issue date
  ap_pripal character varying(10), -- performed procedure
  ap_cnspcn character varying(200), -- hashed patient identifier
  ap_nuidade character varying(2), -- age
  ap_sexo character varying(1), -- gender
  ap_racacor character varying(2), -- race
  ap_ufnacio character varying(3), -- nationality
  ap_tpaten character varying(2), -- reason for encounter
  ap_motsai character varying(2), -- reason for discharge
  ap_dtocor character varying(8), -- date of discharge
  ap_cidcas character varying(4), -- associated causes
  ap_cidpri character varying(4), -- main diagnosis
  ap_cidsec character varying(4), -- secondary diagnosis
  ap_etnia character varying(4), -- ethnic group
  CONSTRAINT id_diversos PRIMARY KEY (id_)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE miscellaneous
  OWNER TO postgres;
COMMENT ON TABLE miscellaneous
  IS 'Authorisation for Outpatient Miscellaneous Procedure';
COMMENT ON COLUMN miscellaneous.id_ IS 'logical primary key';
COMMENT ON COLUMN miscellaneous.estado IS 'state ';
COMMENT ON COLUMN miscellaneous.ap_coduni IS 'healthcare unit';
COMMENT ON COLUMN miscellaneous.ap_cmp IS 'issue date';
COMMENT ON COLUMN miscellaneous.ap_pripal IS 'performed procedure';
COMMENT ON COLUMN miscellaneous.ap_cnspcn IS 'hashed patient identifier';
COMMENT ON COLUMN miscellaneous.ap_nuidade IS 'age';
COMMENT ON COLUMN miscellaneous.ap_sexo IS 'gender';
COMMENT ON COLUMN miscellaneous.ap_racacor IS 'race';
COMMENT ON COLUMN miscellaneous.ap_ufnacio IS 'nationality';
COMMENT ON COLUMN miscellaneous.ap_tpaten IS 'reason for encounter';
COMMENT ON COLUMN miscellaneous.ap_motsai IS 'reason for discharge';
COMMENT ON COLUMN miscellaneous.ap_dtocor IS 'date of discharge';
COMMENT ON COLUMN miscellaneous.ap_cidcas IS 'associated causes';
COMMENT ON COLUMN miscellaneous.ap_cidpri IS 'main diagnosis';
COMMENT ON COLUMN miscellaneous.ap_cidsec IS 'secondary diagnosis';
COMMENT ON COLUMN miscellaneous.ap_etnia IS 'ethnic group';


-- Index: ix_div_cnspcn

-- DROP INDEX ix_div_cnspcn;

CREATE INDEX ix_div_cnspcn
  ON miscellaneous
  USING btree
  (ap_cnspcn);

-- Table: nephrology

-- DROP TABLE nephrology;

CREATE TABLE nephrology
(
  id_ serial, -- logical primary key
  estado character(2), -- state
  ap_coduni character varying(200), -- healthcare unit
  ap_cmp character varying(6), -- issue date
  ap_pripal character varying(10), -- performed procedure
  ap_cnspcn character varying(200), -- hashed patient identifier
  ap_nuidade character varying(2), -- age
  ap_sexo character varying(1), -- gender
  ap_racacor character varying(2), -- race
  ap_ufnacio character varying(3), -- nationality
  ap_tpaten character varying(2), -- reason for encounter
  ap_motsai character varying(2), -- reason for discharge
  ap_dtocor character varying(8), -- date of discharge
  ap_cidpri character varying(4), -- main diagnosis
  ap_cidsec character varying(4), -- secondary diagnosis
  ap_etnia character varying(4), -- ethnic group
  an_dtpdr character varying(8), -- date of first dialysis
  an_altura character varying(3), -- height
  an_peso character varying(3), -- weight
  an_diures character varying(4), -- diuresis
  an_glicos character varying(4), -- glucose
  an_acevas character varying(1), -- vascular access
  an_ulsoab character varying(1), -- abdominal ultrasonography
  an_tru character varying(4), -- ureia reduction rate
  an_intfis character varying(2), -- venous fistula amount
  an_cncdo character varying(1), -- enrolled for transplantation
  an_albumi character varying(2), -- albumine
  an_hcv character varying(1), -- HIC - antibodies
  an_hbsag character varying(1), -- HbsAg
  an_hiv character varying(1), -- HIV
  an_hb character varying(2), -- HB
  CONSTRAINT id_nefrologia PRIMARY KEY (id_)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE nephrology
  OWNER TO postgres;
COMMENT ON TABLE nephrology
  IS 'Authorisation for Nephrology Procedure';
COMMENT ON COLUMN nephrology.id_ IS 'logical primary key';
COMMENT ON COLUMN nephrology.estado IS 'state ';
COMMENT ON COLUMN nephrology.ap_coduni IS 'healthcare unit';
COMMENT ON COLUMN nephrology.ap_cmp IS 'issue date';
COMMENT ON COLUMN nephrology.ap_pripal IS 'performed procedure';
COMMENT ON COLUMN nephrology.ap_cnspcn IS 'hashed patient identifier';
COMMENT ON COLUMN nephrology.ap_nuidade IS 'age';
COMMENT ON COLUMN nephrology.ap_sexo IS 'gender';
COMMENT ON COLUMN nephrology.ap_racacor IS 'race';
COMMENT ON COLUMN nephrology.ap_ufnacio IS 'nationality';
COMMENT ON COLUMN nephrology.ap_tpaten IS 'reason for encounter';
COMMENT ON COLUMN nephrology.ap_motsai IS 'reason for discharge';
COMMENT ON COLUMN nephrology.ap_dtocor IS 'date of discharge';
COMMENT ON COLUMN nephrology.ap_cidpri IS 'main diagnosis';
COMMENT ON COLUMN nephrology.ap_cidsec IS 'secondary diagnosis';
COMMENT ON COLUMN nephrology.ap_etnia IS 'ethnic group';
COMMENT ON COLUMN nephrology.an_dtpdr IS 'date of first dialysis';
COMMENT ON COLUMN nephrology.an_altura IS 'height';
COMMENT ON COLUMN nephrology.an_peso IS 'weight';
COMMENT ON COLUMN nephrology.an_diures IS 'diuresis';
COMMENT ON COLUMN nephrology.an_glicos IS 'glucose';
COMMENT ON COLUMN nephrology.an_acevas IS 'vascular access';
COMMENT ON COLUMN nephrology.an_ulsoab IS 'abdominal ultrasonography';
COMMENT ON COLUMN nephrology.an_tru IS 'ureia reduction rate';
COMMENT ON COLUMN nephrology.an_intfis IS 'venous fistula amount';
COMMENT ON COLUMN nephrology.an_cncdo IS 'enrolled for transplantation';
COMMENT ON COLUMN nephrology.an_albumi IS 'albumine';
COMMENT ON COLUMN nephrology.an_hcv IS 'HIC - antibodies';
COMMENT ON COLUMN nephrology.an_hbsag IS 'HbsAg';
COMMENT ON COLUMN nephrology.an_hiv IS 'HIV';
COMMENT ON COLUMN nephrology.an_hb IS 'HB';

-- an_hcv, an_hiv, an_hbsag, ap_nuidade, ap_coduni, owner_id, ap_pripal, ap_motsai, estado, an_tru, an_intfis, vol
-- Index: ix_nef_cnspcn

-- DROP INDEX ix_nef_cnspcn;

CREATE INDEX ix_nef_cnspcn
  ON nephrology
  USING btree
  (ap_cnspcn);

