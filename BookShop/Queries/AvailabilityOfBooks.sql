USE BookStore
SELECT a.Id, FirstName, LastName, Sum(Price) AS Price, Count(*) AS BookCount
  FROM Author AS a JOIN Book AS b
  ON a.Id = b.AuthorId
  GROUP BY FirstName, LastName, a.Id