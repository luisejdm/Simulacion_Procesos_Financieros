-- Cuántas filas tiene la tabla
SELECT COUNT(*) AS FilasTotals
FROM dbo.FinancialStatement;

-- Cuántas empresas aparecen?
SELECT COUNT(DISTINCT(ticker)) AS EmpresasTotales
FROM dbo.FinancialStatement;

-- Cuáles cuentas tienes disponibles (columna Account)
SELECT *
FROM dbo.FinancialStatement;

-- Para cuántos años tienes datos?
SELECT DATEDIFF(YEAR, MIN(fiscalDateEnding), MAX(fiscalDateEnding)) + 1 AS AñosTotales
FROM dbo.FinancialStatement;


-- Calcula el Gross Profit promedio de AMD
SELECT AVG(grossProfit) AS GrossProfitPromedio
FROM dbo.FinancialStatement
WHERE ticker = 'AMD';

-- Obtén las 20 empresas con el mayor EBITDA en 2018
SELECT TOP 20
    ticker,
    ebitda
FROM dbo.FinancialStatement
WHERE YEAR(fiscalDateEnding) = '2018'
ORDER BY ebitda DESC;

-- Cuál fue el total Revenue por año de Microsoft entre 2015 y 2020?
SELECT 
    YEAR(fiscalDateEnding) AS Año,
    ticker,
    totalRevenue
FROM dbo.FinancialStatement
WHERE ticker = 'MSFT'
AND YEAR(fiscalDateEnding) BETWEEN 2015 AND 2020
ORDER BY Año;

-- Cuál fue el total Revenue (acumulado) de Microsoft entre 2015 y 2020?
select sum(totalRevenue) as REVENUE
from FinancialStatement
where ticker = 'MSFT' and
    fiscalDateEnding > cast('2014-12-31' as DATE) 
    and fiscalDateEnding < cast('2021-01-01' as DATE);

