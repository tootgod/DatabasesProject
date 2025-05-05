-- Finds Countries with lower the average education expenditure and show the languages that those countries have
SELECT c.Name AS CountryName, cl.Language
FROM CountryLanguage cl
JOIN Country c ON cl.CountryCode = c.Code
WHERE cl.CountryCode IN (
    SELECT e.CountryCode
    FROM Education e
    WHERE e.Expenditure < (
        SELECT AVG(Expenditure)
        FROM Education
        WHERE Expenditure IS NOT NULL
    )
)
AND cl.Percentage = (
    SELECT MAX(cl2.Percentage)
    FROM CountryLanguage cl2
    WHERE cl2.CountryCode = cl.CountryCode
);