USE BUDT703_Project_0501_11;
--1.  What are the Apartment ID, Apartment Name, Apartment Address of the apartments with average rating greater than 4.5?
SELECT a.aptId, a.aptName, a.aptStreet + ' ' + a.aptCity + ' ' + a.aptState + ' ' + a.aptZipCode as 'aptAddress', AVG(w.revRate) as 'Average Rating'
FROM [Review.Apartment] a, [Review.Write] w
WHERE a.aptId=w.aptId
GROUP BY a.aptId, a.aptName, a.aptStreet, a.aptCity, aptState, aptZipCode
HAVING AVG(w.revRate) > 4.5

GO
DROP VIEW IF EXISTS Q1

GO
CREATE VIEW Q1 AS
	SELECT a.aptId, a.aptName, a.aptStreet + ' ' + a.aptCity + ' ' + a.aptState + ' ' + a.aptZipCode as 'aptAddress', AVG(w.revRate) as 'Average Rating'
	FROM [Review.Apartment] a, [Review.Write] w
	WHERE a.aptId=w.aptId
	GROUP BY a.aptId, a.aptName, a.aptStreet, a.aptCity, aptState, aptZipCode
	HAVING AVG(w.revRate) > 4.5
WITH CHECK OPTION

SELECT *
FROM Q1


--2. What is the Apartment ID, Apartment Name, Apartment Address of the apartment with worst rating?
SELECT a.aptId, a.aptName, a.aptStreet + ' ' + a.aptCity + ' ' + a.aptState + ' ' + a.aptZipCode as 'aptAddress', AVG(w.revRate) as 'Average_Rating'
FROM [Review.Apartment] a, [Review.Write] w, (
	SELECT aa.aptId, AVG(ww.revRate) as 'AR'
	FROM [Review.Apartment] aa, [Review.Write] ww
	WHERE aa.aptId=ww.aptId
	GROUP BY aa.aptId) av
WHERE a.aptId=w.aptId
GROUP BY a.aptId, a.aptName, a.aptStreet, a.aptCity, aptState, aptZipCode
HAVING AVG(w.revRate) = MIN(av.AR)

GO
DROP VIEW IF EXISTS Q2

GO
CREATE VIEW Q2 AS
	SELECT a.aptId, a.aptName, a.aptStreet + ' ' + a.aptCity + ' ' + a.aptState + ' ' + a.aptZipCode as 'aptAddress', AVG(w.revRate) as 'Average_Rating'
	FROM [Review.Apartment] a, [Review.Write] w, (
		SELECT aa.aptId, AVG(ww.revRate) as 'AR'
		FROM [Review.Apartment] aa, [Review.Write] ww
		WHERE aa.aptId=ww.aptId
		GROUP BY aa.aptId) av
	WHERE a.aptId=w.aptId
	GROUP BY a.aptId, a.aptName, a.aptStreet, a.aptCity, aptState, aptZipCode
	HAVING AVG(w.revRate) = MIN(av.AR)
WITH CHECK OPTION

SELECT *
FROM Q2

-- 3. What are the apartment name of the apartment that do not have a gym, a pool and a club?
SELECT a.aptName 
FROM [Review.Apartment] a , [Review.Amenity] am
WHERE a.aptId = am.aptId and (am.amenGym = 'N' and am.amenPool = 'N' and am.amenClub = 'N')

GO
DROP VIEW IF EXISTS Q3

GO
CREATE VIEW Q3 AS
	SELECT a.aptName 
	FROM [Review.Apartment] a , [Review.Amenity] am
	WHERE a.aptId = am.aptId and (am.amenGym = 'N' and am.amenPool = 'N' and am.amenClub = 'N')
	WITH CHECK OPTION

SELECT *
FROM Q3

--4. What is the apartment name and its unit's full detail of the apartment that has the cheapest apartment units in college park area? 
SELECT TOP 1 a.aptName, u.*
FROM [Review.Apartment] a ,[Review.Unit] u
WHERE a.aptId=u.aptId
ORDER BY  u.unitRent

GO
DROP VIEW IF EXISTS Q4

GO
CREATE VIEW Q4 AS
	SELECT TOP 1 a.aptName, u.*
	FROM [Review.Apartment] a ,[Review.Unit] u
	WHERE a.aptId=u.aptId
	ORDER BY  u.unitRent

SELECT *
FROM Q4

--5. What are the apartment name, user name and the content of the 5 longest reviews?
SELECT TOP 5 a.aptName ,r.rwerName, w.revContent
FROM [Review.Write] w, [Review.Reviewer] r,[Review.Apartment] a
WHERE w.rwerId = r.rwerId AND   w.aptId = a.aptId
ORDER BY LEN(w.revContent) DESC

GO
DROP VIEW IF EXISTS Q5

GO
CREATE VIEW Q5 AS
	SELECT TOP 5 a.aptName ,r.rwerName, w.revContent
	FROM [Review.Write] w, [Review.Reviewer] r,[Review.Apartment] a
	WHERE w.rwerId = r.rwerId AND   w.aptId = a.aptId
	ORDER BY LEN(w.revContent) DESC

SELECT *
FROM Q5