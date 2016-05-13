--
--
--  MYSQL-SQL FILE TO CREATE THE WHOLE DATABASE HR
--
--

-- User to connect locally
CREATE USER IF  NOT EXISTS 'hruserl'@'localhost' identified by 'hr123_HR123';

-- User to connect from 'ALL' remote machines
CREATE USER IF NOT EXISTS 'hruserr'@'%' identified by 'hr123_HR123';

-- User to connect from specific remote machines
-- TBD

-- Create DB
CREATE DATABASE IF NOT EXISTS hr;
USE hr;

-- Create tablespace (NOTE - in MYSQL only.  MARIADB does NOT have Tablespaces)
-- CREATE TABLESPACE 'HR_TS' ADD DATAFILE 'HR_TS1.ibd';
-- FILE_BLOCK_SIZE is not required for NON-COMPRESSED tables

-- Create tables
CREATE TABLE IF NOT EXISTS dept (id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,  name VARCHAR(20));

CREATE TABLE IF NOT EXISTS emp  (id INT NOT NULL AUTO_INCREMENT, name VARCHAR(20), address VARCHAR(60), phone_number VARCHAR(15),
	PRIMARY KEY (id),
	FOREIGN KEY (id) REFERENCES dept(id) ON UPDATE CASCADE ON DELETE RESTRICT,
	INDEX (name)
	);

-- Grant all privileges on HR DB to 'LOCAL' user (to avoid someone unknown doing admin from remote machine)
GRANT ALL PRIVILEGES ON hr.* to 'hruserl'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE on hr.* to 'hruserr'@'%';
