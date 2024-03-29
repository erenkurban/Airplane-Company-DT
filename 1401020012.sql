USE [master]
GO
/****** Object:  Database [ErenOğulcanKurban1401020012]    Script Date: 5.12.2018 21:59:10 ******/
CREATE DATABASE [ErenOğulcanKurban1401020012]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AirPlanecompany', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\AirPlanecompany.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AirPlanecompany_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\AirPlanecompany_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [ErenOğulcanKurban1401020012] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ErenOğulcanKurban1401020012].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ErenOğulcanKurban1401020012] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ErenOğulcanKurban1401020012] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ErenOğulcanKurban1401020012] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ErenOğulcanKurban1401020012] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ErenOğulcanKurban1401020012] SET ARITHABORT OFF 
GO
ALTER DATABASE [ErenOğulcanKurban1401020012] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ErenOğulcanKurban1401020012] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ErenOğulcanKurban1401020012] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ErenOğulcanKurban1401020012] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ErenOğulcanKurban1401020012] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ErenOğulcanKurban1401020012] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ErenOğulcanKurban1401020012] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ErenOğulcanKurban1401020012] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ErenOğulcanKurban1401020012] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ErenOğulcanKurban1401020012] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ErenOğulcanKurban1401020012] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ErenOğulcanKurban1401020012] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ErenOğulcanKurban1401020012] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ErenOğulcanKurban1401020012] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ErenOğulcanKurban1401020012] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ErenOğulcanKurban1401020012] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ErenOğulcanKurban1401020012] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ErenOğulcanKurban1401020012] SET RECOVERY FULL 
GO
ALTER DATABASE [ErenOğulcanKurban1401020012] SET  MULTI_USER 
GO
ALTER DATABASE [ErenOğulcanKurban1401020012] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ErenOğulcanKurban1401020012] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ErenOğulcanKurban1401020012] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ErenOğulcanKurban1401020012] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ErenOğulcanKurban1401020012] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ErenOğulcanKurban1401020012', N'ON'
GO
ALTER DATABASE [ErenOğulcanKurban1401020012] SET QUERY_STORE = OFF
GO
USE [ErenOğulcanKurban1401020012]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [ErenOğulcanKurban1401020012]
GO
/****** Object:  Schema [APComp]    Script Date: 5.12.2018 21:59:10 ******/
CREATE SCHEMA [APComp]
GO
/****** Object:  UserDefinedFunction [APComp].[TotalFare]    Script Date: 5.12.2018 21:59:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [APComp].[TotalFare](@id INT)
	RETURNS INT
	AS
	BEGIN
	DECLARE @fare INT, @fsc INT,@totalfare INT
	SELECT @fare = Fare FROM APComp.AirFare
	WHERE AfID = @id

	SELECT @fsc = FSC FROM APComp.AirFare
	WHERE AfID = @id


	SET @totalfare = @fare + @fsc
	RETURN @totalfare
	
	END
GO
/****** Object:  Table [APComp].[Route]    Script Date: 5.12.2018 21:59:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [APComp].[Route](
	[RtID] [int] NOT NULL,
	[Airport] [varchar](32) NOT NULL,
	[Destination] [varchar](32) NOT NULL,
	[RouteCode] [varchar](16) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RtID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[RouteCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [APComp].[AirFare]    Script Date: 5.12.2018 21:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [APComp].[AirFare](
	[AfID] [int] NOT NULL,
	[Route] [int] NULL,
	[Fare] [decimal](19, 2) NULL,
	[FSC] [decimal](19, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[AfID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [APComp].[RoutePrice]    Script Date: 5.12.2018 21:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE VIEW [APComp].[RoutePrice]
	AS 
	SELECT Fare, FSC, Airport, Destination
	FROM APComp.AirFare INNER JOIN APComp.Route 
	ON Route=RtID
	
GO
/****** Object:  Table [APComp].[State]    Script Date: 5.12.2018 21:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [APComp].[State](
	[StID] [int] NOT NULL,
	[StateName] [varchar](32) NULL,
	[Country] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[StID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [APComp].[Branches]    Script Date: 5.12.2018 21:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [APComp].[Branches](
	[BrID] [int] NOT NULL,
	[Center] [varchar](16) NOT NULL,
	[Address] [varchar](32) NOT NULL,
	[State] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[BrID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [APComp].[Employee]    Script Date: 5.12.2018 21:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [APComp].[Employee](
	[EmpID] [int] NOT NULL,
	[Name] [varchar](32) NOT NULL,
	[Address] [varchar](32) NOT NULL,
	[Branch] [int] NOT NULL,
	[Designation] [varchar](32) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Tel] [varchar](16) NOT NULL,
	[Ext] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[EmpID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [APComp].[EmployeeInfo]    Script Date: 5.12.2018 21:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE VIEW [APComp].[EmployeeInfo]
	AS 
	SELECT Name, Designation,Center, Email, Tel
	FROM APComp.Employee INNER JOIN APComp.Branches 
	ON Branch=BrID
	INNER JOIN APComp.State ON BrID=StID
GO
/****** Object:  Table [APComp].[AirCrafts]    Script Date: 5.12.2018 21:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [APComp].[AirCrafts](
	[AcID] [int] NOT NULL,
	[AcNumber] [varchar](32) NOT NULL,
	[Capacity] [int] NOT NULL,
	[MfdBy] [varchar](128) NOT NULL,
	[MfdOn] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AcID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [APComp].[Flight_Schedule]    Script Date: 5.12.2018 21:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [APComp].[Flight_Schedule](
	[FlID] [int] NOT NULL,
	[FlightDate] [date] NULL,
	[Departure] [time](7) NULL,
	[Arrival] [time](7) NULL,
	[AirCraft] [int] NULL,
	[NetFare] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[FlID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [APComp].[AircraftsRoute]    Script Date: 5.12.2018 21:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [APComp].[AircraftsRoute]
	AS 
	SELECT AcNumber, Airport, Destination
	FROM APComp.Flight_Schedule INNER JOIN APComp.AirCrafts 
	ON AirCraft=AcID
	INNER JOIN APComp.AirFare ON NetFare=AfID
	INNER JOIN APComp.Route ON Route=RtID
GO
/****** Object:  Table [APComp].[Passengers]    Script Date: 5.12.2018 21:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [APComp].[Passengers](
	[PsID] [int] NOT NULL,
	[Name] [varchar](32) NOT NULL,
	[Address] [varchar](64) NOT NULL,
	[Age] [int] NOT NULL,
	[Nationality] [varchar](16) NOT NULL,
	[Contacts] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [APComp].[PassengersOver18]    Script Date: 5.12.2018 21:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [APComp].[PassengersOver18]
	AS 
	SELECT Name, Age
	FROM APComp.Passengers
	WHERE Age > 17 
GO
/****** Object:  Table [APComp].[Transactions]    Script Date: 5.12.2018 21:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [APComp].[Transactions](
	[TsID] [int] NOT NULL,
	[BookingDate] [datetime] NULL,
	[DepartureDate] [datetime] NULL,
	[Passenger] [int] NULL,
	[Flight] [int] NULL,
	[Type] [bit] NULL,
	[Employee] [int] NULL,
	[Charges] [int] NULL,
	[Discount] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[TsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [APComp].[PassengerTicket]    Script Date: 5.12.2018 21:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE VIEW [APComp].[PassengerTicket]
	AS 
	SELECT Name, Airport, Destination, Fare, FlightDate
	FROM APComp.Transactions INNER JOIN APComp.Passengers 
	ON Passenger=PsID
	INNER JOIN APComp.Flight_Schedule ON Flight=FlID
	INNER JOIN APComp.AirFare ON NetFare=AfID
	INNER JOIN APComp.Route ON Route=RtID
GO
/****** Object:  View [APComp].[GetRoute_Time]    Script Date: 5.12.2018 21:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE VIEW [APComp].[GetRoute_Time]
	AS 
	SELECT FlightDate, Departure, Arrival,Airport,Destination
	FROM APComp.Flight_Schedule INNER JOIN APComp.AirFare 
	ON NetFare=AfID
	INNER JOIN APComp.Route 
	ON Route=RtID 
GO
/****** Object:  Table [APComp].[Countries]    Script Date: 5.12.2018 21:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [APComp].[Countries](
	[CtID] [int] NOT NULL,
	[CountryName] [varchar](32) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CtID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [APComp].[Country_State]    Script Date: 5.12.2018 21:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE VIEW [APComp].[Country_State]
	AS 
	SELECT StateName,CountryName 
	FROM APComp.State INNER JOIN APComp.Countries 
	ON Country=CtID
GO
/****** Object:  Table [APComp].[Contact_Details]    Script Date: 5.12.2018 21:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [APComp].[Contact_Details](
	[CnID] [int] NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Cell] [varchar](16) NOT NULL,
	[Tel] [varchar](16) NULL,
	[Street] [varchar](64) NULL,
	[State] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CnID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [APComp].[PassengersInfo]    Script Date: 5.12.2018 21:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [APComp].[PassengersInfo]
	AS 
	SELECT Name, Address, Age, Nationality, Email,Cell,StateName
	FROM APComp.Passengers INNER JOIN APComp.Contact_Details 
	ON Contacts=CnID
	INNER JOIN APComp.State ON State=StID
GO
/****** Object:  View [APComp].[Branch_Address]    Script Date: 5.12.2018 21:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	
	CREATE VIEW [APComp].[Branch_Address]
	AS 
	SELECT Center,Address,StateName,CountryName 
	FROM APComp.Branches INNER JOIN APComp.State 
	ON State=StID
	INNER JOIN APComp.Countries ON Country=CtID
GO
/****** Object:  Table [APComp].[Discounts]    Script Date: 5.12.2018 21:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [APComp].[Discounts](
	[DiID] [int] NOT NULL,
	[Title] [varchar](32) NULL,
	[Amount] [int] NULL,
	[Description] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[DiID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [APComp].[Discount_Types]    Script Date: 5.12.2018 21:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [APComp].[Discount_Types]
	AS 
	SELECT Amount,Description 
	FROM APComp.Discounts
GO
/****** Object:  Table [APComp].[CancelReservation]    Script Date: 5.12.2018 21:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [APComp].[CancelReservation](
	[CrID] [int] NOT NULL,
	[Pas_idno] [int] NOT NULL,
	[Reason] [varchar](32) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CrID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [APComp].[Charges]    Script Date: 5.12.2018 21:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [APComp].[Charges](
	[ChID] [int] NOT NULL,
	[Title] [varchar](32) NULL,
	[Amount] [int] NULL,
	[Description] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ChID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [APComp].[AirFare]  WITH CHECK ADD  CONSTRAINT [fk_Route] FOREIGN KEY([Route])
REFERENCES [APComp].[Route] ([RtID])
GO
ALTER TABLE [APComp].[AirFare] CHECK CONSTRAINT [fk_Route]
GO
ALTER TABLE [APComp].[Branches]  WITH CHECK ADD  CONSTRAINT [fk_StateOfEmployee] FOREIGN KEY([State])
REFERENCES [APComp].[State] ([StID])
GO
ALTER TABLE [APComp].[Branches] CHECK CONSTRAINT [fk_StateOfEmployee]
GO
ALTER TABLE [APComp].[Contact_Details]  WITH CHECK ADD  CONSTRAINT [fk_State] FOREIGN KEY([State])
REFERENCES [APComp].[State] ([StID])
GO
ALTER TABLE [APComp].[Contact_Details] CHECK CONSTRAINT [fk_State]
GO
ALTER TABLE [APComp].[Employee]  WITH CHECK ADD  CONSTRAINT [fk_Branch] FOREIGN KEY([Branch])
REFERENCES [APComp].[Branches] ([BrID])
GO
ALTER TABLE [APComp].[Employee] CHECK CONSTRAINT [fk_Branch]
GO
ALTER TABLE [APComp].[Flight_Schedule]  WITH CHECK ADD  CONSTRAINT [fk_AirCraft] FOREIGN KEY([AirCraft])
REFERENCES [APComp].[AirCrafts] ([AcID])
GO
ALTER TABLE [APComp].[Flight_Schedule] CHECK CONSTRAINT [fk_AirCraft]
GO
ALTER TABLE [APComp].[Flight_Schedule]  WITH CHECK ADD  CONSTRAINT [fk_NetFare] FOREIGN KEY([NetFare])
REFERENCES [APComp].[AirFare] ([AfID])
GO
ALTER TABLE [APComp].[Flight_Schedule] CHECK CONSTRAINT [fk_NetFare]
GO
ALTER TABLE [APComp].[Passengers]  WITH CHECK ADD  CONSTRAINT [fk_Contacts] FOREIGN KEY([Contacts])
REFERENCES [APComp].[Contact_Details] ([CnID])
GO
ALTER TABLE [APComp].[Passengers] CHECK CONSTRAINT [fk_Contacts]
GO
ALTER TABLE [APComp].[State]  WITH CHECK ADD  CONSTRAINT [fk_Country] FOREIGN KEY([Country])
REFERENCES [APComp].[Countries] ([CtID])
GO
ALTER TABLE [APComp].[State] CHECK CONSTRAINT [fk_Country]
GO
ALTER TABLE [APComp].[Transactions]  WITH CHECK ADD  CONSTRAINT [fk_Charges] FOREIGN KEY([Charges])
REFERENCES [APComp].[Charges] ([ChID])
GO
ALTER TABLE [APComp].[Transactions] CHECK CONSTRAINT [fk_Charges]
GO
ALTER TABLE [APComp].[Transactions]  WITH CHECK ADD  CONSTRAINT [fk_Discount] FOREIGN KEY([Discount])
REFERENCES [APComp].[Discounts] ([DiID])
GO
ALTER TABLE [APComp].[Transactions] CHECK CONSTRAINT [fk_Discount]
GO
ALTER TABLE [APComp].[Transactions]  WITH CHECK ADD  CONSTRAINT [fk_Employee] FOREIGN KEY([Employee])
REFERENCES [APComp].[Employee] ([EmpID])
GO
ALTER TABLE [APComp].[Transactions] CHECK CONSTRAINT [fk_Employee]
GO
ALTER TABLE [APComp].[Transactions]  WITH CHECK ADD  CONSTRAINT [fk_Flight] FOREIGN KEY([Flight])
REFERENCES [APComp].[Flight_Schedule] ([FlID])
GO
ALTER TABLE [APComp].[Transactions] CHECK CONSTRAINT [fk_Flight]
GO
ALTER TABLE [APComp].[Transactions]  WITH CHECK ADD  CONSTRAINT [fk_Passenger] FOREIGN KEY([Passenger])
REFERENCES [APComp].[Passengers] ([PsID])
GO
ALTER TABLE [APComp].[Transactions] CHECK CONSTRAINT [fk_Passenger]
GO
/****** Object:  StoredProcedure [APComp].[AddCountry]    Script Date: 5.12.2018 21:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [APComp].[AddCountry]
	@CtID INT,@Name NVARCHAR(20)
	AS
	BEGIN
	INSERT INTO APComp.Countries values(@CtID,@Name)
	
	END
GO
/****** Object:  StoredProcedure [APComp].[deleteCountry]    Script Date: 5.12.2018 21:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [APComp].[deleteCountry]
	@CtID INT
	AS
	BEGIN
	DELETE FROM APComp.State WHERE Country=@CtID

	DELETE FROM APComp.Countries WHERE CtID=@CtID
	
	

	END
GO
/****** Object:  StoredProcedure [APComp].[deletePassenger]    Script Date: 5.12.2018 21:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [APComp].[deletePassenger]
	@CnID INT
	AS
	BEGIN

	DELETE FROM APComp.Transactions WHERE TsID=@CnID

	DELETE FROM APComp.Passengers WHERE PsID=@CnID

	DELETE FROM APComp.Contact_Details WHERE CnID=@CnID

	

	END
GO
/****** Object:  StoredProcedure [APComp].[UpdatePassengers]    Script Date: 5.12.2018 21:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE PROCEDURE [APComp].[UpdatePassengers]
	@id INT,@name NVARCHAR(30),@address NVARCHAR(40),@age INT,@nation NVARCHAR(20)
	AS
	BEGIN
	UPDATE APComp.Passengers
	SET Name=@name,Address=@address,Age=@age,Nationality=@nation
	WHERE PsID=@id

	END
GO
USE [master]
GO
ALTER DATABASE [ErenOğulcanKurban1401020012] SET  READ_WRITE 
GO
