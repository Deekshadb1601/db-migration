ROLLBACK;

BEGIN;

ALTER TABLE order_details
DROP CONSTRAINT IF EXISTS fk_order_details_orders;

DROP INDEX IF EXISTS idx_orders_customer_id;

DROP TABLE IF EXISTS orders;

COMMIT;