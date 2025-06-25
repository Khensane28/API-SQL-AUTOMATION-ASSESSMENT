SELECT 
    CONCAT(c.first_name, ' ', c.last_name) AS "Full Name", 
    c.email AS "Email Address", 
    n.note_text AS "Most Recent Note" 
FROM contacts c  
LEFT JOIN contact_notes n 
    ON c.contact_id = n.contact_id 
    AND n.note_id = (
        SELECT n2.note_id
        FROM contact_notes n2 
        WHERE n2.contact_id = c.contact_id 
        ORDER BY n2.created_at DESC
        LIMIT 1
    )
WHERE 
    c.first_name LIKE 'A%'
    AND (n.created_at >= DATE_SUB(CURDATE(), INTERVAL 7 DAY) OR n.created_at IS NULL)
ORDER BY c.last_name, c.first_name;
