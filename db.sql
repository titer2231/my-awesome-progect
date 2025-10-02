USE [ispp3506]
GO
/****** Object:  Table [dbo].[Materials]    Script Date: 04.09.2025 9:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Materials](
	[MaterialID] [int] IDENTITY(1,1) NOT NULL,
	[TopicID] [int] NOT NULL,
	[Title] [nvarchar](150) NOT NULL,
	[Type] [nvarchar](20) NOT NULL,
	[HtmlContent] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaterialID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 04.09.2025 9:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleId] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tests]    Script Date: 04.09.2025 9:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tests](
	[TestID] [int] IDENTITY(1,1) NOT NULL,
	[TopicID] [int] NOT NULL,
	[Title] [nvarchar](150) NOT NULL,
	[TimeLimitMinutes] [int] NOT NULL,
	[IsPublished] [bit] NOT NULL,
	[PassThresholdPct] [decimal](5, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TestID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Topics]    Script Date: 04.09.2025 9:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Topics](
	[TopicId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](150) NOT NULL,
	[Summary] [nvarchar](300) NOT NULL,
	[Level] [nvarchar](50) NOT NULL,
	[PublishedAt] [datetime2](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TopicId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 04.09.2025 9:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [int] NOT NULL,
	[Email] [nvarchar](100) NULL,
	[UserName] [nvarchar](100) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Materials] ON 

INSERT [dbo].[Materials] ([MaterialID], [TopicID], [Title], [Type], [HtmlContent]) VALUES (1, 1, N'Как правильно кормить кота', N'Задание', N'<p>Кормите кота качественным кормом, следите за его рационом.</p>')
INSERT [dbo].[Materials] ([MaterialID], [TopicID], [Title], [Type], [HtmlContent]) VALUES (2, 1, N'Гигиена кота', N'Теория', N'<p>Регулярно чистите уши и зубы вашего кота.</p>')
INSERT [dbo].[Materials] ([MaterialID], [TopicID], [Title], [Type], [HtmlContent]) VALUES (3, 2, N'Почему коты мяукают?', N'Теория', N'<p>Коты мяукают, чтобы общаться с людьми.</p>')
INSERT [dbo].[Materials] ([MaterialID], [TopicID], [Title], [Type], [HtmlContent]) VALUES (4, 3, N'Сиамская кошка', N'Теория', N'<p>Сиамские кошки известны своим характерным окрасом и дружелюбным характером.</p>')
SET IDENTITY_INSERT [dbo].[Materials] OFF
GO
INSERT [dbo].[Roles] ([RoleId], [Name]) VALUES (1, N'Администратор')
INSERT [dbo].[Roles] ([RoleId], [Name]) VALUES (2, N'Преподаватель')
INSERT [dbo].[Roles] ([RoleId], [Name]) VALUES (3, N'Студент')
GO
SET IDENTITY_INSERT [dbo].[Tests] ON 

INSERT [dbo].[Tests] ([TestID], [TopicID], [Title], [TimeLimitMinutes], [IsPublished], [PassThresholdPct]) VALUES (1, 1, N'Тест по уходу за котами', 30, 1, CAST(70.00 AS Decimal(5, 2)))
INSERT [dbo].[Tests] ([TestID], [TopicID], [Title], [TimeLimitMinutes], [IsPublished], [PassThresholdPct]) VALUES (2, 2, N'Тест по поведению котов', 20, 1, CAST(60.00 AS Decimal(5, 2)))
SET IDENTITY_INSERT [dbo].[Tests] OFF
GO
SET IDENTITY_INSERT [dbo].[Topics] ON 

INSERT [dbo].[Topics] ([TopicId], [Title], [Summary], [Level], [PublishedAt]) VALUES (1, N'Уход за котиками', N'Основные советы по уходу за домашними кошками.', N'Базовый', CAST(N'2025-09-04T09:28:08.4900000' AS DateTime2))
INSERT [dbo].[Topics] ([TopicId], [Title], [Summary], [Level], [PublishedAt]) VALUES (2, N'Поведение котиков', N'Изучение привычек и поведения домашних кошек.', N'Базовый', CAST(N'2025-09-04T09:28:08.4900000' AS DateTime2))
INSERT [dbo].[Topics] ([TopicId], [Title], [Summary], [Level], [PublishedAt]) VALUES (3, N'Породы котиков', N'Обзор популярных пород кошек и их характеристик.', N'Начальный', CAST(N'2025-09-04T09:28:08.4900000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Topics] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserId], [RoleId], [Email], [UserName], [Password], [CreatedAt]) VALUES (1, 1, N'admin@example.com', N'admin', N'password123', CAST(N'2025-09-04T09:27:57.0233333' AS DateTime2))
INSERT [dbo].[Users] ([UserId], [RoleId], [Email], [UserName], [Password], [CreatedAt]) VALUES (2, 2, N'teacher@example.com', N'teacher', N'password456', CAST(N'2025-09-04T09:27:57.0233333' AS DateTime2))
INSERT [dbo].[Users] ([UserId], [RoleId], [Email], [UserName], [Password], [CreatedAt]) VALUES (3, 3, N'student@example.com', N'student', N'password789', CAST(N'2025-09-04T09:27:57.0233333' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__A9D10534034D2C9B]    Script Date: 04.09.2025 9:35:10 ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Tests] ADD  DEFAULT ((0)) FOR [IsPublished]
GO
ALTER TABLE [dbo].[Tests] ADD  DEFAULT ((60)) FOR [PassThresholdPct]
GO
ALTER TABLE [dbo].[Topics] ADD  DEFAULT (getdate()) FOR [PublishedAt]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Materials]  WITH CHECK ADD FOREIGN KEY([TopicID])
REFERENCES [dbo].[Topics] ([TopicId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Tests]  WITH CHECK ADD FOREIGN KEY([TopicID])
REFERENCES [dbo].[Topics] ([TopicId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([RoleId])
GO
ALTER TABLE [dbo].[Materials]  WITH CHECK ADD CHECK  (([Type]=N'Задание' OR [Type]=N'Теория'))
GO
ALTER TABLE [dbo].[Topics]  WITH CHECK ADD CHECK  (([Level]=N'Продвинутый' OR [Level]=N'Базовый' OR [Level]=N'Начальный'))
GO
