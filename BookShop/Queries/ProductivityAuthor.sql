USE BookStore
SELECT FirstName, LastName, Sum(Price) as Price, Count(*) AS BookCount
  FROM Author AS a Join Book AS b
  ON a.Id = b.AuthorId
  GROUP BY FirstName, LastName, a.Id
  HAVING COUNT(*) > 1