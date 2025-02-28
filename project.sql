use paymentapp;
create table user_info( user_id INT AUTO_INCREMENT PRIMARY KEY,
	user_name varchar(20),
	password varchar(20),	
	first_name varchar(20),
    last_name varchar(20),
    phone_number bigint UNIQUE,
    email varchar(20),
    address varchar(30)
    );
    INSERT INTO user_info (user_name, password, first_name, last_name, phone_number, email, address)
VALUES ('Sunitha', 'suni123', 'Sunitha', 'killi', 7794830448,'suni52@gmail.com','NAD'),
('geetha','geethu111','geetha','Bolem',995133622,'geethu@gmail.com','dabagardens'),
('Hemasree','hema123','Hema','sree',1234567890,'hema@gmail.com','kommadi'),
('Harshitha','harshi234','Harshitha','Reddy',2345678901,'harshi@gmail.com','udacolony'),
('Akhira','Akhira123','Akhira','Kolli',3456123467,'Akhira@gmail.com','bhp'),
('Naresh','naresh123','naresh','kumar',1234554321,'nares@gmail.com','madhurwada');
desc user_info;
select *from user_info;

create table user_acc_details
(
user_acc_id int ,
Acc_open_date DATE,
Current_wallet_Balance bigint,
Linked_bank_accounts int,
wallet_pin varchar(10),
FOREIGN KEY(user_acc_id) REFERENCES user_info(user_id)
);
INSERT INTO user_acc_details (user_acc_id, acc_open_date, Current_wallet_Balance, linked_bank_accounts, wallet_pin)  
VALUES 
(1, '2020-09-25', 20000, 2, 343),
(2, '2022-12-12', 10000, 1, 779),
(3, '2024-01-5', 15000, 1, 589),
(4, '2021-04-10', 5000, 1, 301),
(5, '2023-11-25', 9000, 1, 502),
(6, '2025-02-25', 4000, 2, 111);
desc user_acc_details;
select *from user_acc_details;

Create table BankAccount
(
bank_acc_id int PRIMARY KEY,
user_id int,
Acc_number bigint,
ifsc_code varchar(20),
bank_name varchar(20),
is_active ENUM('yes','no'),
bank_branch_loc varchar(20),
FOREIGN KEY(user_id) REFERENCES user_info(user_id)

);

INSERT INTO BankAccount (bank_acc_id, user_id, Acc_number, ifsc_code, bank_name,is_active, bank_branch_loc)  
VALUES 
(423, 1, 234123567765, 'SBI01888',  'SBI','yes','kotthapeta'),
(417,2,234567123456,'HDFC234','HDFC','yes','secundrabad'),
(456,3,51248567884,'uni@345','union','yes','gajuwaka'),
(426,4,7146683841,'KVB@987','KarurVysyaBank','no','gajularega'),
(428,5,7146583841,'SBI@987','stateban','yes','ameerpet'),
(440,6,6646683841,'kotak@981','KotakMahendraBank','no','khairatabad');

select *from BankAccount;

create table Source_types(source_id int primary key,source_type_code varchar(4),source_type_desc varchar(20));

INSERT INTO Source_types (source_id, source_type_code, source_type_desc)  
VALUES 
(1, 'BNK', 'Bank Transfer'),
(2, 'WAL', 'Wallet'),
(3, 'UPI', 'UPI Payment');

select *from Source_types;

CREATE TABLE transaction_details (
    txn_id INT  PRIMARY KEY,
    txn_date_time DATETIME ,
    source_id INT ,
    target_id INT ,
    source_type_id INT ,
    dest_type_id INT ,
    txn_amount BIGINT,
    user_id INT ,
    FOREIGN KEY (source_type_id) REFERENCES source_types(source_id),
    FOREIGN KEY (dest_type_id) REFERENCES source_types(source_id),
    FOREIGN KEY (user_id) REFERENCES user_info(user_id)
);


insert into transaction_details(txn_id,txn_date_time,source_id,target_id,source_type_id,dest_type_id,
txn_amount,user_id) values(1, '2021-12-22 10:30:00', 1, 2, 1, 2, 2000,1),
(2, '2015-02-21 12:45:00', 2, 1, 2, 1, 5500,2),
(3, '2025-09-22 09:15:00', 3, 4, 1, 2, 6000,3),
(4, '2022-07-21 14:00:00', 5, 6, 1, 2, 3500,4),
(5, '2023-06-12 11:10:00', 2, 3, 2, 1, 10000,5),
(6, '2021-11-02 16:45:00', 6, 1, 3,2, 1000,6);

select *from transaction_details;









