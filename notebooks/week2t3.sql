CREATE DATABASE bank_reviews;
CREATE USER 'bank_user'@'localhost' IDENTIFIED BY 'mysql260394';
GRANT ALL PRIVILEGES ON bank_reviews.* TO 'bank_user'@'localhost';
FLUSH PRIVILEGES;

USE bank_reviews;

CREATE TABLE banks (
    bank_id INT AUTO_INCREMENT PRIMARY KEY,
    bank_name VARCHAR(100) NOT NULL,
    app_package_name VARCHAR(100) UNIQUE NOT NULL,
    current_version VARCHAR(50),
    last_updated DATE
);

CREATE TABLE reviews (
    review_id INT AUTO_INCREMENT PRIMARY KEY,
    bank_id INT,
    review_text TEXT,
    rating TINYINT CHECK (rating BETWEEN 1 AND 5),
    sentiment_score DECIMAL(3,2),
    sentiment ENUM('POSITIVE', 'NEUTRAL', 'NEGATIVE'),
    theme VARCHAR(50),
    review_date DATETIME,
    source VARCHAR(50) DEFAULT 'GOOGLE_PLAY',
    FOREIGN KEY (bank_id) REFERENCES banks(bank_id)
);

INSERT INTO banks (bank_name, app_package_name) 
VALUES 
    ('Commercial Bank of Ethiopia', 'com.cbe.cbe'),
    ('Bank of Abyssinia', 'com.boa.mobilebanking'),
    ('Dashen Bank', 'com.dashen.mobilebanking');

