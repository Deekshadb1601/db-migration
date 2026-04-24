# Migration Validation

## 1. Baseline (Before Migration)

### PostgreSQL
- Orders table did not contain `status` column (verified using `\d orders`)

### MongoDB
- Documents without `status` field: 50000
- Documents with `status` field: 0

---

## 2. Failure Simulation

### PostgreSQL
- Forced failure during migration execution
- Transaction rolled back successfully
- Verified schema after failure: `status` column not present

### MongoDB
- After partial execution:
  - Documents with `status`: 18000
  - Documents without `status`: 32000
- After re-running migration:
  - Documents without `status`: 0
- Confirms idempotent and recoverable behavior

---

## 3. Successful Execution

### PostgreSQL
- `status` column added successfully
- Index on `customer_id` created

### MongoDB
- All documents now contain `status` field
- Index on `customer_id` created successfully

---

## 4. Performance Validation

### PostgreSQL
- Queries filtering by `customer_id` use Index Scan
- No significant increase in rows scanned or query cost observed

### MongoDB
- Queries on `customer_id` use index
- No full collection scan observed
- Query performance remains stable

---

## 5. Conclusion

- PostgreSQL migration is safe due to transactional rollback
- MongoDB migration is idempotent and safe to re-run
- Migration handles partial failures without data inconsistency
- No critical performance regression observed