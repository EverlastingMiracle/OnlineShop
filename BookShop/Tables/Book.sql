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