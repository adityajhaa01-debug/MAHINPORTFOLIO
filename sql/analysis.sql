-- Revenue Leakage & Pricing Intelligence
-- Illustrative SQL analysis against a relational sales model.

-- 1. Contract vs realized price leakage
WITH invoice_base AS (
  SELECT
    i.invoice_id,
    i.customer_id,
    i.product_id,
    i.quantity,
    i.contract_price,
    i.invoice_unit_price,
    i.quantity * (i.contract_price - i.invoice_unit_price) AS price_variance
  FROM invoices i
), ranked AS (
  SELECT *,
    SUM(price_variance) OVER (PARTITION BY customer_id) AS customer_leakage,
    RANK() OVER (ORDER BY price_variance DESC) AS leakage_rank
  FROM invoice_base
)
SELECT * FROM ranked WHERE price_variance > 0 ORDER BY price_variance DESC;

-- 2. Customer contribution profitability
WITH customer_economics AS (
  SELECT customer_id,
    SUM(net_revenue) AS revenue,
    SUM(cogs) AS cogs,
    SUM(discount_amount) AS discounts,
    SUM(support_cost) AS support_cost,
    SUM(net_revenue - cogs - support_cost) AS contribution_profit
  FROM order_economics
  GROUP BY customer_id
)
SELECT *,
  contribution_profit / NULLIF(revenue,0) AS contribution_margin,
  RANK() OVER (ORDER BY contribution_profit DESC) AS profit_rank
FROM customer_economics
ORDER BY contribution_profit DESC;

-- 3. Monthly price realization
SELECT DATE_TRUNC('month', invoice_date) AS month,
  SUM(invoice_unit_price * quantity) / NULLIF(SUM(contract_price * quantity),0) AS price_realization,
  SUM(discount_amount) / NULLIF(SUM(list_value),0) AS discount_rate
FROM invoices
GROUP BY 1 ORDER BY 1;
