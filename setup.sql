DROP DATABASE IF EXISTS website_accounts; 
CREATE DATABASE website_accounts DEFAULT CHARACTER SET utf8mb4;
use website_accounts;

CREATE TABLE account_users
(
    first_name VARCHAR(25) NOT NULL,
    last_name VARCHAR(25) NOT NULL,
    user_name VARCHAR(25) NOT NULL,
    email VARCHAR(40) NOT NULL,
    comment VARCHAR(25) NOT NULL,
   
);

CREATE TABLE website_users
(
    website_name VARCHAR(40) NOT NULL,
    website_url VARCHAR(40) NOT NULL

);

CREATE TABLE pass_users
(
    pass_wrd VARCHAR(25),
    pass_create TIMESTAMP NOT NULL
);



INSERT INTO account_users
VALUES
(
    
);
INSERT INTO website_users
VALUES
(

);

INSERT INTO pass_users
VALUES
(

);
