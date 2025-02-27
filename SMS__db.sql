USE [master]
GO
/****** Object:  Database [SMS__DB]    Script Date: 20-09-2024 12:15:55 ******/
CREATE DATABASE [SMS__DB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SMS__DB', FILENAME = N'D:\program_sqlserver\MSSQL16.MSSQLSERVER\MSSQL\DATA\SMS__DB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SMS__DB_log', FILENAME = N'D:\program_sqlserver\MSSQL16.MSSQLSERVER\MSSQL\DATA\SMS__DB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [SMS__DB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SMS__DB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SMS__DB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SMS__DB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SMS__DB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SMS__DB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SMS__DB] SET ARITHABORT OFF 
GO
ALTER DATABASE [SMS__DB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SMS__DB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SMS__DB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SMS__DB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SMS__DB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SMS__DB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SMS__DB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SMS__DB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SMS__DB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SMS__DB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SMS__DB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SMS__DB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SMS__DB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SMS__DB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SMS__DB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SMS__DB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SMS__DB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SMS__DB] SET RECOVERY FULL 
GO
ALTER DATABASE [SMS__DB] SET  MULTI_USER 
GO
ALTER DATABASE [SMS__DB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SMS__DB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SMS__DB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SMS__DB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SMS__DB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SMS__DB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'SMS__DB', N'ON'
GO
ALTER DATABASE [SMS__DB] SET QUERY_STORE = ON
GO
ALTER DATABASE [SMS__DB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [SMS__DB]
GO
/****** Object:  Table [dbo].[Marks]    Script Date: 20-09-2024 12:15:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Marks](
	[MarksId] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [int] NULL,
	[SubjectId] [int] NULL,
	[Marks] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MarksId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 20-09-2024 12:15:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Students]    Script Date: 20-09-2024 12:15:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[StudentId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[RollNumber] [char](5) NOT NULL,
	[Name] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subjects]    Script Date: 20-09-2024 12:15:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subjects](
	[SubjectId] [int] IDENTITY(1,1) NOT NULL,
	[SubjectName] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SubjectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 20-09-2024 12:15:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[Password] [varchar](255) NOT NULL,
	[RoleId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Marks] ON 

INSERT [dbo].[Marks] ([MarksId], [StudentId], [SubjectId], [Marks]) VALUES (1, 1, 1, 85)
INSERT [dbo].[Marks] ([MarksId], [StudentId], [SubjectId], [Marks]) VALUES (2, 1, 2, 90)
INSERT [dbo].[Marks] ([MarksId], [StudentId], [SubjectId], [Marks]) VALUES (3, 2, 1, 78)
INSERT [dbo].[Marks] ([MarksId], [StudentId], [SubjectId], [Marks]) VALUES (4, 2, 2, 88)
INSERT [dbo].[Marks] ([MarksId], [StudentId], [SubjectId], [Marks]) VALUES (5, 1, 3, 92)
INSERT [dbo].[Marks] ([MarksId], [StudentId], [SubjectId], [Marks]) VALUES (6, 2, 3, 85)
INSERT [dbo].[Marks] ([MarksId], [StudentId], [SubjectId], [Marks]) VALUES (7, 1, 1, 60)
SET IDENTITY_INSERT [dbo].[Marks] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([RoleId], [RoleName]) VALUES (1, N'invigilator')
INSERT [dbo].[Roles] ([RoleId], [RoleName]) VALUES (2, N'student')
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[Students] ON 

INSERT [dbo].[Students] ([StudentId], [UserId], [RollNumber], [Name]) VALUES (1, 1, N'12345', N'John Doe')
INSERT [dbo].[Students] ([StudentId], [UserId], [RollNumber], [Name]) VALUES (2, 2, N'67890', N'Jane Smith')
INSERT [dbo].[Students] ([StudentId], [UserId], [RollNumber], [Name]) VALUES (3, NULL, N'1    ', N'tom')
SET IDENTITY_INSERT [dbo].[Students] OFF
GO
SET IDENTITY_INSERT [dbo].[Subjects] ON 

INSERT [dbo].[Subjects] ([SubjectId], [SubjectName]) VALUES (1, N'Mathematics')
INSERT [dbo].[Subjects] ([SubjectId], [SubjectName]) VALUES (2, N'Physics')
INSERT [dbo].[Subjects] ([SubjectId], [SubjectName]) VALUES (3, N'Chemistry')
INSERT [dbo].[Subjects] ([SubjectId], [SubjectName]) VALUES (4, N'English')
INSERT [dbo].[Subjects] ([SubjectId], [SubjectName]) VALUES (5, N'Programming')
SET IDENTITY_INSERT [dbo].[Subjects] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserId], [Username], [Password], [RoleId]) VALUES (1, N'admin', N'password@1', 1)
INSERT [dbo].[Users] ([UserId], [Username], [Password], [RoleId]) VALUES (2, N'student1', N'password@2', 2)
INSERT [dbo].[Users] ([UserId], [Username], [Password], [RoleId]) VALUES (6, N'student', N'password@2', 2)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Roles__8A2B616042E46FBF]    Script Date: 20-09-2024 12:15:55 ******/
ALTER TABLE [dbo].[Roles] ADD UNIQUE NONCLUSTERED 
(
	[RoleName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Students__E9F06F16E6BB21D7]    Script Date: 20-09-2024 12:15:56 ******/
ALTER TABLE [dbo].[Students] ADD UNIQUE NONCLUSTERED 
(
	[RollNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__536C85E48D952A68]    Script Date: 20-09-2024 12:15:56 ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Marks]  WITH CHECK ADD FOREIGN KEY([StudentId])
REFERENCES [dbo].[Students] ([StudentId])
GO
ALTER TABLE [dbo].[Marks]  WITH CHECK ADD FOREIGN KEY([SubjectId])
REFERENCES [dbo].[Subjects] ([SubjectId])
GO
ALTER TABLE [dbo].[Students]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([RoleId])
GO
ALTER TABLE [dbo].[Marks]  WITH CHECK ADD CHECK  (([Marks]>=(1) AND [Marks]<=(100)))
GO
/****** Object:  StoredProcedure [dbo].[AddStudent]    Script Date: 20-09-2024 12:15:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddStudent]
    @Username VARCHAR(50),
    @Password VARCHAR(255),
    @RollNumber CHAR(5),
    @Name VARCHAR(30),
    @RoleId INT
AS
BEGIN
    DECLARE @UserId INT;

    -- Insert into Users table
    INSERT INTO Users (Username, Password, RoleId)
    VALUES (@Username, @Password, @RoleId);

    -- Get the UserId of the newly inserted user
    SET @UserId = SCOPE_IDENTITY();

    -- Insert into Students table
    INSERT INTO Students (UserId, RollNumber, Name)
    VALUES (@UserId, @RollNumber, @Name);
END;
GO
/****** Object:  StoredProcedure [dbo].[Sp_AddMarks]    Script Date: 20-09-2024 12:15:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

  CREATE PROCEDURE [dbo].[Sp_AddMarks]
    @StudentId INT,
    @SubjectId INT,
    @Marks INT
AS
BEGIN
    -- Check if marks are within valid range
    IF @Marks < 1 OR @Marks > 100
    BEGIN
        RAISERROR('Marks must be between 1 and 100.', 16, 1);
        RETURN;
    END

    -- Insert into Marks table
    INSERT INTO Marks (StudentId, SubjectId, Marks)
    VALUES (@StudentId, @SubjectId, @Marks);
END;
GO
/****** Object:  StoredProcedure [dbo].[Sp_AddStudent]    Script Date: 20-09-2024 12:15:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sp_AddStudent]
    @Username VARCHAR(50),
    @Password VARCHAR(255),
    @RollNumber CHAR(5),
    @Name VARCHAR(30),
    @RoleId INT
AS
BEGIN
    DECLARE @UserId INT;

    -- Insert into Users table
    INSERT INTO Users (Username, Password, RoleId)
    VALUES (@Username, @Password, @RoleId);

    -- Get the UserId of the newly inserted user
    SET @UserId = SCOPE_IDENTITY();

    -- Insert into Students table
    INSERT INTO Students (UserId, RollNumber, Name)
    VALUES (@UserId, @RollNumber, @Name);
END;
GO
/****** Object:  StoredProcedure [dbo].[Sp_CheckUserCredentials]    Script Date: 20-09-2024 12:15:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Sp_CheckUserCredentials]
    @Username VARCHAR(50),
    @Password VARCHAR(255),
    @IsValid BIT OUTPUT
AS
BEGIN
    -- Initialize output parameter
    SET @IsValid = 0;

    -- Check if the user exists and the password matches (use appropriate hashing)
    IF EXISTS (
        SELECT 1
        FROM Users
        WHERE Username = @Username AND Password = @Password
    )
    BEGIN
        SET @IsValid = 1;  -- Credentials are valid
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[Sp_DeleteStudent]    Script Date: 20-09-2024 12:15:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sp_DeleteStudent]
    @StudentId INT
AS
BEGIN
    -- Check if the student exists
    IF EXISTS (SELECT 1 FROM Students WHERE StudentId = @StudentId)
    BEGIN
        -- Delete marks associated with the student
        DELETE FROM Marks WHERE StudentId = @StudentId;

        -- Delete the student record
        DELETE FROM Students WHERE StudentId = @StudentId;
    END
    ELSE
    BEGIN
        RAISERROR('Student not found.', 16, 1);
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[Sp_DisplayAllStudentRecords]    Script Date: 20-09-2024 12:15:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sp_DisplayAllStudentRecords]
AS
BEGIN
    SELECT s.RollNumber, s.Name, sub.SubjectName, m.Marks
    FROM Students s
    JOIN Marks m ON s.StudentId = m.StudentId
    JOIN Subjects sub ON m.SubjectId = sub.SubjectId;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_DisplayStudentByRollNumber]    Script Date: 20-09-2024 12:15:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_DisplayStudentByRollNumber]
    @RollNumber CHAR(5)
AS
BEGIN
    SELECT 
        s.StudentId,
        s.RollNumber,
        s.Name,
        u.Username,
        sub.SubjectName,
        m.Marks
    FROM 
        Students s
    JOIN 
        Users u ON s.UserId = u.UserId
    LEFT JOIN 
        Marks m ON s.StudentId = m.StudentId
    LEFT JOIN 
        Subjects sub ON m.SubjectId = sub.SubjectId
    WHERE 
        s.RollNumber = @RollNumber
    ORDER BY 
        sub.SubjectName;
END;
GO
/****** Object:  StoredProcedure [dbo].[Sp_UpdateMarks]    Script Date: 20-09-2024 12:15:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Sp_UpdateMarks]
    @MarksId INT,
    @NewMarks INT
AS
BEGIN
    -- Check if the new marks are within valid range
    IF @NewMarks < 1 OR @NewMarks > 100
    BEGIN
        RAISERROR('Marks must be between 1 and 100.', 16, 1);
        RETURN;
    END

    -- Update the marks record
    UPDATE Marks
    SET Marks = @NewMarks
    WHERE MarksId = @MarksId;
END;
GO
USE [master]
GO
ALTER DATABASE [SMS__DB] SET  READ_WRITE 
GO
