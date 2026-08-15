
-- user table 

CREATE TABLE Users(

	user_id int primary key,
	Fname varchar(20) not null,
	Lname varchar(20) not null,
	Email varchar(20) not null unique,
	Hash_Password varchar(20) not null,
	Role VARCHAR(10) NOT NULL CHECK (Role IN ('owner', 'sitter')),
	created_at DATETIME2 DEFAULT SYSUTCDATETIME(),
)

-- creating SP

create table Sitter_Profile (
	SP_id int primary key ,
	User_id int unique foreign key references Users(user_id)  ,
	Bio text ,
	address varchar(50),
	city varchar(20),
	accepts_cats bit NOT NULL DEFAULT 0,
	accepts_dogs bit NOT NULL DEFAULT 0,
	accepts_birds bit NOT NULL DEFAULT 0,
	price_per_night int NOT NULL DEFAULT 0,
	rating_avg DECIMAL(3,2) DEFAULT 0.00, 
)

-- Creating Pets

CREATE TABLE Pet (
	Pet_id int primary key,
	Owner_id int unique foreign key references Users(user_id) ON DELETE CASCADE,
	Name varchar(20) default Null ,
	Species VARCHAR(10) NOT NULL
        CHECK (Species IN ('dog', 'cat', 'bird', 'other')),
	Breed varchar(20) default Null ,
	age INT,
    special_needs VARCHAR(MAX),
)

-- Creating Booking 

CREATE TABLE Booking (
	Booking_id int primary key ,
	SP_id int unique foreign key references Sitter_Profile(SP_id) ON DELETE CASCADE,
	Pet_id int unique foreign key references Pet(Pet_id) ON DELETE CASCADE,
	start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    status VARCHAR(10) NOT NULL DEFAULT 'pending'
        CHECK (status IN ('pending', 'confirmed', 'completed', 'cancelled')),
    total_price DECIMAL(8,2) NOT NULL,
    created_at DATETIME2 DEFAULT SYSUTCDATETIME(),
)

-- Creating Payment 

CREATE TABLE Payment(
	payment_id INT PRIMARY KEY,
    booking_id INT NOT NULL UNIQUE FOREIGN KEY REFERENCES Booking(booking_id) ON DELETE CASCADE,
    amount DECIMAL(8,2) NOT NULL,
    payment_method VARCHAR(10) NOT NULL
        CHECK (payment_method IN ('card', 'cash', 'wallet')),
    payment_status VARCHAR(10) NOT NULL DEFAULT 'pending'
        CHECK (payment_status IN ('pending', 'paid', 'refunded')),
    paid_at DATETIME2 NULL,
)

-- Creating Review

CREATE TABLE Review (
	Payment_id int primary key ,
	Booking_id INT NOT NULL UNIQUE FOREIGN KEY REFERENCES Booking(booking_id) ON DELETE CASCADE,
	Rating INT NOT NULL CHECK (rating BETWEEN 1 AND 5),
	comment VARCHAR(MAX),
    created_at DATETIME2 DEFAULT SYSUTCDATETIME(),
)

Select * from Users

Select * from Pet
Select * from Booking
Select * from Payment
Select * from Review
Select * from Sitter_Profile

