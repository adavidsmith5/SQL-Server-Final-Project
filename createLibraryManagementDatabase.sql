CREATE DATABASE db_library_management_system2;
USE db_library_management_system2;
CREATE TABLE tbl_library_branch(
	branch_id INT NOT NULL PRIMARY KEY IDENTITY (1,1),
	branch_name VARCHAR(50) NOT NULL,
	branch_address VARCHAR(50) NOT NULL
);

CREATE TABLE tbl_borrower(
	borrower_card_no INT NOT NULL PRIMARY KEY IDENTITY (100,1),
	borrower_name VARCHAR(50) NOT NULL,
	borrower_address VARCHAR(50) NOT NULL,
	borrower_phone CHAR(12) NOT NULL
);

CREATE TABLE tbl_publisher(
	publisher_name VARCHAR(50) NOT NULL PRIMARY KEY,
	publisher_address VARCHAR(50),
	publisher_phone CHAR(12)
);

CREATE TABLE tbl_books(
	book_id INT NOT NULL PRIMARY KEY IDENTITY (1000,1),
	book_title VARCHAR(50) NOT NULL,
	book_publisher_name VARCHAR(50) NOT NULL CONSTRAINT fk_publisher_name FOREIGN KEY REFERENCES tbl_publisher(publisher_name) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE book_authors(
	authors_book_id INT NOT NULL CONSTRAINT fk_book_id FOREIGN KEY REFERENCES tbl_books(book_id) ON UPDATE CASCADE ON DELETE CASCADE,
	authors_name VARCHAR(50) NOT NULL
);


CREATE TABLE tbl_book_copies(
	copies_book_id INT NOT NULL CONSTRAINT fk_book_id_copies FOREIGN KEY REFERENCES tbl_books(book_id) ON UPDATE CASCADE ON DELETE CASCADE,
	copies_branch_id INT NOT NULL CONSTRAINT fk_branch_id FOREIGN KEY REFERENCES tbl_library_branch(branch_id) ON UPDATE CASCADE ON DELETE CASCADE,
	copies_number_of_copies INT
);


CREATE TABLE tbl_book_loans(
	loans_book_id INT NOT NULL CONSTRAINT fk_book_id_loan FOREIGN KEY REFERENCES tbl_books(book_id) ON UPDATE CASCADE ON DELETE CASCADE,
	loans_branch_id INT NOT NULL CONSTRAINT fk_branch_id_loans FOREIGN KEY REFERENCES tbl_library_branch(branch_id) ON UPDATE CASCADE ON DELETE CASCADE,
	loans_card_no INT NOT NULL CONSTRAINT fk_card_no FOREIGN KEY REFERENCES tbl_borrower(borrower_card_no) ON UPDATE CASCADE ON DELETE CASCADE,
	loans_date_out DATE,
	loans_date_due DATE
);


INSERT INTO tbl_library_branch (branch_name, branch_address)
	VALUES
	('Central', '23 Broad St.'),
	('Sharpstown', '443 E. Main St.'),
	('Northern', '1252 Woodruff Ave.'),
	('Southern', '3344 S. 221st St.'),
	('Eastern', '1234 Dublin Rd.')
;

INSERT INTO tbl_borrower (borrower_name, borrower_address, borrower_phone)
	VALUES
	('Samuel Johnson', '2323 Creston Rd.', '614-234-2344'),
	('Melissa Jackson', '59498 Norton Ave.', '614-432-4322'),
	('Jonathan Swift', '2305 Doten Ave.', '614-333-2399'),
	('Henry Ocho', '9988 Mary Way', '614-239-3958'),
	('Samira Halpert', '93 Cranston Rd.', '614-234-7690'),
	('Paul Simon', '440 Call Me Alley', '614-789-9875'),
	('Sandra Williams', '392 Halstead Ct.', '614-567-5839'),
	('Carl Sadiq', '58 W. Henderson Rd.', '614-932-8904'),
	('Pavel Sandersson', '39 Norton Ave.', '614-33-2847')
;

INSERT INTO tbl_publisher (publisher_name, publisher_address, publisher_phone)
	VALUES
	('Hachette Book Group', '237 Park Avenue', '212-364-1200'),
	('HarperCollins', '195 Broadway Ave.', '212-207-7000'),
	('Macmillan Publishers', '175 Fift Avenue', '64-307-5151'),
	('Penguin Random House', '1745 Broadway Ave.', '212-782-9000'),
	('Simon and Schuster', '1230 Avenue of the Americas', '212-698-7000')
;

INSERT INTO tbl_books (book_title, book_publisher_name)
	VALUES
	('In Search of Lost Time', 'HarperCollins'),
	('Don Quixote', 'Hachette Book Group'),
	('Ulysses', 'HarperCollins'),
	('The Great Gatsby', 'Penguin Random House'),
	('The Lost Tribe', 'Hachette Book Group'),
	('Moby Dick', 'Simon and Schuster'),
	('Hamlet', 'HarperCollins'),
	('War and Peace', 'Macmillan Publishers'),
	('It', 'Macmillan Publishers'),
	('The Odyssey', 'Simon and Schuster'),
	('One Hundred Years of Solitude', 'Hachette Book Group'),
	('The Divine Comedy', 'HarperCollins'),
	('The Brothers Karamazov', 'Penguin Random House'),
	('Cujo', 'Macmillan Publishers'),
	('Madame Bovary', 'Penguin Random House'),
	('The Adventures of Huckleberry Finn', 'Hachette Book Group'),
	('The Iliad', 'Penguin Random House'),
	('Lolita', 'Macmillan Publishers'),
	('Crime and Punishment', 'Simon and Schuster'),
	('Alice''s Adventures in Wonderland', 'Simon and Schuster'),
	('Wuthering Heights', 'HarperCollins'),
	('Pride and Prejudice', 'Penguin Random House'),
	('The Catcher in the Rye', 'Macmillan Publishers')
;

INSERT INTO book_authors (authors_book_id, authors_name)
	VALUES
	(1000, 'Marcel Proust'),
	(1001, 'Miguel de Cervantes'),
	(1002, 'James Joyce'),
	(1003, 'F. Scott Fitzgerald'),
	(1004, 'Edward Marriott'),
	(1005, 'Herman Melville'),
	(1006, 'William Shakespeare'),
	(1007, 'Leo Tolstoy'),
	(1008, 'Stephen King'),
	(1009, 'Homer'),
	(1010, 'Gabriel Garcia Marquez'),
	(1011, 'Dante Alighieri'),
	(1012, 'Fyodor Dostoyevsky'),
	(1013, 'Stephen King'),
	(1014, 'Gustave Flaubert'),
	(1015, 'Mark Twain'),
	(1016, 'Homer'),
	(1017, 'Vladimir Nabokov'),
	(1018, 'Fyodor Dostoyevsky'),
	(1019, 'Lewis Carroll'),
	(1020, 'Wuthering Heights'),
	(1021, 'Jane Austen'),
	(1022, 'J. D. Salinger')
;



INSERT INTO tbl_book_copies (copies_book_id, copies_branch_id, copies_number_of_copies)
	VALUES
	(1000, 1, 4),
	(1000, 2, 5), 
	(1000, 3, 4),
	(1000, 5, 6),
	(1001, 1, 5),
	(1001, 2, 4),
	(1001, 3, 3),
	(1001, 4, 10),
	(1001, 5, 3),
	(1002, 1, 5),
	(1002, 2, 11),
	(1002, 3, 10),
	(1002, 4, 10),
	(1002, 5, 5),
	(1003, 2, 3),
	(1003, 3, 6),
	(1003, 4, 6),
	(1003, 5, 7),
	(1004, 1, 5),
	(1004, 2, 4),
	(1004, 3, 9),
	(1004, 4, 2),
	(1005, 1, 9),
	(1005, 2, 2),
	(1005, 3, 2),
	(1005, 4, 8),
	(1005, 5, 3),
	(1006, 1, 2),
	(1006, 2, 7),
	(1006, 3, 2),
	(1006, 5, 7),
	(1007, 1, 4),
	(1007, 2, 6),
	(1007, 3, 4),
	(1007, 4, 9),
	(1007, 5, 8),
	(1008, 1, 3),
	(1008, 2, 8),
	(1008, 3, 9),
	(1008, 4, 9),
	(1008, 5, 7),
	(1009, 2, 2),
	(1009, 3, 14),
	(1009, 4, 4),
	(1009, 5, 5),
	(1010, 1, 14),
	(1010, 2, 3),
	(1010, 3, 4),
	(1010, 4, 5),
	(1011, 1, 4),
	(1011, 2, 6),
	(1011, 3, 10),
	(1011, 4, 2),
	(1011, 5, 2),
	(1012, 1, 5),
	(1012, 2, 5),
	(1012, 3, 3),
	(1012, 5, 2),
	(1013, 1, 2),
	(1013, 2, 8),
	(1013, 3, 8),
	(1013, 4, 9),
	(1013, 5, 8),
	(1014, 1, 3),
	(1014, 2, 9),
	(1014, 3, 7),
	(1014, 4, 2),
	(1014, 5, 4),
	(1015, 2, 2),
	(1015, 3, 5),
	(1015, 4, 6),
	(1015, 5, 6),
	(1016, 1, 5),
	(1016, 2, 5),
	(1016, 3, 7),
	(1016, 4, 3),
	(1016, 5, 4),
	(1017, 1, 6),
	(1017, 2, 3),
	(1017, 3, 2),
	(1017, 4, 9),
	(1017, 5, 9),
	(1018, 1, 3),
	(1018, 3, 6),
	(1018, 4, 5),
	(1018, 5, 4),
	(1019, 1, 5),
	(1019, 2, 12),
	(1019, 3, 3),
	(1019, 4, 3),
	(1019, 5, 13),
	(1020, 1, 10),
	(1020, 2, 6),
	(1020, 3, 4),
	(1020, 4, 2),
	(1020, 5, 2),
	(1021, 1, 3),
	(1021, 2, 5),
	(1021, 4, 7),
	(1021, 5, 8),
	(1022, 1, 6),
	(1022, 2, 5),
	(1022, 3, 15),
	(1022, 4, 8),
	(1022, 5, 2)
;

INSERT INTO tbl_book_loans (loans_book_id, loans_branch_id, loans_card_no, loans_date_out, loans_date_due)
	VALUES
	(1000, 1, 107, '2019-02-25', '2019-03-03'),
	(1010, 1, 107, '2019-02-25', '2019-03-03'),
	(1016, 1, 107, '2019-02-25', '2019-03-03'),
	(1019, 1, 107, '2019-02-25', '2019-03-03'),
	(1020, 1, 107, '2019-02-25', '2019-03-03'),
	(1001, 3, 103, '2019-02-20', '2019-03-02'),
	(1002, 3, 103, '2019-02-20', '2019-03-02'),
	(1007, 3, 103, '2019-02-20', '2019-03-02'),
	(1008, 3, 103, '2019-02-20', '2019-03-02'),
	(1015, 3, 103, '2019-02-20', '2019-03-02'),
	(1017, 3, 103, '2019-02-20', '2019-03-02'),
	(1020, 3, 103, '2019-02-20', '2019-03-02'),
	(1022, 3, 103, '2019-02-20', '2019-03-02'),
	(1004,4, 100, '2019-02-28', '2019-03-10'),
	(1005,4, 100, '2019-02-28', '2019-03-10'),
	(1007,4, 100, '2019-02-28', '2019-03-10'),
	(1008,4, 100, '2019-02-28', '2019-03-10'),
	(1009,4, 100, '2019-02-28', '2019-03-10'),
	(1010,4, 100, '2019-02-28', '2019-03-10'),
	(1017,4, 100, '2019-02-28', '2019-03-10'),
	(1018,4, 100, '2019-02-28', '2019-03-10'),
	(1019,4, 100, '2019-02-28', '2019-03-10'),
	(1020,4, 100, '2019-02-28', '2019-03-10'),
	(1004, 2, 101, '2019-02-22', '2019-03-02'),
	(1010,2, 102, '2019-03-02', '2019-03-17'),
	(1011,2, 102, '2019-03-02', '2019-03-17'),
	(1012,2, 102, '2019-03-02', '2019-03-17'),
	(1013,2, 102, '2019-03-02', '2019-03-17'),
	(1014,2, 102, '2019-03-02', '2019-03-17'),
	(1019,2, 102, '2019-03-02', '2019-03-17'),
	(1020,2, 102, '2019-03-02', '2019-03-17'),
	(1021,2, 102, '2019-03-02', '2019-03-17'),
	(1022,2, 102, '2019-03-02', '2019-03-17'),
	(1000,5, 101, '2019-02-26', '2019-03-04'),
	(1001,5, 101, '2019-02-26', '2019-03-04'),
	(1002,5, 101, '2019-02-26', '2019-03-04'),
	(1003,5, 101, '2019-02-26', '2019-03-04'),
	(1005,5, 101, '2019-02-26', '2019-03-04'),
	(1006,5, 101, '2019-02-26', '2019-03-04'),
	(1007,5, 101, '2019-02-26', '2019-03-04'),
	(1008,5, 101, '2019-02-26', '2019-03-04'),
	(1003,3, 106, '2019-02-27', '2019-03-05'),
	(1006,3, 106, '2019-02-27', '2019-03-05'),
	(1009,3, 106, '2019-02-27', '2019-03-05'),
	(1012,3, 106, '2019-02-27', '2019-03-05'),
	(1002,1, 105, '2019-03-01', '2019-03-15'),
	(1004,1, 105, '2019-03-01', '2019-03-15'),
	(1006,1, 105, '2019-03-01', '2019-03-15'),
	(1008,1, 105, '2019-03-01', '2019-03-15'),
	(1010,1, 105, '2019-03-01', '2019-03-15')
;




