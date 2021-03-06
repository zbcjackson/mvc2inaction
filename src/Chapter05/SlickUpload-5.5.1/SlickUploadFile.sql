/****** Object:  Table [dbo].[SlickUploadFile]    Script Date: 03/06/2007 06:37:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SlickUploadFile](
	[FileId] [int] IDENTITY(1,1) NOT NULL,
	[FileName] [varchar](128) COLLATE Latin1_General_CI_AI NULL,
	[Data] [image] NULL,
 CONSTRAINT [PK_SlickUploadFile] PRIMARY KEY CLUSTERED 
(
	[FileId] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF