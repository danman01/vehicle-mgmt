CREATE TABLE reservations (
reservation_id integer primary key autoincrement,
 "vehicle_id" varchar(10),
 "user_id" varchar(40),
 "comments" varchar(255),
 "reserved_from" datetime,
 "reserved_until" datetime,
 "created_at" datetime,
 "fulfilled" integer DEFAULT 0
);
