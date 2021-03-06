USE [master]
GO

/****** Object:  Table [dbo].[Books]    Script Date: 8/11/2021 10:50:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Books](
	[idBook] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](40) NULL,
	[author] [varchar](30) NULL,
	[editorial] [varchar](30) NULL,
	[category] [varchar](30) NULL,
	[year] [int] NULL,
	[stock] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[idBook] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clients]    Script Date: 8/11/2021 10:50:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clients](
	[idClient] [int] IDENTITY(1,1) NOT NULL,
	[document] [int] NULL,
	[name] [varchar](40) NULL,
	[lastname] [varchar](40) NULL,
	[status] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[idClient] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[document] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoanBooks]    Script Date: 8/11/2021 10:50:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoanBooks](
	[idLoanBooks] [int] IDENTITY(1,1) NOT NULL,
	[idBook] [int] NULL,
	[idLoan] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[idLoanBooks] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Loans]    Script Date: 8/11/2021 10:50:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Loans](
	[idLoan] [int] IDENTITY(1,1) NOT NULL,
	[idUser] [int] NULL,
	[loanDate] [datetime] NULL,
	[expirationDate] [datetime] NULL,
	[loanStatus] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[idLoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Penalty]    Script Date: 8/11/2021 10:50:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Penalty](
	[idPenalty] [int] IDENTITY(1,1) NOT NULL,
	[idLoan] [int] NULL,
	[amount] [int] NULL,
	[status] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[idPenalty] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 8/11/2021 10:50:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[idUser] [int] IDENTITY(1,1) NOT NULL,
	[idClient] [int] NULL,
	[password] [varchar](64) NULL,
	[rol] [varchar](20) NULL,
	[status] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[idUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[LoanBooks]  WITH CHECK ADD  CONSTRAINT [fk_Books_LoanBooks] FOREIGN KEY([idBook])
REFERENCES [dbo].[Books] ([idBook])
GO
ALTER TABLE [dbo].[LoanBooks] CHECK CONSTRAINT [fk_Books_LoanBooks]
GO
ALTER TABLE [dbo].[LoanBooks]  WITH CHECK ADD  CONSTRAINT [fk_Loans_LoanBooks] FOREIGN KEY([idLoan])
REFERENCES [dbo].[Loans] ([idLoan])
GO
ALTER TABLE [dbo].[LoanBooks] CHECK CONSTRAINT [fk_Loans_LoanBooks]
GO
ALTER TABLE [dbo].[Loans]  WITH CHECK ADD  CONSTRAINT [fk_Users_Loans] FOREIGN KEY([idUser])
REFERENCES [dbo].[Users] ([idUser])
GO
ALTER TABLE [dbo].[Loans] CHECK CONSTRAINT [fk_Users_Loans]
GO
ALTER TABLE [dbo].[Penalty]  WITH CHECK ADD  CONSTRAINT [fk_Loans_Penalty] FOREIGN KEY([idLoan])
REFERENCES [dbo].[Loans] ([idLoan])
GO
ALTER TABLE [dbo].[Penalty] CHECK CONSTRAINT [fk_Loans_Penalty]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [fk_Clients_Users] FOREIGN KEY([idClient])
REFERENCES [dbo].[Clients] ([idClient])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [fk_Clients_Users]
GO
/****** Object:  StoredProcedure [dbo].[sp_delete_books]    Script Date: 8/11/2021 10:50:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Andres Vaca>
-- Create date: <25/10/2021>
-- Description:	<Sp encargado de Eliminar libros>
-- =============================================
CREATE PROCEDURE [dbo].[sp_delete_books]
	@idBook		INT
AS
BEGIN
	IF NOT EXISTS(SELECT * FROM [dbo].[loanBooks] WHERE [idBook] = @idBook)
	BEGIN
		DELETE FROM
			[dbo].[Books] 	
		WHERE 
			[idBook] = @idBook
		SELECT 0
	END
	ELSE
	BEGIN
		SELECT 1
	END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_delete_clients]    Script Date: 8/11/2021 10:50:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Andres Vaca>
-- Create date: <25/10/2021>
-- Description:	<Sp encargado de eliminar los clientes en casoo de no tener una asociación>
-- =============================================
CREATE PROCEDURE [dbo].[sp_delete_clients]
	@idClient			INT
AS
BEGIN	
	IF NOT EXISTS(SELECT * FROM [dbo].[Users] WHERE [idClient] =  @idClient)
	BEGIN
		DELETE FROM
			[dbo].[Clients]		
		WHERE 
			[idClient] =  @idClient
		SELECT 0
	END
	ELSE
	BEGIN
		SELECT 1
	END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_delete_users]    Script Date: 8/11/2021 10:50:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Andres Vaca>
-- Create date: <25/10/2021>
-- Description:	<Sp encargado de eliminar los usuarios en caso de no tener dependencia>
-- =============================================
CREATE PROCEDURE [dbo].[sp_delete_users]		
	@idUser			INT
AS
BEGIN	
	IF NOT EXISTS(SELECT * FROM [dbo].[Loans] WHERE [idUser] = @idUser)
	BEGIN
		DELETE FROM
			[dbo].[Users]		
		WHERE
			[idUser] = @idUser
		SELECT 0
	END
	ELSE
	BEGIN
		SELECT 1
	END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_get_book]    Script Date: 8/11/2021 10:50:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Andres Vaca>
-- Create date: <25/10/2021>
-- Description:	<Sp encargado de Consultar libros con palabra clave>
-- =============================================
CREATE PROCEDURE [dbo].[sp_get_book]
	@book	VARCHAR(40)
AS
BEGIN	
	IF((SELECT COUNT(*) FROM [dbo].[Books] WHERE [name] LIKE '%'+@Book+'%')<>0)
	BEGIN
		SELECT 
			[idBook],
			[name],
			[author],
			[editorial],
			[category],
			[year],
			[stock]
		FROM 
			[dbo].[Books]  			
		WHERE 
			[name] LIKE '%'+@Book+'%'		
	END
	ELSE
	BEGIN
		SELECT 'No Existen registros','','','','','',''
	END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_get_book_loans]    Script Date: 8/11/2021 10:50:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Andres Vaca>
-- Create date: <25/10/2021>
-- Description:	<Sp encargado de Consultar los libros prestados>
-- =============================================
CREATE PROCEDURE [dbo].[sp_get_book_loans]	
AS
BEGIN	
	IF((SELECT COUNT(*) FROM [dbo].[LoanBooks] AS [LB]
	INNER JOIN [dbo].[Loans] AS [L] ON [LB].[idLoan] = [L].[idLoan]
	INNER JOIN [dbo].[Books] AS [B] ON [B].[idBook] = [B].[idBook]
	INNER JOIN [dbo].[Users] AS [U] ON [L].[idUser] = [U].[idUser]
	INNER JOIN [dbo].[Clients] AS [C] ON [U].[idClient] = [C].[idClient]) <> 0)
	BEGIN
		SELECT
			[LB].[idLoanBooks],
			[L].[idLoan],
			[B].[name],
			[C].[document],
			[L].[loanDate],
			[L].[loanStatus]			
		 FROM 
			[dbo].[LoanBooks] AS [LB]
			INNER JOIN [dbo].[Loans] AS [L] ON [LB].[idLoan] = [L].[idLoan]
			INNER JOIN [dbo].[Books] AS [B] ON [B].[idBook] = [B].[idBook]
			INNER JOIN [dbo].[Users] AS [U] ON [L].[idUser] = [U].[idUser]
			INNER JOIN [dbo].[Clients] AS [C] ON [U].[idClient] = [C].[idClient]
	END
	ELSE
	BEGIN
		SELECT 'No Existen registros','','','','',''
	END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_get_books]    Script Date: 8/11/2021 10:50:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Andres Vaca>
-- Create date: <25/10/2021>
-- Description:	<Sp encargado de consultar libros>
-- =============================================
CREATE PROCEDURE [dbo].[sp_get_books]	
AS
BEGIN	
	IF((SELECT COUNT(*) FROM [dbo].[Books]) <> 0)
	BEGIN
		SELECT 
			[idBook],
			[name],
			[author],
			[editorial],
			[category],
			[year],
			[stock]
		FROM 
			[dbo].[Books] 
		ORDER BY
			[name] ASC
	END
	ELSE
	BEGIN
		SELECT 'No Existen registros','','','','','',''
	END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_get_client]    Script Date: 8/11/2021 10:50:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Andres Vaca>
-- Create date: <25/10/2021>
-- Description:	<Sp encargado de Consultar un cliente>
-- =============================================
CREATE PROCEDURE [dbo].[sp_get_client]
	@document	INT
AS
BEGIN	
	IF((SELECT COUNT(*) FROM [dbo].[Clients] WHERE [document] = @document)<>0)
	BEGIN
		SELECT 
			[idClient],
			[document],
			[name],
			[lastname],
			[status]
		 FROM 
			[dbo].[Clients] 			
		WHERE 
			[document] = @document			
	END
	ELSE
	BEGIN
		SELECT 'No Existen registros','','','','','',''	
	END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_get_clients]    Script Date: 8/11/2021 10:50:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Andres Vaca>
-- Create date: <25/10/2021>
-- Description:	<Sp encargado de consultar clientes>
-- =============================================
CREATE PROCEDURE [dbo].[sp_get_clients]
AS
BEGIN	
	IF((SELECT COUNT(*) FROM [dbo].[Clients]) <> 0)
	BEGIN
		SELECT
			[idClient],
			[document],
			[name],
			[lastname],
			[status]
		FROM 
			[dbo].[Clients]
	END
	ELSE
	BEGIN
		SELECT 'No Existen registros','','','',''
	END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_get_credentials]    Script Date: 8/11/2021 10:50:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Andres Vaca>
-- Create date: <25/10/2021>
-- Description:	<Sp encargado de Consultar los usuarios>
-- =============================================
CREATE PROCEDURE [dbo].[sp_get_credentials]	
@document		INT,
@password		VARCHAR(64)
AS
BEGIN	
	IF EXISTS(SELECT * FROM [dbo].[Users] AS [U] INNER JOIN [dbo].[Clients] AS [C] ON 
	[U].[idClient] = [C].[idClient] 
	WHERE [C].[document] = @document AND [U].[password] = @password)
	BEGIN
		SELECT 0
	END
	ELSE
	BEGIN
		SELECT 1
	END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_get_documents]    Script Date: 8/11/2021 10:50:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Andres Vaca>
-- Create date: <25/10/2021>
-- Description:	<Sp encargado de consultar los documentos que no esten asociados a un Usuario>
-- =============================================
CREATE PROCEDURE [dbo].[sp_get_documents]	
AS
BEGIN	
	IF((SELECT COUNT(*) FROM [dbo].[Users] AS [U] RIGHT JOIN [dbo].[Clients] AS [C] 
		ON [U].[idClient] = [C].[idClient] WHERE [U].idClient IS NULL)<>0)
	BEGIN
		SELECT 			
			[C].[document]
		 FROM 
			[dbo].[Users] AS [U] RIGHT JOIN [dbo].[Clients] AS [C] 
			ON [U].[idClient] = [C].[idClient] 
	END
	ELSE
	BEGIN
		SELECT 'No Existen registros'
	END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_get_loan]    Script Date: 8/11/2021 10:50:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Andres Vaca>
-- Create date: <25/10/2021>
-- Description:	<Sp encargado de Consultar lso prestamos de un usuario>
-- =============================================
CREATE PROCEDURE [dbo].[sp_get_loan]
	@document		INT
AS
BEGIN	
	IF((SELECT COUNT(*) FROM [dbo].[Loans] AS [L]
	INNER JOIN [dbo].[Users] AS [U] ON [L].[idUser] = [U].[idUser]
	INNER JOIN [dbo].[Clients] AS [C] ON [U].[idClient] = [C].[idClient]
	WHERE [C].[document] = @document)<>0)
	BEGIN
		SELECT 
			[L].[idLoan],			
			[C].[document],
			[L].[loanDate],
			[L].[expirationDate],
			[L].[loanStatus]
		 FROM [dbo].[Loans] AS [L]
			INNER JOIN [dbo].[Users] AS [U] ON [L].[idUser] = [U].[idUser]
			INNER JOIN [dbo].[Clients] AS [C] ON [U].[idClient] = [C].[idClient]
		WHERE 
			[C].[document] = @document			
	END
	ELSE
	BEGIN
		SELECT 'No Existen registros','','','',''
	END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_get_loans]    Script Date: 8/11/2021 10:50:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Andres Vaca>
-- Create date: <25/10/2021>
-- Description:	<Sp encargado de Consultar los prestamos>
-- =============================================
CREATE PROCEDURE [dbo].[sp_get_loans]	
AS
BEGIN	
	IF((SELECT COUNT(*) FROM [dbo].[Loans] AS [L]
	INNER JOIN [dbo].[Users] AS [U] ON [L].[idUser] = [U].[idUser]
	INNER JOIN [dbo].[Clients] AS [C] ON [U].[idClient] = [C].[idClient]) <> 0)
	BEGIN
		SELECT 
			[L].[idLoan],			
			[C].[document],
			[L].[loanDate],
			[L].[expirationDate],
			[L].[loanStatus]			
		 FROM 
			[dbo].[Loans] AS [L]
			INNER JOIN [dbo].[Users] AS [U] ON [L].[idUser] = [U].[idUser]
			INNER JOIN [dbo].[Clients] AS [C] ON [U].[idClient] = [C].[idClient]
	END
	ELSE
	BEGIN
		SELECT 'No Existen registros','','','',''
	END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_get_loans_penalty]    Script Date: 8/11/2021 10:50:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Andres Vaca>
-- Create date: <25/10/2021>
-- Description:	<Sp encargado de Consultar las multas de los prestamos>
-- =============================================
CREATE PROCEDURE [dbo].[sp_get_loans_penalty]
AS
BEGIN	
	IF((SELECT COUNT(*) FROM [dbo].[Penalty] AS [P]
	INNER JOIN [dbo].[Loans] AS [L] ON [P].[idLoan] = [L].[idLoan]	
	INNER JOIN [dbo].[Users] AS [U] ON [L].[idUser] = [U].[idUser]
	INNER JOIN [dbo].[Clients] AS [C] ON [U].[idClient] = [C].[idClient]) <> 0)
	BEGIN
		SELECT
			[P].[idPenalty],
			[L].[idLoan],
			[C].[document],
			[L].[loanDate],
			[L].[expirationDate],
			[L].[loanStatus],
			[P].[amount],
			[P].[status]
		 FROM 
			[dbo].[Penalty] AS [P]
			INNER JOIN [dbo].[Loans] AS [L] ON [P].[idLoan] = [L].[idLoan]	
			INNER JOIN [dbo].[Users] AS [U] ON [L].[idUser] = [U].[idUser]
			INNER JOIN [dbo].[Clients] AS [C] ON [U].[idClient] = [C].[idClient]
	END
	ELSE
	BEGIN
		SELECT 'No Existen registros','','','','','','',''
	END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_get_user]    Script Date: 8/11/2021 10:50:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Andres Vaca>
-- Create date: <25/10/2021>
-- Description:	<Sp encargado de Consultar un usuario>
-- =============================================
CREATE PROCEDURE [dbo].[sp_get_user]
	@document	INT
AS
BEGIN	
	IF((SELECT COUNT(*) FROM [dbo].[Users] AS [U] INNER JOIN [dbo].[Clients] AS [C] ON 
	[U].[idClient] = [C].[idClient]	WHERE [C].[document] = @document)<>0)
	BEGIN
		SELECT 
			[U].[idUser],
			[C].[document],
			[U].[password],
			[U].[rol],
			[U].[status]
		 FROM 
			[dbo].[Users] AS [U] INNER JOIN [dbo].[Clients] AS [C] 
			ON [U].[idClient] = [C].[idClient]
		WHERE 
			[C].[document] = @document			
	END
	ELSE
	BEGIN
		SELECT 'No Existen registros','','','','','',''	
	END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_get_users]    Script Date: 8/11/2021 10:50:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Andres Vaca>
-- Create date: <25/10/2021>
-- Description:	<Sp encargado de Consultar los usuarios>
-- =============================================
CREATE PROCEDURE [dbo].[sp_get_users]	
AS
BEGIN	
	IF((SELECT COUNT(*) FROM [dbo].[Users] AS [U] INNER JOIN [dbo].[Clients] AS [C] ON 
	[U].[idClient] = [C].[idClient])<>0)
	BEGIN
		SELECT 
			[U].[idUser],
			[C].[document],
			[U].[password],
			[U].[rol],
			[U].[status]
		 FROM 
			[dbo].[Users] AS [U] INNER JOIN [dbo].[Clients] AS [C] 
			ON [U].[idClient] = [C].[idClient]
	END
	ELSE
	BEGIN
		SELECT 'No Existen registros','','','','','',''	
	END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_insert_books]    Script Date: 8/11/2021 10:50:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Andres Vaca>
-- Create date: <25/10/2021>
-- Description:	<Sp encargado de insertar libros>
-- =============================================
CREATE PROCEDURE [dbo].[sp_insert_books]
	@nameBook	VARCHAR(40),
	@author		VARCHAR(30),
	@editorial	VARCHAR(30),
	@category	VARCHAR(20),
	@year		INT		   ,
	@cuantity	INT
AS
BEGIN	
	IF NOT EXISTS(SELECT * FROM [dbo].[Books] WHERE [name] = @nameBook )
	BEGIN
		INSERT INTO
			[dbo].[Books](
				[name],
				[author],
				[editorial],
				[category],
				[year],
				[stock]
			)VALUES(
				@nameBook,
				@author,
				@editorial,
				@category,
				@year,
				@cuantity
			)
		SELECT 0
	END
	ELSE
	BEGIN
		SELECT 1
	END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_insert_clients]    Script Date: 8/11/2021 10:50:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Andres Vaca>
-- Create date: <25/10/2021>
-- Description:	<Sp encargado de insertar clientes>
-- =============================================
CREATE PROCEDURE [dbo].[sp_insert_clients]
	@document			INT,
	@nameClient			VARCHAR(40),
	@lastNameCliente	VARCHAR(40),
	@status				VARCHAR(20)		
AS
BEGIN	
	IF NOT EXISTS(SELECT * FROM [dbo].[Clients] WHERE [document] =  @document)
	BEGIN
		INSERT INTO
			[dbo].[Clients](
				[document],
				[name],
				[lastname],
				[status]
			)VALUES(
				@document,
				@nameClient,
				@lastNameCliente,
				@status
			)
		SELECT 0
	END
	ELSE
	BEGIN
		SELECT 1
	END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_insert_loans]    Script Date: 8/11/2021 10:50:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Andres Vaca>
-- Create date: <25/10/2021>
-- Description:	<Sp encargado de insertar los prestamos>
-- =============================================
CREATE PROCEDURE [dbo].[sp_insert_loans]		
	@user				INT,
	@loanDate			VARCHAR(20),
	@expirationDate		VARCHAR(20),
	@loanStatus			VARCHAR(20)
AS
DECLARE @idUser INT
BEGIN	
	
	SELECT 
		@idUser = [U].[idUser]
	FROM 
		[dbo].[Users] AS [U] INNER JOIN [dbo].[Clients] AS [C] 
		ON [U].[idClient] = [C].[idClient]
	WHERE 
		[C].[document] = @user		

	IF NOT EXISTS(SELECT * FROM [dbo].[Loans] WHERE [idUser] = @idUser 
	AND ([loanStatus] = 'En Prestamo' OR [loanStatus] ='Vencido'))
	BEGIN
		INSERT
			[dbo].[Loans](
				[idUser],
				[loanDate],
				[expirationDate],
				[loanStatus]
			)VALUES(
				@idUser,
				@loanDate,
				@expirationDate,
				@loanStatus
			)
		SELECT 0
	END
	ELSE
	BEGIN
		SELECT 1
	END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_insert_loansbooks]    Script Date: 8/11/2021 10:50:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Andres Vaca>
-- Create date: <25/10/2021>
-- Description:	<Sp encargado de insertar los libros de los prestamos>
-- =============================================
CREATE PROCEDURE [dbo].[sp_insert_loansbooks]				
	@idBook				INT,
	@idLoan				INT
AS
BEGIN	
	IF EXISTS(SELECT * FROM [dbo].[LoanBooks] WHERE [idLoan] = @idLoan AND [idBook] = @idBook)
	BEGIN
		INSERT INTO
			[dbo].[LoanBooks](
				[idBook],
				[idLoan]
		)VALUES(
				@idBook,
				@idLoan
		)	
		SELECT 0
	END
	ELSE
	BEGIN
		SELECT 1
	END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_insert_penality]    Script Date: 8/11/2021 10:50:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Andres Vaca>
-- Create date: <25/10/2021>
-- Description:	<Sp encargado de crear las multas>
-- =============================================
CREATE PROCEDURE [dbo].[sp_insert_penality]
	@idLoan			INT,
	@amount			INT,	
	@status			VARCHAR(20)
AS
BEGIN	
	IF NOT EXISTS(SELECT * FROM [dbo].[Penalty] WHERE [idLoan] =  @idLoan)
	BEGIN
		INSERT INTO
			[dbo].[Penalty](
				[idLoan],
				[amount],
				[status]
			)VALUES( 
				@idLoan,
				@amount,
				@status
			)
		SELECT 0
	END
	ELSE
	BEGIN
		SELECT 1
	END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_insert_users]    Script Date: 8/11/2021 10:50:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Andres Vaca>
-- Create date: <25/10/2021>
-- Description:	<Sp encargado de insertar los usuarios>
-- =============================================
CREATE PROCEDURE [dbo].[sp_insert_users]
	@client			INT,
	@password		VARCHAR(64),
	@rol			VARCHAR(20),
	@status			VARCHAR(20)
AS
BEGIN	
DECLARE @idClient INT

	SELECT @idClient = [idClient] FROM [Clients] WHERE [document] = @client 

	IF NOT EXISTS(SELECT * FROM [dbo].[Users] WHERE [idClient] =  @idClient)
	BEGIN
		INSERT INTO
			[dbo].[Users](
				[idClient],
				[password],
				[rol],
				[status]
			)VALUES( 
				@idClient,
				@password,
				@rol,
				@status
			)
		SELECT 0
	END
	ELSE
	BEGIN
		SELECT 1
	END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_update_amount_penality]    Script Date: 8/11/2021 10:50:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Andres Vaca>
-- Create date: <25/10/2021>
-- Description:	<Sp encargado de actualizar el valor de las multas>
-- =============================================
CREATE PROCEDURE [dbo].[sp_update_amount_penality]	
	@amount			INT,	
	@idPenalty		INT
AS
BEGIN	
	IF EXISTS(SELECT * FROM [dbo].[Penalty] WHERE [idPenalty] =  @idPenalty AND [status] = 'Pendiente')
	BEGIN
		UPDATE
			[dbo].[Penalty]
		SET
			[amount] = @amount
		WHERE 
			[idPenalty] = @idPenalty			
		SELECT 0
	END
	ELSE
	BEGIN
		SELECT 1
	END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_update_books]    Script Date: 8/11/2021 10:50:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Andres Vaca>
-- Create date: <25/10/2021>
-- Description:	<Sp encargado de Actualizar libros>
-- =============================================
CREATE PROCEDURE [dbo].[sp_update_books]

	@nameBook	VARCHAR(40),
	@author		VARCHAR(30),
	@editorial	VARCHAR(30),
	@category	VARCHAR(20),
	@year		INT		   ,
	@cuantity	INT		   ,
	@idBook		INT
AS
BEGIN	
	IF NOT EXISTS(SELECT * FROM [dbo].[Books] WHERE [idBook] =  @idBook)
	BEGIN
		UPDATE 
			[dbo].[Books] 
		SET
			[name]			= @nameBook,
			[author]		= @author,
			[editorial]		= @editorial,
			[category]		= @editorial,
			[year]			= @year,
			[stock]			= @cuantity
		WHERE 
			[idBook] = @idBook
		SELECT 0
	END
	ELSE
	BEGIN
		SELECT 1
	END
	
END
GO
/****** Object:  StoredProcedure [dbo].[sp_update_clients]    Script Date: 8/11/2021 10:50:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Andres Vaca>
-- Create date: <25/10/2021>
-- Description:	<Sp encargado de actualizar datos de los clientes>
-- =============================================
CREATE PROCEDURE [dbo].[sp_update_clients]
	@document			INT,
	@nameClient			VARCHAR(40),
	@lastNameClient		VARCHAR(40),
	@status				VARCHAR(20),
	@idClient			INT
AS
BEGIN	
	IF EXISTS(SELECT * FROM [dbo].[Clients] WHERE [idClient] =  @idClient)
	BEGIN
		UPDATE
			[dbo].[Clients]
		SET
			[document] = @document,
			[name] = @nameClient,
			[lastname] = @lastNameClient,
			[status] = @status
		WHERE 
			[idClient] =  @idClient
		SELECT 0
	END
	ELSE
	BEGIN
		SELECT 1
	END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_update_data_users]    Script Date: 8/11/2021 10:50:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Andres Vaca>
-- Create date: <25/10/2021>
-- Description:	<Sp encargado de Editar Rol y estado los usuarios>
-- =============================================
CREATE PROCEDURE [dbo].[sp_update_data_users]	
	@rol			VARCHAR(20),
	@status			VARCHAR(20),
	@idUser			INT
AS
BEGIN	
	IF EXISTS(SELECT * FROM [dbo].[Users] WHERE [idUser] = @idUser)
	BEGIN
		UPDATE
			[dbo].[Users]
		SET
			[rol] = @rol,
			[status] = @status
		WHERE
			[idUser] = @idUser
		SELECT 0
	END
	ELSE
	BEGIN
		SELECT 1
	END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_update_loans]    Script Date: 8/11/2021 10:50:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Andres Vaca>
-- Create date: <25/10/2021>
-- Description:	<Sp encargado de Actualizar datos de los prestamos>
-- =============================================
CREATE PROCEDURE [dbo].[sp_update_loans]			
	@expirationDate		VARCHAR(20),
	@loanStatus			VARCHAR(20),
	@idLoan				INT
AS
BEGIN	
	IF EXISTS(SELECT * FROM [dbo].[Loans] WHERE [idLoan] = @idLoan 
	AND ([loanStatus] <> 'Devuelto' OR [loanStatus] <>'Devuelto Vencido'))
	BEGIN
		UPDATE
			[dbo].[Loans]
		SET
			[expirationDate] = @expirationDate,
			[loanStatus] = @loanStatus
		WHERE
			[idLoan] = @idLoan
		SELECT 0
	END
	ELSE
	BEGIN
		SELECT 1
	END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_update_pass_users]    Script Date: 8/11/2021 10:50:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Andres Vaca>
-- Create date: <25/10/2021>
-- Description:	<Sp encargado de Editar la contraseña de los usuarios>
-- =============================================
CREATE PROCEDURE [dbo].[sp_update_pass_users]	
	@password		VARCHAR(64),
	@idUser			INT
AS
BEGIN	
	IF EXISTS(SELECT * FROM [dbo].[Users] WHERE [idUser] = @idUser)
	BEGIN
		UPDATE
			[dbo].[Users]
		SET
			[password] = @password
		WHERE
			[idUser] = @idUser
		SELECT 0
	END
	ELSE
	BEGIN
		SELECT 1
	END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_update_status_penality]    Script Date: 8/11/2021 10:50:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Andres Vaca>
-- Create date: <25/10/2021>
-- Description:	<Sp encargado de actualizar el estado de las multas>
-- =============================================
CREATE PROCEDURE [dbo].[sp_update_status_penality]	
	@status			VARCHAR(20),	
	@idPenalty		INT
AS
BEGIN	
	IF EXISTS(SELECT * FROM [dbo].[Penalty] WHERE [idPenalty] =  @idPenalty AND [status] = 'Pendiente')
	BEGIN
		UPDATE
			[dbo].[Penalty]
		SET
			[status] = @status
		WHERE 
			[idPenalty] = @idPenalty			
		SELECT 0
	END
	ELSE
	BEGIN
		SELECT 1
	END
END
GO
USE [master]
GO
ALTER DATABASE [Loans] SET  READ_WRITE 
GO
