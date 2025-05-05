-- Find the count of cities in a country

SELECT 
	Country.Name AS CountryName,
	COUNT(City.ID) AS NumberOfCities
FROM Country
JOIN City ON Country.Code = City.CountryCode
GROUP BY Country.Code, Country.Name
ORDER BY NumberOfCities DESC;