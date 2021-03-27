CREATE DATABASE BookStore 

USE BookStore
GO

CREATE TABLE [dbo].[Author]
(
	Id INT NOT NULL PRIMARY KEY IDENTITY(1,1), 
    FirstName NCHAR(128) NOT NULL, 
	LastName NCHAR(128) NOT NULL
);


INSERT INTO Author(FirstName,LastName) VALUES('Nelle','Maddox'),('Catherine','Brady'),('Isaac','Mcdonald'),('Flynn','Baxter'),('Cooper','Salas'),('Blythe','Stark'),('Karina','Michael'),('Nehru','Heath'),('Xandra','Whitfield'),('Rajah','Cote');
INSERT INTO Author(FirstName,LastName) VALUES('Zeus','Reynolds'),('Kylan','Griffith'),('McKenzie','Dawson'),('Christopher','Shields'),('Victoria','Mann'),('Guy','Lawrence'),('Nicole','Dillon'),('Pearl','Mathis'),('Caleb','Bailey'),('Price','Lane');
INSERT INTO Author(FirstName,LastName) VALUES('Dillon','Berger'),('Jamal','Phillips'),('Damian','Frank'),('Candice','Ewing'),('Carlos','Schwartz'),('Sara','Merrill'),('Elliott','York'),('Felix','Lott'),('Riley','Aguilar'),('Rhiannon','Callahan');
INSERT INTO Author(FirstName,LastName) VALUES('Elijah','Schwartz'),('Andrew','Peterson'),('Damon','Baxter'),('Vincent','Floyd'),('Jonah','Barrett'),('Leila','Stanton'),('Donovan','Zamora'),('Oleg','Jimenez'),('Jena','Copeland'),('Ima','Yang');
INSERT INTO Author(FirstName,LastName) VALUES('Uriel','Anderson'),('Amaya','Schwartz'),('Norman','Cole'),('Malcolm','Sandoval'),('Quinn','Paul'),('Jolene','Hancock'),('Andrew','Pitts'),('Sylvia','Anderson'),('Autumn','Owen'),('Willa','Holden');
INSERT INTO Author(FirstName,LastName) VALUES('Phoebe','Reed'),('Erasmus','Mcguire'),('Mufutau','Navarro'),('Beck','Watson'),('Mason','Harmon'),('Delilah','Garrett'),('Talon','Lowe'),('Simone','Shelton'),('Caesar','Stokes'),('Dillon','Gregory');
INSERT INTO Author(FirstName,LastName) VALUES('Hayfa','Wyatt'),('Jasper','Reilly'),('Cassady','Hardin'),('Iris','Parsons'),('Ashely','Warner'),('Leslie','Odonnell'),('Leila','Morrison'),('Erasmus','Gillespie'),('Tad','Mann'),('Camden','Odom');
INSERT INTO Author(FirstName,LastName) VALUES('Madonna','Hutchinson'),('Kirsten','Beck'),('Hasad','Chaney'),('Ira','Aguirre'),('Rhea','Rios'),('Daquan','Wolfe'),('Emery','Mcdowell'),('Zachery','Good'),('Aline','Hill'),('Keaton','Guerrero');
INSERT INTO Author(FirstName,LastName) VALUES('Jocelyn','Justice'),('Kirestin','Keller'),('Maisie','Ballard'),('Solomon','Burks'),('Cameran','Sexton'),('Irma','Jacobson'),('Ori','Hood'),('Yael','Wilkins'),('Carson','Wagner'),('Tatyana','Peck');
INSERT INTO Author(FirstName,LastName) VALUES('Kylynn','Hart'),('Dean','Barrett'),('Calista','Summers'),('Jacob','Randolph'),('Gabriel','Blake'),('Colin','Blankenship'),('Jeremy','Hooper'),('Piper','Levy'),('Kennan','Sherman'),('Fallon','Rice');


CREATE TABLE [dbo].[BookCategory] (
	Id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	Category NCHAR(128) NOT NULL,
	CONSTRAINT UC_BookCategory UNIQUE (Category)
);


INSERT INTO BookCategory (Category) VALUES ('Fiction');
INSERT INTO BookCategory (Category) VALUES ('Fantasy');
INSERT INTO BookCategory (Category) VALUES ('Mystery');
INSERT INTO BookCategory (Category) VALUES ('Romance');
INSERT INTO BookCategory (Category) VALUES ('Westerns');
INSERT INTO BookCategory (Category) VALUES ('Dystopian');
INSERT INTO BookCategory (Category) VALUES ('Thriller');
INSERT INTO BookCategory (Category) VALUES ('Contemporary');
INSERT INTO BookCategory (Category) VALUES ('Sci-Fi');


CREATE TABLE [dbo].[Book]
(
	Id INT NOT NULL PRIMARY KEY IDENTITY(1,1), 
    Name NCHAR(128) NOT NULL, 
    AuthorId INT, 
    EditionYear SMALLINT NOT NULL CONSTRAINT CHK_EditionYear_validation CHECK (EditionYear >=1000 AND EditionYear <=3000), 
    Price MONEY,
	CategoryId INT,
    CONSTRAINT FK_BookCategory_To_Book FOREIGN KEY (CategoryId) REFERENCES BookCategory (Id) ON DELETE SET NULL,
	CONSTRAINT FK_Author_To_Book FOREIGN KEY (AuthorId) REFERENCES Author(Id) ON DELETE SET NULL
)


--Drop table Author;
--Drop table Book;
--Drop table BookCategory;


