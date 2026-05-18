/*
 Navicat Premium Data Transfer

 Source Server         : 电信测试pgsql
 Source Server Type    : PostgreSQL
 Source Server Version : 120007
 Source Host           : 134.108.27.146:18801
 Source Catalog        : kms_data
 Source Schema         : xxl-job

 Target Server Type    : PostgreSQL
 Target Server Version : 120007
 File Encoding         : 65001

 Date: 18/05/2026 14:34:17
*/


-- ----------------------------
-- Sequence structure for xxl_job_group_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "xxl-job"."xxl_job_group_id_seq";
CREATE SEQUENCE "xxl-job"."xxl_job_group_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for xxl_job_info_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "xxl-job"."xxl_job_info_id_seq";
CREATE SEQUENCE "xxl-job"."xxl_job_info_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for xxl_job_log_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "xxl-job"."xxl_job_log_id_seq";
CREATE SEQUENCE "xxl-job"."xxl_job_log_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for xxl_job_log_report_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "xxl-job"."xxl_job_log_report_id_seq";
CREATE SEQUENCE "xxl-job"."xxl_job_log_report_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for xxl_job_logglue_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "xxl-job"."xxl_job_logglue_id_seq";
CREATE SEQUENCE "xxl-job"."xxl_job_logglue_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for xxl_job_registry_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "xxl-job"."xxl_job_registry_id_seq";
CREATE SEQUENCE "xxl-job"."xxl_job_registry_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for xxl_job_user_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "xxl-job"."xxl_job_user_id_seq";
CREATE SEQUENCE "xxl-job"."xxl_job_user_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Table structure for xxl_job_group
-- ----------------------------
DROP TABLE IF EXISTS "xxl-job"."xxl_job_group";
CREATE TABLE "xxl-job"."xxl_job_group" (
  "id" int4 NOT NULL DEFAULT nextval('"xxl-job".xxl_job_group_id_seq'::regclass),
  "app_name" varchar(64) COLLATE "pg_catalog"."default" NOT NULL,
  "title" varchar(12) COLLATE "pg_catalog"."default" NOT NULL,
  "address_type" int2 NOT NULL DEFAULT 0,
  "address_list" text COLLATE "pg_catalog"."default",
  "update_time" timestamp(6)
)
;
COMMENT ON COLUMN "xxl-job"."xxl_job_group"."app_name" IS '执行器AppName';
COMMENT ON COLUMN "xxl-job"."xxl_job_group"."title" IS '执行器名称';
COMMENT ON COLUMN "xxl-job"."xxl_job_group"."address_type" IS '执行器地址类型：0=自动注册、1=手动录入';
COMMENT ON COLUMN "xxl-job"."xxl_job_group"."address_list" IS '执行器地址列表，多地址逗号分隔';
COMMENT ON COLUMN "xxl-job"."xxl_job_group"."update_time" IS '更新时间';
COMMENT ON TABLE "xxl-job"."xxl_job_group" IS '执行器组表';

-- ----------------------------
-- Records of xxl_job_group
-- ----------------------------
INSERT INTO "xxl-job"."xxl_job_group" VALUES (1, 'xxl-job-executor-sample', '示例执行器', 1, 'http://134.96.254.241:9999/', '2025-12-29 16:28:52.167618');

-- ----------------------------
-- Table structure for xxl_job_info
-- ----------------------------
DROP TABLE IF EXISTS "xxl-job"."xxl_job_info";
CREATE TABLE "xxl-job"."xxl_job_info" (
  "id" int4 NOT NULL DEFAULT nextval('"xxl-job".xxl_job_info_id_seq'::regclass),
  "job_group" int4 NOT NULL,
  "job_desc" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "add_time" timestamp(6),
  "update_time" timestamp(6),
  "author" varchar(64) COLLATE "pg_catalog"."default",
  "alarm_email" varchar(255) COLLATE "pg_catalog"."default",
  "schedule_type" varchar(50) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'NONE'::character varying,
  "schedule_conf" varchar(128) COLLATE "pg_catalog"."default",
  "misfire_strategy" varchar(50) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'DO_NOTHING'::character varying,
  "executor_route_strategy" varchar(50) COLLATE "pg_catalog"."default",
  "executor_handler" varchar(255) COLLATE "pg_catalog"."default",
  "executor_param" varchar(512) COLLATE "pg_catalog"."default",
  "executor_block_strategy" varchar(50) COLLATE "pg_catalog"."default",
  "executor_timeout" int4 NOT NULL DEFAULT 0,
  "executor_fail_retry_count" int4 NOT NULL DEFAULT 0,
  "glue_type" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "glue_source" text COLLATE "pg_catalog"."default",
  "glue_remark" varchar(128) COLLATE "pg_catalog"."default",
  "glue_updatetime" timestamp(6),
  "child_jobid" varchar(255) COLLATE "pg_catalog"."default",
  "trigger_status" int2 NOT NULL DEFAULT 0,
  "trigger_last_time" int8 NOT NULL DEFAULT 0,
  "trigger_next_time" int8 NOT NULL DEFAULT 0
)
;
COMMENT ON COLUMN "xxl-job"."xxl_job_info"."job_group" IS '执行器主键ID';
COMMENT ON COLUMN "xxl-job"."xxl_job_info"."job_desc" IS '任务描述';
COMMENT ON COLUMN "xxl-job"."xxl_job_info"."add_time" IS '添加时间';
COMMENT ON COLUMN "xxl-job"."xxl_job_info"."update_time" IS '更新时间';
COMMENT ON COLUMN "xxl-job"."xxl_job_info"."author" IS '作者';
COMMENT ON COLUMN "xxl-job"."xxl_job_info"."alarm_email" IS '报警邮件';
COMMENT ON COLUMN "xxl-job"."xxl_job_info"."schedule_type" IS '调度类型';
COMMENT ON COLUMN "xxl-job"."xxl_job_info"."schedule_conf" IS '调度配置，值含义取决于调度类型';
COMMENT ON COLUMN "xxl-job"."xxl_job_info"."misfire_strategy" IS '调度过期策略';
COMMENT ON COLUMN "xxl-job"."xxl_job_info"."executor_route_strategy" IS '执行器路由策略';
COMMENT ON COLUMN "xxl-job"."xxl_job_info"."executor_handler" IS '执行器任务handler';
COMMENT ON COLUMN "xxl-job"."xxl_job_info"."executor_param" IS '执行器任务参数';
COMMENT ON COLUMN "xxl-job"."xxl_job_info"."executor_block_strategy" IS '阻塞处理策略';
COMMENT ON COLUMN "xxl-job"."xxl_job_info"."executor_timeout" IS '任务执行超时时间，单位秒';
COMMENT ON COLUMN "xxl-job"."xxl_job_info"."executor_fail_retry_count" IS '失败重试次数';
COMMENT ON COLUMN "xxl-job"."xxl_job_info"."glue_type" IS 'GLUE类型';
COMMENT ON COLUMN "xxl-job"."xxl_job_info"."glue_source" IS 'GLUE源代码';
COMMENT ON COLUMN "xxl-job"."xxl_job_info"."glue_remark" IS 'GLUE备注';
COMMENT ON COLUMN "xxl-job"."xxl_job_info"."glue_updatetime" IS 'GLUE更新时间';
COMMENT ON COLUMN "xxl-job"."xxl_job_info"."child_jobid" IS '子任务ID，多个逗号分隔';
COMMENT ON COLUMN "xxl-job"."xxl_job_info"."trigger_status" IS '调度状态：0-停止，1-运行';
COMMENT ON COLUMN "xxl-job"."xxl_job_info"."trigger_last_time" IS '上次调度时间';
COMMENT ON COLUMN "xxl-job"."xxl_job_info"."trigger_next_time" IS '下次调度时间';
COMMENT ON TABLE "xxl-job"."xxl_job_info" IS '任务信息表';

-- ----------------------------
-- Records of xxl_job_info
-- ----------------------------
INSERT INTO "xxl-job"."xxl_job_info" VALUES (1, 1, '测试任务1', '2018-11-03 22:21:31', '2018-11-03 22:21:31', 'XXL', '', 'CRON', '0 0 0 * * ? *', 'DO_NOTHING', 'FIRST', 'demoJobHandler', '', 'SERIAL_EXECUTION', 0, 0, 'BEAN', '', 'GLUE代码初始化', '2018-11-03 22:21:31', '', 0, 0, 0);

-- ----------------------------
-- Table structure for xxl_job_lock
-- ----------------------------
DROP TABLE IF EXISTS "xxl-job"."xxl_job_lock";
CREATE TABLE "xxl-job"."xxl_job_lock" (
  "lock_name" varchar(50) COLLATE "pg_catalog"."default" NOT NULL
)
;
COMMENT ON COLUMN "xxl-job"."xxl_job_lock"."lock_name" IS '锁名称';
COMMENT ON TABLE "xxl-job"."xxl_job_lock" IS '锁表';

-- ----------------------------
-- Records of xxl_job_lock
-- ----------------------------
INSERT INTO "xxl-job"."xxl_job_lock" VALUES ('schedule_lock');

-- ----------------------------
-- Table structure for xxl_job_log
-- ----------------------------
DROP TABLE IF EXISTS "xxl-job"."xxl_job_log";
CREATE TABLE "xxl-job"."xxl_job_log" (
  "id" int8 NOT NULL DEFAULT nextval('"xxl-job".xxl_job_log_id_seq'::regclass),
  "job_group" int4 NOT NULL,
  "job_id" int4 NOT NULL,
  "executor_address" varchar(255) COLLATE "pg_catalog"."default",
  "executor_handler" varchar(255) COLLATE "pg_catalog"."default",
  "executor_param" varchar(512) COLLATE "pg_catalog"."default",
  "executor_sharding_param" varchar(20) COLLATE "pg_catalog"."default",
  "executor_fail_retry_count" int4 NOT NULL DEFAULT 0,
  "trigger_time" timestamp(6),
  "trigger_code" int4 NOT NULL,
  "trigger_msg" text COLLATE "pg_catalog"."default",
  "handle_time" timestamp(6),
  "handle_code" int4 NOT NULL,
  "handle_msg" text COLLATE "pg_catalog"."default",
  "alarm_status" int2 NOT NULL DEFAULT 0
)
;
COMMENT ON COLUMN "xxl-job"."xxl_job_log"."job_group" IS '执行器主键ID';
COMMENT ON COLUMN "xxl-job"."xxl_job_log"."job_id" IS '任务，主键ID';
COMMENT ON COLUMN "xxl-job"."xxl_job_log"."executor_address" IS '执行器地址，本次执行的地址';
COMMENT ON COLUMN "xxl-job"."xxl_job_log"."executor_handler" IS '执行器任务handler';
COMMENT ON COLUMN "xxl-job"."xxl_job_log"."executor_param" IS '执行器任务参数';
COMMENT ON COLUMN "xxl-job"."xxl_job_log"."executor_sharding_param" IS '执行器任务分片参数，格式如 1/2';
COMMENT ON COLUMN "xxl-job"."xxl_job_log"."executor_fail_retry_count" IS '失败重试次数';
COMMENT ON COLUMN "xxl-job"."xxl_job_log"."trigger_time" IS '调度-时间';
COMMENT ON COLUMN "xxl-job"."xxl_job_log"."trigger_code" IS '调度-结果';
COMMENT ON COLUMN "xxl-job"."xxl_job_log"."trigger_msg" IS '调度-日志';
COMMENT ON COLUMN "xxl-job"."xxl_job_log"."handle_time" IS '执行-时间';
COMMENT ON COLUMN "xxl-job"."xxl_job_log"."handle_code" IS '执行-状态';
COMMENT ON COLUMN "xxl-job"."xxl_job_log"."handle_msg" IS '执行-日志';
COMMENT ON COLUMN "xxl-job"."xxl_job_log"."alarm_status" IS '告警状态：0-默认、1-无需告警、2-告警成功、3-告警失败';
COMMENT ON TABLE "xxl-job"."xxl_job_log" IS '任务日志表';

-- ----------------------------
-- Records of xxl_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for xxl_job_log_report
-- ----------------------------
DROP TABLE IF EXISTS "xxl-job"."xxl_job_log_report";
CREATE TABLE "xxl-job"."xxl_job_log_report" (
  "id" int4 NOT NULL DEFAULT nextval('"xxl-job".xxl_job_log_report_id_seq'::regclass),
  "trigger_day" timestamp(6),
  "running_count" int4 NOT NULL DEFAULT 0,
  "suc_count" int4 NOT NULL DEFAULT 0,
  "fail_count" int4 NOT NULL DEFAULT 0,
  "update_time" timestamp(6)
)
;
COMMENT ON COLUMN "xxl-job"."xxl_job_log_report"."trigger_day" IS '调度-时间';
COMMENT ON COLUMN "xxl-job"."xxl_job_log_report"."running_count" IS '运行中-日志数量';
COMMENT ON COLUMN "xxl-job"."xxl_job_log_report"."suc_count" IS '执行成功-日志数量';
COMMENT ON COLUMN "xxl-job"."xxl_job_log_report"."fail_count" IS '执行失败-日志数量';
COMMENT ON COLUMN "xxl-job"."xxl_job_log_report"."update_time" IS '更新时间';
COMMENT ON TABLE "xxl-job"."xxl_job_log_report" IS '日志报表';

-- ----------------------------
-- Records of xxl_job_log_report
-- ----------------------------
INSERT INTO "xxl-job"."xxl_job_log_report" VALUES (145, '2026-05-18 00:00:00', 0, 0, 0, NULL);
INSERT INTO "xxl-job"."xxl_job_log_report" VALUES (146, '2026-05-17 00:00:00', 0, 0, 0, NULL);
INSERT INTO "xxl-job"."xxl_job_log_report" VALUES (147, '2026-05-16 00:00:00', 0, 0, 0, NULL);

-- ----------------------------
-- Table structure for xxl_job_logglue
-- ----------------------------
DROP TABLE IF EXISTS "xxl-job"."xxl_job_logglue";
CREATE TABLE "xxl-job"."xxl_job_logglue" (
  "id" int4 NOT NULL DEFAULT nextval('"xxl-job".xxl_job_logglue_id_seq'::regclass),
  "job_id" int4 NOT NULL,
  "glue_type" varchar(50) COLLATE "pg_catalog"."default",
  "glue_source" text COLLATE "pg_catalog"."default",
  "glue_remark" varchar(128) COLLATE "pg_catalog"."default" NOT NULL,
  "add_time" timestamp(6),
  "update_time" timestamp(6)
)
;
COMMENT ON COLUMN "xxl-job"."xxl_job_logglue"."job_id" IS '任务，主键ID';
COMMENT ON COLUMN "xxl-job"."xxl_job_logglue"."glue_type" IS 'GLUE类型';
COMMENT ON COLUMN "xxl-job"."xxl_job_logglue"."glue_source" IS 'GLUE源代码';
COMMENT ON COLUMN "xxl-job"."xxl_job_logglue"."glue_remark" IS 'GLUE备注';
COMMENT ON TABLE "xxl-job"."xxl_job_logglue" IS 'GLUE日志表';

-- ----------------------------
-- Records of xxl_job_logglue
-- ----------------------------

-- ----------------------------
-- Table structure for xxl_job_registry
-- ----------------------------
DROP TABLE IF EXISTS "xxl-job"."xxl_job_registry";
CREATE TABLE "xxl-job"."xxl_job_registry" (
  "id" int4 NOT NULL DEFAULT nextval('"xxl-job".xxl_job_registry_id_seq'::regclass),
  "registry_group" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "registry_key" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "registry_value" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "update_time" timestamp(6)
)
;
COMMENT ON COLUMN "xxl-job"."xxl_job_registry"."registry_group" IS '注册组';
COMMENT ON COLUMN "xxl-job"."xxl_job_registry"."registry_key" IS '注册键';
COMMENT ON COLUMN "xxl-job"."xxl_job_registry"."registry_value" IS '注册值';
COMMENT ON COLUMN "xxl-job"."xxl_job_registry"."update_time" IS '更新时间';
COMMENT ON TABLE "xxl-job"."xxl_job_registry" IS '注册表';

-- ----------------------------
-- Records of xxl_job_registry
-- ----------------------------
INSERT INTO "xxl-job"."xxl_job_registry" VALUES (99, 'EXECUTOR', 'xxl-job-executor-sample', 'http://172.26.0.58:9999/', '2025-12-29 17:58:33.373536');
INSERT INTO "xxl-job"."xxl_job_registry" VALUES (98, 'EXECUTOR', 'xxl-job-executor-sample', 'http://134.96.254.241:9999/', '2026-05-18 14:34:01.872611');

-- ----------------------------
-- Table structure for xxl_job_user
-- ----------------------------
DROP TABLE IF EXISTS "xxl-job"."xxl_job_user";
CREATE TABLE "xxl-job"."xxl_job_user" (
  "id" int4 NOT NULL DEFAULT nextval('"xxl-job".xxl_job_user_id_seq'::regclass),
  "username" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "password" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "role" int2 NOT NULL,
  "permission" varchar(255) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "xxl-job"."xxl_job_user"."username" IS '账号';
COMMENT ON COLUMN "xxl-job"."xxl_job_user"."password" IS '密码';
COMMENT ON COLUMN "xxl-job"."xxl_job_user"."role" IS '角色：0-普通用户、1-管理员';
COMMENT ON COLUMN "xxl-job"."xxl_job_user"."permission" IS '权限：执行器ID列表，多个逗号分割';
COMMENT ON TABLE "xxl-job"."xxl_job_user" IS '用户表';

-- ----------------------------
-- Records of xxl_job_user
-- ----------------------------
INSERT INTO "xxl-job"."xxl_job_user" VALUES (1, 'admin', '33bf16a20f85abcaaebc3d611b71db15', 1, NULL);

-- ----------------------------
-- Function structure for upd_timestamp
-- ----------------------------
DROP FUNCTION IF EXISTS "xxl-job"."upd_timestamp"();
CREATE OR REPLACE FUNCTION "xxl-job"."upd_timestamp"()
  RETURNS "pg_catalog"."trigger" AS $BODY$
begin
  new.update_time = current_timestamp;
  return new;
end
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

-- ----------------------------
-- Function structure for update_modified_column
-- ----------------------------
DROP FUNCTION IF EXISTS "xxl-job"."update_modified_column"();
CREATE OR REPLACE FUNCTION "xxl-job"."update_modified_column"()
  RETURNS "pg_catalog"."trigger" AS $BODY$
BEGIN
    NEW.update_time = CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "xxl-job"."xxl_job_group_id_seq"
OWNED BY "xxl-job"."xxl_job_group"."id";
SELECT setval('"xxl-job"."xxl_job_group_id_seq"', 3, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "xxl-job"."xxl_job_info_id_seq"
OWNED BY "xxl-job"."xxl_job_info"."id";
SELECT setval('"xxl-job"."xxl_job_info_id_seq"', 5, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "xxl-job"."xxl_job_log_id_seq"
OWNED BY "xxl-job"."xxl_job_log"."id";
SELECT setval('"xxl-job"."xxl_job_log_id_seq"', 19, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "xxl-job"."xxl_job_log_report_id_seq"
OWNED BY "xxl-job"."xxl_job_log_report"."id";
SELECT setval('"xxl-job"."xxl_job_log_report_id_seq"', 148, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "xxl-job"."xxl_job_logglue_id_seq"
OWNED BY "xxl-job"."xxl_job_logglue"."id";
SELECT setval('"xxl-job"."xxl_job_logglue_id_seq"', 4, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "xxl-job"."xxl_job_registry_id_seq"
OWNED BY "xxl-job"."xxl_job_registry"."id";
SELECT setval('"xxl-job"."xxl_job_registry_id_seq"', 100, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "xxl-job"."xxl_job_user_id_seq"
OWNED BY "xxl-job"."xxl_job_user"."id";
SELECT setval('"xxl-job"."xxl_job_user_id_seq"', 2, true);

-- ----------------------------
-- Triggers structure for table xxl_job_group
-- ----------------------------
CREATE TRIGGER "update_xxl_job_group_modtime" BEFORE UPDATE ON "xxl-job"."xxl_job_group"
FOR EACH ROW
EXECUTE PROCEDURE "xxl-job"."update_modified_column"();

-- ----------------------------
-- Primary Key structure for table xxl_job_group
-- ----------------------------
ALTER TABLE "xxl-job"."xxl_job_group" ADD CONSTRAINT "xxl_job_group_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table xxl_job_info
-- ----------------------------
CREATE INDEX "idx_job_info_job_group" ON "xxl-job"."xxl_job_info" USING btree (
  "job_group" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_job_info_trigger_status" ON "xxl-job"."xxl_job_info" USING btree (
  "trigger_status" "pg_catalog"."int2_ops" ASC NULLS LAST
);

-- ----------------------------
-- Triggers structure for table xxl_job_info
-- ----------------------------
CREATE TRIGGER "update_xxl_job_info_modtime" BEFORE UPDATE ON "xxl-job"."xxl_job_info"
FOR EACH ROW
EXECUTE PROCEDURE "xxl-job"."update_modified_column"();

-- ----------------------------
-- Primary Key structure for table xxl_job_info
-- ----------------------------
ALTER TABLE "xxl-job"."xxl_job_info" ADD CONSTRAINT "xxl_job_info_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table xxl_job_lock
-- ----------------------------
ALTER TABLE "xxl-job"."xxl_job_lock" ADD CONSTRAINT "xxl_job_lock_pkey" PRIMARY KEY ("lock_name");

-- ----------------------------
-- Indexes structure for table xxl_job_log
-- ----------------------------
CREATE INDEX "idx_job_log_alarm_status" ON "xxl-job"."xxl_job_log" USING btree (
  "alarm_status" "pg_catalog"."int2_ops" ASC NULLS LAST
);
CREATE INDEX "idx_job_log_handle_code" ON "xxl-job"."xxl_job_log" USING btree (
  "handle_code" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_job_log_job_group" ON "xxl-job"."xxl_job_log" USING btree (
  "job_group" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_job_log_job_id" ON "xxl-job"."xxl_job_log" USING btree (
  "job_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_job_log_trigger_time" ON "xxl-job"."xxl_job_log" USING btree (
  "trigger_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table xxl_job_log
-- ----------------------------
ALTER TABLE "xxl-job"."xxl_job_log" ADD CONSTRAINT "xxl_job_log_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table xxl_job_log_report
-- ----------------------------
CREATE UNIQUE INDEX "uidx_job_log_report_trigger_day" ON "xxl-job"."xxl_job_log_report" USING btree (
  "trigger_day" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table xxl_job_log_report
-- ----------------------------
ALTER TABLE "xxl-job"."xxl_job_log_report" ADD CONSTRAINT "xxl_job_log_report_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table xxl_job_logglue
-- ----------------------------
CREATE INDEX "idx_job_logglue_job_id" ON "xxl-job"."xxl_job_logglue" USING btree (
  "job_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table xxl_job_logglue
-- ----------------------------
ALTER TABLE "xxl-job"."xxl_job_logglue" ADD CONSTRAINT "xxl_job_logglue_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table xxl_job_registry
-- ----------------------------
CREATE INDEX "idx_job_registry_g_k_v" ON "xxl-job"."xxl_job_registry" USING btree (
  "registry_group" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "registry_key" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "registry_value" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_job_registry_update_time" ON "xxl-job"."xxl_job_registry" USING btree (
  "update_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);

-- ----------------------------
-- Triggers structure for table xxl_job_registry
-- ----------------------------
CREATE TRIGGER "update_xxl_job_registry_modtime" BEFORE UPDATE ON "xxl-job"."xxl_job_registry"
FOR EACH ROW
EXECUTE PROCEDURE "xxl-job"."update_modified_column"();

-- ----------------------------
-- Primary Key structure for table xxl_job_registry
-- ----------------------------
ALTER TABLE "xxl-job"."xxl_job_registry" ADD CONSTRAINT "xxl_job_registry_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table xxl_job_user
-- ----------------------------
CREATE UNIQUE INDEX "uidx_job_user_username" ON "xxl-job"."xxl_job_user" USING btree (
  "username" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table xxl_job_user
-- ----------------------------
ALTER TABLE "xxl-job"."xxl_job_user" ADD CONSTRAINT "xxl_job_user_pkey" PRIMARY KEY ("id");
