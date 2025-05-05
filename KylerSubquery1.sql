-- Find all countries with lower then average Primary School employment and higher then average unemployment and displays them

SELECT 
    c.Name,
    e.TotalPrimaryEnrollment,
    ec.UnemploymentRate
FROM Country c
JOIN Education e ON c.Code = e.CountryCode
JOIN Economy ec ON c.Code = ec.CountryCode
WHERE e.TotalPrimaryEnrollment < (
    SELECT AVG(TotalPrimaryEnrollment)
    FROM Education
    WHERE TotalPrimaryEnrollment IS NOT NULL
)
AND ec.UnemploymentRate > (
    SELECT AVG(UnemploymentRate)
    FROM Economy
    WHERE UnemploymentRate IS NOT NULL
);