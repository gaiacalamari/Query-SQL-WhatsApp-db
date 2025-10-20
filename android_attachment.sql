SELECT 
    m._id, 
    m.date_sent, 
    m.from_recipient_id, 
    m.content_type
FROM 
    message m
JOIN 
    attachment a ON m._id = a.message_id;

/* restituisce informazioni sui messaggi che contengono allegati, estraendo ID, data, mittente/destinatario e tipo di contenuto
