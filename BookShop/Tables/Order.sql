CREATE TABLE [dbo].[Order]
(
    Id INT NOT NULL PRIMARY KEY IDENTITY(1,1), 
    BookId INT NOT NULL,
    Count INT NOT NULL, 
    CustomerId INT NOT NULL,
	CONSTRAINT FK_Order_to_Customer FOREIGN KEY (CustomerId) REFERENCES [Customer](Id), 
	CONSTRAINt FK_Order_To_Book FOREIGN KEY (BookId) REFERENCES Book(Id)
)
