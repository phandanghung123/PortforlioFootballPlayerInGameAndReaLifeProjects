--Checking input data

SELECT *
FROM dbo.Player_perfomance_in_real_life
ORDER BY age,height

--Checking if the player in  player perfomance in real life
-- Use 'SELECT ... INTO' for SQL Server
SELECT 
    a.Name, 
    b.height,
    b.age,
    a.RAT,
    a.POS,
    a.VER,
    CASE 
        WHEN a.price LIKE '%K' THEN CAST(REPLACE(a.price, 'K', '') AS FLOAT) * 1000
        WHEN a.price LIKE '%M' THEN CAST(REPLACE(a.price, 'M', '') AS FLOAT) * 1000000 
        ELSE CAST(ISNULL(NULLIF(a.price, ''), 0) AS FLOAT) 
    END AS numeric_price,
    a.SKI,
    a.WR,
    a.PAC,
    a.SHO,
    a.DRI,
    a.DEF,
    a.PHY,
    a.BS,
    a.IGS,
    b.appearance,
    b.goals,
    b.assists,
    b.minutes_played,
    b.award,
    a.Popularity,
    b.current_value AS price_in_market,
    b.highest_value AS max_price_in_market
INTO dbo.process_data  -- <--- This replaces 'CREATE TABLE AS'
FROM dbo.FIFA_estimate AS a
JOIN dbo.Player_perfomance_in_real_life AS b
    ON a.Name = b.name;