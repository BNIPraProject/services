USE [PraBNI]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Enrollment]') AND type in (N'U'))
ALTER TABLE [dbo].[Enrollment] DROP CONSTRAINT IF EXISTS [FK_Enrollment_Student]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Enrollment]') AND type in (N'U'))
ALTER TABLE [dbo].[Enrollment] DROP CONSTRAINT IF EXISTS [FK_Enrollment_Course]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Dosen_Course]') AND type in (N'U'))
ALTER TABLE [dbo].[Dosen_Course] DROP CONSTRAINT IF EXISTS [FK_Dosen_Course_Dosen]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Dosen_Course]') AND type in (N'U'))
ALTER TABLE [dbo].[Dosen_Course] DROP CONSTRAINT IF EXISTS [FK_Dosen_Course_Course]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 7/2/2021 11:10:23 PM ******/
DROP TABLE IF EXISTS [dbo].[Student]
GO
/****** Object:  Table [dbo].[Enrollment]    Script Date: 7/2/2021 11:10:23 PM ******/
DROP TABLE IF EXISTS [dbo].[Enrollment]
GO
/****** Object:  Table [dbo].[Dosen_Course]    Script Date: 7/2/2021 11:10:23 PM ******/
DROP TABLE IF EXISTS [dbo].[Dosen_Course]
GO
/****** Object:  Table [dbo].[Dosen]    Script Date: 7/2/2021 11:10:23 PM ******/
DROP TABLE IF EXISTS [dbo].[Dosen]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 7/2/2021 11:10:23 PM ******/
DROP TABLE IF EXISTS [dbo].[Course]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 7/2/2021 11:10:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[ID_Course] [int] IDENTITY(1,1) NOT NULL,
	[Nama_Course] [nvarchar](50) NOT NULL,
	[Jumlah_Mahasiswa] [int] NULL,
 CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED 
(
	[ID_Course] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dosen]    Script Date: 7/2/2021 11:10:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dosen](
	[ID_Dosen] [int] NOT NULL,
	[Nama_Dosen] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Dosen] PRIMARY KEY CLUSTERED 
(
	[ID_Dosen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dosen_Course]    Script Date: 7/2/2021 11:10:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dosen_Course](
	[ID_Dosen_Course] [int] IDENTITY(1,1) NOT NULL,
	[ID_Dosen] [int] NOT NULL,
	[ID_Course] [int] NOT NULL,
 CONSTRAINT [PK_Dosen_Course] PRIMARY KEY CLUSTERED 
(
	[ID_Dosen_Course] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Enrollment]    Script Date: 7/2/2021 11:10:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Enrollment](
	[ID_Enroll] [int] NOT NULL,
	[ID_Course] [int] NOT NULL,
	[ID_Student] [int] NOT NULL,
 CONSTRAINT [PK_Enrollment] PRIMARY KEY CLUSTERED 
(
	[ID_Enroll] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 7/2/2021 11:10:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[ID_Student] [int] NOT NULL,
	[Nama] [nvarchar](50) NOT NULL,
	[Domisili] [nchar](10) NULL,
	[Angkatan] [int] NULL,
	[Jenis_Kelamin] [nchar](10) NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[ID_Student] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Dosen_Course]  WITH CHECK ADD  CONSTRAINT [FK_Dosen_Course_Course] FOREIGN KEY([ID_Course])
REFERENCES [dbo].[Course] ([ID_Course])
GO
ALTER TABLE [dbo].[Dosen_Course] CHECK CONSTRAINT [FK_Dosen_Course_Course]
GO
ALTER TABLE [dbo].[Dosen_Course]  WITH CHECK ADD  CONSTRAINT [FK_Dosen_Course_Dosen] FOREIGN KEY([ID_Dosen])
REFERENCES [dbo].[Dosen] ([ID_Dosen])
GO
ALTER TABLE [dbo].[Dosen_Course] CHECK CONSTRAINT [FK_Dosen_Course_Dosen]
GO
ALTER TABLE [dbo].[Enrollment]  WITH CHECK ADD  CONSTRAINT [FK_Enrollment_Course] FOREIGN KEY([ID_Course])
REFERENCES [dbo].[Course] ([ID_Course])
GO
ALTER TABLE [dbo].[Enrollment] CHECK CONSTRAINT [FK_Enrollment_Course]
GO
ALTER TABLE [dbo].[Enrollment]  WITH CHECK ADD  CONSTRAINT [FK_Enrollment_Student] FOREIGN KEY([ID_Student])
REFERENCES [dbo].[Student] ([ID_Student])
GO
ALTER TABLE [dbo].[Enrollment] CHECK CONSTRAINT [FK_Enrollment_Student]
GO
