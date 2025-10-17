WITH ranked_messages AS (
    SELECT 
        Z_PK, 
        strftime('%Y-%m-%d %H:%M:%S', "timestamp" / 1000, 'unixepoch') || '.' || printf('%03d', "timestamp" % 1000) AS timestamp, 
        ZTEXT,
        LAG(Z_PK) OVER (ORDER BY Z_PK) AS previous_PK  -- Ottieni il valore di Z_PK della riga precedente
    FROM 
        ZWAMESSAGE
    WHERE 
        ZTEXT IS NOT NULL  -- Cambiato 'NULL' a IS NOT NULL per una verifica più corretta
        AND "timestamp" BETWEEN 1732409242000 AND 1733791642000  -- Timestamp in millisecondi per le date specificate
)
SELECT 
    Z_PK, 
    timestamp, 
    ZTEXT, 
    COALESCE(NULLIF(Z_PK - previous_PK - 1, 0), 0) AS gap  -- Calcola il gap
FROM 
    ranked_messages;
