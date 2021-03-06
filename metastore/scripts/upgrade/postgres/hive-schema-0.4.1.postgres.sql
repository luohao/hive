--
-- Table: BUCKETING_COLS
--
CREATE TABLE "BUCKETING_COLS" (
  "SD_ID" bigint NOT NULL,
  "BUCKET_COL_NAME" character varying(256) DEFAULT NULL,
  "INTEGER_IDX" bigint NOT NULL,
  PRIMARY KEY ("SD_ID", "INTEGER_IDX")
);
CREATE INDEX "BUCKETING_COLS_N49" on "BUCKETING_COLS" ("SD_ID");

--
-- Table: COLUMNS
--
CREATE TABLE "COLUMNS" (
  "SD_ID" bigint NOT NULL,
  "COMMENT" character varying(256) DEFAULT NULL,
  "COLUMN_NAME" character varying(128) NOT NULL,
  "TYPE_NAME" character varying(128) NOT NULL,
  "INTEGER_IDX" bigint NOT NULL,
  PRIMARY KEY ("SD_ID", "COLUMN_NAME", "TYPE_NAME")
);
CREATE INDEX "COLUMNS_N49" on "COLUMNS" ("SD_ID");

--
-- Table: PARTITIONS
--
CREATE TABLE "PARTITIONS" (
  "PART_ID" bigint NOT NULL,
  "CREATE_TIME" bigint NOT NULL,
  "LAST_ACCESS_TIME" bigint NOT NULL,
  "PART_NAME" character varying(767) DEFAULT NULL,
  "SD_ID" bigint DEFAULT NULL,
  "TBL_ID" bigint DEFAULT NULL,
  PRIMARY KEY ("PART_ID"),
  CONSTRAINT "UNIQUEPARTITION" UNIQUE ("PART_NAME", "TBL_ID")
);
CREATE INDEX "PARTITIONS_N49" on "PARTITIONS" ("TBL_ID");
CREATE INDEX "PARTITIONS_N50" on "PARTITIONS" ("SD_ID");

--
-- Table: PARTITION_KEYS
--
CREATE TABLE "PARTITION_KEYS" (
  "TBL_ID" bigint NOT NULL,
  "PKEY_COMMENT" character varying(767) DEFAULT NULL,
  "PKEY_NAME" character varying(128) NOT NULL,
  "PKEY_TYPE" character varying(767) NOT NULL,
  "INTEGER_IDX" bigint NOT NULL,
  PRIMARY KEY ("TBL_ID", "PKEY_NAME")
);
CREATE INDEX "PARTITION_KEYS_N49" on "PARTITION_KEYS" ("TBL_ID");

--
-- Table: PARTITION_KEY_VALS
--
CREATE TABLE "PARTITION_KEY_VALS" (
  "PART_ID" bigint NOT NULL,
  "PART_KEY_VAL" character varying(256) DEFAULT NULL,
  "INTEGER_IDX" bigint NOT NULL,
  PRIMARY KEY ("PART_ID", "INTEGER_IDX")
);
CREATE INDEX "PARTITION_KEY_VALS_N49" on "PARTITION_KEY_VALS" ("PART_ID");

--
-- Table: PARTITION_PARAMS
--
CREATE TABLE "PARTITION_PARAMS" (
  "PART_ID" bigint NOT NULL,
  "PARAM_KEY" character varying(256) NOT NULL,
  "PARAM_VALUE" character varying(767) DEFAULT NULL,
  PRIMARY KEY ("PART_ID", "PARAM_KEY")
);
CREATE INDEX "PARTITION_PARAMS_N49" on "PARTITION_PARAMS" ("PART_ID");

--
-- Table: SDS
--
CREATE TABLE "SDS" (
  "SD_ID" bigint NOT NULL,
  "INPUT_FORMAT" character varying(256) DEFAULT NULL,
  "IS_COMPRESSED" boolean NOT NULL,
  "LOCATION" character varying(767) DEFAULT NULL,
  "NUM_BUCKETS" bigint NOT NULL,
  "OUTPUT_FORMAT" character varying(256) DEFAULT NULL,
  "SERDE_ID" bigint DEFAULT NULL,
  PRIMARY KEY ("SD_ID")
);
CREATE INDEX "SDS_N49" on "SDS" ("SERDE_ID");

--
-- Table: SD_PARAMS
--
CREATE TABLE "SD_PARAMS" (
  "SD_ID" bigint NOT NULL,
  "PARAM_KEY" character varying(256) NOT NULL,
  "PARAM_VALUE" character varying(767) DEFAULT NULL,
  PRIMARY KEY ("SD_ID", "PARAM_KEY")
);
CREATE INDEX "SD_PARAMS_N49" on "SD_PARAMS" ("SD_ID");

--
-- Table: SERDES
--
CREATE TABLE "SERDES" (
  "SERDE_ID" bigint NOT NULL,
  "NAME" character varying(128) DEFAULT NULL,
  "SLIB" character varying(767) DEFAULT NULL,
  PRIMARY KEY ("SERDE_ID")
);

--
-- Table: SERDE_PARAMS
--
CREATE TABLE "SERDE_PARAMS" (
  "SERDE_ID" bigint NOT NULL,
  "PARAM_KEY" character varying(256) NOT NULL,
  "PARAM_VALUE" character varying(767) DEFAULT NULL,
  PRIMARY KEY ("SERDE_ID", "PARAM_KEY")
);
CREATE INDEX "SERDE_PARAMS_N49" on "SERDE_PARAMS" ("SERDE_ID");

--
-- Table: SORT_COLS
--
CREATE TABLE "SORT_COLS" (
  "SD_ID" bigint NOT NULL,
  "COLUMN_NAME" character varying(128) DEFAULT NULL,
  "ORDER" bigint NOT NULL,
  "INTEGER_IDX" bigint NOT NULL,
  PRIMARY KEY ("SD_ID", "INTEGER_IDX")
);
CREATE INDEX "SORT_COLS_N49" on "SORT_COLS" ("SD_ID");

--
-- Table: TABLE_PARAMS
--
CREATE TABLE "TABLE_PARAMS" (
  "TBL_ID" bigint NOT NULL,
  "PARAM_KEY" character varying(256) NOT NULL,
  "PARAM_VALUE" character varying(767) DEFAULT NULL,
  PRIMARY KEY ("TBL_ID", "PARAM_KEY")
);
CREATE INDEX "TABLE_PARAMS_N49" on "TABLE_PARAMS" ("TBL_ID");

--
-- Table: TBLS
--
CREATE TABLE "TBLS" (
  "TBL_ID" bigint NOT NULL,
  "CREATE_TIME" bigint NOT NULL,
  "DB_ID" bigint DEFAULT NULL,
  "LAST_ACCESS_TIME" bigint NOT NULL,
  "OWNER" character varying(128) DEFAULT NULL,
  "RETENTION" bigint NOT NULL,
  "SD_ID" bigint DEFAULT NULL,
  "TBL_NAME" character varying(128) DEFAULT NULL,
  PRIMARY KEY ("TBL_ID"),
  CONSTRAINT "UNIQUETABLE" UNIQUE ("TBL_NAME", "DB_ID")
);
CREATE INDEX "TBLS_N50" on "TBLS" ("SD_ID");
CREATE INDEX "TBLS_N49" on "TBLS" ("DB_ID");

--
-- Table: TYPE_FIELDS
--
CREATE TABLE "TYPE_FIELDS" (
  "TYPE_NAME" bigint NOT NULL,
  "COMMENT" character varying(256) DEFAULT NULL,
  "FIELD_NAME" character varying(128) NOT NULL,
  "FIELD_TYPE" character varying(128) NOT NULL,
  "INTEGER_IDX" bigint NOT NULL,
  PRIMARY KEY ("TYPE_NAME", "FIELD_NAME")
);
CREATE INDEX "TYPE_FIELDS_N49" on "TYPE_FIELDS" ("TYPE_NAME");

--
-- Table: DBS
--
CREATE TABLE "DBS" (
  "DB_ID" bigint NOT NULL,
  "DESC" character varying(767) DEFAULT NULL,
  "NAME" character varying(128) DEFAULT NULL,
  PRIMARY KEY ("DB_ID"),
  CONSTRAINT "UNIQUE_DATABASE" UNIQUE ("NAME")
);

--
-- Table: TYPES
--
CREATE TABLE "TYPES" (
  "TYPES_ID" bigint NOT NULL,
  "TYPE_NAME" character varying(128) DEFAULT NULL,
  "TYPE1" character varying(128) DEFAULT NULL,
  "TYPE2" character varying(128) DEFAULT NULL,
  PRIMARY KEY ("TYPES_ID"),
  CONSTRAINT "UNIQUE_TYPE" UNIQUE ("TYPE_NAME")
);

--
-- Foreign Key Definitions
--

ALTER TABLE "BUCKETING_COLS" ADD FOREIGN KEY ("SD_ID")
  REFERENCES "SDS" ("SD_ID") DEFERRABLE;

ALTER TABLE "COLUMNS" ADD FOREIGN KEY ("SD_ID")
  REFERENCES "SDS" ("SD_ID") DEFERRABLE;

ALTER TABLE "PARTITIONS" ADD FOREIGN KEY ("SD_ID")
  REFERENCES "SDS" ("SD_ID") DEFERRABLE;

ALTER TABLE "PARTITIONS" ADD FOREIGN KEY ("TBL_ID")
  REFERENCES "TBLS" ("TBL_ID") DEFERRABLE;

ALTER TABLE "PARTITION_KEYS" ADD FOREIGN KEY ("TBL_ID")
  REFERENCES "TBLS" ("TBL_ID") DEFERRABLE;

ALTER TABLE "PARTITION_KEY_VALS" ADD FOREIGN KEY ("PART_ID")
  REFERENCES "PARTITIONS" ("PART_ID") DEFERRABLE;

ALTER TABLE "PARTITION_PARAMS" ADD FOREIGN KEY ("PART_ID")
  REFERENCES "PARTITIONS" ("PART_ID") DEFERRABLE;

ALTER TABLE "SDS" ADD FOREIGN KEY ("SERDE_ID")
  REFERENCES "SERDES" ("SERDE_ID") DEFERRABLE;

ALTER TABLE "SD_PARAMS" ADD FOREIGN KEY ("SD_ID")
  REFERENCES "SDS" ("SD_ID") DEFERRABLE;

ALTER TABLE "SERDE_PARAMS" ADD FOREIGN KEY ("SERDE_ID")
  REFERENCES "SERDES" ("SERDE_ID") DEFERRABLE;

ALTER TABLE "SORT_COLS" ADD FOREIGN KEY ("SD_ID")
  REFERENCES "SDS" ("SD_ID") DEFERRABLE;

ALTER TABLE "TABLE_PARAMS" ADD FOREIGN KEY ("TBL_ID")
  REFERENCES "TBLS" ("TBL_ID") DEFERRABLE;

ALTER TABLE "TBLS" ADD FOREIGN KEY ("SD_ID")
  REFERENCES "SDS" ("SD_ID") DEFERRABLE;

ALTER TABLE "TBLS" ADD FOREIGN KEY ("DB_ID")
  REFERENCES "DBS" ("DB_ID") DEFERRABLE;

ALTER TABLE "TYPE_FIELDS" ADD FOREIGN KEY ("TYPE_NAME")
  REFERENCES "TYPES" ("TYPES_ID") DEFERRABLE;

