CREATE TABLE titanic.passenger (
  id INT unsigned NOT NULL AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  survived BOOLEAN,
  PRIMARY KEY (id)
);