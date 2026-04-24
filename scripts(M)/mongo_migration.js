// MongoDB Migration Script

db.orders.updateMany(
  { status: { $exists: false } },
  { $set: { status: "pending" } }
);

db.orders.createIndex({ customer_id: 1 });

print("Missing status:", db.orders.countDocuments({ status: { $exists: false } }));
print("With status:", db.orders.countDocuments({ status: { $exists: true } }));