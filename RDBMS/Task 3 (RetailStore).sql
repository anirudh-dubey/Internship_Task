CREATE DATABASE dbretailstore;

-> Use DataBase:

	USE dbretailstore;

-> Tables:

	- CustomersTable:

		-Create Table:
			CREATE TABLE Customers (
    			customer_id INT AUTO_INCREMENT PRIMARY KEY,
    			first_name VARCHAR(100),
    			last_name VARCHAR(100),
    			email VARCHAR(100),
    			phone VARCHAR(20),
    			address TEXT,
    			join_date DATE
			);

		-Insert Records into Table:
			INSERT INTO Customers (first_name, last_name, email, phone, address, join_date) VALUES
			('Ramesh', 'Sharma', 'rameshsharma@gamail.com', '+919876543210', '123 MG Road, Indore, MP', '2023-01-15'),
			('Suresh', 'Verma', 'sureshverma@gamail.com', '+919123456789', '45 MG Road, Bhopal, MP', '2023-02-20')	


	- Products Table :

		- Create Table:
			CREATE TABLE Products (
    			product_id INT AUTO_INCREMENT PRIMARY KEY,
    			product_name VARCHAR(100),
    			category VARCHAR(50),
    			price DECIMAL(10,2),
    			stock_quantity INT
			);


		-Insert Records into Table:
			INSERT INTO Products (product_name, category, price, stock_quantity) VALUES
			('Apple iPhone 14', 'Electronics', 79999.00, 50),
			('Samsung Galaxy S23', 'Electronics', 74999.00, 40)
			


	- Orders Table :

		- Create Table:
			CREATE TABLE Orders (
    			order_id INT AUTO_INCREMENT PRIMARY KEY,
    			customer_id INT,
    			order_date DATE,
    			total_amount DECIMAL(10,2),
    			order_status VARCHAR(20),
    			FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
			);

		- Insert Records into Table:
			INSERT INTO Orders (customer_id, order_date, total_amount, order_status) VALUES
			(5, '2023-01-05', 129999.00, 'Shipped'),
			(10, '2023-01-12', 2499.00, 'Delivered'),
			(3, '2023-01-25', 40999.00, 'Pending');



	- OrderDetails Table :

		- Create Table:
			CREATE TABLE OrderDetails (
   			order_detail_id INT AUTO_INCREMENT PRIMARY KEY,
   			order_id INT,
    			product_id INT,
    			quantity INT,
    			unit_price DECIMAL(10,2),
    			FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    			FOREIGN KEY (product_id) REFERENCES Products(product_id)
			);

		- Insert Records into Table:			
			INSERT INTO OrderDetails (order_id, product_id, quantity, unit_price) VALUES
			(1, 2, 1, 74999.00),
			(1, 5, 1, 8999.00),
			(2, 15, 2, 2499.00);


	- Payments Table :
		
		- Create Table:
			CREATE TABLE Payments (
    			payment_id INT AUTO_INCREMENT PRIMARY KEY,
    			order_id INT,
    			payment_date DATE,
    			payment_amount DECIMAL(10,2),
    			payment_method VARCHAR(20),
    			FOREIGN KEY (order_id) REFERENCES Orders(order_id)
			);

		- Insert Records into Table:
			INSERT INTO Payments (order_id, payment_date, payment_amount, payment_method) VALUES
			(1, '2023-01-06', 129999.00, 'Credit Card'),
			(2, '2023-01-13', 2499.00, 'Debit Card'),
			(3, '2023-01-26', 40999.00, 'Net Banking');
			

	1. Find the Total Number of Orders for Each Customer.

		- > SELECT o.customer_id,c.first_name,c.last_name,COUNT(o.customer_id) FROM customers c INNER JOIN orders o ON c.customer_id=o.customer_id GROUP BY o.customer_id

	2. Find the Total Sales Amount for Each Product (Revenue per Product).

		- > SELECT p.product_id,p.product_name,p.category,SUM(od.quantity*od.unit_price) Total_Sales_Amount FROM products p INNER JOIN orderdetails od ON p.product_id=od.product_id GROUP BY p.product_id,p.product_name,p.category ORDER BY Total_Sales_Amount DESC

	3. Find the Most Expensive Product Sold.

		- > SELECT p.product_id,p.product_name,p.category,od.unit_price Sold_Price FROM products p INNER JOIN orderdetails od ON p.product_id=od.product_id GROUP BY p.product_id,p.product_name,p.category ORDER BY `Sold_Price` DESC LIMIT 1

	4. Get the List of Customers Who Have Placed Orders in the Last 30 Days.

		- > SELECT c.customer_id,c.first_name,c.last_name,o.order_date FROM customers c INNER JOIN orders o ON c.customer_id=o.customer_id WHERE o.order_date >= CURDATE()-INTERVAL 30 DAY GROUP BY c.customer_id,c.first_name,c.last_name

		:- Current date - CURDATE()  jab kabhi hum date me se date +/- krna ho toh INTERVAL 21 DAY use krte hai.

	5. Calculate the Total Amount Paid by Each Customer.

		- > SELECT c.customer_id,c.first_name,c.last_name,SUM(p.payment_amount) total_paid_amount FROM payments p INNER JOIN orders o ON p.order_id=o.order_id INNER JOIN customers c ON o.customer_id=c.customer_id GROUP BY c.customer_id,c.first_name,c.last_name;

	6. Get the Number of Products Sold by Category.

		- > SELECT p.category,COUNT(od.product_id) FROM products p INNER JOIN orderdetails od ON p.product_id=od.product_id GROUP BY p.category

		
	7. List All Orders That Are Pending (i.e., Orders that haven't been shipped yet).

		- > SELECT * FROM orders WHERE order_status = "Pending"

	8. Find the Average Order Value (Total Order Amount / Number of Orders).

		- > SELECT AVG(total_amount) Avg_order_value FROM orders

	9. List the Top 5 Customers Who Have Spent the Most Money.

		- > SELECT c.customer_id,c.first_name,c.last_name,SUM(p.payment_amount) total_spent  FROM payments p INNER JOIN orders o ON p.order_id=o.order_id INNER JOIN customers c ON o.customer_id=c.customer_id GROUP BY c.customer_id,c.first_name,c.last_name ORDER BY SUM(p.payment_amount) DESC LIMIT 5;

	10. Find the Products That Have Never Been Sold.
		
		- > SELECT p.* FROM products p LEFT JOIN orderdetails od ON p.product_id=od.product_id WHERE od.product_id IS null





    
	
		



