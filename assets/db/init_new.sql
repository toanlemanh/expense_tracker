PRAGMA foreign_keys = false;

-- ----------------------------
-- Table structure for Assets
-- ----------------------------
DROP TABLE IF EXISTS "Assets";
CREATE TABLE "Assets" (
  "id" INTEGER PRIMARY KEY AUTOINCREMENT,
  "name" TEXT NOT NULL,
  "img_name" TEXT NOT NULL,
  "type" INTEGER NOT NULL,
  "state" INTEGER NOT NULL,
  "remark" TEXT NOT NULL,
  "create_time" INTEGER NOT NULL,
  "money" INTEGER NOT NULL,
  "ranking" INTEGER,
  "init_money" INTEGER NOT NULL
);

-- ----------------------------
-- Records of Assets
-- ----------------------------
INSERT INTO "Assets" VALUES (1, 'home_assets_credit', 'assets_rmb', 0, 0, 'The deposit account', 1741254397093, 0, 0, 0);
INSERT INTO "Assets" VALUES (2, 'home_assets_default', 'assets_wallet', 0, 0, 'The default cash account', 1741254397095, -27200000, 0, 0);
INSERT INTO "Assets" VALUES (3, 'home_assets_bank_card', 'assets_red_packet', 0, 0, 'The bank card account', 1741254397097, 994500000, 0, 0);

-- ----------------------------
-- Table structure for AssetsModifyRecord
-- ----------------------------
DROP TABLE IF EXISTS "AssetsModifyRecord";
CREATE TABLE "AssetsModifyRecord" (
  "assets_id" INTEGER NOT NULL,
  "money" INTEGER NOT NULL,
  "money_before" INTEGER NOT NULL,
  "id" INTEGER PRIMARY KEY AUTOINCREMENT,
  "state" INTEGER NOT NULL,
  "create_time" INTEGER NOT NULL,
  FOREIGN KEY ("assets_id") REFERENCES "Assets" ("id") ON DELETE CASCADE ON UPDATE NO ACTION
);

-- ----------------------------
-- Records of AssetsModifyRecord
-- ----------------------------

-- ----------------------------
-- Table structure for AssetsSummaryRecord
-- ----------------------------
DROP TABLE IF EXISTS "AssetsSummaryRecord";
CREATE TABLE "AssetsSummaryRecord" (
  "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  "time" INTEGER NOT NULL,
  "assets_id" INTEGER NOT NULL,
  "assets_money" INTEGER NOT NULL,
  "liabilities_money" INTEGER NOT NULL
);

-- ----------------------------
-- Records of AssetsSummaryRecord
-- ----------------------------
INSERT INTO "AssetsSummaryRecord" VALUES (1, 1741167998098, -1, 0, 0);
INSERT INTO "AssetsSummaryRecord" VALUES (2, 1741167998098, 3, 0, 0);
INSERT INTO "AssetsSummaryRecord" VALUES (3, 1741167998098, 2, 0, 0);
INSERT INTO "AssetsSummaryRecord" VALUES (4, 1741167998098, 1, 0, 0);
INSERT INTO "AssetsSummaryRecord" VALUES (5, 1742272175318, -1, 0, 0);
INSERT INTO "AssetsSummaryRecord" VALUES (6, 1742272175318, 3, 0, 0);
INSERT INTO "AssetsSummaryRecord" VALUES (7, 1742272175318, 2, 0, 0);
INSERT INTO "AssetsSummaryRecord" VALUES (8, 1742272175318, 1, 0, 0);
INSERT INTO "AssetsSummaryRecord" VALUES (9, 1748269584123, -1, 0, 0);
INSERT INTO "AssetsSummaryRecord" VALUES (10, 1748269584123, 3, 0, 0);
INSERT INTO "AssetsSummaryRecord" VALUES (11, 1748269584123, 2, 0, 0);
INSERT INTO "AssetsSummaryRecord" VALUES (12, 1748269584123, 1, 0, 0);
INSERT INTO "AssetsSummaryRecord" VALUES (13, 1748282243873, -1, 0, 25500000);
INSERT INTO "AssetsSummaryRecord" VALUES (14, 1748282243873, 3, 0, 5500000);
INSERT INTO "AssetsSummaryRecord" VALUES (15, 1748282243873, 2, 0, 20000000);
INSERT INTO "AssetsSummaryRecord" VALUES (16, 1748282243873, 1, 0, 0);

-- ----------------------------
-- Table structure for AssetsTransferRecord
-- ----------------------------
DROP TABLE IF EXISTS "AssetsTransferRecord";
CREATE TABLE "AssetsTransferRecord" (
  "id" INTEGER PRIMARY KEY AUTOINCREMENT,
  "state" INTEGER NOT NULL,
  "create_time" INTEGER NOT NULL,
  "time" INTEGER NOT NULL,
  "assets_id_form" INTEGER NOT NULL,
  "assets_id_to" INTEGER NOT NULL,
  "remark" TEXT NOT NULL,
  "money" INTEGER NOT NULL,
  "charge" INTEGER NOT NULL,
  "recurrence_id" INTEGER NOT NULL,
  "ledger_id" INTEGER NOT NULL,
  "star" INTEGER NOT NULL,
  FOREIGN KEY ("assets_id_form") REFERENCES "Assets" ("id") ON DELETE CASCADE ON UPDATE NO ACTION,
  FOREIGN KEY ("assets_id_to") REFERENCES "Assets" ("id") ON DELETE CASCADE ON UPDATE NO ACTION
);

-- ----------------------------
-- Records of AssetsTransferRecord
-- ----------------------------
INSERT INTO "AssetsTransferRecord" VALUES (1, 0, 1748368643759, 1748368561412, 2, 3, 'dcm het tien', 20000000, 500000, -1, 1, 0);

-- ----------------------------
-- Table structure for Budget
-- ----------------------------
DROP TABLE IF EXISTS "Budget";
CREATE TABLE "Budget" (
  "id" INTEGER PRIMARY KEY AUTOINCREMENT,
  "record_type_id" INTEGER NOT NULL,
  "remark" TEXT NOT NULL,
  "month" INTEGER,
  "money" INTEGER NOT NULL
);

-- ----------------------------
-- Records of Budget
-- ----------------------------
INSERT INTO "Budget" VALUES (1, -1, '', 1748442620584, 200000000);

-- ----------------------------
-- Table structure for Ledger
-- ----------------------------
DROP TABLE IF EXISTS "Ledger";
CREATE TABLE "Ledger" (
  "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  "create_time" INTEGER NOT NULL,
  "name" TEXT NOT NULL,
  "remark" TEXT,
  "img_name" TEXT NOT NULL,
  "state" INTEGER NOT NULL,
  "deletable" INTEGER NOT NULL
);

-- ----------------------------
-- Records of Ledger
-- ----------------------------
INSERT INTO "Ledger" VALUES (1, 1741254397052, 'ledger_default_name', NULL, 'type_education_book_coffe', 0, 1);

-- ----------------------------
-- Table structure for Record
-- ----------------------------
DROP TABLE IF EXISTS "Record";
CREATE TABLE "Record" (
  "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  "money" INTEGER,
  "remark" TEXT,
  "time" INTEGER,
  "create_time" INTEGER,
  "record_type_id" INTEGER NOT NULL,
  "assets_id" INTEGER,
  "recurrence_id" INTEGER NOT NULL,
  "ledger_id" INTEGER NOT NULL,
  "star" INTEGER NOT NULL,
  FOREIGN KEY ("record_type_id") REFERENCES "RecordType" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
  FOREIGN KEY ("assets_id") REFERENCES "Assets" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- ----------------------------
-- Records of Record
-- ----------------------------
INSERT INTO "Record" VALUES (1, 12300000, 'hhh', 1748361599044, 1748361617282, 14, 3, -1, 1, 0);
INSERT INTO "Record" VALUES (2, 700000, '', 1748361900102, 1748361909105, 9, 3, -1, 1, 0);
INSERT INTO "Record" VALUES (3, 12000000, '', 1748361911963, 1748361920172, 11, 3, -1, 1, 0);
INSERT INTO "Record" VALUES (4, 1000000000, '', 1748368813255, 1748368851925, 29, 3, -1, 1, 0);
INSERT INTO "Record" VALUES (5, 1200000, '', 1748368988791, 1748369008815, 3, 2, -1, 1, 0);
INSERT INTO "Record" VALUES (6, 6000000, '', 1748442642785, 1748442648082, 17, 2, -1, 1, 0);

-- ----------------------------
-- Table structure for RecordType
-- ----------------------------
DROP TABLE IF EXISTS "RecordType";
CREATE TABLE "RecordType" (
  "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  "name" TEXT,
  "img_name" TEXT,
  "type" INTEGER NOT NULL,
  "ranking" INTEGER NOT NULL,
  "state" INTEGER NOT NULL,
  "parent_id" INTEGER NOT NULL
);

-- ----------------------------
-- Records of RecordType
-- ----------------------------
INSERT INTO "RecordType" VALUES (1, 'type_eat_hamburger', 'type_eat_hamburger', 0, 0, 0, -1);
INSERT INTO "RecordType" VALUES (2, 'type_fruit_avocado', 'type_fruit_mango', 0, 1, 0, -1);
INSERT INTO "RecordType" VALUES (3, 'type_eat_cola', 'type_eat_cola', 0, 2, 0, -1);
INSERT INTO "RecordType" VALUES (4, 'type_eat_cake', 'type_eat_bake', 0, 3, 0, -1);
INSERT INTO "RecordType" VALUES (5, 'type_eat_noodle', 'type_eat_noodle', 0, 4, 0, -1);
INSERT INTO "RecordType" VALUES (6, 'type_vegetable_carrot', 'type_vegetable_broccoli', 0, 5, 0, -1);
INSERT INTO "RecordType" VALUES (7, 'type_eat_coffe', 'type_eat_coffe', 0, 6, 0, -1);
INSERT INTO "RecordType" VALUES (8, 'type_traffic_jeep', 'type_traffic_mini', 0, 7, 0, -1);
INSERT INTO "RecordType" VALUES (9, 'type_traffic_bus', 'type_traffic_bus', 0, 8, 0, -1);
INSERT INTO "RecordType" VALUES (10, 'type_traffic_fly', 'type_traffic_fly', 0, 9, 0, -1);
INSERT INTO "RecordType" VALUES (11, 'type_shop_shoes_1', 'type_shop_shoes_1', 0, 10, 0, -1);
INSERT INTO "RecordType" VALUES (12, 'type_shop_trousers', 'type_shop_shirt', 0, 11, 0, -1);
INSERT INTO "RecordType" VALUES (13, 'type_shop_iwatch', 'type_shop_iwatch', 0, 12, 0, -1);
INSERT INTO "RecordType" VALUES (14, 'type_shop_perfume', 'type_shop_perfume', 0, 13, 0, -1);
INSERT INTO "RecordType" VALUES (15, 'type_happy_switch', 'type_happy_switch', 0, 14, 0, -1);
INSERT INTO "RecordType" VALUES (16, 'type_sport_football', 'type_sport_football', 0, 15, 0, -1);
INSERT INTO "RecordType" VALUES (17, 'type_medical_pill', 'type_medical_pill', 0, 16, 0, -1);
INSERT INTO "RecordType" VALUES (18, 'type_medical_tooth', 'type_medical_tooth', 0, 17, 0, -1);
INSERT INTO "RecordType" VALUES (19, 'type_life_shampoo', 'type_life_shampoo', 0, 18, 0, -1);
INSERT INTO "RecordType" VALUES (20, 'type_medical_heart', 'type_medical_heart', 0, 19, 0, -1);
INSERT INTO "RecordType" VALUES (21, 'type_life_party', 'type_life_party', 0, 20, 0, -1);
INSERT INTO "RecordType" VALUES (22, 'type_life_axe', 'type_life_axe', 0, 21, 0, -1);
INSERT INTO "RecordType" VALUES (23, 'type_education_bag', 'type_education_bag', 0, 22, 0, -1);
INSERT INTO "RecordType" VALUES (24, 'type_education_knife', 'type_education_knife', 0, 23, 0, -1);
INSERT INTO "RecordType" VALUES (25, 'type_life_express', 'type_life_express', 0, 24, 0, -1);
INSERT INTO "RecordType" VALUES (26, 'type_pet_cat', 'type_pet_cat', 0, 25, 0, -1);
INSERT INTO "RecordType" VALUES (27, 'type_pet_dog', 'type_pet_dog', 0, 26, 0, -1);
INSERT INTO "RecordType" VALUES (28, 'type_pet_bowl', 'type_pet_food', 0, 27, 0, -1);
INSERT INTO "RecordType" VALUES (29, 'type_income_cash', 'type_income_cash', 1, 1, 0, -1);
INSERT INTO "RecordType" VALUES (30, 'type_income_safebox', 'type_income_safebox', 1, 2, 0, -1);
INSERT INTO "RecordType" VALUES (31, 'type_income_save_money', 'type_income_save_money', 1, 3, 0, -1);
INSERT INTO "RecordType" VALUES (32, 'type_income_money_managemnt', 'type_income_money_managemnt', 1, 4, 0, -1);
INSERT INTO "RecordType" VALUES (33, 'type_income_awards', 'type_income_awards', 1, 5, 0, -1);
INSERT INTO "RecordType" VALUES (34, 'type_income_sale', 'type_income_sale', 1, 6, 0, -1);
INSERT INTO "RecordType" VALUES (35, 'type_income_stock', 'type_income_stock', 1, 7, 0, -1);
INSERT INTO "RecordType" VALUES (36, 'type_income_bank_card', 'type_income_bank_card', 1, 8, 0, -1);
INSERT INTO "RecordType" VALUES (37, 'type_income_receipt', 'type_income_receipt', 1, 9, 0, -1);
INSERT INTO "RecordType" VALUES (38, 'type_income_other', 'type_income_other', 1, 10, 0, -1);

-- ----------------------------
-- Table structure for Recurrence
-- ----------------------------
DROP TABLE IF EXISTS "Recurrence";
CREATE TABLE "Recurrence" (
  "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  "create_time" INTEGER,
  "record_type_id" INTEGER,
  "assets_id" INTEGER,
  "assets_out_id" INTEGER,
  "assets_in_id" INTEGER,
  "money" INTEGER,
  "remark" TEXT,
  "cycle_type" INTEGER,
  "cycle_interval" INTEGER,
  "cycle_times" TEXT,
  "end_type" INTEGER,
  "start_time" INTEGER,
  "end_time" INTEGER,
  "end_counts" INTEGER,
  "exe_counts" INTEGER,
  "paused" INTEGER,
  "ledger_id" INTEGER NOT NULL
);

-- ----------------------------
-- Records of Recurrence
-- ----------------------------

-- ----------------------------
-- Table structure for Reimburse
-- ----------------------------
DROP TABLE IF EXISTS "Reimburse";
CREATE TABLE "Reimburse" (
  "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  "money" INTEGER NOT NULL,
  "reimburse_money" INTEGER NOT NULL,
  "remark" TEXT,
  "time" INTEGER,
  "create_time" INTEGER,
  "record_type_id" INTEGER NOT NULL,
  "reimburse_state" INTEGER NOT NULL,
  "assets_id" INTEGER NOT NULL,
  "refund_assets_id" INTEGER NOT NULL,
  "ledger_id" INTEGER NOT NULL,
  "star" INTEGER NOT NULL,
  FOREIGN KEY ("record_type_id") REFERENCES "RecordType" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
  FOREIGN KEY ("assets_id") REFERENCES "Assets" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- ----------------------------
-- Records of Reimburse
-- ----------------------------

-- ----------------------------
-- Table structure for android_metadata
-- ----------------------------
DROP TABLE IF EXISTS "android_metadata";
CREATE TABLE "android_metadata" (
  "locale" TEXT
);

-- ----------------------------
-- Records of android_metadata
-- ----------------------------
INSERT INTO "android_metadata" VALUES ('en_US');

-- ----------------------------
-- Table structure for room_master_table
-- ----------------------------
DROP TABLE IF EXISTS "room_master_table";
CREATE TABLE "room_master_table" (
  "id" INTEGER,
  "identity_hash" TEXT,
  PRIMARY KEY ("id")
);

-- ----------------------------
-- Records of room_master_table
-- ----------------------------
INSERT INTO "room_master_table" VALUES (42, '2573617bb0811885d5ed9de012d19f84');

-- ----------------------------
-- Table structure for sqlite_sequence
-- ----------------------------
DROP TABLE IF EXISTS "sqlite_sequence";
CREATE TABLE "sqlite_sequence" (
  "name" ,
  "seq" 
);

-- ----------------------------
-- Records of sqlite_sequence
-- ----------------------------
INSERT INTO "sqlite_sequence" VALUES ('Ledger', 1);
INSERT INTO "sqlite_sequence" VALUES ('RecordType', 38);
INSERT INTO "sqlite_sequence" VALUES ('Assets', 3);
INSERT INTO "sqlite_sequence" VALUES ('AssetsSummaryRecord', 16);
INSERT INTO "sqlite_sequence" VALUES ('Record', 6);
INSERT INTO "sqlite_sequence" VALUES ('AssetsTransferRecord', 1);
INSERT INTO "sqlite_sequence" VALUES ('Budget', 1);

-- ----------------------------
-- Auto increment value for Assets
-- ----------------------------
UPDATE "sqlite_sequence" SET seq = 3 WHERE name = 'Assets';

-- ----------------------------
-- Indexes structure for table AssetsModifyRecord
-- ----------------------------
CREATE INDEX "index_AssetsModifyRecord_assets_id_create_time"
ON "AssetsModifyRecord" (
  "assets_id" ASC,
  "create_time" ASC
);

-- ----------------------------
-- Auto increment value for AssetsSummaryRecord
-- ----------------------------
UPDATE "sqlite_sequence" SET seq = 16 WHERE name = 'AssetsSummaryRecord';

-- ----------------------------
-- Auto increment value for AssetsTransferRecord
-- ----------------------------
UPDATE "sqlite_sequence" SET seq = 1 WHERE name = 'AssetsTransferRecord';

-- ----------------------------
-- Indexes structure for table AssetsTransferRecord
-- ----------------------------
CREATE INDEX "index_AssetsTransferRecord_assets_id_form_assets_id_to"
ON "AssetsTransferRecord" (
  "assets_id_form" ASC,
  "assets_id_to" ASC
);

-- ----------------------------
-- Auto increment value for Budget
-- ----------------------------
UPDATE "sqlite_sequence" SET seq = 1 WHERE name = 'Budget';

-- ----------------------------
-- Auto increment value for Ledger
-- ----------------------------
UPDATE "sqlite_sequence" SET seq = 1 WHERE name = 'Ledger';

-- ----------------------------
-- Auto increment value for Record
-- ----------------------------
UPDATE "sqlite_sequence" SET seq = 6 WHERE name = 'Record';

-- ----------------------------
-- Indexes structure for table Record
-- ----------------------------
CREATE INDEX "index_Record_record_type_id_time_money_create_time"
ON "Record" (
  "record_type_id" ASC,
  "time" ASC,
  "money" ASC,
  "create_time" ASC
);

-- ----------------------------
-- Auto increment value for RecordType
-- ----------------------------
UPDATE "sqlite_sequence" SET seq = 38 WHERE name = 'RecordType';

-- ----------------------------
-- Indexes structure for table RecordType
-- ----------------------------
CREATE INDEX "index_RecordType_type_ranking_state"
ON "RecordType" (
  "type" ASC,
  "ranking" ASC,
  "state" ASC
);

PRAGMA foreign_keys = true;
