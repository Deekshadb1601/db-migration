BEGIN;

-- Step 1: create structure
CREATE TABLE IF NOT EXISTS orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    amount DECIMAL(10,2) NOT NULL
);

-- Step 2: modify / add constraint
ALTER TABLE orders
ADD COLUMN IF NOT EXISTS status VARCHAR(20);

-- Step 3: performance optimization
CREATE INDEX IF NOT EXISTS idx_orders_customer_id
ON orders(customer_id);

COMMIT;