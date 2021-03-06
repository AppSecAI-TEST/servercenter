drop SCHEMA if exists  `zm_order`;
CREATE SCHEMA `zm_order` ;


use zm_order;



drop table if exists  `zm_order`.`order_base`;

CREATE TABLE `zm_order`.`order_base` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_id` CHAR(20) NOT NULL,
  `combination_id` CHAR(20) NULL COMMENT '订单拆分后的总ID',
  `user_id` BIGINT UNSIGNED NOT NULL,
  `express_type` TINYINT UNSIGNED NOT NULL COMMENT '0：快递；1：自提',
  `status` TINYINT UNSIGNED NOT NULL DEFAULT 0,
  `regional_center_id` BIGINT UNSIGNED NULL COMMENT '区域中心ID',
  `shop_id` BIGINT UNSIGNED NULL COMMENT '单店ID',
  `supplier_id` BIGINT UNSIGNED NULL,
  `tdq` TINYINT UNSIGNED NOT NULL DEFAULT 0,
  `payment` DECIMAL NULL,
  `pay_time` DATETIME NULL,
  `carrier_key` VARCHAR(50) NULL,
  `express_id` VARCHAR(50) NULL,
  `gtime` DATETIME NULL,
  `send_time` DATETIME NULL,
  `create_time` DATETIME NULL,
  `update_time` DATETIME NULL,
  `remark` VARCHAR(200) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `uk_orderId` (`order_id` ASC),
  INDEX `idx_orderId` (`order_id` ASC),
  INDEX `idx_combinationId` (`combination_id` ASC),
  INDEX `idx_userId` (`user_id` ASC),
  INDEX `idx_status` (`status` ASC),
  INDEX `idx_regionalCenterId` (`regional_center_id` ASC),
  INDEX `idx_shopId` (`shop_id` ASC),
  INDEX `idx_supplierId` (`supplier_id` ASC),
  INDEX `idx_createTime` (`create_time` ASC),
  INDEX `idx_expressId` (`express_id` ASC)
  )ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 
COMMENT = '订单基本信息';



drop table if exists  `zm_order`.`order_detail`;

CREATE TABLE `zm_order`.`order_detail` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_id` CHAR(20) NOT NULL,
  `order_flag` TINYINT UNSIGNED NOT NULL COMMENT '0:跨境；1一般贸易',
  `pay_no` VARCHAR(100) NULL,
  `delivery_place` VARCHAR(50)  NULL,
  `carry_address` VARCHAR(200)  NULL COMMENT '自提地址',
  `receive_name` VARCHAR(50) NOT NULL,
  `receive_phone` CHAR(15) NOT NULL ,
  `receive_province` VARCHAR(30) NOT NULL ,
  `receive_city` VARCHAR(30) NOT NULL,
  `receive_area` VARCHAR(30) NOT NULL,
  `receive_address` VARCHAR(100) NOT NULL,
  `receive_zip_code` CHAR(6) NOT NULL,
  `create_time` DATETIME NULL,
  `update_time` DATETIME NULL,
  `remark` VARCHAR(200) NULL,
  PRIMARY KEY (`id`),
  INDEX `idx_orderId` (`order_id` ASC),
  UNIQUE INDEX `uk_payNo` (`pay_no` ASC),
  UNIQUE INDEX `uk_orderId` (`order_id` ASC),
  INDEX `idx_deliveryPlace` (`delivery_place` ASC),
  INDEX `idx_orderFlag` (`order_flag` ASC)
  )ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 
COMMENT = '订单详细信息';



drop table if exists  `zm_order`.`order_goods`;

CREATE TABLE `zm_order`.`order_goods` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_id` CHAR(20) NOT NULL,
  `item_id` VARCHAR(100) NOT NULL,
  `sku` VARCHAR(50) NULL,
  `item_name` VARCHAR(100) NULL,
  `item_code` VARCHAR(100) NULL,
  `item_quantity` INT UNSIGNED NOT NULL,
  `item_price` DECIMAL NOT NULL,
  `actual_price` DECIMAL NOT NULL,
  `create_time` DATETIME NULL,
  `update_time` DATETIME NULL,
  `remark` VARCHAR(200) NULL,
  PRIMARY KEY (`id`),
  INDEX `idx_orderId` (`order_id` ASC),
  INDEX `idx_itemId` (`item_id` ASC),
  INDEX `idx_sku` (`sku` ASC),
  INDEX `idx_itemCode` (`item_code` ASC)
  )ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 
COMMENT = '订单商品';




drop table if exists  `zm_order`.`customs_status`;

CREATE TABLE `zm_order`.`customs_status` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_id` CHAR(20) NOT NULL,
  `status` TINYINT UNSIGNED NOT NULL,
  `create_time` DATETIME NULL,
  `update_time` DATETIME NULL,
  `remark` VARCHAR(200) NULL,
  PRIMARY KEY (`id`),
  INDEX `idx_orderId` (`order_id` ASC)
  )ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 
COMMENT = '跨境订单海关状态';




drop table if exists  `zm_order`.`order_shopping_cart`;

CREATE TABLE `zm_order`.`order_shopping_cart` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` BIGINT UNSIGNED NULL,
  `item_id` VARCHAR(100) NOT NULL,
  `sku` VARCHAR(50) NULL,
  `item_name` VARCHAR(100) NULL,
  `item_code` VARCHAR(100) NULL,
  `item_quantity` INT UNSIGNED NOT NULL,
  `creati_time` DATETIME NULL,
  `update_time` DATETIME NULL,
  `remark` VARCHAR(200) NULL,
  PRIMARY KEY (`id`),
  INDEX `idx_userId` (`user_id` ASC)
  )ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 
COMMENT = '购物车';




drop table if exists  `zm_order`.`order_back_record`;

CREATE TABLE `zm_order`.`order_back_record` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_id` CHAR(20) NOT NULL,
  `status` TINYINT UNSIGNED NULL COMMENT '0:未发送，1：发送成功',
  `send_time` DATETIME NULL,
  `create_time` DATETIME NULL,
  `update_time` DATETIME NULL,
  `remark` VARCHAR(200) NULL,
  PRIMARY KEY (`id`),
  INDEX `idx_orderId` (`order_id` ASC)
  )ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 
COMMENT = '退单记录';




drop table if exists  `zm_order`.`order_api`;

CREATE TABLE `zm_order`.`order_api` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `api_url` VARCHAR(100) NOT NULL,
  `name` VARCHAR(100) NOT NULL,
  `create_time` DATETIME NULL,
  `update_time` DATETIME NULL,
  `opt` VARCHAR(20) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `api_url_UNIQUE` (`api_url` ASC),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC)
  )ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 
COMMENT = '订单API';




drop table if exists  `zm_order`.`order_search_parameter`;

CREATE TABLE `zm_order`.`order_search_parameter` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `api_name` VARCHAR(100) NOT NULL,
  `key_name` VARCHAR(45) NOT NULL COMMENT '字段中文名',
  `key` VARCHAR(45) NULL,
  `value` VARCHAR(100) NULL,
  `html_tag` VARCHAR(30) NULL,
  `type` TINYINT UNSIGNED NULL,
  `create_time` DATETIME NULL,
  `update_time` DATETIME NULL,
  `opt` VARCHAR(20) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `uk_apiName` (`api_name` ASC),
  INDEX `idx_apiName` (`api_name` ASC)
  )ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 
COMMENT = '订单字段表';
