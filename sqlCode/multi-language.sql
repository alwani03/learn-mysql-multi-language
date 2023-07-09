CREATE database studikasus_multi_bahasa;

USE studikasus_multi_bahasa;

CREATE TABLE categories
(
	id varchar(100),
	position INT,
	PRIMARY KEY (id)
)ENGINE InnoDB;

DESC categories;

INSERT INTO categories (id, position) values ('FOOD',1);
INSERT INTO categories (id, position) values ('GADGET',2);
INSERT INTO categories (id, position) values ('FASHION',3);

SELECT * FROM categories order by position ;

CREATE TABLE categories_translations
(
	category_id VARCHAR(100) NOT NULL,
	language VARCHAR(100) NOT NULL,
	name VARCHAR(100) NOT NULL,
	description TEXT,
	PRIMARY KEY (category_id, language)
)ENGINE InnoDB;


DESC categories_translations;

ALTER TABLE categories_translations 
    ADD CONSTRAINT fk_categories_translation
        FOREIGN KEY (category_id) REFERENCES categories(id);

SELECT * FROM categories c
	JOIN categories_translations ct ON c.id = ct.category_id;

INSERT INTO categories_translations (category_id, language, name, description) VALUES ('FOOD', 'in_ID', 'Makanan', 'Deskripsi Makanan');
INSERT INTO categories_translations (category_id, language, name, description) VALUES ('FOOD', 'in_US', 'Food', 'Food Description');
INSERT INTO categories_translations (category_id, language, name, description) VALUES ('GADGET', 'in_ID', 'Gawai', 'Deskripsi Gawai');
INSERT INTO categories_translations (category_id, language, name, description) VALUES ('GADGET', 'en_US', 'Gadget', 'Gadget Description');

SELECT * FROM categories c
	JOIN categories_translations ct ON c.id = ct.category_id
where ct.language = 'en_US' ORDER BY POSITION ;