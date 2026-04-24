BEGIN;

CREATE TABLE IF NOT EXISTS orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    amount DECIMAL(10,2) NOT NULL
);

CREATE INDEX IF NOT EXISTS idx_orders_customer_id
ON orders(customer_id);

COMMIT;