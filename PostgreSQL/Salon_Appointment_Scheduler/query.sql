You should create a database named salon

You should connect to your database, then create tables named customers, appointments, and services

Each table should have a primary key column that automatically increments

Each primary key column should follow the naming convention, table_name_id. For example, the customers table should have a customer_id key. Note that there’s no s at the end of customer

Your appointments table should have a customer_id foreign key that references the customer_id column from the customers table

Your appointments table should have a service_id foreign key that references the service_id column from the services table

Your customers table should have phone that is a VARCHAR and must be unique

Your customers and services tables should have a name column

Your appointments table should have a time column that is a VARCHAR

You should have at least three rows in your services table for the different services you offer, one with a service_id of 1

You should create a script file named salon.sh in the project folder

Your script file should have a “shebang” that uses bash when the file is executed (use #! /bin/bash)

Your script file should have executable permissions

You should not use the clear command in your script

You should display a numbered list of the services you offer before the first prompt for input, each with the format #) <service>. For example, 1) cut, where 1 is the service_id

If you pick a service that doesnt exist, you should be shown the same list of services again

Your script should prompt users to enter a service_id, phone number, a name if they aren’t already a customer, and a time. You should use read to read these inputs into variables named SERVICE_ID_SELECTED, CUSTOMER_PHONE, CUSTOMER_NAME, and SERVICE_TIME

If a phone number entered doesn’t exist, you should get the customers name and enter it, and the phone number, into the customers table

You can create a row in the appointments table by running your script and entering 1, 555-555-5555, Fabio, 10:30 at each request for input if that phone number isn’t in the customers table. The row should have the customer_id for that customer, and the service_id for the service entered

You can create another row in the appointments table by running your script and entering 2, 555-555-5555, 11am at each request for input if that phone number is already in the customers table. The row should have the customer_id for that customer, and the service_id for the service entered

After an appointment is successfully added, you should output the message I have put you down for a <service> at <time>, <name>. For example, if the user chooses cut as the service, 10:30 is entered for the time, and their name is Fabio in the database the output would be I have put you down for a cut at 10:30, Fabio. Make sure your script finishes running after completing any of the tasks above, or else the tests wont pass

-- Queries
create database salon;

\c salon

create table customers(customer_id serial primary key, phone varchar(15) unique not null, name varchar(40) not null);
CREATE TABLE
\d customers;
                                          Table "public.customers"
   Column    |         Type          | Collation | Nullable |                    Default                     
-------------+-----------------------+-----------+----------+------------------------------------------------
 customer_id | integer               |           | not null | nextval('customers_customer_id_seq'::regclass)
 phone       | character varying(15) |           | not null | 
 name        | character varying(40) |           | not null | 
Indexes:
    "customers_pkey" PRIMARY KEY, btree (customer_id)
    "customers_phone_key" UNIQUE CONSTRAINT, btree (phone)

create table services(
    service_id serial primary key, 
    name varchar(40) not null);

\d services
                                         Table "public.services"
   Column   |         Type          | Collation | Nullable |                   Default                    
------------+-----------------------+-----------+----------+----------------------------------------------
 service_id | integer               |           | not null | nextval('services_service_id_seq'::regclass)
 name       | character varying(40) |           | not null | 
Indexes:
    "services_pkey" PRIMARY KEY, btree (service_id)

create table appointments(
    appointment_id serial primary key, 
    customer_id int not null, service_id int not null, 
    foreign key(customer_id) references customers(customer_id), 
    foreign key(service_id) references services(service_id));

alter table appointments add column time varchar(20) not null;

    Table "public.appointments"
     Column     |         Type          | Collation | Nullable |                       Default                        
----------------+-----------------------+-----------+----------+------------------------------------------------------
 appointment_id | integer               |           | not null | nextval('appointments_appointment_id_seq'::regclass)
 customer_id    | integer               |           | not null | 
 service_id     | integer               |           | not null | 
 time           | character varying(20) |           | not null | 
Indexes:
    "appointments_pkey" PRIMARY KEY, btree (appointment_id)
Foreign-key constraints:
    "appointments_customer_id_fkey" FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
    "appointments_service_id_fkey" FOREIGN KEY (service_id) REFERENCES services(service_id)

insert into services(name) values('Hair Services'), ('Skincare Services'), ('Nail Services');
select * from services;
 service_id |       name        
------------+-------------------
          1 | Hair Services
          2 | Skincare Services
          3 | Nail Services

-- Commands
$> touch salon.sh

$> chmod +x salon.sh

