BEGIN;

DO $$
BEGIN
    IF EXISTS (
        SELECT 1 
        FROM information_schema.tables 
        WHERE table_name = 'orders'
    ) THEN

        ALTER TABLE orders 
        ADD COLUMN IF NOT EXISTS status VARCHAR(20);

    END IF;
END $$;

COMMIT;