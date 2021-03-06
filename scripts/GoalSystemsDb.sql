USE [GoalSystemsDb]
GO
ALTER TABLE [dbo].[Tareas] DROP CONSTRAINT [FK_Tareas_Empleados]
GO
ALTER TABLE [dbo].[Incidencias] DROP CONSTRAINT [FK_Incidencias_Empleados]
GO
ALTER TABLE [dbo].[Empleados] DROP CONSTRAINT [FK_Empleados_Empresas]
GO
/****** Object:  Table [dbo].[Tareas]    Script Date: 11/04/2022 12:54:36 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tareas]') AND type in (N'U'))
DROP TABLE [dbo].[Tareas]
GO
/****** Object:  Table [dbo].[Incidencias]    Script Date: 11/04/2022 12:54:36 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Incidencias]') AND type in (N'U'))
DROP TABLE [dbo].[Incidencias]
GO
/****** Object:  Table [dbo].[Empresas]    Script Date: 11/04/2022 12:54:36 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Empresas]') AND type in (N'U'))
DROP TABLE [dbo].[Empresas]
GO
/****** Object:  Table [dbo].[Empleados]    Script Date: 11/04/2022 12:54:36 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Empleados]') AND type in (N'U'))
DROP TABLE [dbo].[Empleados]
GO
/****** Object:  Table [dbo].[Empleados]    Script Date: 11/04/2022 12:54:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleados](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[Apellidos] [nvarchar](50) NOT NULL,
	[FechaAlta] [date] NOT NULL,
	[FechaBaja] [date] NULL,
	[IdEmpresa] [int] NOT NULL,
 CONSTRAINT [PK_Empleados] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empresas]    Script Date: 11/04/2022 12:54:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empresas](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[FechaAlta] [date] NOT NULL,
	[FechaBaja] [date] NULL,
 CONSTRAINT [PK_Empresas] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Incidencias]    Script Date: 11/04/2022 12:54:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Incidencias](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](100) NOT NULL,
	[FechaAlta] [date] NOT NULL,
	[IdEmpleado] [int] NOT NULL,
 CONSTRAINT [PK_Incidencias] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tareas]    Script Date: 11/04/2022 12:54:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tareas](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](100) NOT NULL,
	[FechaAlta] [date] NOT NULL,
	[FechaFin] [date] NULL,
	[IdEmpleado] [int] NULL,
 CONSTRAINT [PK_Tareas] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET IDENTITY_INSERT [dbo].[Empleados] ON 

INSERT [dbo].[Empleados] ([Id], [Nombre], [Apellidos], [FechaAlta], [FechaBaja], [IdEmpresa]) VALUES (1, N'Federico', N'García Lorca', CAST(N'2021-05-09' AS Date), NULL, 1)
INSERT [dbo].[Empleados] ([Id], [Nombre], [Apellidos], [FechaAlta], [FechaBaja], [IdEmpresa]) VALUES (2, N'Manolo', N'Sanchís', CAST(N'2021-05-09' AS Date), NULL, 1)
INSERT [dbo].[Empleados] ([Id], [Nombre], [Apellidos], [FechaAlta], [FechaBaja], [IdEmpresa]) VALUES (3, N'Alfonso', N'Resines', CAST(N'2021-05-09' AS Date), NULL, 2)
INSERT [dbo].[Empleados] ([Id], [Nombre], [Apellidos], [FechaAlta], [FechaBaja], [IdEmpresa]) VALUES (4, N'Max', N'Verstapen', CAST(N'2021-05-09' AS Date), NULL, 3)
SET IDENTITY_INSERT [dbo].[Empleados] OFF
GO
SET IDENTITY_INSERT [dbo].[Empresas] ON 

INSERT [dbo].[Empresas] ([Id], [Nombre], [FechaAlta], [FechaBaja]) VALUES (1, N'Mutiny', CAST(N'2021-05-09' AS Date), NULL)
INSERT [dbo].[Empresas] ([Id], [Nombre], [FechaAlta], [FechaBaja]) VALUES (2, N'Empresa 2', CAST(N'2021-05-09' AS Date), NULL)
INSERT [dbo].[Empresas] ([Id], [Nombre], [FechaAlta], [FechaBaja]) VALUES (3, N'Empresa 3', CAST(N'2021-05-09' AS Date), NULL)
SET IDENTITY_INSERT [dbo].[Empresas] OFF
GO
SET IDENTITY_INSERT [dbo].[Incidencias] ON 

INSERT [dbo].[Incidencias] ([Id], [Descripcion], [FechaAlta], [IdEmpleado]) VALUES (1, N'Prueba incidencia', CAST(N'2021-05-09' AS Date), 1)
INSERT [dbo].[Incidencias] ([Id], [Descripcion], [FechaAlta], [IdEmpleado]) VALUES (2, N'incidencia 2', CAST(N'2021-05-09' AS Date), 1)
INSERT [dbo].[Incidencias] ([Id], [Descripcion], [FechaAlta], [IdEmpleado]) VALUES (3, N'incidencia 3', CAST(N'2021-05-09' AS Date), 2)
INSERT [dbo].[Incidencias] ([Id], [Descripcion], [FechaAlta], [IdEmpleado]) VALUES (4, N'incidencia 4', CAST(N'2021-05-09' AS Date), 3)
INSERT [dbo].[Incidencias] ([Id], [Descripcion], [FechaAlta], [IdEmpleado]) VALUES (5, N'incidencia 5', CAST(N'2021-05-09' AS Date), 4)
SET IDENTITY_INSERT [dbo].[Incidencias] OFF
GO
SET IDENTITY_INSERT [dbo].[Tareas] ON 

INSERT [dbo].[Tareas] ([Id], [Descripcion], [FechaAlta], [FechaFin], [IdEmpleado]) VALUES (1, N'Prueba tarea', CAST(N'2021-05-09' AS Date), NULL, 1)
SET IDENTITY_INSERT [dbo].[Tareas] OFF
GO

ALTER TABLE [dbo].[Empleados]  WITH CHECK ADD  CONSTRAINT [FK_Empleados_Empresas] FOREIGN KEY([IdEmpresa])
REFERENCES [dbo].[Empresas] ([Id])
GO
ALTER TABLE [dbo].[Empleados] CHECK CONSTRAINT [FK_Empleados_Empresas]
GO
ALTER TABLE [dbo].[Incidencias]  WITH CHECK ADD  CONSTRAINT [FK_Incidencias_Empleados] FOREIGN KEY([IdEmpleado])
REFERENCES [dbo].[Empleados] ([Id])
GO
ALTER TABLE [dbo].[Incidencias] CHECK CONSTRAINT [FK_Incidencias_Empleados]
GO
ALTER TABLE [dbo].[Tareas]  WITH CHECK ADD  CONSTRAINT [FK_Tareas_Empleados] FOREIGN KEY([IdEmpleado])
REFERENCES [dbo].[Empleados] ([Id])
GO
ALTER TABLE [dbo].[Tareas] CHECK CONSTRAINT [FK_Tareas_Empleados]
GO
