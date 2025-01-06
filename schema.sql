#Contains the schema creation script

-- Create a database for Zomato-like app
CREATE DATABASE ZomatoApp;
USE ZomatoApp;

-- Create a table for users
CREATE TABLE Users (
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    UserName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Phone VARCHAR(15),
    RegisteredDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create a table for restaurants
CREATE TABLE Restaurants (
    RestaurantID INT AUTO_INCREMENT PRIMARY KEY,
    RestaurantName VARCHAR(100) NOT NULL,
    Location VARCHAR(100),
    Cuisine VARCHAR(50),
    Rating DECIMAL(2,1),
    PriceRange ENUM('Low', 'Medium', 'High')
);

-- Create a table for menu items
CREATE TABLE MenuItems (
    MenuItemID INT AUTO_INCREMENT PRIMARY KEY,
    RestaurantID INT,
    ItemName VARCHAR(100) NOT NULL,
    Price DECIMAL(10,2),
    
);

-- Create a table for orders
CREATE TABLE Orders (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT,
    RestaurantID INT,
    OrderDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    TotalAmount DECIMAL(10,2),
    

);
