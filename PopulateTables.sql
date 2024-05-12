-- Create tables in this first section.
DROP TABLE IF EXISTS `Orders`;
CREATE TABLE `Orders` (
    `RowID` int  NOT NULL ,
    `OrderID` int  NOT NULL ,
    `CustomerID` int  NOT NULL ,
    `ProductID` int  NOT NULL ,
    `QuantityPurchased` int  NOT NULL ,
    `OrderDate` datetime  NOT NULL ,
    CHECK (100>`QuantityPurchased` AND 0<`QuantityPurchased`),
    PRIMARY KEY (
        `RowID`
    )
);

DROP TABLE IF EXISTS `Customers`;
CREATE TABLE `Customers` (
    `CustomerID` int  NOT NULL ,
    `Name` varchar(200)  NOT NULL ,
    `StreetAddress` varchar(200)  NOT NULL ,
    `City` varchar(100)  NOT NULL ,
    `ZipCode` varchar(10)  NOT NULL ,
    `Member` boolean  NOT NULL ,
    PRIMARY KEY (
        `CustomerID`
    )
);

DROP TABLE IF EXISTS `Products`;
CREATE TABLE `Products` (
    `ProductID` int  NOT NULL ,
    `Name` varchar(100)  NOT NULL ,
    `Description` varchar(200)  NULL ,
    `Price` decimal(6,2)  NOT NULL ,
    `PaymentPeriod` varchar(100)  NOT NULL ,
    `ProductCategory` varchar(100)  NOT NULL ,
    `StorageID` int  NOT NULL ,
    PRIMARY KEY (
        `ProductID`
    ),
    CONSTRAINT `uc_Products_Name` UNIQUE (
        `Name`
    )
);

DROP TABLE IF EXISTS `Storage`;
CREATE TABLE `Storage` (
    `RowID` int  NOT NULL ,
    `StorageID` int  NOT NULL ,
    `Quantity` int  NOT NULL ,
    `LocationStored` varchar(200)  NULL ,
    CHECK (`Quantity`>0),
    CHECK(1<=`StorageID` AND 6>=`StorageID`),
    PRIMARY KEY (
        `RowID`
    )
);

DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
`ProductID` int not null, 
`Name` varchar(100) not null,
`Description` varchar(200),
`Price` decimal(6,2) not null,
`PaymentPeriod` varchar(100) not null,
`ProductCategory` varchar(100) not null,
`StorageID` int not null,
 PRIMARY KEY (
        `ProductID`
    )
);
/*
ALTER TABLE `customers` ADD CONSTRAINT `fk_Customers_CustomerID` FOREIGN KEY(`CustomerID`)
REFERENCES `orders` (`CustomerID`);

ALTER TABLE `products` ADD CONSTRAINT `fk_Products_ProductID` FOREIGN KEY(`ProductID`)
REFERENCES `orders` (`ProductID`);

ALTER TABLE `products` ADD CONSTRAINT `fk_Products_StorageID` FOREIGN KEY(`StorageID`)
REFERENCES `storage` (`StorageID`);
*/
-- The next 500 lines were AI generated records to insert into the database. The section below that is
-- cleaning that had to be performed, as the AI generated data for the Orders table didn't comply with all the constraints it should. 
TRUNCATE TABLE `customers`;
INSERT INTO `customers` (`CustomerID`,`Name`,`StreetAddress`,`City`,`ZipCode`,`Member`)
VALUES
    (1, 'Alice Johnson', '123 Oak St', 'Chicago', '60601', 1),
    (2, 'Bob Smith', '456 Maple Ave', 'New York', '10002', 0),
    (3, 'Charlie Brown', '789 Pine Ln', 'Los Angeles', '90003', 1),
    (4, 'David Miller', '101 Elm Blvd', 'San Francisco', '94105', 0),
    (5, 'Emma Davis', '202 Birch Rd', 'Seattle', '98101', 1),
    (6, 'Frank Wilson', '303 Cedar Ct', 'Miami', '33101', 0),
    (7, 'Grace Taylor', '404 Walnut Pl', 'Dallas', '75201', 1),
    (8, 'Henry Turner', '505 Redwood Dr', 'Atlanta', '30301', 0),
    (9, 'Ivy Martinez', '606 Willow St', 'Denver', '80202', 1),
    (10, 'Jack Anderson', '707 Pinehurst Ave', 'Phoenix', '85001', 0),
    (11, 'Karen White', '808 Juniper Ln', 'Boston', '02101', 1),
    (12, 'Leo Rodriguez', '909 Sycamore Blvd', 'Houston', '77001', 0),
    (13, 'Mia Lee', '1010 Magnolia Dr', 'Philadelphia', '19101', 1),
    (14, 'Noah Garcia', '1111 Cedar Ln', 'San Diego', '92101', 0),
    (15, 'Olivia Brown', '1212 Oakwood Rd', 'Detroit', '48201', 1),
    (16, 'Patrick Smith', '1313 Pinecrest Ave', 'Minneapolis', '55401', 0),
    (17, 'Quinn Taylor', '1414 Birchwood Dr', 'Portland', '97201', 1),
    (18, 'Ryan Johnson', '1515 Redstone Ln', 'Tampa', '33601', 0),
    (19, 'Samantha Wilson', '1616 Maple Pl', 'St. Louis', '63101', 1),
    (20, 'Tyler Davis', '1717 Elm St', 'San Antonio', '78201', 0),
    (21, 'Uma Thomas', '1818 Willow Dr', 'Charlotte', '28201', 1),
    (22, 'Vincent Miller', '1919 Sycamore Ave', 'Las Vegas', '89101', 0),
    (23, 'Wendy Martinez', '2020 Juniper Blvd', 'Cleveland', '44101', 1),
    (24, 'Xavier Taylor', '2121 Pinehurst Rd', 'Kansas City', '64101', 0),
    (25, 'Yara Rodriguez', '2222 Cedar Ct', 'Orlando', '32801', 1),
    (26, 'Zane Anderson', '2323 Birch Ln', 'Sacramento', '95801', 0),
    (27, 'Ava White', '2424 Oak Pl', 'Raleigh', '27601', 1),
    (28, 'Benjamin Turner', '2525 Maple Dr', 'Indianapolis', '46201', 0),
    (29, 'Chloe Martinez', '2626 Elm Ave', 'Salt Lake City', '84101', 1),
    (30, 'Daniel Wilson', '2727 Willow Ln', 'Nashville', '37201', 0),
    (31, 'Ella Davis', '2828 Redwood Blvd', 'Austin', '73301', 1),
    (32, 'Finn Smith', '2929 Pinecrest Dr', 'Columbus', '43201', 0),
    (33, 'Grace Taylor', '3030 Birchwood Pl', 'Milwaukee', '53201', 1),
    (34, 'Henry Turner', '3131 Cedar Blvd', 'Albuquerque', '87101', 0),
    (35, 'Ivy Martinez', '3232 Willow St', 'Louisville', '40201', 1),
    (36, 'Jack Anderson', '3333 Oakwood Ave', 'Memphis', '38101', 0),
    (37, 'Karen White', '3434 Maple Dr', 'El Paso', '79901', 1),
    (38, 'Leo Rodriguez', '3535 Elm Ln', 'Oklahoma City', '73101', 0),
    (39, 'Mia Lee', '3636 Sycamore Rd', 'Baltimore', '21201', 1),
    (40, 'John Doe', '3737 Pinehurst Blvd', 'Phoenix', '85001', 0),
    (41, 'Liam Johnson', '3838 Oak St', 'Chicago', '60602', 1),
    (42, 'Olivia Smith', '3939 Maple Ave', 'New York', '10003', 0),
    (43, 'Ethan Brown', '4040 Pine Ln', 'Los Angeles', '90004', 1),
    (44, 'Emma Miller', '4141 Elm Blvd', 'San Francisco', '94106', 0),
    (45, 'Noah Davis', '4242 Birch Rd', 'Seattle', '98102', 1),
    (46, 'Ava Wilson', '4343 Cedar Ct', 'Miami', '33102', 0),
    (47, 'Mason Taylor', '4444 Walnut Pl', 'Dallas', '75202', 1),
    (48, 'Sophia Turner', '4545 Redwood Dr', 'Atlanta', '30302', 0),
    (49, 'Logan Martinez', '4646 Willow St', 'Denver', '80203', 1),
    (50, 'Isabella Anderson', '4747 Pinehurst Ave', 'Phoenix', '85002', 0),
    (51, 'Carter White', '4848 Juniper Ln', 'Boston', '02102', 1),
    (52, 'Charlotte Rodriguez', '4949 Sycamore Blvd', 'Houston', '77002', 0),
    (53, 'Lucas Lee', '5050 Magnolia Dr', 'Philadelphia', '19102', 1),
    (54, 'Lily Garcia', '5151 Cedar Ln', 'San Diego', '92102', 0),
    (55, 'Jackson Brown', '5252 Oakwood Rd', 'Detroit', '48202', 1),
    (56, 'Madison Smith', '5353 Pinecrest Ave', 'Minneapolis', '55402', 0),
    (57, 'Aiden Taylor', '5454 Birchwood Dr', 'Portland', '97202', 1),
    (58, 'Chloe Johnson', '5555 Redstone Ln', 'Tampa', '33602', 0),
    (59, 'Elijah Wilson', '5656 Maple Pl', 'St. Louis', '63102', 1),
    (60, 'Zoe Davis', '5757 Elm St', 'San Antonio', '78202', 0),
    (61, 'Grayson Thomas', '5858 Willow Dr', 'Charlotte', '28202', 1),
    (62, 'Avery Miller', '5959 Sycamore Ave', 'Las Vegas', '89102', 0),
    (63, 'Sofia Martinez', '6060 Juniper Blvd', 'Cleveland', '44102', 1),
    (64, 'Ezra Taylor', '6161 Pinehurst Rd', 'Kansas City', '64102', 0),
    (65, 'Leah Rodriguez', '6262 Cedar Ct', 'Orlando', '32802', 1),
    (66, 'Hudson Anderson', '6363 Birch Ln', 'Sacramento', '95802', 0),
    (67, 'Mila White', '6464 Oak Pl', 'Raleigh', '27602', 1),
    (68, 'Landon Turner', '6565 Maple Dr', 'Indianapolis', '46202', 0),
    (69, 'Bella Martinez', '6666 Elm Ave', 'Salt Lake City', '84102', 1),
    (70, 'Luke Wilson', '6767 Willow Ln', 'Nashville', '37202', 0),
    (71, 'Layla Davis', '6868 Redwood Blvd', 'Austin', '73302', 1),
    (72, 'Henry Smith', '6969 Pinecrest Dr', 'Columbus', '43202', 0),
    (73, 'Stella Taylor', '7070 Birchwood Pl', 'Milwaukee', '53202', 1),
    (74, 'Zachary Turner', '7171 Cedar Blvd', 'Albuquerque', '87102', 0),
    (75, 'Aria Martinez', '7272 Willow St', 'Louisville', '40202', 1);


TRUNCATE TABLE `storage`;
INSERT INTO `storage` (`RowID`,`StorageID`,`Quantity`,`LocationStored`)
VALUES
  (1,"6",18,"Mom's House"),
  (2,"5",6,"Home"),
  (3,"4",6,"Mom's House"),
  (4,"5",24,"Storage Locker"),
  (5,"3",14,"Home"),
  (6,"5",11,"Mom's House"),
  (7,"3",8,"Home"),
  (8,"3",14,"Home"),
  (9,"5",14,"Mom's House"),
  (10,"4",24,"Home");
INSERT INTO `storage` (`RowID`,`StorageID`,`Quantity`,`LocationStored`)
VALUES
  (11,"4",8,"Home"),
  (12,"4",6,"Mom's House"),
  (13,"4",21,"Mom's House"),
  (14,"6",17,"Storage Locker"),
  (15,"6",20,"Mom's House"),
  (16,"3",13,"Home"),
  (17,"5",10,"Storage Locker"),
  (18,"3",22,"Storage Locker"),
  (19,"4",20,"Home"),
  (20,"5",22,"Home");
INSERT INTO `storage` (`RowID`,`StorageID`,`Quantity`,`LocationStored`)
VALUES
  (21,"3",13,"Mom's House"),
  (22,"5",11,"Storage Locker"),
  (23,"5",15,"Home"),
  (24,"5",16,"Home"),
  (25,"4",24,"Mom's House"),
  (26,"4",23,"Mom's House"),
  (27,"3",22,"Home"),
  (28,"6",10,"Home"),
  (29,"6",20,"Mom's House"),
  (30,"3",20,"Storage Locker");
INSERT INTO `storage` (`RowID`,`StorageID`,`Quantity`,`LocationStored`)
VALUES
  (31,"3",21,"Home"),
  (32,"6",23,"Mom's House"),
  (33,"3",11,"Mom's House"),
  (34,"5",17,"Mom's House"),
  (35,"5",24,"Home"),
  (36,"4",9,"Storage Locker"),
  (37,"6",25,"Storage Locker"),
  (38,"5",19,"Home"),
  (39,"4",17,"Mom's House"),
  (40,"4",24,"Mom's House");
INSERT INTO `storage` (`RowID`,`StorageID`,`Quantity`,`LocationStored`)
VALUES
  (41,"5",15,"Home"),
  (42,"6",9,"Home"),
  (43,"4",22,"Home"),
  (44,"6",22,"Mom's House"),
  (45,"5",11,"Mom's House"),
  (46,"6",12,"Home"),
  (47,"4",16,"Mom's House"),
  (48,"3",7,"Home"),
  (49,"4",7,"Storage Locker"),
  (50,"4",14,"Home");


TRUNCATE TABLE `products`;
INSERT INTO `products` (`ProductID`,`Name`,`Description`,`Price`,`PaymentPeriod`,`ProductCategory`,`StorageID`)
VALUES
("1","Membership","One year membership.","20.0","Yearly","Online","1"),
("2","One Time Donation","Support Sarah and her blogging endeavors with this 10$ donation.","10.0","One time","Online","2"),
("3","Branded Tshirt","","20.0","One time","Merchandise","3"),
("4","Branded Tote Bag","","20.0","One time","Merchandise","4"),
("5","Branded Mug","","10.0","One time","Merchandise","5"),
("6","Personalized Poem From Founder","","50.0","One time","Online","6");


TRUNCATE TABLE `Orders`;
INSERT INTO `Orders` (`RowID`,`OrderID`,`CustomerID`,`ProductID`,`QuantityPurchased`,`OrderDate`)
VALUES
	(41, 1, 15, 3, 3, '2023-02-15'),
    (42, 1, 34, 1, 1, '2023-02-15'),
    (43, 1, 51, 6, 2, '2023-02-15'),
    (44, 2, 29, 2, 1, '2023-02-10'),
    (45, 2, 43, 4, 4, '2023-02-10'),
    (46, 2, 58, 5, 3, '2023-02-10'),
    (47, 2, 73, 1, 1, '2023-02-10'),
    (48, 3, 20, 4, 4, '2023-02-05'),
    (49, 3, 36, 3, 3, '2023-02-05'),
    (50, 4, 61, 2, 1, '2023-02-20'),
    (51, 4, 47, 6, 4, '2023-02-20'),
    (52, 4, 12, 5, 4, '2023-02-20'),
    (53, 4, 26, 1, 1, '2023-02-20'),
    (54, 5, 59, 3, 3, '2023-02-25'),
    (55, 5, 43, 2, 1, '2023-02-25'),
    (56, 5, 21, 6, 4, '2023-02-25'),
    (57, 5, 34, 1, 1, '2023-02-25'),
    (58, 6, 47, 5, 3, '2023-03-02'),
    (59, 6, 22, 3, 3, '2023-03-02'),
    (60, 6, 59, 4, 4, '2023-03-02'),
    (61, 6, 12, 1, 1, '2023-03-02'),
    (62, 6, 36, 2, 1, '2023-03-02'),
    (63, 7, 73, 6, 4, '2023-03-07'),
    (64, 7, 51, 4, 1, '2023-03-07'),
    (65, 7, 20, 3, 4, '2023-03-07'),
    (66, 8, 29, 5, 3, '2023-03-12'),
    (67, 8, 43, 6, 4, '2023-03-12'),
    (68, 8, 15, 1, 1, '2023-03-12'),
    (69, 8, 58, 2, 1, '2023-03-12'),
    (70, 9, 12, 3, 4, '2023-03-17'),
    (71, 9, 34, 1, 1, '2023-03-17'),
    (72, 9, 51, 6, 3, '2023-03-17'),
    (73, 10, 47, 4, 4, '2023-03-22'),
    (74, 10, 61, 5, 4, '2023-03-22'),
    (75, 10, 36, 2, 1, '2023-03-22'),
    (76, 10, 73, 1, 1, '2023-03-22'),
    (77, 11, 20, 6, 3, '2023-03-27'),
    (78, 11, 34, 3, 4, '2023-03-27'),
    (79, 11, 51, 2, 1, '2023-03-27'),
    (80, 12, 29, 1, 1, '2023-04-01'),
(81, 12, 47, 3, 3, '2023-04-01'),
    (82, 13, 22, 2, 1, '2023-04-06'),
    (83, 13, 59, 4, 4, '2023-04-06'),
    (84, 13, 12, 5, 4, '2023-04-06'),
    (85, 14, 36, 1, 1, '2023-04-11'),
    (86, 14, 73, 6, 4, '2023-04-11'),
    (87, 14, 51, 2, 1, '2023-04-11'),
    (88, 15, 29, 3, 3, '2023-04-16'),
    (89, 15, 43, 4, 4, '2023-04-16'),
    (90, 15, 15, 6, 2, '2023-04-16'),
    (91, 16, 58, 1, 1, '2023-04-21'),
    (92, 16, 20, 5, 4, '2023-04-21'),
    (93, 16, 59, 2, 1, '2023-04-21'),
    (94, 17, 12, 6, 3, '2023-04-26'),
    (95, 17, 34, 3, 4, '2023-04-26'),
    (96, 17, 51, 1, 1, '2023-04-26'),
    (97, 18, 61, 4, 4, '2023-05-01'),
    (98, 18, 47, 2, 1, '2023-05-01'),
    (99, 18, 26, 5, 4, '2023-05-01'),
    (100, 19, 59, 6, 3, '2023-05-06'),
(101, 19, 43, 3, 3, '2023-05-06'),
    (102, 19, 22, 4, 4, '2023-05-06'),
    (103, 19, 15, 1, 1, '2023-05-06'),
    (104, 20, 36, 6, 2, '2023-05-11'),
    (105, 20, 73, 2, 1, '2023-05-11'),
    (106, 20, 51, 5, 4, '2023-05-11'),
    (107, 21, 29, 3, 3, '2023-05-16'),
    (108, 21, 43, 4, 4, '2023-05-16'),
    (109, 21, 15, 6, 2, '2023-05-16'),
    (110, 22, 58, 1, 1, '2023-05-21'),
    (111, 22, 20, 5, 4, '2023-05-21'),
    (112, 22, 59, 2, 1, '2023-05-21'),
    (113, 23, 12, 6, 3, '2023-05-26'),
    (114, 23, 34, 3, 4, '2023-05-26'),
    (115, 23, 51, 1, 1, '2023-05-26'),
    (116, 24, 61, 4, 4, '2023-05-31'),
    (117, 24, 47, 2, 1, '2023-05-31'),
    (118, 24, 26, 5, 4, '2023-05-31'),
    (119, 25, 59, 6, 3, '2023-06-05'),
    (120, 25, 43, 3, 3, '2023-06-05'),
    (121, 25, 22, 4, 4, '2023-06-05'),
    (122, 26, 15, 1, 1, '2023-06-10'),
    (123, 26, 36, 6, 2, '2023-06-10'),
    (124, 26, 73, 2, 1, '2023-06-10'),
    (125, 27, 51, 5, 4, '2023-06-15'),
    (126, 27, 29, 3, 3, '2023-06-15'),
    (127, 27, 43, 4, 4, '2023-06-15'),
    (128, 28, 15, 6, 2, '2023-06-20'),
    (129, 28, 58, 1, 1, '2023-06-20'),
    (130, 28, 20, 5, 4, '2023-06-20'),
    (131, 29, 59, 2, 1, '2023-06-25'),
    (132, 29, 12, 6, 3, '2023-06-25'),
    (133, 29, 34, 3, 4, '2023-06-25'),
    (134, 30, 51, 1, 1, '2023-06-30'),
    (135, 30, 47, 4, 4, '2023-06-30'),
    (136, 30, 26, 5, 4, '2023-06-30'),
    (137, 31, 36, 2, 1, '2023-07-05'),
    (138, 31, 73, 1, 1, '2023-07-05'),
    (139, 31, 22, 4, 4, '2023-07-05'),
    (140, 32, 15, 6, 3, '2023-07-10'),
(141, 32, 58, 1, 1, '2023-07-10'),
    (142, 32, 20, 5, 4, '2023-07-10'),
    (143, 32, 59, 2, 1, '2023-07-10'),
    (144, 33, 12, 6, 3, '2023-07-15'),
    (145, 33, 34, 3, 4, '2023-07-15'),
    (146, 33, 51, 1, 1, '2023-07-15'),
    (147, 34, 61, 4, 4, '2023-07-20'),
    (148, 34, 47, 2, 1, '2023-07-20'),
    (149, 34, 26, 5, 4, '2023-07-20'),
    (150, 35, 59, 6, 3, '2023-07-25'),
    (151, 35, 43, 3, 3, '2023-07-25'),
    (152, 35, 22, 4, 4, '2023-07-25'),
    (153, 36, 15, 1, 1, '2023-07-30'),
    (154, 36, 36, 6, 2, '2023-07-30'),
    (155, 36, 73, 2, 1, '2023-07-30'),
    (156, 37, 51, 5, 4, '2023-08-04'),
    (157, 37, 29, 3, 3, '2023-08-04'),
    (158, 37, 43, 4, 4, '2023-08-04'),
    (159, 38, 15, 6, 2, '2023-08-09'),
    (160, 38, 58, 1, 1, '2023-08-09'),
    (161, 38, 20, 5, 4, '2023-08-09'),
    (162, 39, 59, 2, 1, '2023-08-14'),
    (163, 39, 12, 6, 3, '2023-08-14'),
    (164, 39, 34, 3, 4, '2023-08-14'),
    (165, 40, 51, 1, 1, '2023-08-19'),
    (166, 40, 47, 4, 4, '2023-08-19'),
    (167, 40, 26, 5, 4, '2023-08-19'),
    (168, 41, 36, 2, 1, '2023-08-24'),
    (169, 41, 73, 1, 1, '2023-08-24'),
    (170, 41, 22, 4, 4, '2023-08-24'),
    (171, 42, 15, 6, 3, '2023-08-29'),
    (172, 42, 58, 1, 1, '2023-08-29'),
    (173, 42, 20, 5, 4, '2023-08-29'),
    (174, 43, 59, 2, 1, '2023-09-03'),
    (175, 43, 12, 6, 3, '2023-09-03'),
    (176, 43, 34, 3, 4, '2023-09-03'),
    (177, 44, 51, 1, 1, '2023-09-08'),
    (178, 44, 47, 4, 4, '2023-09-08'),
    (179, 44, 26, 5, 4, '2023-09-08'),
    (180, 45, 36, 2, 1, '2023-09-13'),
(181, 45, 73, 1, 1, '2023-09-13'),
    (182, 45, 22, 4, 4, '2023-09-13'),
    (183, 46, 15, 6, 3, '2023-09-18'),
    (184, 46, 58, 1, 1, '2023-09-18'),
    (185, 46, 20, 5, 4, '2023-09-18'),
    (186, 47, 59, 2, 1, '2023-09-23'),
    (187, 47, 12, 6, 3, '2023-09-23'),
    (188, 47, 34, 3, 4, '2023-09-23'),
    (189, 48, 51, 1, 1, '2023-09-28'),
    (190, 48, 47, 4, 4, '2023-09-28'),
    (191, 48, 26, 5, 4, '2023-09-28'),
    (192, 49, 36, 2, 1, '2023-10-03'),
    (193, 49, 73, 1, 1, '2023-10-03'),
    (194, 49, 22, 4, 4, '2023-10-03'),
    (195, 50, 15, 6, 3, '2023-10-08'),
    (196, 50, 58, 1, 1, '2023-10-08'),
    (197, 50, 20, 5, 4, '2023-10-08'),
    (198, 51, 59, 2, 1, '2023-10-13'),
    (199, 51, 12, 6, 3, '2023-10-13'),
    (200, 51, 34, 3, 4, '2023-10-13'),
    (201, 52, 51, 1, 1, '2023-10-18'),
    (202, 52, 47, 4, 4, '2023-10-18'),
    (203, 52, 26, 5, 4, '2023-10-18'),
    (204, 53, 36, 2, 1, '2023-10-23'),
    (205, 53, 73, 1, 1, '2023-10-23'),
    (206, 53, 22, 4, 4, '2023-10-23'),
    (207, 54, 15, 6, 3, '2023-10-28'),
    (208, 54, 58, 1, 1, '2023-10-28'),
    (209, 54, 20, 5, 4, '2023-10-28'),
    (210, 55, 59, 2, 1, '2023-11-02'),
    (211, 55, 12, 6, 3, '2023-11-02'),
    (212, 55, 34, 3, 4, '2023-11-02'),
    (213, 56, 51, 1, 1, '2023-11-07'),
    (214, 56, 47, 4, 4, '2023-11-07'),
    (215, 56, 26, 5, 4, '2023-11-07'),
    (216, 57, 36, 2, 1, '2023-11-12'),
    (217, 57, 73, 1, 1, '2023-11-12'),
    (218, 57, 22, 4, 4, '2023-11-12'),
    (219, 58, 15, 6, 3, '2023-11-17'),
    (220, 58, 58, 1, 1, '2023-11-17'),
(221, 58, 20, 5, 4, '2023-11-17'),
    (222, 59, 59, 2, 1, '2023-11-22'),
    (223, 59, 12, 6, 3, '2023-11-22'),
    (224, 59, 34, 3, 4, '2023-11-22'),
    (225, 60, 51, 1, 1, '2023-11-27'),
    (226, 60, 47, 4, 4, '2023-11-27'),
    (227, 60, 26, 5, 4, '2023-11-27'),
    (228, 61, 36, 2, 1, '2023-12-02'),
    (229, 61, 73, 1, 1, '2023-12-02'),
    (230, 61, 22, 4, 4, '2023-12-02'),
    (231, 62, 15, 6, 3, '2023-12-07'),
    (232, 62, 58, 1, 1, '2023-12-07'),
    (233, 62, 20, 5, 4, '2023-12-07'),
    (234, 63, 59, 2, 1, '2023-12-12'),
    (235, 63, 12, 6, 3, '2023-12-12'),
    (236, 63, 34, 3, 4, '2023-12-12'),
    (237, 64, 51, 1, 1, '2023-12-17'),
    (238, 64, 47, 4, 4, '2023-12-17'),
    (239, 64, 26, 5, 4, '2023-12-17'),
    (240, 65, 36, 2, 1, '2023-12-22'),
    (241, 65, 73, 1, 1, '2023-12-22'),
    (242, 65, 22, 4, 4, '2023-12-22'),
    (243, 66, 15, 6, 3, '2023-12-27'),
    (244, 66, 58, 1, 1, '2023-12-27'),
    (245, 66, 20, 5, 4, '2023-12-27'),
    (246, 67, 59, 2, 1, '2024-01-01'),
    (247, 67, 12, 6, 3, '2024-01-01'),
    (248, 67, 34, 3, 4, '2024-01-01'),
    (249, 68, 51, 1, 1, '2024-01-06'),
    (250, 68, 47, 4, 4, '2024-01-06'),
    (251, 68, 26, 5, 4, '2024-01-06'),
    (252, 69, 36, 2, 1, '2024-01-11'),
    (253, 69, 73, 1, 1, '2024-01-11'),
    (254, 69, 22, 4, 4, '2024-01-11'),
    (255, 70, 15, 6, 3, '2024-01-16'),
    (256, 70, 58, 1, 1, '2024-01-16'),
    (257, 70, 20, 5, 4, '2024-01-16'),
    (258, 71, 59, 2, 1, '2024-01-21'),
    (259, 71, 12, 6, 3, '2024-01-21'),
    (260, 71, 34, 3, 4, '2024-01-21'),
(261, 72, 51, 1, 1, '2024-01-26'),
    (262, 72, 47, 4, 4, '2024-01-26'),
    (263, 72, 26, 5, 4, '2024-01-26'),
    (264, 73, 36, 2, 1, '2024-01-31'),
    (265, 73, 73, 1, 1, '2024-01-31'),
    (266, 73, 22, 4, 4, '2024-01-31'),
    (267, 74, 15, 6, 3, '2024-02-05'),
    (268, 74, 58, 1, 1, '2024-02-05'),
    (269, 74, 20, 5, 4, '2024-02-05'),
    (270, 75, 59, 2, 1, '2024-02-10'),
    (271, 75, 12, 6, 3, '2024-02-10'),
    (272, 75, 34, 3, 4, '2024-02-10'),
    (273, 76, 51, 1, 1, '2024-02-15'),
    (274, 76, 47, 4, 4, '2024-02-15'),
    (275, 76, 26, 5, 4, '2024-02-15'),
    (276, 77, 36, 2, 1, '2024-02-20'),
    (277, 77, 73, 1, 1, '2024-02-20'),
    (278, 77, 22, 4, 4, '2024-02-20'),
    (279, 78, 15, 6, 3, '2024-02-25'),
    (280, 78, 58, 1, 1, '2024-02-25'),
    (281, 78, 20, 5, 4, '2024-02-25'),
    (282, 79, 59, 2, 1, '2024-03-01'),
    (283, 79, 12, 6, 3, '2024-03-01'),
    (284, 79, 34, 3, 4, '2024-03-01'),
    (285, 80, 51, 1, 1, '2024-03-06'),
    (286, 80, 47, 4, 4, '2024-03-06'),
    (287, 80, 26, 5, 4, '2024-03-06'),
    (288, 81, 36, 2, 1, '2024-03-11'),
    (289, 81, 73, 1, 1, '2024-03-11'),
    (290, 81, 22, 4, 4, '2024-03-11'),
    (291, 82, 15, 6, 3, '2024-03-16'),
    (292, 82, 58, 1, 1, '2024-03-16'),
    (293, 82, 20, 5, 4, '2024-03-16'),
    (294, 83, 59, 2, 1, '2024-03-21'),
    (295, 83, 12, 6, 3, '2024-03-21'),
    (296, 83, 34, 3, 4, '2024-03-21'),
    (297, 84, 51, 1, 1, '2024-03-26'),
    (298, 84, 47, 4, 4, '2024-03-26'),
    (299, 84, 26, 5, 4, '2024-03-26'),
    (300, 85, 36, 2, 1, '2024-03-31'),
(301, 85, 73, 1, 1, '2024-03-31'),
    (302, 85, 22, 4, 4, '2024-03-31'),
    (303, 86, 15, 6, 3, '2024-04-05'),
    (304, 86, 58, 1, 1, '2024-04-05'),
    (305, 86, 20, 5, 4, '2024-04-05'),
    (306, 87, 59, 2, 1, '2024-04-10'),
    (307, 87, 12, 6, 3, '2024-04-10'),
    (308, 87, 34, 3, 4, '2024-04-10'),
    (309, 88, 51, 1, 1, '2024-04-15'),
    (310, 88, 47, 4, 4, '2024-04-15'),
    (311, 88, 26, 5, 4, '2024-04-15'),
    (312, 89, 36, 2, 1, '2024-04-20'),
    (313, 89, 73, 1, 1, '2024-04-20'),
    (314, 89, 22, 4, 4, '2024-04-20'),
    (315, 90, 15, 6, 3, '2024-04-25'),
    (316, 90, 58, 1, 1, '2024-04-25'),
    (317, 90, 20, 5, 4, '2024-04-25'),
    (318, 91, 59, 2, 1, '2024-04-30'),
    (319, 91, 12, 6, 3, '2024-04-30'),
    (320, 91, 34, 3, 4, '2024-04-30'),
    (321, 92, 51, 1, 1, '2024-05-05'),
    (322, 92, 47, 4, 4, '2024-05-05'),
    (323, 92, 26, 5, 4, '2024-05-05'),
    (324, 93, 36, 2, 1, '2024-05-10'),
    (325, 93, 73, 1, 1, '2024-05-10'),
    (326, 93, 22, 4, 4, '2024-05-10'),
    (327, 94, 15, 6, 3, '2024-05-15'),
    (328, 94, 58, 1, 1, '2024-05-15'),
    (329, 94, 20, 5, 4, '2024-05-15'),
    (330, 95, 59, 2, 1, '2024-05-20'),
    (331, 95, 12, 6, 3, '2024-05-20'),
    (332, 95, 34, 3, 4, '2024-05-20'),
    (333, 96, 51, 1, 1, '2024-05-25'),
    (334, 96, 47, 4, 4, '2024-05-25'),
    (335, 96, 26, 5, 4, '2024-05-25'),
    (336, 97, 36, 2, 1, '2024-05-30'),
    (337, 97, 73, 1, 1, '2024-05-30'),
    (338, 97, 22, 4, 4, '2024-05-30'),
    (339, 98, 15, 6, 3, '2024-06-04'),
    (340, 98, 58, 1, 1, '2024-06-04'),
    (341, 98, 20, 5, 4, '2024-06-04'),
    (342, 99, 59, 2, 1, '2024-06-09'),
    (343, 99, 12, 6, 3, '2024-06-09'),
    (344, 99, 34, 3, 4, '2024-06-09'),
    (345, 100, 51, 1, 1, '2024-06-14'),
    (346, 100, 47, 4, 4, '2024-06-14'),
    (347, 100, 26, 5, 4, '2024-06-14'),
(348, 101, 36, 2, 1, '2024-06-19'),
    (349, 101, 73, 1, 1, '2024-06-19'),
    (350, 101, 22, 4, 4, '2024-06-19'),
    (351, 102, 15, 6, 3, '2024-06-24'),
    (352, 102, 58, 1, 1, '2024-06-24'),
    (353, 102, 20, 5, 4, '2024-06-24'),
    (354, 103, 59, 2, 1, '2024-06-29'),
    (355, 103, 12, 6, 3, '2024-06-29'),
    (356, 103, 34, 3, 4, '2024-06-29'),
    (357, 104, 51, 1, 1, '2024-07-04'),
    (358, 104, 47, 4, 4, '2024-07-04'),
    (359, 104, 26, 5, 4, '2024-07-04'),
    (360, 105, 36, 2, 1, '2024-07-09'),
    (361, 105, 73, 1, 1, '2024-07-09'),
    (362, 105, 22, 4, 4, '2024-07-09'),
    (363, 106, 15, 6, 3, '2024-07-14'),
    (364, 106, 58, 1, 1, '2024-07-14'),
    (365, 106, 20, 5, 4, '2024-07-14'),
    (366, 107, 59, 2, 1, '2024-07-19'),
    (367, 107, 12, 6, 3, '2024-07-19'),
    (368, 107, 34, 3, 4, '2024-07-19'),
    (369, 108, 51, 1, 1, '2024-07-24'),
    (370, 108, 47, 4, 4, '2024-07-24'),
    (371, 108, 26, 5, 4, '2024-07-24'),
    (372, 109, 36, 2, 1, '2024-07-29'),
    (373, 109, 73, 1, 1, '2024-07-29'),
    (374, 109, 22, 4, 4, '2024-07-29'),
    (375, 110, 15, 6, 3, '2024-08-03'),
    (376, 110, 58, 1, 1, '2024-08-03'),
    (377, 110, 20, 5, 4, '2024-08-03'),
    (378, 111, 59, 2, 1, '2024-08-08'),
    (379, 111, 12, 6, 3, '2024-08-08'),
    (380, 111, 34, 3, 4, '2024-08-08'),
    (381, 112, 51, 1, 1, '2024-08-13'),
    (382, 112, 47, 4, 4, '2024-08-13'),
    (383, 112, 26, 5, 4, '2024-08-13'),
    (384, 113, 36, 2, 1, '2024-08-18'),
    (385, 113, 73, 1, 1, '2024-08-18'),
    (386, 113, 22, 4, 4, '2024-08-18'),
    (387, 114, 15, 6, 3, '2024-08-23'),
    (388, 114, 58, 1, 1, '2024-08-23'),
    (389, 114, 20, 5, 4, '2024-08-23'),
    (390, 115, 59, 2, 1, '2024-08-28');

-- The cleaning below had to be performed, as the AI generated data for the Orders table didn't comply with all the constraints it should. 
SET @row_number = 0;

UPDATE `orders`
SET `RowID` = (@row_number := @row_number + 1)
ORDER BY `RowID`;

UPDATE `Orders`
SET `QuantityPurchased` = 
    CASE 
        WHEN `ProductID` IN (1, 2) THEN 1
        WHEN `ProductID` IN (6) THEN FLOOR(1 + RAND() * 2)
        ELSE FLOOR(1 + RAND() * 4)
	END;

UPDATE `Orders`
SET `CustomerID` = 
    FLOOR(1 + RAND() * 75);

ALTER TABLE orders AUTO_INCREMENT = 1;

-- Create a new table with the same CustomerID for common OrderID values
DROP TABLE IF EXISTS UpdatedOrders;
-- Create a new table with the same CustomerID for common OrderID values
CREATE TABLE UpdatedOrders AS
SELECT
    RowID,
    OrderID,
    MIN(CustomerID) OVER (PARTITION BY OrderID) AS CustomerID,
    ProductID,
    QuantityPurchased,
    OrderDate
FROM Orders;

-- Replace the old Orders table with UpdatedOrders. 
  DROP TABLE IF EXISTS Orders;
  ALTER TABLE updatedorders
  RENAME TO orders; 