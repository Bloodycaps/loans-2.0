/*************************************************************
* Creación Base de datos Loans
* Antes de ejecutar el Script asegúrese de tener creada una base de datos llamada 'Loans' totalmente vacía.
**************************************************************/

CREATE TABLE [Clients]
(
	[idClient] INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	[document] INT NOT NULL UNIQUE,
	[name] VARCHAR(40) NOT NULL UNIQUE,
	[lastname] VARCHAR(40) NOT NULL,
	[status] VARCHAR(20) NOT NULL
)

CREATE TABLE [Users]
(
	[idUser] INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	[idClient] INT NOT NULL,
	[password] VARCHAR(64) NOT NULL,
	[rol] VARCHAR(20) NOT NULL,
	[status] VARCHAR(20) NOT NULL,
	CONSTRAINT fk_Clients_Users FOREIGN KEY (idClient) REFERENCES Clients (idClient) 
)

CREATE TABLE [Loans]
(
	[idLoan] INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	[idUser] INT NOT NULL,
	[loanDate] DATETIME NOT NULL,
	[expirationDate] DATETIME NOT NULL,
	[loanStatus] VARCHAR(20) NOT NULL,
	CONSTRAINT fk_Users_Loans FOREIGN KEY (idUser) REFERENCES Users (idUser) 
)


CREATE TABLE [Books]
(
	[idBook] INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	[name] VARCHAR(40) UNIQUE NOT NULL,
	[author] VARCHAR(30) NOT NULL,
	[editorial] VARCHAR(30)NOT NULL,
	[category] VARCHAR(30) NOT NULL,
	[year] INT NOT NULL,
	[stock] INT NOT NULL
)

CREATE TABLE [LoanBooks]
(
	[idLoanBooks] INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	[idBook] INT NOT NULL,
	[idLoan] INT NOT NULL,
	CONSTRAINT fk_Books_LoanBooks FOREIGN KEY (idBook) REFERENCES Books (idBook),
	CONSTRAINT fk_Loans_LoanBooks FOREIGN KEY (idLoan) REFERENCES Loans (idLoan) 
)

CREATE TABLE [Penalty]
(
	[idPenalty] INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	[idLoan] INT NOT NULL,
	[amount] INT NOT NULL,
	[status] VARCHAR(20) NOT NULL,
	CONSTRAINT fk_Loans_Penalty FOREIGN KEY (idLoan) REFERENCES Loans (idLoan) 
)



