-- GODDESS ANTI-CHEAT - SQL Database Schema
-- Complete database structure for all GAC systems

CREATE TABLE IF NOT EXISTS `goddess_ac_bans` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `player_name` VARCHAR(255) NOT NULL,
    `license` VARCHAR(255) UNIQUE,
    `license2` VARCHAR(255),
    `discord` VARCHAR(255),
    `fivem` VARCHAR(255),
    `ip_hash` VARCHAR(255),
    `reason` TEXT NOT NULL,
    `detection` VARCHAR(255),
    `evidence` LONGTEXT,
    `admin` VARCHAR(255),
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `expires_at` TIMESTAMP NULL,
    `permanent` BOOLEAN DEFAULT FALSE,
    `active` BOOLEAN DEFAULT TRUE,
    INDEX `idx_license` (`license`),
    INDEX `idx_active` (`active`),
    INDEX `idx_expires` (`expires_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `goddess_ac_detections` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `player_source` INT NOT NULL,
    `player_name` VARCHAR(255) NOT NULL,
    `detection_type` VARCHAR(255) NOT NULL,
    `severity` VARCHAR(50),
    `score` INT DEFAULT 0,
    `confidence` FLOAT DEFAULT 0,
    `evidence` LONGTEXT,
    `action_taken` VARCHAR(50),
    `timestamp` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `acknowledged` BOOLEAN DEFAULT FALSE,
    `admin_notes` TEXT,
    INDEX `idx_player_source` (`player_source`),
    INDEX `idx_detection_type` (`detection_type`),
    INDEX `idx_timestamp` (`timestamp`),
    INDEX `idx_severity` (`severity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `goddess_ac_resources` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `resource_name` VARCHAR(255) UNIQUE NOT NULL,
    `resource_path` VARCHAR(500),
    `protected` BOOLEAN DEFAULT FALSE,
    `integrity_status` VARCHAR(50) DEFAULT 'unknown',
    `last_scanned` TIMESTAMP NULL,
    `baseline_hash` VARCHAR(255),
    `current_hash` VARCHAR(255),
    `manifest_modified` BOOLEAN DEFAULT FALSE,
    `backup_exists` BOOLEAN DEFAULT FALSE,
    `last_backup` TIMESTAMP NULL,
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX `idx_protected` (`protected`),
    INDEX `idx_integrity` (`integrity_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `goddess_ac_integrity` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `resource_id` INT NOT NULL,
    `file_path` VARCHAR(500) NOT NULL,
    `file_hash` VARCHAR(255),
    `file_size` BIGINT,
    `status` VARCHAR(50) DEFAULT 'unknown',
    `baseline_hash` VARCHAR(255),
    `modified_at` TIMESTAMP NULL,
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (`resource_id`) REFERENCES `goddess_ac_resources`(`id`) ON DELETE CASCADE,
    INDEX `idx_resource_id` (`resource_id`),
    INDEX `idx_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `goddess_ac_audit` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `admin_source` INT,
    `admin_name` VARCHAR(255),
    `action_type` VARCHAR(255) NOT NULL,
    `target_player` VARCHAR(255),
    `target_resource` VARCHAR(255),
    `action_details` LONGTEXT,
    `result` VARCHAR(50),
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    INDEX `idx_action_type` (`action_type`),
    INDEX `idx_created_at` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `goddess_ac_authorizations` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `player_source` INT NOT NULL,
    `authorization_type` VARCHAR(255) NOT NULL,
    `duration` INT,
    `authorized_by` INT,
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `expires_at` TIMESTAMP,
    `active` BOOLEAN DEFAULT TRUE,
    INDEX `idx_player_source` (`player_source`),
    INDEX `idx_auth_type` (`authorization_type`),
    INDEX `idx_expires` (`expires_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Add indexes for performance optimization
ALTER TABLE `goddess_ac_bans` ADD INDEX `idx_player_name` (`player_name`);
ALTER TABLE `goddess_ac_detections` ADD INDEX `idx_player_name` (`player_name`);
ALTER TABLE `goddess_ac_audit` ADD INDEX `idx_admin_name` (`admin_name`);
