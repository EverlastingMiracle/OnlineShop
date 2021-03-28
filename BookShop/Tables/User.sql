CREATE TABLE [dbo].[User]
(
	Id INT NOT NULL PRIMARY KEY IDENTITY(1,1), 
    FirstName NCHAR(20) NOT NULL, 
    LastName NCHAR(20) NOT NULL, 
    BirthDate DATE NOT NULL, 
    UserCategoryId INT NOT NULL ,
    ContactId INT NOT NULL,
    CONSTRAINT FK_User_To_UserCategory FOREIGN KEY (UserCategoryId) REFERENCES UserCategory(Id),
    CONSTRAINT FK_User_To_Contact FOREIGN KEY (ContactId) REFERENCES Contact(Id)
)
