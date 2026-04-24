DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM schema_migrations 
        WHERE version = 'v2_add_status'
    ) THEN

        -- your schema change
        ALTER TABLE orders ADD COLUMN status VARCHAR(20);

        -- mark as applied
        INSERT INTO schema_migrations(version) 
        VALUES ('v2_add_status');

    END IF;
END $$;