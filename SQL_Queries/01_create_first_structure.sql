create database library CHARACTER SET utf8 COLLATE utf8_polish_ci;
use library;

CREATE TABLE `user` (
	user_id INT AUTO_INCREMENT,
    user_name VARCHAR(15),
    user_surname VARCHAR(50) NOT NULL,
    user_email VARCHAR(100) NULL,
    user_phone VARCHAR(12),
    user_card_number VARCHAR(9),

    PRIMARY KEY (user_id)
);

CREATE TABLE book (
	book_id INT AUTO_INCREMENT,
    book_title VARCHAR(250) NOT NULL,
    book_isbn VARCHAR(13) NOT NULL,
    book_pages INT(4),
    book_publish_year INT(4),

    PRIMARY KEY (book_id)
);

CREATE TABLE book_status (
	bs_id INT AUTO_INCREMENT,
    bs_name VARCHAR(20) NOT NULL,

    PRIMARY KEY (bs_id)
);

CREATE TABLE book_copy (
	bc_id INT AUTO_INCREMENT,
    bc_status_id INT NOT NULL,
    bc_book_id INT NOT NULL,

    PRIMARY KEY(bc_id),
    FOREIGN KEY (bc_status_id)
		REFERENCES book_status(bs_id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
	FOREIGN KEY (bc_book_id)
		REFERENCES book(book_id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

CREATE TABLE user_book_rent (
	ub_id INT AUTO_INCREMENT,
    ub_user_id INT NOT NULL,
    ub_bc_id INT NOT NULL,
    ub_rent_date DATETIME NOT NULL DEFAULT now(),
    ub_return_date DATETIME,

    PRIMARY KEY(ub_id),
    FOREIGN KEY(ub_user_id) REFERENCES `user`(user_id)
		ON DELETE RESTRICT ON UPDATE CASCADE,
	FOREIGN KEY(ub_bc_id) REFERENCES book_copy(bc_id)
		ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE author (
	author_id INT AUTO_INCREMENT,
	author_name VARCHAR(15) NOT NULL,
    author_surname VARCHAR(50) NOT NULL,

    PRIMARY KEY (author_id)
);

CREATE TABLE book_author (
	ba_book_id INT NOT NULL,
    ba_author_id INT NOT NULL,

    PRIMARY KEY(ba_book_id, ba_author_id),
    FOREIGN KEY(ba_book_id) REFERENCES book(book_id)
		ON UPDATE CASCADE ON DELETE RESTRICT,
	FOREIGN KEY(ba_author_id) REFERENCES author(author_id)
		ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE user_book_copy_rent (
	ub_id INT AUTO_INCREMENT,
    ub_user_id INT NOT NULL,
    ub_bc_id INT NOT NULL,
    ub_rent_date DATETIME NOT NULL DEFAULT now(),
    ub_return_date DATETIME,

    PRIMARY KEY(ub_id),
    FOREIGN KEY(ub_user_id) REFERENCES `user`(user_id)
		ON DELETE RESTRICT ON UPDATE CASCADE,
	FOREIGN KEY(ub_bc_id) REFERENCES book_copy(bc_id)
		ON DELETE RESTRICT ON UPDATE CASCADE
);