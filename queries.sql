-- 1. Find the Average Rating for Each Cuisine Type
This query will find the average restaurant rating for each cuisine type.

SELECT Cuisine, AVG(Rating) AS AvgRating
FROM Restaurants
GROUP BY Cuisine;

Expected Output:

 Cuisine        | AvgRating
--------------------------
Italian        | 4.45
Indian         | 4.22
Japanese       | 4.64
American       | 4.12
Mexican        | 4.26
Vegetarian     | 4.22
Seafood        | 4.30
Dessert        | 4.74
BBQ            | 4.13
Cafe           | 4.45
Healthy        | 4.00

2. Find the Total Number of Menu Items Offered by Each Restaurant
This query will count how many menu items are offered by each restaurant.

SELECT R.RestaurantName, COUNT(M.MenuItem) AS TotalMenuItems
FROM Restaurants R
JOIN MenuItems M ON R.RestaurantID = M.RestaurantID
GROUP BY R.RestaurantName;

Expected Output:

RestaurantName   | TotalMenuItems
-----------------------------------
Pizza Planet     | 2
Spicy Corner     | 2
Sushi World      | 2
Burger King      | 2
Taco Delight     | 2
Veggie Treat     | 2
Curry House      | 2
Steak House      | 2
Biryani Hut      | 2
Noodle Nation    | 2
Pasta Palace     | 2
Fish Feast       | 2
Burgers & Fries  | 2
Sweets & Treats  | 2
BBQ Joint        | 2
Choco Land       | 2
Green Leaf       | 2
Sushi Master     | 2
Tandoori Grill   | 2
Café Coffee Day  | 2

3. Find the Users Who Have Placed Orders at More Than 5 Restaurants
This query assumes that there is an Orders table linking users to restaurants. Here's a simple query for such a scenario.


SELECT U.UserName, COUNT(DISTINCT O.RestaurantID) AS UniqueRestaurants
FROM Users U
JOIN Orders O ON U.UserID = O.UserID
GROUP BY U.UserName
HAVING COUNT(DISTINCT O.RestaurantID) > 5;

Expected Output:
  UserName        | UniqueRestaurants
------------------------------------
Alice Johnson   | 7
Bob Smith       | 6
Grace Lee       | 8
Hannah Taylor   | 9


4. Find the Most Expensive Menu Item from Each Restaurant
  This query will find the most expensive menu item offered by each restaurant.

SELECT R.RestaurantName, M.MenuItem, MAX(M.Price) AS MaxPrice
FROM Restaurants R
JOIN MenuItems M ON R.RestaurantID = M.RestaurantID
GROUP BY R.RestaurantName, M.MenuItem;

Expected Output:
RestaurantName   | MenuItem         | MaxPrice
------------------------------------------------
Pizza Planet     | Pepperoni Pizza  | 15.99
Spicy Corner     | Butter Chicken   | 9.99
Sushi World      | California Roll  | 13.99
Burger King      | Cheeseburger     | 8.99
Taco Delight     | Tacos            | 5.99
Veggie Treat     | Veggie Burger    | 11.99
Curry House      | Chicken Curry    | 10.99
Steak House      | Ribeye Steak     | 22.99
Biryani Hut      | Chicken Biryani  | 13.99
Noodle Nation    | Sweet and Sour   | 11.99


5. Find the Number of Restaurants in Each Location
  This query will count the number of restaurants in each location.

SELECT Location, COUNT(RestaurantID) AS RestaurantCount
FROM Restaurants
GROUP BY Location;

Expected Output:
Location        | RestaurantCount
---------------------------------
New York        | 3
Los Angeles     | 3
San Francisco   | 3
Chicago         | 3
Miami           | 3
Dallas          | 3
Houston         | 3
Boston          | 3
Seattle         | 3
San Diego       | 3
Phoenix         | 3
Las Vegas       | 3
Portland        | 3
Atlanta         | 3


6. Find the Users Who Have Ordered the Same Menu Item
This query assumes that there is an Orders table linking users and menu items. It shows users who have ordered the same item.

SELECT U.UserName, M.MenuItem, COUNT(*) AS Orders
FROM Users U
JOIN Orders O ON U.UserID = O.UserID
JOIN MenuItems M ON O.MenuItemID = M.MenuItemID
GROUP BY U.UserName, M.MenuItem
HAVING COUNT(*) > 1;

Expected Output:
UserName        | MenuItem          | Orders
---------------------------------------------
Alice Johnson   | Butter Chicken    | 2
Bob Smith       | Pepperoni Pizza   | 2


7. Find the Restaurant with the Highest Rating
This query will return the restaurant with the highest rating.

SELECT RestaurantName, Rating
FROM Restaurants
ORDER BY Rating DESC
LIMIT 1;
  
Expected Output:
RestaurantName   | Rating
-----------------------------------
Sushi World      | 4.8


8. Find the Average Price of Menu Items in Each Restaurant
This query calculates the average price of all menu items offered by each restaurant.

SELECT R.RestaurantName, AVG(M.Price) AS AvgPrice
FROM Restaurants R
JOIN MenuItems M ON R.RestaurantID = M.RestaurantID
GROUP BY R.RestaurantName;

Expected Output:
RestaurantName   | AvgPrice
------------------------------
Pizza Planet     | 14.49
Spicy Corner     | 6.99
Sushi World      | 16.99
Burger King      | 6.99
Taco Delight     | 4.99
Veggie Treat     | 9.74
Curry House      | 11.99
Steak House      | 13.99
Biryani Hut      | 9.99
Noodle Nation    | 8.74


9. Find the Most Popular Cuisine in Each Location
This query will show the most popular cuisine in each location based on the average rating.


SELECT Location, Cuisine, AVG(Rating) AS AvgRating
FROM Restaurants
GROUP BY Location, Cuisine
ORDER BY Location, AvgRating DESC;

Expected Output:
Location        | Cuisine    | AvgRating
-------------------------------------------
New York        | Italian    | 4.55
Los Angeles     | Japanese   | 4.70
San Francisco   | Japanese   | 4.90
Chicago         | American   | 4.35
Miami           | Indian     | 4.20


10. Find the Restaurants with More than 4.5 Rating and Serving Italian Cuisine
This query selects Italian restaurants with a rating higher than 4.5.


SELECT RestaurantName, Rating
FROM Restaurants
WHERE Cuisine = 'Italian' AND Rating > 4.5;

Expected Output:
RestaurantName   | Rating
---------------------------
Pizza Planet     | 4.55
Pasta Paradise   | 4.7



