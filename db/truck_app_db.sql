create table vehicles (
vehicleID varchar(10),
year year,
make varchar(14),
model varchar(20),
owner varchar(20),
alias varchar(255),
image_url varchar(255), 
primary key (vehicleID)
);

create table locations (
building_dbid integer PRIMARY KEY AUTOINCREMENT NOT NULL,
building_number varchar(10),
name varchar(255)
);

create table users (
myid varchar(40),
user_fname varchar(50),
user_lname varchar(50),
user_email varchar(50),
user_phone varchar(12),
user_group varchar(25),
primary key (myid)
);

create table trips (
trip_id integer PRIMARY KEY AUTOINCREMENT NOT NULL,
vehicle_id varchar(16),
myid varchar(40),
destination_name varchar(100),
description varchar(255),
check_out_time datetime,
check_in_time datetime,
multidest_trip_id integer,
comments varchar(255),
foreign key (multidest_trip_id) references trips(trip_id),
foreign key (vehicle_id) references vehicles(vehicleID),
foreign key (myid) references users(myid)
);

create table dorms (
building_number varchar(10),
num_residents integer,
community varchar(40),
infrastructure varchar(6),
primary key (building_number),
foreign key (building_number) references locations(building_number)
);


create table ip_ranges (
range_number integer PRIMARY KEY AUTOINCREMENT NOT NULL,
building_number varchar(10),
ip_range varchar(30),
number_ip_in_range integer,
foreign key (building_number) references locations(building_number)
);

/*regex--
to find  four character time string:
([0-1])([0-9])([0-5])([0-9])

replace with:
\1\2:\3\4

regex tab:
\t

=====find/replace command=======
*convert four character mil time string to sql time data type (does not handle 2000hr+, edit and search manually as needs)
find: \t([0-1])([0-9])([0-5])([0-9])
replace: \t\1\2:\3\4

*combine date and time tab seperated values into one datetime value
find: (2009-[0-1][0-9]-[0-3][0-9])\t([0-1][0-9]:[0-5][0-9])
replace: \1 \2

*change mm/dd/yyyy type dates to yyyy-mm-dd
find: ([0-1][0-9])/([0-3][0-9])/2009
replace: 2009-\1-\2

*add '0' before month space in mm/dd/yyyy for jan-sept
find: \t([1-9])/
replace: \t0\1/

*find emails, repaste just myid
find: (\w+)@uga.edu
replace: \1@uga.edu\t\1

*seperate first name and last name
find: (\w)\s(\w)
replace: \1','\2

*re-order a comma seperated group (of four)
('.*'),('.*'),('.*'),('.*')
\4,\1,\2,\3

*/


