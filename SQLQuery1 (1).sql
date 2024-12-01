/*Create Table*/
CREATE TABLE Customer(
    Customer_ID Varchar(15) PRIMARY KEY,
    First_Name VARCHAR(50) NOT NULL,
    Last_Name VARCHAR(50) NOT NULL,
    Home_No VARCHAR(50) NOT NULL,
    Street_Name VARCHAR(50) NOT NULL,
    City VARCHAR(50) NOT NULL,
    Age INT NOT NULL,
);
/*Customer Table Details */
INSERT INTO  Customer VALUES ('C0001', 'Nimsara','Nethum','hn\102','samagipura','Nugegoda',25);
INSERT INTO  Customer VALUES ('C0002', 'Heman','Harath','hn\102','mawathagama','Maharagama',34);
INSERT INTO  Customer VALUES ('C0003', 'Shahim','Hem','hn\102','nelumapuara','Kandy',28);
INSERT INTO  Customer VALUES ('C0004', 'Peni','Silva','hn\102','ranawirumawatha','Negambo',57);
INSERT INTO  Customer VALUES ('C0005', 'Gihan','Pera','hn\102','samagimawatah','Homagama',42);

/*Cutomer Phone Table*/
CREATE TABLE Customer_Phone(
  Customer_ID varchar(15) not null,
  Phone_no decimal(10,0) not null
);
/*Customer Phone Table Details */
INSERT INTO  Customer_Phone VALUES ('C0001','0713701298');
INSERT INTO  Customer_Phone VALUES ('C0002','0713701298');
INSERT INTO  Customer_Phone VALUES ('C0003','0713701298');
INSERT INTO  Customer_Phone VALUES ('C0004','0713701298');
INSERT INTO  Customer_Phone VALUES ('C0005','0713701298');

/*Customer Email Table*/
CREATE TABLE Customer_Email(
  Customer_ID varchar(15) not null,
  Email VARCHAR (50) CHECK (Email LIKE '%_@_%._%') not null,

  CONSTRAINT Cutomer_Phone CHECK (Email LIKE '%@%%'),
);

/*Cutomer Email Table Details */
INSERT INTO  Customer_Email VALUES ('C0001','nim@gamil.com');
INSERT INTO  Customer_Email VALUES ('C0002','herath@gmail.com');
INSERT INTO  Customer_Email VALUES ('C0003','shahim@gamil.com');
INSERT INTO  Customer_Email VALUES ('C0004','peni@gamil.com');
INSERT INTO  Customer_Email VALUES ('C0005','gihan@gamil.com');

CREATE TABLE Administrator (
    Admin_ID VARCHAR(15) PRIMARY KEY,
    First_Name VARCHAR(40) NOT NULL,
    Last_Name VARCHAR(40) NOT NULL,
    Street VARCHAR(30) NOT NULL,
    City VARCHAR(35) NOT NULL,
    Password VARCHAR(15) NOT NULL,
    DOB DATE NOT NULL,
    Email VARCHAR(35) NOT NULL CHECK (Email LIKE '%_@_%._%'),
	Phone_No DECIMAL(10) NOT NULL,

);


/* Add table details */
/*Administrator table details*/
INSERT INTO Administrator VALUES ('A0001','Kamal', 'Samantha', 'No.56/2, Galle road','Kandy', '****', '1984-09-08', 'kamal@gmail.com',0747456123);
INSERT INTO Administrator VALUES ('A0002','Madura', 'Dimantha', 'No.9/7, Nugegoda road','Nugegoda','****', '1990-03-08', 'madura@gmail.com',0767845684 );
INSERT INTO Administrator VALUES ('A0003','Sakuni', 'Sansala', 'No.36/8,Gothami road','Colombo','****', '1986-11-08', 'sakuni@gmail.com',0787456128 );
INSERT INTO Administrator VALUES ('A0004','Sithum', 'Apsara', 'No.25/47, Mahinda road','Negambo','****', '1985-10-08', 'dimantha@gmail.com', 0779854623 );
INSERT INTO Administrator VALUES ('A0005','Malki', 'Jayathilaka', 'No.5/12, Rajakaruna road','Malabe','****', '1989-04-08', 'malki@gmail.com',0115875247 );


CREATE TABLE   
 Destination (
    Destination_ID VARCHAR(15) PRIMARY KEY,
    City VARCHAR(50) NOT NULL,
    Name VARCHAR(100) NOT NULL,
    Description VARCHAR(100),
    Country VARCHAR(50) NOT NULL

);
/*Destination Table Details */
INSERT INTO  Destination VALUES ('D0001','Kandy','kani','Temple of Tooth','Srilanka');
INSERT INTO  Destination VALUES ('D0002','Homagama','shani','Galle Face','Srilanka');
INSERT INTO  Destination VALUES ('D0003','Hambanthota','niamli','Safari Park','Srilanka');
INSERT INTO  Destination VALUES ('D0004','Maharagama','janu','Shopping Mall','Srilanka');
INSERT INTO  Destination VALUES ('D0005','Kandy','heman','Fort','Srilanka');


CREATE TABLE Guide (
    Guide_ID VARCHAR(15) PRIMARY KEY,
    First_Name VARCHAR(50) NOT NULL,
    Last_Name VARCHAR(50) NOT NULL,
    Experience INT NOT NULL,
	Admin_ID VARCHAR(15),
	
	FOREIGN KEY (Admin_ID) REFERENCES Administrator(Admin_ID),

);
/*Guide Table Details */
INSERT INTO  Guide VALUES ('G0001','Eran','Pette','12','A0001');
INSERT INTO  Guide VALUES ('G0002','Hens','Deman','02','A0002');
INSERT INTO  Guide VALUES ('G0003','Ahem','Fan','09','A0003');
INSERT INTO  Guide VALUES ('G0004','Jani','Iran','05','A0004');
INSERT INTO  Guide VALUES ('G0005','Nima','Niker','10','A0005');

CREATE TABLE Guide_Language (
    Guide_ID VARCHAR(15) NOT NULL,
    Language VARCHAR(50) NOT NULL,
    FOREIGN KEY (Guide_ID) REFERENCES Guide(Guide_ID)
);
/*Guide Language Table Details */
INSERT INTO Guide_Language VALUES ('G0001','English');
INSERT INTO Guide_Language VALUES ('G0002','English');
INSERT INTO Guide_Language VALUES ('G0003','English');
INSERT INTO Guide_Language VALUES ('G0004','English');
INSERT INTO Guide_Language VALUES ('G0005','English');


CREATE TABLE TransportPackage (
    Package_ID VARCHAR(15) PRIMARY KEY,
    Package_Name VARCHAR(100) NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    Duration INT NOT NULL,
    Itinerary VARCHAR(225) NOT NULL,
    Destination_ID  VARCHAR(15) NOT NULL,
	Guide_ID VARCHAR(15) NOT NULL,

    FOREIGN KEY (Destination_ID) REFERENCES Destination(Destination_ID),
	FOREIGN KEY (Guide_ID) REFERENCES Guide(Guide_ID)

);
/*Transport Package Table Details */
INSERT INTO  TransportPackage VALUES ('P0001','Herath','19000','03','ASE','D0001','G0001');
INSERT INTO  TransportPackage VALUES ('P0002','Menka','19000','06','ASE','D0002','G0002');
INSERT INTO  TransportPackage VALUES ('P0003','Sahan','18000','03','ASE','D0003','G0003');
INSERT INTO  TransportPackage VALUES ('P0004','Shan','10000','03','ASE','D0004','G0004');
INSERT INTO  TransportPackage VALUES ('P0005','Pethum','15000','05','ASE','D0005','G0005');


CREATE TABLE Booking (
    Booking_ID VARCHAR(15) PRIMARY KEY,
    Booking_Date DATE NOT NULL,
    Total_Amount DECIMAL(10, 2) NOT NULL,
    Booking_Type VARCHAR(50) NOT NULL,
    Customer_ID Varchar(15) NOT NULL,
	Package_ID VArCHAR(15) NOT NULL,
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID),
	FOREIGN KEY (Package_ID) REFERENCES TransportPackage(Package_ID)

);
/*Booking Table Details */
INSERT INTO  Booking VALUES ('B0001','2019-01-23','12000','Online','C0001','P0001');
INSERT INTO  Booking VALUES ('B0002','2020-04-23','10500','Offline','C0002','P0002');
INSERT INTO  Booking VALUES ('B0003','2019-02-03','11000','Online','C0003','P0003');
INSERT INTO  Booking VALUES ('B0004','2018-02-23','10500','Offline','C0004','P0004');
INSERT INTO  Booking VALUES ('B0005','2018-10-27','13500','Online','C0005','P0005');

CREATE TABLE Payment (
    Payment_ID VARCHAR(15) PRIMARY KEY,
    Payment_Date DATE NOT NULL,
    Method VARCHAR(50) NOT NULL,
    Amount DECIMAL(10, 2) NOT NULL,
    Customer_ID Varchar(15) NOT NULL,
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
);
/*Payment Table Details */
INSERT INTO  Payment VALUES ('P0001','2019-10-02','CreditCrad','12000','C0001');
INSERT INTO  Payment VALUES ('P0002','2018-03-02','CashDeposite','12000','C0004');
INSERT INTO  Payment VALUES ('P0003','2018-10-22','CreditCrad','12000','C0003');
INSERT INTO  Payment VALUES ('P0004','2019-10-02','Paypal','12000','C0004');
INSERT INTO  Payment VALUES ('P0005','2019-12-20','CreditCrad','12000','C0005');

CREATE TABLE Review (
    Review_ID VARCHAR(15) PRIMARY KEY,
    Rating VARCHAR(15) NOT NULL,
    Date DATE NOT NULL,
    Comment VARCHAR(225) NOT NULL,
    Customer_ID Varchar(15) NOT NULL,
    Package_ID VARCHAR(15) NOT NULL,
	Admin_ID VARCHAR(15),

    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID),
    FOREIGN KEY (Package_ID) REFERENCES TransportPackage(Package_ID),
	FOREIGN KEY (Admin_ID) REFERENCES Administrator(Admin_ID)

);
/*Review Table Details */
INSERT INTO  Review VALUES ('R0001','08%','2022-10-23','Good','C0001','P0001','A0001');
INSERT INTO  Review VALUES ('R0002','07%','2020-10-20','Good','C0002','P0002','A0002');
INSERT INTO  Review VALUES ('R0003','10%','2019-09-23','Good','C0003','P0003','A0003');
INSERT INTO  Review VALUES ('R0004','12%','2022-10-23','Good','C0004','P0004','A0004');
INSERT INTO  Review VALUES ('R0005','09%','2021-11-23','Good','C0005','P0005','A0005');



CREATE TABLE Transport (
    Transport_ID VARCHAR(15) PRIMARY KEY,
    Provider VARCHAR(50) NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    Booking_ID VARCHAR(15) NOT NULL,
    FOREIGN KEY (Booking_ID) REFERENCES Booking(Booking_ID)
);
/*Transport Table Details */
INSERT INTO  Transport VALUES ('T0001','ASD','11000','B0001');
INSERT INTO  Transport VALUES ('T0002','DEF','10000','B0002');
INSERT INTO  Transport VALUES ('T0003','AED','12000','B0003');
INSERT INTO  Transport VALUES ('T0004','SDR','15000','B0004');
INSERT INTO  Transport VALUES ('T0005','CVB','12000','B0005');

CREATE TABLE Transport_Type (
    Transport_ID VARCHAR(15) NOT NULL,
    Type VARCHAR(15) NOT NULL,
    FOREIGN KEY (Transport_ID) REFERENCES Transport(Transport_ID)
);
/*Transport Type Table Details */
INSERT INTO  Transport_Type VALUES ('T0001','Bus');
INSERT INTO  Transport_Type VALUES ('T0002','Train');
INSERT INTO  Transport_Type VALUES ('T0003','Bus');
INSERT INTO  Transport_Type VALUES ('T0004','Bus');
INSERT INTO  Transport_Type VALUES ('T0005','Car');



Create Table Customer_Pay_Payment(
     Payment_Date DATE NOT NULL,
     Customer_ID Varchar(15),
     Payment_ID VARCHAR(15),
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID),
    FOREIGN KEY ( Payment_ID) REFERENCES Payment(Payment_ID),
);
/*Customer_Pay_Payment*/
INSERT INTO Customer_Pay_Payment VALUES('2019-10-02','C0001','P0001');
INSERT INTO Customer_Pay_Payment VALUES('2018-03-02','C0002','P0002');
INSERT INTO Customer_Pay_Payment VALUES('2018-10-22','C0003','P0003');
INSERT INTO Customer_Pay_Payment VALUES('2019-10-02','C0004','P0004');
INSERT INTO Customer_Pay_Payment VALUES('2019-12-20','C0005','P0005');