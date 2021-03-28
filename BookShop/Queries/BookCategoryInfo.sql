USE BookStore
  SELECT Category, SUM(Price) AS TotalPrice, COUNT(*) AS Count
  FROM Book AS b JOIN BookCategory AS bc
  ON b.CategoryId = bc.Id
  GROUP BY Category