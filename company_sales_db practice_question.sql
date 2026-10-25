--A. Beginner — SELECT, WHERE, ORDER BY
1. Display all columns from the employee table.
2. Display only first_name, last_name, salary from employee.
3. Display all departments.
4. Display unique customer cities.
5. Find employees whose salary is greater than 70000.
6. Find employees whose salary is between 60000 and 100000.
7. Find employees working in department 1.
8. Find customers from Hyderabad.
9. Find customers who are not from Bangalore.
10. Find products with stock_quantity less than 15.
11. Find products with unit_price greater than 20000.
12. Find orders with status 'Delivered'.
13. Find orders placed between 2024-01-01 and 2024-03-31.
14. Find employees hired after 2021-01-01.
15. Display employees ordered by salary from highest to lowest.
16. Display the 5 cheapest products.
17. Find customers whose name starts with 'A'.
18. Find products whose name contains 'Laptop'.
19. Find employees whose last name ends with 'a'.
20. Find orders from Hyderabad or Bangalore.


--B. Intermediate — Functions, GROUP BY, HAVING
21. Count the total number of employees.
22. Find the average employee salary.
23. Find the maximum salary.
24. Find the minimum salary.
25. Find the total salary paid by the company.
26. Count employees in each department.
27. Find average salary by department.
28. Find maximum salary by department.
29. Find departments having more than 2 employees.
30. Find total order amount by order status.
31. Find average order amount by customer.
32. Find total sales by customer.
33. Find the number of orders handled by each sales employee.
34. Find the most expensive product in each category.
35. Find total stock quantity by category.
36. Find average product price by supplier.
37. Find customers with more than 1 order.
38. Find employees whose salary is above the company average.
39. Find orders whose total amount is above the average order amount.
40. Use CASE to label employees as High, Medium, or Low salary.


--C. JOIN Practice
41. Join employee and department to display employee name and department name.
42. Display each employee with their manager's name using a self join.
43. Display product name, category name, and supplier name.
44. Display orders with customer names.
45. Display orders with the employee who handled each order.
46. Display order ID, customer name, product name, and quantity.
47. Display customer name and total order amount.
48. Display each department and its employees, including departments with no employees.
49. Display all customers and their orders using LEFT JOIN.
50. Display all products and their categories.
51. Display suppliers and the products they supply.
52. Find customers who have never placed an order.
53. Find products that have never been ordered.
54. Find employees who have not handled any orders.
55. Find the total sales handled by each employee.
56. Find total sales by customer city.
57. Find the top-selling product by quantity.
58. Find category-wise sales amount.
59. Find payment details along with customer name.
60. Display project name, department name, employee name, and project role.


--D.Subqueries
61. Find employees earning more than the average salary.
62. Find the second-highest salary.
63. Find employees with the highest salary in their department.
64. Find products priced above the average product price.
65. Find customers whose total purchases are above the average customer purchase.
66. Find customers who have placed at least one order.
67. Find customers who have never placed an order using NOT EXISTS.
68. Find products that have been ordered at least once using EXISTS.
69. Find employees working in the department with the highest average salary.
70. Find the department with the highest total salary.
71. Find the third-highest salary using a subquery.
72. Find orders greater than the average order amount.
73. Find the most expensive product using a subquery.
74. Find employees whose salary is greater than their manager's salary.
75. Find the customer with the highest total purchase.


--E. Advanced — CTEs and Window Functions
76. Rank employees by salary using RANK().
77. Rank employees within each department by salary.
78. Find the top 2 highest-paid employees in every department.
79. Calculate running total of orders by order date.
80. Calculate monthly sales using a CTE.
81. Find each customer's total purchase and percentage of overall sales.
82. Find the difference between an employee salary and department average salary.
83. Use LAG() to compare each order with the previous order.
84. Use LEAD() to find the next order date.
85. Find the highest-selling product in each category using ROW_NUMBER().
86. Find cumulative sales by customer.
87. Find the first order of every customer.
88. Find the latest order of every customer.
89. Find employees whose salary is in the top 20% of their department.
90. Create a CTE for delivered orders and calculate total delivered revenue.


--F. UPDATE, DELETE, Views, Indexes, Transactions
91. Increase salary by 10% for employees in the IT department.
92. Increase product prices by 5% for products in the Laptops category.
93. Change pending orders to Shipped.
94. Update a customer's city.
95. Delete cancelled orders safely.
96. Delete products with zero stock (after checking dependencies).
97. Create a view showing employee name, department, job title, and salary.
98. Create a view showing customer sales summary.
99. Create an index on employee department_id.
100. Create an index on orders order_date.
101. Create a composite index on orders(customer_id, order_date).
102. Start a transaction, update salaries, check the result, then ROLLBACK.
103. Start a transaction, update a product price, then COMMIT.
104. Use SAVEPOINT before making a second change.
105. Explain a query plan using EXPLAIN ANALYZE