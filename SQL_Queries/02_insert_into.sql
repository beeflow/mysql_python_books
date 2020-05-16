INSERT INTO `user` (user_name, user_surname, user_email)
VALUES ('Rafał', 'Przetakowski', 'rafal.p@beeflow.co.uk');

INSERT INTO `user` (user_name, user_surname, user_email)
VALUES ('Tomasz', 'Zasada', 'tomasz_zasada@wp.pl');

INSERT INTO `user` (user_name, user_surname, user_email)
VALUES ('Olga', 'Czytelna', 'olga.c_12@onet.pl');

INSERT INTO book_status (bs_name)
VALUES ('dostępna'), ('wypożyczona'), ('w renowacji'),('zniszczona');

INSERT INTO book (book_title, book_isbn)
VALUES ('Wyznawcy płomienia', '1-11111');

INSERT INTO book(book_title, book_isbn) VALUES
('Rose mother', '1234-1'),
('Władca pierścieni - dwie wieże', '4321-4');

INSERT INTO author(author_name, author_surname)
VALUES('Stephen', 'King'), ('J.R.R.', 'Tolkien');

INSERT INTO book_author(ba_book_id, ba_author_id)
VALUES(
	(SELECT book_id FROM book WHERE book_title = 'Rose mother'),
	(SELECT author_id FROM author WHERE author_surname = 'king' AND author_name = 'stephen')
),
(
	(SELECT book_id FROM book WHERE book_title = 'Władca pierścieni - dwie wieże'),
	(SELECT author_id FROM author WHERE author_surname = 'Tolkien')
);

INSERT INTO book_copy (bc_status_id, bc_book_id)
VALUES (
    (SELECT bs_id FROM book_status WHERE bs_name = 'dostępna'),
    (SELECT book_id FROM book WHERE book_title = 'Rose mother')
);

INSERT INTO book_copy (bc_status_id, bc_book_id)
VALUES (
    (SELECT bs_id FROM book_status WHERE bs_name = 'dostępna'),
    (SELECT book_id FROM book WHERE book_title = 'Władca pierścieni - dwie wieże')
);

INSERT INTO book_copy (bc_status_id, bc_book_id)
VALUES (
    (SELECT bs_id FROM book_status WHERE bs_name = 'dostępna'),
    (SELECT book_id FROM book WHERE book_title = 'Władca pierścieni - dwie wieże')
);