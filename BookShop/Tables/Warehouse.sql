﻿CREATE TABLE [dbo].[Warehouse]
(
	Id INT NOT NULL PRIMARY KEY IDENTITY(1,1), 
    BookId INT NOT NULL,  
    Count INT NOT NULL,
    LastUpdated DATETIME NOT NULL,
    CONSTRAINT FK_Warehouse_To_Book FOREIGN KEY (BookId) REFERENCES Book(Id)
)
