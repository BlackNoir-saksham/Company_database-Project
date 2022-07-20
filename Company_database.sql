Create table Employee(
    emp_id INT ,
    first_name varchar(20),
    last_name varchar(20),
    birth_date Date,
    sex varchar(1),
    salary INT,
    super_id INT,
    branch_id INT ,
    PRIMARY KEY (emp_id)
);

Create table Branch(
    branch_id INT PRIMARY KEY,
    branch_name varchar(20),
    mgr_id INT,
    mgr_start_date DATE,
    FOREIGN KEY(mgr_id) REFERENCES Employee(emp_id) on DELETE SET NULL
);

ALTER table Employee
Add FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE SET NULL;

ALTER table Employee
Add FOREIGN KEY(super_id) REFERENCES Employee(emp_id) ON DELETE SET NULL;

Create table Client(
    client_id INT PRIMARY KEY,
    client_name varchar(20),
    branch_id INT,
    FOREIGN KEY (branch_id) REFERENCES Branch(branch_id) ON DELETE SET NULL
);

Create table Works_with(
    emp_id INT ,
    client_id INT ,
    total_sales INT,
    PRIMARY KEY(emp_id,client_id),
    FOREIGN KEY(emp_id) REFERENCES Employee(emp_id) ON DELETE Cascade,
    FOREIGN KEY(client_id) REFERENCES client(client_id) ON DELETE Cascade
);

Create table Branch_supplier(
    branch_id INT ,
    supplier_name varchar(20),
    supply_type varchar(20),
    PRIMARY KEY(branch_id,supplier_name),
    FOREIGN KEY (branch_id) REFERENCES Branch(branch_id) ON DELETE Cascade
);
--drop table branch_supplier;

--CORPORATE

INSERT INTO Employee values(100, 'David', 'Wallace', '1967-11-17', 'M',250000, null, null);

INSERT INTO Branch values(1, 'Corporate', 100, '2006-02-09');

UPDATE Employee SET branch_id = 1 WHERE emp_id = 100;

INSERT INTO Employee values(101, 'Jane', 'Levinson', '1961-05-11', 'F',110000, 100, 1);

--SCRANTON

INSERT INTO Employee values(102, 'Michael', 'Scott', '1964-03-15', 'M', 75000, 100, null);

INSERT INTO Branch values(2, 'Scranton', 102, '1992-04-06');

UPDATE Employee SET branch_id = 2 WHERE emp_id = 102;

INSERT INTO Employee values(103, 'Angela', 'Martin', '1971-06-25', 'F', 63000, 102, 2);
INSERT INTO Employee values(104, 'Kelly', 'Kapoor', '1980-02-05', 'F', 55000, 102, 2);
INSERT INTO Employee values(105, 'Stanley', 'Hudson', '1958-02-19', 'M', 69000, 102, 2);

--STAMFORD

INSERT INTO Employee values(106, 'Josh', 'Porter', '1969-09-05', 'M', 78000, 100, null);

INSERT INTO Branch values(3, 'Stamford', 106, '1998-02-13');

UPDATE Employee SET branch_id = 3 WHERE emp_id = 106;

INSERT INTO Employee values(107, 'Andy', 'Bernard', '1973-07-22', 'M', 65000, 106, 3);
INSERT INTO Employee values(108, 'Jim', 'Halpert', '1978-10-0', 'M', 71000, 106, 3);

-- BRANCH SUPPLIER
INSERT INTO branch_supplier VALUES(2, 'Hammer Mill', 'Paper');
INSERT INTO branch_supplier VALUES(2, 'Uni-ball', 'Writing Utensils');
INSERT INTO branch_supplier VALUES(3, 'Patriot Paper', 'Paper');
INSERT INTO branch_supplier VALUES(2, 'J.T. Forms & Labels', 'Custom Forms');
INSERT INTO branch_supplier VALUES(3, 'Uni-ball', 'Writing Utensils');
INSERT INTO branch_supplier VALUES(3, 'Hammer Mill', 'Paper');
INSERT INTO branch_supplier VALUES(3, 'Stamford Lables', 'Custom Forms');

-- CLIENT
INSERT INTO client VALUES(400, 'Dunmore Highschool', 2);
INSERT INTO client VALUES(401, 'Lackawana Country', 2);
INSERT INTO client VALUES(402, 'FedEx', 3);
INSERT INTO client VALUES(403, 'John Daly Law, LLC', 3);
INSERT INTO client VALUES(404, 'Scranton Whitepages', 2);
INSERT INTO client VALUES(405, 'Times Newspaper', 3);
INSERT INTO client VALUES(406, 'FedEx', 2);

-- WORKS_WITH
INSERT INTO works_with VALUES(105, 400, 55000);
INSERT INTO works_with VALUES(102, 401, 267000);
INSERT INTO works_with VALUES(108, 402, 22500);
INSERT INTO works_with VALUES(107, 403, 5000);
INSERT INTO works_with VALUES(108, 403, 12000);
INSERT INTO works_with VALUES(105, 404, 33000);
INSERT INTO works_with VALUES(107, 405, 26000);
INSERT INTO works_with VALUES(102, 406, 15000);
INSERT INTO works_with VALUES(105, 406, 130000);

Select * from branch;
