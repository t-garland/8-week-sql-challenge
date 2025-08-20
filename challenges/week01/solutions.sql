-- 1. What is the total amount each customer spent at the restaurant?
SELECT
    sales.customer_id,
    CONCAT('$', SUM(menu.price)) as total_amount
FROM menu
INNER JOIN sales
ON menu.product_id = sales.product_id
GROUP BY sales.customer_id
ORDER BY sales.customer_id;

-- 2. How many days has each customer visited the restaurant?
SELECT
    customer_id,
    COUNT(DISTINCT order_date) AS total_visits
FROM sales
GROUP BY customer_id
ORDER BY customer_id;

-- 3. What was the first item from the menu purchased by each customer?
WITH order_rank AS (
    SELECT sales.customer_id AS customer_id,
        sales.order_date,
        ROW_NUMBER() OVER (PARTITION BY sales.customer_id ORDER BY sales.order_date) AS row_num,
        menu.product_name AS product_name
    FROM sales
    INNER JOIN menu
    ON sales.product_id = menu.product_id
)

SELECT
    customer_id,
    product_name
FROM order_rank
WHERE row_num = 1;

-- 4. What is the most purchased item on the menu and how many times was it purchased by all customers?
-- 5. Which item was the most popular for each customer?
-- 6. Which item was purchased first by the customer after they became a member?
-- 7. Which item was purchased just before the customer became a member?
-- 8. What is the total items and amount spent for each member before they became a member?
-- 9. If each $1 spent equates to 10 points and sushi has a 2x points multiplier - how many points would each customer have?
-- 10. In the first week after a customer joins the program (including their join date) they earn 2x points on all items, not just sushi - how many points do customer A and B have at the end of January?
