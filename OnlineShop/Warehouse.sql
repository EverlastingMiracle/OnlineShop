CREATE TABLE [dbo].[Warehouse]
(
	[Id] INT NOT NULL PRIMARY KEY, 
    	[BookId] INT NULL FOREIGN KEY REFERENCES [Book] (Id), 
    	[Count] NCHAR(10) NULL,
    	[LastUpdated] DATETIME NULL
)
