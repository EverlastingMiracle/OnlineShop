CREATE TABLE [dbo].[Warehouse]
(
	[Id] INT NOT NULL PRIMARY KEY, 
    	[BookId] INT NOT NULL FOREIGN KEY REFERENCES [Book](Id), 
    	[Count] INT NOT NULL,
    	[LastUpdated] DATETIME NOT NULL
)
