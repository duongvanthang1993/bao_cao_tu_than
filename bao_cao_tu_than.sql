create database if not exists payflow_db;
use payflow_db;

drop table if exists Transactions;

create table Transactions(
transaction_id int auto_increment primary key,
user_id int,
amount decimal(15,2),
transaction_type varchar(20),
created_at datetime
);

insert into Transactions(user_id,amount,transaction_type,created_at) values
(101,1000000.00,'DEPOSIT','2026-06-15 10:30:00'),
(102,500000.00,'DEPOSIT','2026-06-20 14:15:00'),
(103,2000000.00,'WITHDRAW','2026-06-21 09:00:00'),
(104,1500000.00,'DEPOSIT','2026-07-01 08:00:00');

explain
select sum(amount) as total_deposit
from transactions
where transaction_type ='DEPOSIT'
and year(created_at)=2026
and month(created_at)=6;

create index idx_type_date on Transactions(transaction_type,created_at);

explain
select sum(amount) as total_deposit
from Transactions
where transaction_type ='DEPOSIT'
and created_at>='2026-06-01 00:00:00'
and created_at <'2026-07-01 00:00:00';