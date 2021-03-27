CREATE TABLE [dbo].[Book]
(
	[Id] INT NOT NULL PRIMARY KEY, 
    [Name] NCHAR(20) NOT NULL, 
    [Author] NCHAR(20) NOT NULL, 
    [EditionYear] INT NOT NULL, 
    [Price] MONEY NOT NULL, 
    [Category] NCHAR(10) NULL
)
