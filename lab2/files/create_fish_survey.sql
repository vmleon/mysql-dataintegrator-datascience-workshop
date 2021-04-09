CREATE DATABASE IF NOT EXISTS nature;
USE nature;
DROP TABLE IF EXISTS fish;
CREATE TABLE fish (
  id INT unsigned NOT NULL AUTO_INCREMENT,
  fid VARCHAR(100) UNIQUE,
  key_id VARCHAR(100),
  survey_id VARCHAR(15) NOT NULL UNIQUE,
  country VARCHAR(50),
  ecoregion VARCHAR(100),
  realm VARCHAR(150),
  site_code VARCHAR(9),
  site_name VARCHAR(100),
  site_lat DECIMAL(5, 2),
  site_long DECIMAL(5, 2),
  survey_date DATETIME,
  depth TINYINT UNSIGNED,
  phylum VARCHAR(100),
  class VARCHAR(100),
  family VARCHAR(100),
  taxon VARCHAR(200),
  block_number TINYINT UNSIGNED,
  total INT UNSIGNED,
  diver VARCHAR(50),
  geom VARCHAR(100),
  PRIMARY KEY (id)
);