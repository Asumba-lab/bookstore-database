-- 1. Get all books with their authors
SELECT b.title, a.first_name, a.last_name
FROM book b
JOIN book_author ba ON b.book_id = ba.book_id
JOIN author a ON ba.author_id = a.author_id;

-- 2. Get all customer orders with shipping method and status
SELECT o.order_id, c.first_name, c.last_name, o.order_date, sm.method_name, os.status_name
FROM cust_order o
JOIN customer c ON o.customer_id = c.customer_id
JOIN shipping_method sm ON o.shipping_method_id = sm.method_id
JOIN order_status os ON o.current_status_id = os.status_id;

-- 3. List all addresses for a customer
SELECT c.first_name, c.last_name, a.street, a.city, cs.status_name
FROM customer c
JOIN customer_address ca ON c.customer_id = ca.customer_id
JOIN address a ON ca.address_id = a.address_id
JOIN address_status cs ON ca.status_id = cs.status_id;

-- 4. Count the number of books by each publisher
SELECT p.name AS publisher, COUNT(b.book_id) AS total_books
FROM publisher p
JOIN book b ON p.publisher_id = b.publisher_id
GROUP BY p.name;

-- 5. Top 5 most recent orders
SELECT order_id, order_date
FROM cust_order
ORDER BY order_date DESC
LIMIT 5;
