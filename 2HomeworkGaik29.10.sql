CREATE TABLE Users (
  user_id INT AUTO_INCREMENT PRIMARY KEY,
  user_name VARCHAR(50) NOT NULL,
  email VARCHAR(100) UNIQUE,
  age INT CHECK (age >= 0 AND age <= 140),
  gender ENUM('m', 'f')
);

INSERT INTO Users (user_name, email, age)
VALUES ('John Doe', 'johndoe@example.com', 30);

INSERT INTO Users (user_name, email, age)
VALUES ('Jane Smith', 'janesmith@example.com', 25);
