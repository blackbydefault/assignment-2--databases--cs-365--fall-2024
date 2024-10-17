
INSERT INTO account_users (first_name, last_name, user_name, email, comment) VALUES ('Sarah', 'Connor', 'sarahconnor', 'sarah@example.com', 'Cyberdyne Systems');
INSERT INTO website_users (website_name, website_url) VALUES ('Cyberdyne', 'www.cyberdyne.com');
INSERT INTO pass_users (pass_wrd, pass_create) VALUES (AES_ENCRYPT('T3rm!n4tor', @key_str, @init_vector), CURRENT_TIMESTAMP);


SELECT pass_wrd FROM pass_users
JOIN website_users ON pass_users.id = website_users.id
WHERE website_users.website_url = 'www.supermart.com';


SELECT * FROM pass_users
JOIN website_users ON pass_users.id = website_users.id
WHERE website_users.website_url LIKE '%https%';

UPDATE website_users
SET website_url = 'www.newurl.com'
WHERE website_url = 'www.supermart.com';

UPDATE pass_users
SET pass_wrd = AES_ENCRYPT('NewP@ssword!', @key_str, @init_vector)
WHERE pass_wrd = AES_ENCRYPT('Sup3r!Mart', @key_str, @init_vector);

DELETE FROM website_users
WHERE website_url = 'www.supermart.com';

DELETE FROM pass_users
WHERE pass_wrd = AES_ENCRYPT('Sup3r!Mart', @key_str, @init_vector);
