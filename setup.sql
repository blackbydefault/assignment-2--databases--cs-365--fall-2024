DROP DATABASE IF EXISTS passwords;
CREATE DATABASE passwords DEFAULT CHARACTER SET utf8mb4;
USE passwords;

SET block_encryption_mode = 'aes-256-cbc';
SET @key_str = UNHEX(SHA2('my secret passphrase', 256));
SET @init_vector = RANDOM_BYTES(16);

CREATE TABLE account_users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(25) NOT NULL,
    last_name VARCHAR(25) NOT NULL,
    user_name VARCHAR(25) NOT NULL,
    email VARCHAR(40) NOT NULL,
    comment VARCHAR(25) NOT NULL
);

CREATE TABLE website_users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    website_name VARCHAR(40) NOT NULL,
    website_url VARCHAR(40) NOT NULL
);

CREATE TABLE pass_users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    pass_wrd VARBINARY(255),
    pass_create TIMESTAMP NOT NULL
);

INSERT INTO account_users (first_name, last_name, user_name, email, comment) VALUES
('John', 'Doe', 'johndoe123', 'john@example.com', 'Shopping website'),
('Jane', 'Smith', 'janesmith456', 'jane@example.com', 'Bookstore website'),
('Alice', 'Johnson', 'alicejohnson', 'alice@example.com', 'Travel booking site'),
('Bob', 'Brown', 'bobbrown789', 'bob@example.com', 'Music streaming'),
('Charlie', 'Davis', 'charliedavis', 'charlie@example.com', 'Gadget reviews'),
('Emily', 'Wilson', 'emilywilson', 'emily@example.com', 'Fitness tracking'),
('Frank', 'Clark', 'frankclark', 'frank@example.com', 'Gaming community'),
('Grace', 'Lewis', 'gracelewis', 'grace@example.com', 'Food blog'),
('Henry', 'Walker', 'henrywalker', 'henry@example.com', 'Fashion website'),
('Ivy', 'Young', 'ivyyoung', 'ivy@example.com', 'Tech news site');

INSERT INTO website_users (website_name, website_url) VALUES
('SuperMart', 'www.supermart.com'),
('Book Paradise', 'www.bookparadise.com'),
('TravelGo', 'www.travelgo.com'),
('MusicWave', 'www.musicwave.com'),
('GadgetZone', 'www.gadgetzone.com'),
('FitLife', 'www.fitlife.com'),
('GameHub', 'www.gamehub.com'),
('FoodieWorld', 'www.foodieworld.com'),
('FashionForward', 'www.fashionforward.com'),
('TechTrends', 'www.techtrends.com');

INSERT INTO pass_users (pass_wrd, pass_create) VALUES
(AES_ENCRYPT('Sup3r!Mart', @key_str, @init_vector), '2024-10-04 17:23'),
(AES_ENCRYPT('Read@Par4dise', @key_str, @init_vector), '2024-10-05 17:23'),
(AES_ENCRYPT('Travel!2024', @key_str, @init_vector), '2024-10-06 17:23'),
(AES_ENCRYPT('MusicW@v3', @key_str, @init_vector), '2024-10-02 17:23'),
(AES_ENCRYPT('G4dgetZ0ne', @key_str, @init_vector), '2024-10-07 17:23'),
(AES_ENCRYPT('Fitness@2024', @key_str, @init_vector), '2024-10-10 17:23'),
(AES_ENCRYPT('G@meHubb!', @key_str, @init_vector), '2024-10-11 17:23'),
(AES_ENCRYPT('F00d!eW0rld', @key_str, @init_vector), '2024-10-12 17:23'),
(AES_ENCRYPT('F@shionFwd', @key_str, @init_vector), '2024-10-14 17:23'),
(AES_ENCRYPT('T3ch!Tr3nds', @key_str, @init_vector), '2024-10-01 17:23');


/*
-- TESTING SQL COMMANDS 
USE passwords; 
SHOW TABLES; 
SELECT pass_wrd FROM pass_users; 
*/



