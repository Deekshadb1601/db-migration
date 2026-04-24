\# Migration Validation



\## 1. Baseline (Before Migration)



\### PostgreSQL

\- Orders table did not contain `status` column



\### MongoDB

\- Documents without `status` field: (add your count)

\- Documents with `status` field: (add your count)



\---



\## 2. Failure Simulation



\### PostgreSQL

\- Simulated failure during migration (forced interruption)

\- Transaction rolled back successfully

\- Schema remained unchanged after failure



\### MongoDB

\- Simulated partial update

\- Some documents updated, some not

\- Re-running script updated remaining documents (idempotent behavior)



\---



\## 3. Successful Execution



\### PostgreSQL

\- `status` column added successfully

\- Index on `customer\_id` created



\### MongoDB

\- All documents now contain `status` field

\- Index created successfully



\---



\## 4. Performance Validation



\### PostgreSQL

\- Queries continue using index

\- No significant increase in rows scanned or cost



\### MongoDB

\- Index used for `customer\_id`

\- Query performance stable



\---



\## 5. Conclusion



\- Migration is safe under failure conditions

\- PostgreSQL ensures atomic rollback

\- MongoDB migration is recoverable and idempotent

\- No critical performance regression observed

