--DROP TABLE users;
--DROP TABLE product;
--DROP TABLE downloads;

CREATE TABLE users
(
   user_id         NUMBER           PRIMARY KEY,
   email_address   VARCHAR2(50)     NOT NULL          UNIQUE,
   first_name      VARCHAR2(10)     NOT NULL,
   last_name       VARCHAR2(10)     NOT NULL
);

CREATE TABLE product
(
   product_id      NUMBER          PRIMARY KEY,
   product_name    VARCHAR2(30)    NOT NULL    UNIQUE
);

CREATE TABLE downloads
(
   download_id     NUMBER         PRIMARY KEY,
   user_id         NUMBER         REFERENCES users (user_id) ON DELETE CASCADE,
   download_date   VARCHAR2(11)   DEFAULT SYSDATE,
   filename        VARCHAR2(30)   NOT NULL,
   product_id      NUMBER         REFERENCES product (product_id) ON DELETE CASCADE
);


CREATE INDEX full_name_ix
   ON users (first_name, last_name);

CREATE INDEX downloads_filename_ix
   ON downloads (filename);

CREATE INDEX foreign_key_ix
   ON downloads (user_id, product_id);
   
--DROP SEQUENCE user_id_seq;
--DROP SEQUENCE product_id_seq;
--DROP SEQUENCE download_id_seq;

CREATE SEQUENCE user_id_seq
   CACHE 10 ORDER;

CREATE SEQUENCE product_id_seq
   CACHE 10 ORDER;

CREATE SEQUENCE download_id_seq
   CACHE 10 ORDER;
   

INSERT INTO users
VALUES (user_id_seq.NEXTVAL, 'johnsmith@gmail.com', 'John', 'Smith');

INSERT INTO users
VALUES (user_id_seq.NEXTVAL, 'janedoe@yahoo.com', 'Jane', 'Doe');

INSERT INTO product
VALUES (product_id_seq.NEXTVAL, 'Local Music Vol 2');

INSERT INTO product
VALUES (product_id_seq.NEXTVAL, 'Local Music Vol 1');

INSERT INTO downloads
VALUES (download_id_seq.NEXTVAL, 1, DEFAULT, 'pedals_are_falling.mp3', 2);

INSERT INTO downloads
VALUES (download_id_seq.NEXTVAL, 2, DEFAULT, 'turn_signal.mp3', 2);

INSERT INTO downloads
VALUES (download_id_seq.NEXTVAL, 2, DEFAULT, 'one_horse_town.mp3', 1);


ALTER TABLE product
ADD price        NUMBER(3,2)    DEFAULT(9.99)     NOT NULL;

ALTER TABLE product
ADD date_added   VARCHAR2(11)   DEFAULT SYSDATE;


INSERT INTO users
VALUES (user_id_seq.NEXTVAL, 'jacksonreedross@utexas.edu', 'ThisIsNotMyFirstName', 'Ross');

ALTER TABLE users
MODIFY first_name VARCHAR2(20);

INSERT INTO users
VALUES (user_id_seq.NEXTVAL, 'jacksonreedross@utexas.edu', 'ThisIsNotMyFirstName', 'Ross');