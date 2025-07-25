SELECT * FROM contacts
WHERE first_name LIKE 'A%'

    SELECT contacts.id,contact_notes.contact_id
FROM contacts
LEFT JOIN contact_notes ON contacts.id = contact_notes.contact_id
ORDER BY contacts.id
WHERE created_at >=CURRENT_DATE -INTERVAL '7 days';

SELECT contacts.first_name +' ' + contacts.last_name as full_name,
contacts.email,
SELECT contacts.id,contact_notes.contact_id
FROM contact
FULL OUTER JOIN contact_notes ON contacts.id = contact_notes.contact_id
ORDER BY contacts.id
WHERE created_at >=CURRENT_DATE -INTERVAL '7 days';
FINAL:
SELECT
contacts.first_name ||' '|| contacts.last_name AS full_name,
contacts.emails,
contact_notes.note_text AS most_recent_note
FROM contacts
JOIN(SELECT 
contact_id,
note_text,
ROW_NUMBER() OVER (PARTITION BY contact_id ORDER BY created_at DESC) AS rn
FROM contact_notes
WHERE created at >= CURRENT_DATE - INTERVAL '7 days')AS n
ON contact_notes.contact_id=contacts.id
AND contact_notes.rn =1 WHERE contacts.first_name LIKE 'A%'
ORDER BY full_name;

