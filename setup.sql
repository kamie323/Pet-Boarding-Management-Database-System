-- Schematicsetup
CREATE DATABASE IF NOT EXISTS PetFosterSystem;
USE PetFosterSystem;

-- Pet_Owner表
CREATE TABLE Pet_Owner (
    Owner_ID INT PRIMARY KEY,
    First_Name VARCHAR(50) NOT NULL,
    Last_Name VARCHAR(50) NOT NULL,
    Phone VARCHAR(20) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Address TEXT,
    Registration_Date DATE DEFAULT CURRENT_DATE
);

-- Pet表
CREATE TABLE Pet (
    Pet_ID INT,
    Owner_ID INT,
    Name VARCHAR(50) NOT NULL,
    Species VARCHAR(20) NOT NULL,
    Breed VARCHAR(50),
    Date_Of_Birth DATE,
    Weight DECIMAL(5,2),
    Vaccination_Status ENUM('Complete', 'Incomplete', 'Expired') DEFAULT 'Incomplete',
    PRIMARY KEY (Pet_ID, Owner_ID),
    FOREIGN KEY (Owner_ID) REFERENCES Pet_Owner(Owner_ID) ON DELETE CASCADE
);

-- Vaccination_Record表
CREATE TABLE Vaccination_Record (
    Record_ID INT PRIMARY KEY AUTO_INCREMENT,
    Pet_ID INT NOT NULL,
    Owner_ID INT NOT NULL,
    Vaccine_Name VARCHAR(100) NOT NULL,
    Vaccination_Date DATE NOT NULL,
    Expiry_Date DATE NOT NULL,
    Vaccination_Status ENUM('TAKEN', 'NOT TAKEN') DEFAULT 'NOT TAKEN',
    FOREIGN KEY (Pet_ID, Owner_ID) REFERENCES Pet(Pet_ID, Owner_ID) ON DELETE CASCADE
);

-- Employee表
CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(20) NOT NULL,
    LastName VARCHAR(20) NOT NULL,
    Position VARCHAR(50),
    Phone VARCHAR(20)
);

-- Service表
CREATE TABLE Service (
    Service_ID INT PRIMARY KEY,
    Service_Name VARCHAR(50) NOT NULL,
    Service_Rating INT,
    Price DECIMAL(10,2)
);

-- Cage表
CREATE TABLE Cage (
    Cage_ID INT PRIMARY KEY,
    TypeName VARCHAR(30) NOT NULL UNIQUE,
    Capacity INT,
    TotalQuantity INT NOT NULL,
    AvailableQuantity INT NOT NULL
);

-- Booking表
CREATE TABLE Booking (
    Booking_ID INT PRIMARY KEY AUTO_INCREMENT,
    Pet_ID INT NOT NULL,
    Owner_ID INT NOT NULL,
    Service_ID INT NOT NULL,
    Employee_ID INT,
    Cage_ID INT,
    Start_Date DATE NOT NULL,
    End_Date DATE NOT NULL,
    Status ENUM('Pending', 'Confirmed', 'InProgress', 'Completed', 'Cancelled', 'NoShow') DEFAULT 'Pending',
    FOREIGN KEY (Pet_ID, Owner_ID) REFERENCES Pet(Pet_ID, Owner_ID),
    FOREIGN KEY (Service_ID) REFERENCES Service(Service_ID),
    FOREIGN KEY (Employee_ID) REFERENCES Employee(Employee_ID),
    FOREIGN KEY (Cage_ID) REFERENCES Cage(Cage_ID)
);

-- TrainingProgress表
CREATE TABLE TrainingProgress (
    ProgressID INT PRIMARY KEY AUTO_INCREMENT,
    BookingID INT NOT NULL,
    TrainingDate DATE NOT NULL,
    SkillsCovered TEXT NOT NULL,
    TrainingRating INT CHECK (TrainingRating >= 1 AND TrainingRating <= 5),
    FOREIGN KEY (BookingID) REFERENCES Booking(Booking_ID) ON DELETE CASCADE
);

-- Payment表
CREATE TABLE Payment (
    PaymentID INT PRIMARY KEY AUTO_INCREMENT,
    BookingID INT NOT NULL,
    Amount DECIMAL(10,2) NOT NULL,
    PaymentDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Method ENUM('Cash', 'CreditCard', 'DebitCard', 'Online'),
    Status ENUM('Pending', 'Completed', 'Failed', 'Refunded'),
    FOREIGN KEY (BookingID) REFERENCES Booking(Booking_ID)
);


