CREATE TABLE [dbo].[Order]
(
    [Id] INT NOT NULL PRIMARY KEY, 
    [BookId] INT NOT NULL FOREIGN KEY REFERENCES [Book](Id), 
    [DeliveryAddress] NCHAR(40) NOT NULL, 
    [Count] INT NOT NULL, 
    [CustomerId] INT NOT NULL FOREIGN KEY REFERENCES [Customer](Id), 
)
