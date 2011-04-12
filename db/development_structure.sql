CREATE TABLE "carts" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "created_at" datetime, "updated_at" datetime);
CREATE TABLE "credits" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255), "number" integer, "address" varchar(255), "city" varchar(255), "state" varchar(255), "zip" integer, "expiration" varchar(255), "created_at" datetime, "updated_at" datetime);
CREATE TABLE "line_items" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "product_id" integer, "cart_id" integer, "status" integer DEFAULT 0, "order_status" integer DEFAULT 0, "created_at" datetime, "updated_at" datetime, "quantity" integer DEFAULT 1, "order_id" integer, "status1" integer DEFAULT 0);
CREATE TABLE "orders" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255), "address" text, "email" varchar(255), "pay_type" varchar(255), "order_status" integer DEFAULT 0, "created_at" datetime, "updated_at" datetime, "order_status1" integer DEFAULT 0);
CREATE TABLE "products" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "title" varchar(255), "description" text, "image_url" varchar(255), "price" decimal(8,2), "created_at" datetime, "updated_at" datetime);
CREATE TABLE "schema_migrations" ("version" varchar(255) NOT NULL);
CREATE TABLE "stands" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255), "location" varchar(255), "created_at" datetime, "updated_at" datetime);
CREATE TABLE "users" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255), "hashed_password" varchar(255), "salt" varchar(255), "created_at" datetime, "updated_at" datetime);
CREATE TABLE "venues" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255), "created_at" datetime, "updated_at" datetime);
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
INSERT INTO schema_migrations (version) VALUES ('20110411210528');

INSERT INTO schema_migrations (version) VALUES ('20110223193054');

INSERT INTO schema_migrations (version) VALUES ('20110226193127');

INSERT INTO schema_migrations (version) VALUES ('20110226193452');

INSERT INTO schema_migrations (version) VALUES ('20110226200035');

INSERT INTO schema_migrations (version) VALUES ('20110226200917');

INSERT INTO schema_migrations (version) VALUES ('20110227194952');

INSERT INTO schema_migrations (version) VALUES ('20110227195020');

INSERT INTO schema_migrations (version) VALUES ('20110227205534');

INSERT INTO schema_migrations (version) VALUES ('20110322180133');

INSERT INTO schema_migrations (version) VALUES ('20110322180144');

INSERT INTO schema_migrations (version) VALUES ('20110406214711');