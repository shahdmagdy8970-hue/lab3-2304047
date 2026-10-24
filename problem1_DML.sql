USE company;

-- 1) employees first (Dno = NULL for now)
INSERT INTO EMPLOYEE (ssn, fname, lname, bdate, address, gender, salary, Dno) VALUES
('111111111', 'Ahmed', 'Hassan', '1985-03-12', 'Alexandria', 'M', 15000.00, NULL),
('222222222', 'Mona',  'Ali',    '1990-07-25', 'Cairo',      'F', 12000.50, NULL),
('333333333', 'Omar',  'Khaled', '1988-11-02', 'Giza',        'M', 11000.00, NULL);

-- 2) departments (managers already exist)
INSERT INTO DEPARTMENT (Dnumber, Dname, mgr_ssn, mgr_start_date) VALUES
(1, 'Research',       '111111111', '2015-01-01'),
(2, 'Administration', '222222222', '2018-06-15'),
(3, 'Headquarters',   '333333333', '2020-09-01');

-- 3) now give employees their departments
UPDATE EMPLOYEE SET Dno = 1 WHERE ssn = '111111111';
UPDATE EMPLOYEE SET Dno = 2 WHERE ssn = '222222222';
UPDATE EMPLOYEE SET Dno = 3 WHERE ssn = '333333333';

-- 4) projects
INSERT INTO PROJECT (Pnumber, Pname, Plocation, Dno) VALUES
(10, 'ProductX',   'Alexandria', 1),
(20, 'ProductY',   'Cairo',      2),
(30, 'Automation', 'Giza',       3);