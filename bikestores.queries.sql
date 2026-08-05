USE BikeStores;
--1.length of each product name--

SELECT product_name,LEN(product_name) as product_length FROM production.products;

--2.first 5 characters of product name--

SELECT product_name,LEFT(product_name,5) as f_5_char_p_name FROM production.products;

--3.Replace hyphens with spaces in product names--
SELECT product_name,REPLACE(product_name,'-','') AS TRIM_NAME FROM production.products; 

--4.Find position of Bike in product names--
SELECT product_name,CHARINDEX('Bike',product_name) as bike_position FROM production.products;

--5.Concatenate product name and model year--

SELECT product_name +'-'+ CAST(model_year AS VARCHAR) AS product_with_year FROM
production.products;

--6.Convert product names to uppercase--
SELECT product_name,UPPER(product_name) AS upper_name FROM production.products

--7.Convert product names to lowercase--
SELECT product_name,LOWER(product_name) AS lower_name FROM production.products;

--8.Trim spaces from product names--
SELECT product_name,LTRIM(RTRIM(product_name)) AS trimmed_name FROM production.products;

--9.Find customers whose email starts with 'a'--
SELECT * FROM sales.customers;
SELECT * FROM sales.customers WHERE email LIKE'a%';
SELECT first_name,email FROM sales.customers WHERE email LIKE'a%';

--10.Find domain from customer emails--
SELECT email, RIGHT(email, LEN(email) - CHARINDEX('@', email)) AS domain FROM
sales.customers;

--11.Extract brand from product names (before space)--
SELECT * FROM production.products;
SELECT product_name,LEFT(product_name, CHARINDEX(' ', product_name)-1) AS brand
FROM production.products WHERE CHARINDEX(' ', product_name)>0;

--12.Count how many products contain 'Mountain'--
SELECT COUNT(*) FROM production.products as Mountain_bikes
WHERE product_name like '%Mountain%';


--13.Products that do not contain 'Bike'--
SELECT * FROM Production.products
WHERE product_name NOT LIKE '%Bike%';

--14.Concatenate brand and category--
SELECT CONCAT(P.product_name,'-',B.brand_name,'-',C.category_name)AS Bike_Fullname
FROM production.products AS P
INNER JOIN production.brands AS B 
ON P.brand_id = B.brand_id
INNER JOIN production.categories AS C
ON P.category_id = C.category_id;

--15.Customers whose last name starts with 'K'--
SELECT * FROM sales.customers
WHERE last_name LIKE 'K%';

--16.Extract area code from phone number--
SELECT phone,LEFT(phone,CHARINDEX(' ',phone)-1) AS Area_code
FROM sales.customers
WHERE phone IS NOT NULL;

--17.Emails that contain 'gmail.com'--
SELECT * FROM sales.customers
WHERE email LIKE '%gmail.com%';

--18.Create customer code
SELECT CONCAT(customer_id,LEFT(first_name,3))  AS cus_id
FROM sales.customers;

--19.Show customers where email contains company name--
SELECT * FROM sales.customers
WHERE CHARINDEX(email,'company')>0;

--20.Check if phone numbers contain dashes--
SELECT phone,CHARINDEX(phone,'-')
FROM sales.customers
WHERE phone IS NOT NULL;

