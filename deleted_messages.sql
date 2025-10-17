SELECT docid, c0content
FROM message_ftsv2_content
WHERE docid NOT IN (SELECT _id FROM message);
