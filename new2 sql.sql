-- Create the database
CREATE DATABASE bookstore;

-- Use the database
USE bookstore;

-- Create users table
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE
);

-- Create books table
CREATE TABLE books (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(255) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL,
    cover_image VARCHAR(255)
);

-- Create orders table
CREATE TABLE orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    total_price DECIMAL(10, 2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- Create order_items table
CREATE TABLE order_items (
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    book_id INT,
    quantity INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (book_id) REFERENCES books(id)
);

-- Insert test users
INSERT INTO users (username, password, email) VALUES 
('john_doe', '$2y$10$K1NvS8IvBWSO7V8SDC.wUuD/IMx.eL/UEfXVr6UJh2QuBvB4ZTguS', 'john@example.com'),
('jane_doe', '$2y$10$N0O8tpiiRZEsQh6q1bXWeuy5XW.Q7G8qQzSyJo7fj8kQulTnnO5IW', 'jane@example.com');

-- Insert test books
INSERT INTO books (title, author, description, price, cover_image) VALUES 
('The Great Gatsby', 'F. Scott Fitzgerald', 'A novel about the American dream.', 10.99, 'images/great_gatsby.jpg'),
('1984', 'George Orwell', 'A dystopian novel about totalitarian regime.', 9.99, 'images/1984.jpg'),
('To Kill a Mockingbird', 'Harper Lee', 'A novel about racial injustice.', 12.99, 'images/to_kill_a_mockingbird.jpg'),
('Pride and Prejudice', 'Jane Austen', 'A romantic novel.', 8.99, 'images/pride_and_prejudice.jpg');

-- Insert test orders
INSERT INTO orders (user_id, total_price) VALUES 
(1, 20.98),
(2, 9.99);

-- Insert test order items
INSERT INTO order_items (order_id, book_id, quantity, price) VALUES 
(1, 1, 1, 10.99),  -- Order 1, Book 1, Quantity 1, Price 10.99
(1, 2, 1, 9.99),   -- Order 1, Book 2, Quantity 1, Price 9.99
(2, 3, 1, 9.99);   -- Order 2, Book 3, Quantity 1, Price 9.99