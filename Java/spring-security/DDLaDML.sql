Create Database SecurityProject

CREATE TABLE customer (customer_id int IDENTITY NOT NULL, name varchar(100) NOT NULL, email varchar(100) NOT NULL, mobile_number varchar(20) NOT NULL, pwd varchar(500) NOT NULL, role varchar(100) NOT NULL, create_dt date NOT NULL, PRIMARY KEY (customer_id));
CREATE TABLE account_transactions (transaction_id varchar(200) NOT NULL, account_number int NOT NULL, transaction_dt date NOT NULL, transaction_summary varchar(200) NOT NULL, transaction_type varchar(100) NOT NULL, transaction_amt int NOT NULL, closing_balance int NOT NULL, create_dt date NOT NULL, PRIMARY KEY (transaction_id));
CREATE TABLE accounts (customer_id int NOT NULL, account_number int IDENTITY NOT NULL, account_type varchar(100) NOT NULL, branch_address varchar(200) NOT NULL, create_dt date NOT NULL, PRIMARY KEY (account_number));
CREATE TABLE authorities (id int IDENTITY NOT NULL, customer_id int NOT NULL, name int NOT NULL, PRIMARY KEY (id));
CREATE TABLE cards (card_id int IDENTITY NOT NULL, customer_id int NOT NULL, card_number varchar(100) NOT NULL, card_type varchar(100) NOT NULL, total_limit int NOT NULL, amount_used int NOT NULL, available_amount int NOT NULL, create_dt date NOT NULL, PRIMARY KEY (card_id));
CREATE TABLE contact_messages (contact_id varchar(50) NOT NULL, contact_name varchar(50) NOT NULL, contact_email varchar(100) NOT NULL, subject varchar(500) NOT NULL, message varchar(2000) NOT NULL, create_dt date NOT NULL, PRIMARY KEY (contact_id));
CREATE TABLE loans (loan_number int IDENTITY NOT NULL, customer_id int NOT NULL, start_dt date NOT NULL, loan_type varchar(100) NOT NULL, total_loan int NOT NULL, amount_paid int NOT NULL, outstanding_amount int NOT NULL, create_dt date NOT NULL, PRIMARY KEY (loan_number));
CREATE TABLE notice_details (notice_id int IDENTITY NOT NULL, notice_summary varchar(200) NOT NULL, notice_details varchar(500) NOT NULL, notic_beg_dt date NOT NULL, notic_end_dt date NOT NULL, create_dt date NOT NULL, update_dt date NOT NULL, PRIMARY KEY (notice_id));
ALTER TABLE authorities ADD CONSTRAINT FKauthoritie761686 FOREIGN KEY (customer_id) REFERENCES [customer] (customer_id);
ALTER TABLE cards ADD CONSTRAINT FKcards739464 FOREIGN KEY (customer_id) REFERENCES [customer] (customer_id);
ALTER TABLE loans ADD CONSTRAINT FKloans26720 FOREIGN KEY (customer_id) REFERENCES [customer] (customer_id);
ALTER TABLE account_transactions ADD CONSTRAINT FKaccount_tr7107 FOREIGN KEY (account_number) REFERENCES accounts (account_number);
ALTER TABLE accounts ADD CONSTRAINT FKaccounts652425 FOREIGN KEY (customer_id) REFERENCES [customer] (customer_id);

INSERT INTO customer ([name], email, mobile_number, pwd, role, create_dt)
VALUES ('John Doe', 'john@example.com', '0123456789', '$2a$10$FJRPO/112GQRyX8CmCv01efVAT1t8NJoXT0PE/4dcprurPE4GuUR6', 'USER', '2024-01-01');

INSERT INTO accounts (customer_id, account_type, branch_address, create_dt)
VALUES (1, 'Savings', '123 Main St, City', '2024-01-01');

INSERT INTO account_transactions (transaction_id, account_number, transaction_dt, transaction_summary, transaction_type, transaction_amt, closing_balance, create_dt)
VALUES 
	('TXN001', 1, '2024-01-01', 'ATM Withdrawal', 'Debit', 500, 1500, '2024-01-01'), 
	('TXN002', 1, '2024-01-02', 'POS Purchase', 'Debit', 200, 1300, '2024-01-02'),
	('TXN003', 1, '2024-01-03', 'ATM Deposit', 'Credit', 500, 1800, '2024-01-03'),
	('TXN004', 1, '2024-01-04', 'Online Transfer', 'Debit', 300, 700, '2024-01-04'),
	('TXN005', 1, '2024-01-05', 'ATM Withdrawal', 'Debit', 100, 600, '2024-01-05');

INSERT INTO loans (customer_id, start_dt, loan_type, total_loan, amount_paid, outstanding_amount, create_dt)
VALUES 
(1, '2024-01-01', 'Home Loan', 100000, 20000, 80000, '2024-01-01'),
(1, '2024-02-01', 'Car Loan', 50000, 10000, 40000, '2024-02-01'),
(1, '2024-03-01', 'Personal Loan', 30000, 5000, 25000, '2024-03-01'),
(1, '2024-04-01', 'Education Loan', 40000, 10000, 30000, '2024-04-01'),
(1, '2024-05-01', 'Business Loan', 150000, 30000, 120000, '2024-05-01');

INSERT INTO cards (customer_id, card_number, card_type, total_limit, amount_used, available_amount, create_dt)
VALUES 
(1, '1234-5678-9123-4567', 'Credit', 10000, 2000, 8000, '2024-01-01'),
(1, '2345-6789-1234-5678', 'Debit', 5000, 1000, 4000, '2024-01-02'),
(1, '3456-7891-2345-6789', 'Credit', 15000, 5000, 10000, '2024-01-03');

INSERT INTO notice_details (notice_summary, notice_details, notic_beg_dt, notic_end_dt, create_dt, update_dt) 
VALUES 
('Notice 1 Summary', 'Detail for Notice 1', '2024-01-01', '2024-01-10', '2024-01-01', '2024-01-01'),
('Notice 2 Summary', 'Detail for Notice 2', '2024-02-01', '2024-02-10', '2024-02-01', '2024-02-01'),
('Notice 3 Summary', 'Detail for Notice 3', '2024-03-01', '2024-03-10', '2024-03-01', '2024-03-01'),
('Notice 4 Summary', 'Detail for Notice 4', '2024-04-01', '2024-04-10', '2024-04-01', '2024-04-01'),
('Notice 5 Summary', 'Detail for Notice 5', '2024-05-01', '2024-05-10', '2024-05-01', '2024-05-01'),
('Notice 6 Summary', 'Detail for Notice 6', '2024-06-01', '2024-06-10', '2024-06-01', '2024-06-01');
