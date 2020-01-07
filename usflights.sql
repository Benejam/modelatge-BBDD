/* Añadir columnas a tabla antes de importar datos */
ALTER TABLE flights
ADD CarrierDelay SMALLINT(6) UNSIGNED,
ADD WeatherDelay SMALLINT(6) UNSIGNED,
ADD NASDelay SMALLINT(6) UNSIGNED,
ADD SecurityDelay SMALLINT(6) UNSIGNED,
ADD LateAircraftDelay SMALLINT(6) UNSIGNED;

/* 1. Contar vuelos */
SELECT COUNT(*) FROM flights;

/* 2. Calcular promedios de retraso por aeropuerto de origen */
SELECT Origin, AVG(ArrDelay), AVG(DepDelay)
FROM flights
GROUP BY Origin;

/* 3. Calcular promedio de retrasos de llegadas por aeropuerto, mes y año */
SELECT Origin, colYear, colMonth, AVG(ArrDelay)
FROM flights
GROUP BY Origin, colYear, colMonth
ORDER BY Origin, colYear, colMonth;

/* 4. Igual que 3 pero mostrando ciudad del aeropuerto */
SELECT City, colYear, colMonth, AVG(ArrDelay)
FROM flights
INNER JOIN usairports ON flights.Origin = usairports.IATA
GROUP BY City, colYear, colMonth
ORDER BY City, colYear, colMonth;

/* 5. Compañías con más vuelos cancelados por mes y año, ordenadas de más a menos cancelaciones */
SELECT UniqueCarrier, colYear, colMonth, SUM(Cancelled)
FROM flights
GROUP BY UniqueCarrier, colYear, colMonth
ORDER BY SUM(Cancelled) DESC;

/* 6. 10 aviones con una mayor distancia recorrida */
SELECT TailNum, SUM(Distance)
FROM flights
WHERE TailNum != ""
GROUP BY TailNum
ORDER BY SUM(Distance) DESC 
LIMIT 10;

/* 7. Las compañías con un retraso promedio mayor a 10 min */
SELECT UniqueCarrier, AVG(ArrDelay)
FROM flights
GROUP BY UniqueCarrier
HAVING AVG(ArrDelay) > 10
ORDER BY AVG(ArrDelay) DESC;