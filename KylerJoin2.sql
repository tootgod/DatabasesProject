-- Calculate Trade imbalance
SELECT 
    c.Name AS CountryName,
    ec.Imports,
    ec.Exports,
    (ec.Exports - ec.Imports) AS TradeBalance
FROM Country c
JOIN Economy ec ON c.Code = ec.CountryCode
where ec.imports is not null;
