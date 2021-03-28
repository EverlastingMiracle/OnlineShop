USE BookStore
SELECT b.EditionYear, COUNT(*) AS Count
 FROM Book AS b
 GROUP BY b.EditionYear
 