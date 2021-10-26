/*************************************************************
* Creación Base de datos Loans
* Antes de ejecutar el Script asegúrese de tener creada una base de datos llamada 'Loans' totalmente vacía.
**************************************************************/

CREATE TABLE [Clients]
(
	[idClient] INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	[document] INT UNIQUE,
	[name] VARCHAR(40) UNIQUE,
	[lastname] VARCHAR(40),
	[status] VARCHAR(20)
)

CREATE TABLE [Users]
(
	[idUser] INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	[idClient] INT,
	[password] VARCHAR(64),
	[rol] VARCHAR(20),
	[status] VARCHAR(20),
	CONSTRAINT fk_Clients_Users FOREIGN KEY (idClient) REFERENCES Clients (idClient) 
)

CREATE TABLE [Loans]
(
	[idLoan] INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	[idUser] INT,
	[loanDate] DATETIME,
	[expirationDate] DATETIME,
	[loanStatus] VARCHAR(20),
	CONSTRAINT fk_Users_Loans FOREIGN KEY (idUser) REFERENCES Users (idUser) 
)


CREATE TABLE [Books]
(
	[idBook] INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	[name] VARCHAR(40) UNIQUE,
	[author] VARCHAR(30),
	[editorial] VARCHAR(30),
	[category] VARCHAR(30),
	[year] INT,
	[stock] INT
)

CREATE TABLE [loanBooks]
(
	[idLoanBooks] INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	[idBook] INT,
	[idLoan] INT,
	CONSTRAINT fk_Books_LoanBooks FOREIGN KEY (idBook) REFERENCES Books (idBook),
	CONSTRAINT fk_Loans_LoanBooks FOREIGN KEY (idLoan) REFERENCES Loans (idLoan) 
)

CREATE TABLE [Penalty]
(
	[idPenalty] INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	[idLoan] INT,
	[amount] INT,
	[status] VARCHAR(20),
	CONSTRAINT fk_Loans_Penalty FOREIGN KEY (idLoan) REFERENCES Loans (idLoan) 
)



