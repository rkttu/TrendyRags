USE [TrendyRags2]
GO
/****** Object:  Table [dbo].[CART]    Script Date: 2020-01-09 오후 9:06:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CART](
	[CartNo] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[SessionID] [varchar](100) NULL,
	[Email] [varchar](100) NOT NULL,
	[ProductNo] [varchar](50) NULL,
	[ColorName] [varchar](50) NULL,
	[SizeName] [varchar](50) NULL,
	[Qty] [numeric](18, 0) NULL,
	[UnitPrice] [float] NULL,
	[RegDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientMaster]    Script Date: 2020-01-09 오후 9:06:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientMaster](
	[SerialNo] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[ClientNameF] [nvarchar](50) NULL,
	[ClientNameM] [nvarchar](50) NULL,
	[ClientNameL] [nvarchar](50) NULL,
	[Email] [varchar](200) NULL,
	[Phone] [varchar](50) NULL,
	[Street1] [nvarchar](50) NULL,
	[Street2] [nvarchar](50) NULL,
	[City] [nvarchar](50) NULL,
	[State] [nvarchar](50) NULL,
	[Zip] [nvarchar](50) NULL,
	[Country] [nvarchar](50) NULL,
	[MailOPT] [varchar](10) NULL,
	[Password] [varchar](50) NULL,
	[Class] [varchar](50) NULL,
	[RegDate] [datetime] NULL,
	[WholesaleLevel] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CodeCountry]    Script Date: 2020-01-09 오후 9:06:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CodeCountry](
	[CCNumeric] [int] NOT NULL,
	[CountryName] [nvarchar](255) NOT NULL,
	[RegionCode] [varchar](10) NULL,
	[CCode3] [varchar](10) NULL,
	[CCode2] [varchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CodeOrderStatus]    Script Date: 2020-01-09 오후 9:06:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CodeOrderStatus](
	[StatusCode] [varchar](10) NULL,
	[StatusName] [varchar](50) NULL,
	[SerialNo] [numeric](18, 0) IDENTITY(1,1) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CodeRegion]    Script Date: 2020-01-09 오후 9:06:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CodeRegion](
	[RegionCode] [varchar](10) NOT NULL,
	[RegionName] [varchar](200) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CodeStates]    Script Date: 2020-01-09 오후 9:06:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CodeStates](
	[Abbr] [nvarchar](10) NOT NULL,
	[StatesName] [nvarchar](100) NOT NULL,
	[StatesNo] [tinyint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Coupon]    Script Date: 2020-01-09 오후 9:06:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Coupon](
	[SerialNo] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[CouponCode] [varchar](50) NULL,
	[Salesman] [varchar](50) NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[DCRate] [int] NULL,
	[Products] [ntext] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Log_ClientMaster]    Script Date: 2020-01-09 오후 9:06:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Log_ClientMaster](
	[LogSerial] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[SerialNo] [numeric](18, 0) NOT NULL,
	[ClientNameF] [nvarchar](50) NULL,
	[ClientNameM] [nvarchar](50) NULL,
	[ClientNameL] [nvarchar](50) NULL,
	[Email] [varchar](200) NULL,
	[Phone] [varchar](50) NULL,
	[Street1] [nvarchar](50) NULL,
	[Street2] [nvarchar](50) NULL,
	[City] [nvarchar](50) NULL,
	[State] [nvarchar](50) NULL,
	[Zip] [nvarchar](50) NULL,
	[Country] [nvarchar](50) NULL,
	[MailOPT] [varchar](10) NULL,
	[Password] [varchar](50) NULL,
	[Class] [varchar](50) NULL,
	[RegDate] [datetime] NULL,
	[WholesaleLevel] [varchar](50) NULL,
	[ModifyDate] [datetime] NULL,
	[Modifier] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 2020-01-09 오후 9:06:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[SerialNo] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[OrderNo] [varchar](20) NOT NULL,
	[ProductNo] [varchar](20) NOT NULL,
	[ColorName] [varchar](20) NULL,
	[SizeName] [varchar](20) NULL,
	[Qty] [numeric](18, 0) NOT NULL,
	[UnitPrice] [float] NULL,
	[Amount] [float] NULL,
	[Remarks] [varchar](200) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderMaster]    Script Date: 2020-01-09 오후 9:06:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderMaster](
	[SerialNo] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[OrderNo] [varchar](20) NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[ClientNo] [numeric](18, 0) NOT NULL,
	[Email] [varchar](100) NULL,
	[Street1] [nvarchar](50) NULL,
	[Street2] [nvarchar](50) NULL,
	[City] [nvarchar](50) NULL,
	[State] [nvarchar](50) NULL,
	[Zip] [nvarchar](50) NULL,
	[Country] [nvarchar](50) NULL,
	[CouponCode] [varchar](50) NULL,
	[CouponDCRate] [int] NULL,
	[OrderAmount] [float] NULL,
	[TaxAmount] [float] NULL,
	[DCAmount] [float] NULL,
	[WrappingCharge] [float] NULL,
	[ShippingAmount] [float] NULL,
	[TotalAmount] [float] NULL,
	[PayMethod] [varchar](50) NULL,
	[Paystatus] [varchar](50) NULL,
	[ShipMethod] [varchar](50) NULL,
	[OrderStatus] [varchar](50) NULL,
	[TrackingNo] [varchar](50) NULL,
	[CommentFromClient] [ntext] NULL,
	[CommentToClient] [ntext] NULL,
	[IsGift] [varchar](50) NULL,
	[GiftWrapping] [varchar](50) NULL,
	[RecipientName] [nvarchar](50) NULL,
	[RecipientStreet1] [nvarchar](50) NULL,
	[RecipientStreet2] [nvarchar](50) NULL,
	[RecipientCity] [nvarchar](50) NULL,
	[RecipientState] [nvarchar](50) NULL,
	[RecipientZip] [nvarchar](50) NULL,
	[RecipientCountry] [nvarchar](50) NULL,
	[RecipientPhone] [nvarchar](50) NULL,
	[GiftComment] [ntext] NULL,
	[UserIP] [varchar](50) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderTemp]    Script Date: 2020-01-09 오후 9:06:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderTemp](
	[SerialNo] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[SessionID] [varchar](50) NULL,
	[CardType] [varchar](50) NULL,
	[CardNumber] [varchar](50) NULL,
	[CardExpires] [varchar](10) NULL,
	[CardCVV] [varchar](10) NULL,
	[BillName] [nvarchar](50) NULL,
	[BillAddress1] [nvarchar](50) NULL,
	[BillAddress2] [nvarchar](50) NULL,
	[BillCity] [nvarchar](50) NULL,
	[BillState] [nvarchar](50) NULL,
	[BillZip] [nvarchar](50) NULL,
	[BillCountry] [nvarchar](50) NULL,
	[BillPhone] [nvarchar](50) NULL,
	[ShipName] [nvarchar](50) NULL,
	[ShipAddress1] [nvarchar](50) NULL,
	[ShipAddress2] [nvarchar](50) NULL,
	[ShipCity] [nvarchar](50) NULL,
	[ShipState] [nvarchar](50) NULL,
	[ShipZip] [nvarchar](50) NULL,
	[ShipCountry] [nvarchar](50) NULL,
	[ShipPhone] [nvarchar](50) NULL,
	[ShippingMethod] [varchar](50) NULL,
	[RegDate] [datetime] NULL,
	[CouponCode] [varchar](50) NULL,
	[CouponDCRate] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pictures]    Script Date: 2020-01-09 오후 9:06:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pictures](
	[SerialNo] [numeric](18, 0) IDENTITY(200,1) NOT NULL,
	[ProductNo] [varchar](20) NOT NULL,
	[Usage] [varchar](20) NULL,
	[ColorName] [varchar](20) NULL,
	[FileName] [varchar](400) NULL,
	[DisplayOrder] [int] NULL,
	[Status] [varchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductColor]    Script Date: 2020-01-09 오후 9:06:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductColor](
	[SerialNo] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[ProductNo] [varchar](20) NOT NULL,
	[ColorName] [varchar](20) NOT NULL,
	[ColorStock] [numeric](18, 0) NULL,
	[ColorStatus] [varchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductMaster]    Script Date: 2020-01-09 오후 9:06:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductMaster](
	[SerialNo] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[ProductNo] [varchar](20) NOT NULL,
	[BrandName] [varchar](100) NULL,
	[Category] [varchar](50) NULL,
	[Gender] [varchar](50) NULL,
	[NewItem] [varchar](50) NULL,
	[ExclusiveSales] [varchar](50) NULL,
	[ProductName] [varchar](100) NULL,
	[ModelName] [varchar](100) NULL,
	[BriefDescription] [varchar](400) NULL,
	[Description] [ntext] NULL,
	[PriceRetail] [float] NULL,
	[PriceRetailEvent1] [float] NULL,
	[PriceRetailEvent2] [float] NULL,
	[PriceWholesale1] [float] NULL,
	[PriceWholesale2] [float] NULL,
	[PriceWholesale3] [float] NULL,
	[PriceWholesale4] [float] NULL,
	[PriceWholesale5] [float] NULL,
	[Stock] [numeric](18, 0) NULL,
	[Status] [varchar](10) NULL,
	[WebDisplay] [varchar](10) NULL,
	[DisplayOrder] [numeric](18, 0) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductSize]    Script Date: 2020-01-09 오후 9:06:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductSize](
	[SerialNo] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[ProductNo] [varchar](20) NOT NULL,
	[SizeName] [varchar](20) NOT NULL,
	[SizeStock] [numeric](18, 0) NULL,
	[SizeStatus] [varchar](10) NULL,
	[WeightLBS] [real] NULL,
	[RegDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShopList]    Script Date: 2020-01-09 오후 9:06:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShopList](
	[SerialNo] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[DisplayOrder] [numeric](18, 0) NULL,
	[Class] [varchar](50) NULL,
	[CompanyName] [varchar](100) NULL,
	[AddressLine1] [varchar](100) NULL,
	[SuiteNo] [varchar](50) NULL,
	[AddressLine2] [varchar](100) NULL,
	[Phone] [varchar](50) NULL,
	[Fax] [varchar](50) NULL,
	[Email] [varchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UPS_Rates]    Script Date: 2020-01-09 오후 9:06:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UPS_Rates](
	[Area] [nvarchar](50) NULL,
	[Class] [nvarchar](20) NULL,
	[Weight] [real] NULL,
	[Zone2] [real] NULL,
	[Zone3] [real] NULL,
	[Zone4] [real] NULL,
	[Zone5] [real] NULL,
	[Zone6] [real] NULL,
	[Zone7] [real] NULL,
	[Zone8] [real] NULL,
	[Zone44] [real] NULL,
	[Zone45] [real] NULL,
	[Zone46] [real] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UPS_ZoneCode]    Script Date: 2020-01-09 오후 9:06:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UPS_ZoneCode](
	[ZipCode] [nvarchar](10) NULL,
	[Ground] [nvarchar](10) NULL,
	[Day3Select] [nvarchar](10) NULL,
	[Day2Air] [nvarchar](10) NULL,
	[Day2AirAM] [nvarchar](10) NULL,
	[NextDayAirSaver] [nvarchar](10) NULL,
	[NextDayAir] [nvarchar](10) NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CART] ON 

INSERT [dbo].[CART] ([CartNo], [SessionID], [Email], [ProductNo], [ColorName], [SizeName], [Qty], [UnitPrice], [RegDate]) VALUES (CAST(112 AS Numeric(18, 0)), N'4o3ree55yfzmrm55h1aaxs55', N'si@wholeA.com', N'MLFT107', N'Color(Wholesale)', N'Small', CAST(4 AS Numeric(18, 0)), 32, CAST(N'2008-01-30T20:46:53.140' AS DateTime))
INSERT [dbo].[CART] ([CartNo], [SessionID], [Email], [ProductNo], [ColorName], [SizeName], [Qty], [UnitPrice], [RegDate]) VALUES (CAST(113 AS Numeric(18, 0)), N'4o3ree55yfzmrm55h1aaxs55', N'si@wholeA.com', N'MLFT107', N'Color(Wholesale)', N'Medium', CAST(4 AS Numeric(18, 0)), 32, CAST(N'2008-01-30T20:46:53.140' AS DateTime))
INSERT [dbo].[CART] ([CartNo], [SessionID], [Email], [ProductNo], [ColorName], [SizeName], [Qty], [UnitPrice], [RegDate]) VALUES (CAST(114 AS Numeric(18, 0)), N'4o3ree55yfzmrm55h1aaxs55', N'si@wholeA.com', N'MLFT107', N'Color(Wholesale)', N'Large', CAST(4 AS Numeric(18, 0)), 32, CAST(N'2008-01-30T20:46:53.140' AS DateTime))
INSERT [dbo].[CART] ([CartNo], [SessionID], [Email], [ProductNo], [ColorName], [SizeName], [Qty], [UnitPrice], [RegDate]) VALUES (CAST(119 AS Numeric(18, 0)), N'4o3ree55yfzmrm55h1aaxs55', N'si@wholeA.com', N'MLFT106', N'Color(Wholesale)', N'Small', CAST(4 AS Numeric(18, 0)), 38, CAST(N'2008-01-30T20:56:26.007' AS DateTime))
INSERT [dbo].[CART] ([CartNo], [SessionID], [Email], [ProductNo], [ColorName], [SizeName], [Qty], [UnitPrice], [RegDate]) VALUES (CAST(120 AS Numeric(18, 0)), N'4o3ree55yfzmrm55h1aaxs55', N'si@wholeA.com', N'MLFT106', N'Color(Wholesale)', N'Medium', CAST(4 AS Numeric(18, 0)), 38, CAST(N'2008-01-30T20:56:26.007' AS DateTime))
INSERT [dbo].[CART] ([CartNo], [SessionID], [Email], [ProductNo], [ColorName], [SizeName], [Qty], [UnitPrice], [RegDate]) VALUES (CAST(121 AS Numeric(18, 0)), N'4o3ree55yfzmrm55h1aaxs55', N'si@wholeA.com', N'MLFT106', N'Color(Wholesale)', N'Large', CAST(4 AS Numeric(18, 0)), 38, CAST(N'2008-01-30T20:56:26.007' AS DateTime))
INSERT [dbo].[CART] ([CartNo], [SessionID], [Email], [ProductNo], [ColorName], [SizeName], [Qty], [UnitPrice], [RegDate]) VALUES (CAST(122 AS Numeric(18, 0)), N'4mruxcahoxolqve5n3e3qvmw', N'si@user.com', N'MLFT102', N'Black', N'Small', CAST(1 AS Numeric(18, 0)), 62, CAST(N'2008-01-30T21:20:17.520' AS DateTime))
INSERT [dbo].[CART] ([CartNo], [SessionID], [Email], [ProductNo], [ColorName], [SizeName], [Qty], [UnitPrice], [RegDate]) VALUES (CAST(109 AS Numeric(18, 0)), N'4o3ree55yfzmrm55h1aaxs55', N'si@wholeA.com', N'MLFL101', N'Color(Wholesale)', N'Small', CAST(4 AS Numeric(18, 0)), 68, CAST(N'2008-01-30T20:46:18.647' AS DateTime))
INSERT [dbo].[CART] ([CartNo], [SessionID], [Email], [ProductNo], [ColorName], [SizeName], [Qty], [UnitPrice], [RegDate]) VALUES (CAST(110 AS Numeric(18, 0)), N'4o3ree55yfzmrm55h1aaxs55', N'si@wholeA.com', N'MLFL101', N'Color(Wholesale)', N'Medium', CAST(4 AS Numeric(18, 0)), 68, CAST(N'2008-01-30T20:46:18.647' AS DateTime))
INSERT [dbo].[CART] ([CartNo], [SessionID], [Email], [ProductNo], [ColorName], [SizeName], [Qty], [UnitPrice], [RegDate]) VALUES (CAST(111 AS Numeric(18, 0)), N'4o3ree55yfzmrm55h1aaxs55', N'si@wholeA.com', N'MLFL101', N'Color(Wholesale)', N'Large', CAST(4 AS Numeric(18, 0)), 68, CAST(N'2008-01-30T20:46:18.647' AS DateTime))
SET IDENTITY_INSERT [dbo].[CART] OFF
SET IDENTITY_INSERT [dbo].[ClientMaster] ON 

INSERT [dbo].[ClientMaster] ([SerialNo], [ClientNameF], [ClientNameM], [ClientNameL], [Email], [Phone], [Street1], [Street2], [City], [State], [Zip], [Country], [MailOPT], [Password], [Class], [RegDate], [WholesaleLevel]) VALUES (CAST(10 AS Numeric(18, 0)), N'SI_A', N'', N'Cho', N'si@admin.com', N'626-848-8771', N'2401 s. Hacienda Bl.', N'Apt #38', N'hacienda heights', N'CA', N'91745', N'USA', N'YES', N'a', N'ADMIN', CAST(N'2008-01-28T15:34:17.030' AS DateTime), N'NA')
INSERT [dbo].[ClientMaster] ([SerialNo], [ClientNameF], [ClientNameM], [ClientNameL], [Email], [Phone], [Street1], [Street2], [City], [State], [Zip], [Country], [MailOPT], [Password], [Class], [RegDate], [WholesaleLevel]) VALUES (CAST(18 AS Numeric(18, 0)), N'SI_WA', N'', N'Cho', N'si@wholeA.com', N'626-848-8771', N'2401 s. Hacienda Bl.', N'', N'hacienda heights', N'CA', N'91745', N'USA', N'YES', N'a', N'WHOLESALE', CAST(N'2008-01-28T15:36:05.890' AS DateTime), N'A')
INSERT [dbo].[ClientMaster] ([SerialNo], [ClientNameF], [ClientNameM], [ClientNameL], [Email], [Phone], [Street1], [Street2], [City], [State], [Zip], [Country], [MailOPT], [Password], [Class], [RegDate], [WholesaleLevel]) VALUES (CAST(20 AS Numeric(18, 0)), N'SI_Re', N'', N'Cho', N'Retired_si@hot.com', N'', N'', N'', N'', N'AL', N'', N'USA', N'YES', N'Retired_', N'__Retired', CAST(N'2008-01-28T16:25:16.463' AS DateTime), N'E')
INSERT [dbo].[ClientMaster] ([SerialNo], [ClientNameF], [ClientNameM], [ClientNameL], [Email], [Phone], [Street1], [Street2], [City], [State], [Zip], [Country], [MailOPT], [Password], [Class], [RegDate], [WholesaleLevel]) VALUES (CAST(21 AS Numeric(18, 0)), N'SI_P', N'', N'Cho', N'si@pre.com', N'', N'', N'', N'', N'AL', N'', N'USA', N'YES', N'a', N'PREWHOLESALE', CAST(N'2008-01-16T20:44:13.033' AS DateTime), N'E')
INSERT [dbo].[ClientMaster] ([SerialNo], [ClientNameF], [ClientNameM], [ClientNameL], [Email], [Phone], [Street1], [Street2], [City], [State], [Zip], [Country], [MailOPT], [Password], [Class], [RegDate], [WholesaleLevel]) VALUES (CAST(22 AS Numeric(18, 0)), N'SI_U', N'', N'Cho', N'si@user.com', N'', N'', N'', N'', N'AL', N'', N'USA', N'YES', N'a', N'USER', CAST(N'2008-01-16T20:45:16.867' AS DateTime), N'NA')
INSERT [dbo].[ClientMaster] ([SerialNo], [ClientNameF], [ClientNameM], [ClientNameL], [Email], [Phone], [Street1], [Street2], [City], [State], [Zip], [Country], [MailOPT], [Password], [Class], [RegDate], [WholesaleLevel]) VALUES (CAST(23 AS Numeric(18, 0)), N'SI_WB', N'', N'Cho', N'si@wholeB.com', N'', N'', N'', N'', N'', N'', N'', N'Yes', N'a', N'WHOLESALE', CAST(N'2008-01-30T14:04:24.563' AS DateTime), N'B')
INSERT [dbo].[ClientMaster] ([SerialNo], [ClientNameF], [ClientNameM], [ClientNameL], [Email], [Phone], [Street1], [Street2], [City], [State], [Zip], [Country], [MailOPT], [Password], [Class], [RegDate], [WholesaleLevel]) VALUES (CAST(24 AS Numeric(18, 0)), N'SI_WC', N'', N'Cho', N'si@wholeC.com', N'', N'', N'', N'', N'', N'', N'', N'Yes', N'a', N'WHOLESALE', CAST(N'2008-01-30T14:04:26.960' AS DateTime), N'C')
INSERT [dbo].[ClientMaster] ([SerialNo], [ClientNameF], [ClientNameM], [ClientNameL], [Email], [Phone], [Street1], [Street2], [City], [State], [Zip], [Country], [MailOPT], [Password], [Class], [RegDate], [WholesaleLevel]) VALUES (CAST(25 AS Numeric(18, 0)), N'SI_WD', N'', N'Cho', N'si@wholeD.com', N'', N'', N'', N'', N'', N'', N'', N'Yes', N'a', N'WHOLESALE', CAST(N'2008-01-30T14:04:27.930' AS DateTime), N'D')
INSERT [dbo].[ClientMaster] ([SerialNo], [ClientNameF], [ClientNameM], [ClientNameL], [Email], [Phone], [Street1], [Street2], [City], [State], [Zip], [Country], [MailOPT], [Password], [Class], [RegDate], [WholesaleLevel]) VALUES (CAST(26 AS Numeric(18, 0)), N'SI_WE', N'', N'Cho', N'si@wholeE.com', N'', N'', N'', N'', N'', N'', N'', N'Yes', N'a', N'WHOLESALE', CAST(N'2008-01-30T14:04:28.657' AS DateTime), N'E')
SET IDENTITY_INSERT [dbo].[ClientMaster] OFF
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (4, N'Afghanistan', N'AS', N'AFG', N'AF')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (248, N'Åland Islands', N'EU', N'ALA', N'AX')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (8, N'Albania', N'EU', N'ALB', N'AL')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (12, N'Algeria', N'AF', N'DZA', N'DZ')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (16, N'American Samoa', N'OC', N'ASM', N'AS')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (20, N'Andorra', N'EU', N'AND', N'AD')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (24, N'Angola', N'AF', N'AGO', N'AO')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (660, N'Anguilla', N'NA', N'AIA', N'AI')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (10, N'Antarctica', N'AN', N'ATA', N'AQ')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (28, N'Antigua and Barbuda', N'NA', N'ATG', N'AG')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (32, N'Argentina', N'SA', N'ARG', N'AR')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (51, N'Armenia', N'AS', N'ARM', N'AM')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (533, N'Aruba', N'NA', N'ABW', N'AW')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (36, N'Australia', N'OC', N'AUS', N'AU')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (40, N'Austria', N'EU', N'AUT', N'AT')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (31, N'Azerbaijan', N'AS', N'AZE', N'AZ')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (44, N'Bahamas', N'NA', N'BHS', N'BS')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (48, N'Bahrain', N'AS', N'BHR', N'BH')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (50, N'Bangladesh', N'AS', N'BGD', N'BD')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (52, N'Barbados', N'NA', N'BRB', N'BB')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (112, N'Belarus', N'EU', N'BLR', N'BY')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (56, N'Belgium', N'EU', N'BEL', N'BE')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (84, N'Belize', N'NA', N'BLZ', N'BZ')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (204, N'Benin', N'AF', N'BEN', N'BJ')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (60, N'Bermuda', N'NA', N'BMU', N'BM')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (64, N'Bhutan', N'AS', N'BTN', N'BT')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (68, N'Bolivia', N'SA', N'BOL', N'BO')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (70, N'Bosnia and Herzegovina', N'EU', N'BIH', N'BA')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (72, N'Botswana', N'AF', N'BWA', N'BW')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (74, N'Bouvet Island', N'AN', N'BVT', N'BV')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (76, N'Brazil', N'SA', N'BRA', N'BR')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (86, N'British Indian Ocean Territory', N'AS', N'IOT', N'IO')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (96, N'Brunei Darussalam', N'AS', N'BRN', N'BN')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (100, N'Bulgaria', N'EU', N'BGR', N'BG')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (854, N'Burkina Faso', N'AF', N'BFA', N'BF')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (108, N'Burundi', N'AF', N'BDI', N'BI')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (116, N'Cambodia', N'AS', N'KHM', N'KH')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (120, N'Cameroon', N'AF', N'CMR', N'CM')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (124, N'Canada', N'NA', N'CAN', N'CA')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (132, N'Cape Verde', N'AF', N'CPV', N'CV')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (136, N'Cayman Islands', N'NA', N'CYM', N'KY')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (140, N'Central African Republic', N'AF', N'CAF', N'CF')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (148, N'Chad', N'AF', N'TCD', N'TD')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (152, N'Chile', N'SA', N'CHL', N'CL')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (156, N'China', N'AS', N'CHN', N'CN')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (162, N'Christmas Island', N'AS', N'CXR', N'CX')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (166, N'Cocos (Keeling) Islands', N'AS', N'CCK', N'CC')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (170, N'Colombia', N'SA', N'COL', N'CO')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (174, N'Comoros', N'AF', N'COM', N'KM')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (178, N'Congo', N'AF', N'COG', N'CG')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (180, N'Congo, Democratic Republic of the', N'AF', N'COD', N'CD')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (184, N'Cook Islands', N'OC', N'COK', N'CK')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (188, N'Costa Rica', N'NA', N'CRI', N'CR')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (384, N'Côte d''Ivoire', N'AF', N'CIV', N'CI')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (191, N'Croatia', N'EU', N'HRV', N'HR')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (192, N'Cuba', N'NA', N'CUB', N'CU')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (196, N'Cyprus', N'AS', N'CYP', N'CY')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (203, N'Czech Republic', N'EU', N'CZE', N'CZ')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (208, N'Denmark', N'EU', N'DNK', N'DK')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (262, N'Djibouti', N'AF', N'DJI', N'DJ')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (212, N'Dominica', N'NA', N'DMA', N'DM')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (214, N'Dominican Republic', N'NA', N'DOM', N'DO')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (218, N'Ecuador', N'SA', N'ECU', N'EC')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (818, N'Egypt', N'AF', N'EGY', N'EG')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (222, N'El Salvador', N'NA', N'SLV', N'SV')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (226, N'Equatorial Guinea', N'AF', N'GNQ', N'GQ')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (232, N'Eritrea', N'AF', N'ERI', N'ER')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (233, N'Estonia', N'EU', N'EST', N'EE')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (231, N'Ethiopia', N'AF', N'ETH', N'ET')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (238, N'Falkland Islands (Malvinas)', N'SA', N'FLK', N'FK')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (234, N'Faroe Islands', N'EU', N'FRO', N'FO')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (242, N'Fiji', N'OC', N'FJI', N'FJ')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (246, N'Finland', N'EU', N'FIN', N'FI')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (250, N'France', N'EU', N'FRA', N'FR')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (254, N'French Guiana', N'SA', N'GUF', N'GF')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (258, N'French Polynesia', N'OC', N'PYF', N'PF')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (260, N'French Southern Territories', N'AN', N'ATF', N'TF')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (266, N'Gabon', N'AF', N'GAB', N'GA')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (270, N'Gambia', N'AF', N'GMB', N'GM')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (268, N'Georgia', N'AS', N'GEO', N'GE')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (276, N'Germany', N'EU', N'DEU', N'DE')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (288, N'Ghana', N'AF', N'GHA', N'GH')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (292, N'Gibraltar', N'EU', N'GIB', N'GI')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (300, N'Greece', N'EU', N'GRC', N'GR')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (304, N'Greenland', N'NA', N'GRL', N'GL')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (308, N'Grenada', N'NA', N'GRD', N'GD')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (312, N'Guadeloupe', N'NA', N'GLP', N'GP')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (316, N'Guam', N'OC', N'GUM', N'GU')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (320, N'Guatemala', N'NA', N'GTM', N'GT')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (831, N'Guernsey', N'EU', N'GGY', N'GG')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (324, N'Guinea', N'AF', N'GIN', N'GN')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (624, N'Guinea-Bissau', N'AF', N'GNB', N'GW')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (328, N'Guyana', N'SA', N'GUY', N'GY')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (332, N'Haiti', N'NA', N'HTI', N'HT')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (334, N'Heard Island and McDonald Islands', N'AN', N'HMD', N'HM')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (336, N'Holy See (Vatican City State)', N'EU', N'VAT', N'VA')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (340, N'Honduras', N'NA', N'HND', N'HN')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (344, N'Hong Kong', N'AS', N'HKG', N'HK')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (348, N'Hungary', N'EU', N'HUN', N'HU')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (352, N'Iceland', N'EU', N'ISL', N'IS')
GO
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (356, N'India', N'AS', N'IND', N'IN')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (360, N'Indonesia', N'AS', N'IDN', N'ID')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (364, N'Iran, Islamic Republic of', N'AS', N'IRN', N'IR')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (368, N'Iraq', N'AS', N'IRQ', N'IQ')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (372, N'Ireland', N'EU', N'IRL', N'IE')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (833, N'Isle of Man', N'EU', N'IMN', N'IM')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (376, N'Israel', N'AS', N'ISR', N'IL')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (380, N'Italy', N'EU', N'ITA', N'IT')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (388, N'Jamaica', N'NA', N'JAM', N'JM')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (392, N'Japan', N'AS', N'JPN', N'JP')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (832, N'Jersey', N'EU', N'JEY', N'JE')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (400, N'Jordan', N'AS', N'JOR', N'JO')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (398, N'Kazakhstan', N'AS', N'KAZ', N'KZ')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (404, N'Kenya', N'AF', N'KEN', N'KE')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (296, N'Kiribati', N'OC', N'KIR', N'KI')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (408, N'Korea, Democratic People''s Republic of', N'AS', N'PRK', N'KP')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (410, N'Korea, Republic of', N'AS', N'KOR', N'KR')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (414, N'Kuwait', N'AS', N'KWT', N'KW')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (417, N'Kyrgyzstan', N'AS', N'KGZ', N'KG')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (418, N'Lao People''s Democratic Republic', N'AS', N'LAO', N'LA')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (428, N'Latvia', N'EU', N'LVA', N'LV')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (422, N'Lebanon', N'AS', N'LBN', N'LB')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (426, N'Lesotho', N'AF', N'LSO', N'LS')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (430, N'Liberia', N'AF', N'LBR', N'LR')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (434, N'Libyan Arab Jamahiriya', N'AF', N'LBY', N'LY')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (438, N'Liechtenstein', N'EU', N'LIE', N'LI')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (440, N'Lithuania', N'EU', N'LTU', N'LT')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (442, N'Luxembourg', N'EU', N'LUX', N'LU')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (446, N'Macao', N'AS', N'MAC', N'MO')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (807, N'Macedonia, the former Yugoslav Republic of', N'EU', N'MKD', N'MK')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (450, N'Madagascar', N'AF', N'MDG', N'MG')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (454, N'Malawi', N'AF', N'MWI', N'MW')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (458, N'Malaysia', N'AS', N'MYS', N'MY')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (462, N'Maldives', N'AS', N'MDV', N'MV')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (466, N'Mali', N'AF', N'MLI', N'ML')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (470, N'Malta', N'EU', N'MLT', N'MT')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (584, N'Marshall Islands', N'OC', N'MHL', N'MH')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (474, N'Martinique', N'NA', N'MTQ', N'MQ')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (478, N'Mauritania', N'AF', N'MRT', N'MR')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (480, N'Mauritius', N'AF', N'MUS', N'MU')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (175, N'Mayotte', N'AF', N'MYT', N'YT')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (484, N'Mexico', N'NA', N'MEX', N'MX')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (583, N'Micronesia, Federated States of', N'OC', N'FSM', N'FM')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (498, N'Moldova, Republic of', N'EU', N'MDA', N'MD')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (492, N'Monaco', N'EU', N'MCO', N'MC')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (496, N'Mongolia', N'AS', N'MNG', N'MN')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (499, N'Montenegro', N'EU', N'MNE', N'ME')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (500, N'Montserrat', N'NA', N'MSR', N'MS')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (504, N'Morocco', N'AF', N'MAR', N'MA')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (508, N'Mozambique', N'AF', N'MOZ', N'MZ')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (104, N'Myanmar', N'AS', N'MMR', N'MM')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (516, N'Namibia', N'AF', N'NAM', N'NA')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (520, N'Nauru', N'OC', N'NRU', N'NR')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (524, N'Nepal', N'AS', N'NPL', N'NP')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (528, N'Netherlands', N'EU', N'NLD', N'NL')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (530, N'Netherlands Antilles', N'NA', N'ANT', N'AN')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (540, N'New Caledonia', N'OC', N'NCL', N'NC')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (554, N'New Zealand', N'OC', N'NZL', N'NZ')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (558, N'Nicaragua', N'NA', N'NIC', N'NI')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (562, N'Niger', N'AF', N'NER', N'NE')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (566, N'Nigeria', N'AF', N'NGA', N'NG')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (570, N'Niue', N'OC', N'NIU', N'NU')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (574, N'Norfolk Island', N'OC', N'NFK', N'NF')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (580, N'Northern Mariana Islands', N'OC', N'MNP', N'MP')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (578, N'Norway', N'EU', N'NOR', N'NO')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (512, N'Oman', N'AS', N'OMN', N'OM')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (586, N'Pakistan', N'AS', N'PAK', N'PK')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (585, N'Palau', N'OC', N'PLW', N'PW')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (275, N'Palestinian Territory, Occupied', N'AS', N'PSE', N'PS')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (591, N'Panama', N'NA', N'PAN', N'PA')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (598, N'Papua New Guinea', N'OC', N'PNG', N'PG')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (600, N'Paraguay', N'SA', N'PRY', N'PY')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (604, N'Peru', N'SA', N'PER', N'PE')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (608, N'Philippines', N'AS', N'PHL', N'PH')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (612, N'Pitcairn', N'OC', N'PCN', N'PN')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (616, N'Poland', N'EU', N'POL', N'PL')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (620, N'Portugal', N'EU', N'PRT', N'PT')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (630, N'Puerto Rico', N'NA', N'PRI', N'PR')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (634, N'Qatar', N'AS', N'QAT', N'QA')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (638, N'Réunion', N'AF', N'REU', N'RE')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (642, N'Romania', N'EU', N'ROU', N'RO')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (643, N'Russian Federation', N'EU', N'RUS', N'RU')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (646, N'Rwanda', N'AF', N'RWA', N'RW')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (652, N'Saint Barthélemy', N'NA', N'BLM', N'BL')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (654, N'Saint Helena', N'AF', N'SHN', N'SH')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (659, N'Saint Kitts and Nevis', N'NA', N'KNA', N'KN')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (662, N'Saint Lucia', N'NA', N'LCA', N'LC')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (663, N'Saint Martin (French part)', N'NA', N'MAF', N'MF')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (666, N'Saint Pierre and Miquelon', N'NA', N'SPM', N'PM')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (670, N'Saint Vincent and the Grenadines', N'NA', N'VCT', N'VC')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (882, N'Samoa', N'OC', N'WSM', N'WS')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (674, N'San Marino', N'EU', N'SMR', N'SM')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (678, N'Sao Tome and Principe', N'AF', N'STP', N'ST')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (682, N'Saudi Arabia', N'AS', N'SAU', N'SA')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (686, N'Senegal', N'AF', N'SEN', N'SN')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (688, N'Serbia', N'EU', N'SRB', N'RS')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (690, N'Seychelles', N'AF', N'SYC', N'SC')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (694, N'Sierra Leone', N'AF', N'SLE', N'SL')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (702, N'Singapore', N'AS', N'SGP', N'SG')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (703, N'Slovakia', N'EU', N'SVK', N'SK')
GO
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (705, N'Slovenia', N'EU', N'SVN', N'SI')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (90, N'Solomon Islands', N'OC', N'SLB', N'SB')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (706, N'Somalia', N'AF', N'SOM', N'SO')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (710, N'South Africa', N'AF', N'ZAF', N'ZA')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (239, N'South Georgia and the South Sandwich Islands', N'AN', N'SGS', N'GS')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (724, N'Spain', N'EU', N'ESP', N'ES')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (144, N'Sri Lanka', N'AS', N'LKA', N'LK')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (736, N'Sudan', N'AF', N'SDN', N'SD')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (740, N'Suriname', N'SA', N'SUR', N'SR')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (744, N'Svalbard and Jan Mayen', N'EU', N'SJM', N'SJ')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (748, N'Swaziland', N'AF', N'SWZ', N'SZ')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (752, N'Sweden', N'EU', N'SWE', N'SE')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (756, N'Switzerland', N'EU', N'CHE', N'CH')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (760, N'Syrian Arab Republic', N'AS', N'SYR', N'SY')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (158, N'Taiwan, Province of China', N'AS', N'TWN', N'TW')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (762, N'Tajikistan', N'AS', N'TJK', N'TJ')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (834, N'Tanzania, United Republic of', N'AF', N'TZA', N'TZ')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (764, N'Thailand', N'AS', N'THA', N'TH')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (626, N'Timor-Leste', N'AS', N'TLS', N'TL')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (768, N'Togo', N'AF', N'TGO', N'TG')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (772, N'Tokelau', N'OC', N'TKL', N'TK')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (776, N'Tonga', N'OC', N'TON', N'TO')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (780, N'Trinidad and Tobago', N'NA', N'TTO', N'TT')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (788, N'Tunisia', N'AF', N'TUN', N'TN')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (792, N'Turkey', N'AS', N'TUR', N'TR')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (795, N'Turkmenistan', N'AS', N'TKM', N'TM')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (796, N'Turks and Caicos Islands', N'NA', N'TCA', N'TC')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (798, N'Tuvalu', N'OC', N'TUV', N'TV')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (800, N'Uganda', N'AF', N'UGA', N'UG')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (804, N'Ukraine', N'EU', N'UKR', N'UA')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (784, N'United Arab Emirates', N'AS', N'ARE', N'AE')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (826, N'United Kingdom', N'EU', N'GBR', N'GB')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (840, N'United States', N'NA', N'USA', N'US')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (581, N'United States Minor Outlying Islands', N'OC', N'UMI', N'UM')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (858, N'Uruguay', N'SA', N'URY', N'UY')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (860, N'Uzbekistan', N'AS', N'UZB', N'UZ')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (548, N'Vanuatu', N'OC', N'VUT', N'VU')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (862, N'Venezuela', N'SA', N'VEN', N'VE')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (704, N'Viet Nam', N'AS', N'VNM', N'VN')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (92, N'Virgin Islands, British', N'NA', N'VGB', N'VG')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (850, N'Virgin Islands, U.S.', N'NA', N'VIR', N'VI')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (876, N'Wallis and Futuna', N'OC', N'WLF', N'WF')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (732, N'Western Sahara', N'AF', N'ESH', N'EH')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (887, N'Yemen', N'AS', N'YEM', N'YE')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (894, N'Zambia', N'AF', N'ZMB', N'ZM')
INSERT [dbo].[CodeCountry] ([CCNumeric], [CountryName], [RegionCode], [CCode3], [CCode2]) VALUES (716, N'Zimbabwe', N'AF', N'ZWE', N'ZW')
SET IDENTITY_INSERT [dbo].[CodeOrderStatus] ON 

INSERT [dbo].[CodeOrderStatus] ([StatusCode], [StatusName], [SerialNo]) VALUES (N'09', N'Error', CAST(1 AS Numeric(18, 0)))
INSERT [dbo].[CodeOrderStatus] ([StatusCode], [StatusName], [SerialNo]) VALUES (N'10', N'Order Confirmed', CAST(2 AS Numeric(18, 0)))
INSERT [dbo].[CodeOrderStatus] ([StatusCode], [StatusName], [SerialNo]) VALUES (N'20', N'Processing Order', CAST(3 AS Numeric(18, 0)))
INSERT [dbo].[CodeOrderStatus] ([StatusCode], [StatusName], [SerialNo]) VALUES (N'30', N'Packaging Order', CAST(4 AS Numeric(18, 0)))
INSERT [dbo].[CodeOrderStatus] ([StatusCode], [StatusName], [SerialNo]) VALUES (N'40', N'Shipped', CAST(5 AS Numeric(18, 0)))
INSERT [dbo].[CodeOrderStatus] ([StatusCode], [StatusName], [SerialNo]) VALUES (N'50', N'Returned', CAST(6 AS Numeric(18, 0)))
INSERT [dbo].[CodeOrderStatus] ([StatusCode], [StatusName], [SerialNo]) VALUES (N'60', N'Refunded', CAST(7 AS Numeric(18, 0)))
INSERT [dbo].[CodeOrderStatus] ([StatusCode], [StatusName], [SerialNo]) VALUES (N'70', N'NA(70)', CAST(8 AS Numeric(18, 0)))
INSERT [dbo].[CodeOrderStatus] ([StatusCode], [StatusName], [SerialNo]) VALUES (N'80', N'NA(80)', CAST(9 AS Numeric(18, 0)))
INSERT [dbo].[CodeOrderStatus] ([StatusCode], [StatusName], [SerialNo]) VALUES (N'90', N'Cancelled', CAST(10 AS Numeric(18, 0)))
SET IDENTITY_INSERT [dbo].[CodeOrderStatus] OFF
INSERT [dbo].[CodeRegion] ([RegionCode], [RegionName]) VALUES (N'NA', N'North America')
INSERT [dbo].[CodeRegion] ([RegionCode], [RegionName]) VALUES (N'SA', N'South America')
INSERT [dbo].[CodeRegion] ([RegionCode], [RegionName]) VALUES (N'EU', N'Europe')
INSERT [dbo].[CodeRegion] ([RegionCode], [RegionName]) VALUES (N'AS', N'Asia')
INSERT [dbo].[CodeRegion] ([RegionCode], [RegionName]) VALUES (N'AF', N'Africa')
INSERT [dbo].[CodeRegion] ([RegionCode], [RegionName]) VALUES (N'OC', N'Oceania')
INSERT [dbo].[CodeRegion] ([RegionCode], [RegionName]) VALUES (N'AN', N'Antarctica')
INSERT [dbo].[CodeStates] ([Abbr], [StatesName], [StatesNo]) VALUES (N'AL', N'Alabama', 1)
INSERT [dbo].[CodeStates] ([Abbr], [StatesName], [StatesNo]) VALUES (N'AK', N'Alaska', 2)
INSERT [dbo].[CodeStates] ([Abbr], [StatesName], [StatesNo]) VALUES (N'AZ', N'Arizona', 3)
INSERT [dbo].[CodeStates] ([Abbr], [StatesName], [StatesNo]) VALUES (N'AR', N'Arkansas', 4)
INSERT [dbo].[CodeStates] ([Abbr], [StatesName], [StatesNo]) VALUES (N'CA', N'California', 5)
INSERT [dbo].[CodeStates] ([Abbr], [StatesName], [StatesNo]) VALUES (N'CO', N'Colorado', 6)
INSERT [dbo].[CodeStates] ([Abbr], [StatesName], [StatesNo]) VALUES (N'CT', N'Connecticut', 7)
INSERT [dbo].[CodeStates] ([Abbr], [StatesName], [StatesNo]) VALUES (N'DC', N'D. C.', 51)
INSERT [dbo].[CodeStates] ([Abbr], [StatesName], [StatesNo]) VALUES (N'DE', N'Delaware', 8)
INSERT [dbo].[CodeStates] ([Abbr], [StatesName], [StatesNo]) VALUES (N'FL', N'Florida', 9)
INSERT [dbo].[CodeStates] ([Abbr], [StatesName], [StatesNo]) VALUES (N'GA', N'Georgia', 10)
INSERT [dbo].[CodeStates] ([Abbr], [StatesName], [StatesNo]) VALUES (N'HI', N'Hawaii', 11)
INSERT [dbo].[CodeStates] ([Abbr], [StatesName], [StatesNo]) VALUES (N'ID', N'Idaho', 12)
INSERT [dbo].[CodeStates] ([Abbr], [StatesName], [StatesNo]) VALUES (N'IL', N'Illinois', 13)
INSERT [dbo].[CodeStates] ([Abbr], [StatesName], [StatesNo]) VALUES (N'IN', N'Indiana', 14)
INSERT [dbo].[CodeStates] ([Abbr], [StatesName], [StatesNo]) VALUES (N'IA', N'Iowa', 15)
INSERT [dbo].[CodeStates] ([Abbr], [StatesName], [StatesNo]) VALUES (N'KS', N'Kansas', 16)
INSERT [dbo].[CodeStates] ([Abbr], [StatesName], [StatesNo]) VALUES (N'KY', N'Kentucky', 17)
INSERT [dbo].[CodeStates] ([Abbr], [StatesName], [StatesNo]) VALUES (N'LA', N'Louisiana', 18)
INSERT [dbo].[CodeStates] ([Abbr], [StatesName], [StatesNo]) VALUES (N'ME', N'Maine', 19)
INSERT [dbo].[CodeStates] ([Abbr], [StatesName], [StatesNo]) VALUES (N'MD', N'Maryland', 20)
INSERT [dbo].[CodeStates] ([Abbr], [StatesName], [StatesNo]) VALUES (N'MA', N'Massachusetts', 21)
INSERT [dbo].[CodeStates] ([Abbr], [StatesName], [StatesNo]) VALUES (N'MI', N'Michigan', 22)
INSERT [dbo].[CodeStates] ([Abbr], [StatesName], [StatesNo]) VALUES (N'MN', N'Minnesota', 23)
INSERT [dbo].[CodeStates] ([Abbr], [StatesName], [StatesNo]) VALUES (N'MS', N'Mississippi', 24)
INSERT [dbo].[CodeStates] ([Abbr], [StatesName], [StatesNo]) VALUES (N'MO', N'Missouri', 25)
INSERT [dbo].[CodeStates] ([Abbr], [StatesName], [StatesNo]) VALUES (N'MT', N'Montana', 26)
INSERT [dbo].[CodeStates] ([Abbr], [StatesName], [StatesNo]) VALUES (N'NE', N'Nebraska', 27)
INSERT [dbo].[CodeStates] ([Abbr], [StatesName], [StatesNo]) VALUES (N'NV', N'Nevada', 28)
INSERT [dbo].[CodeStates] ([Abbr], [StatesName], [StatesNo]) VALUES (N'NH', N'New Hampshire', 29)
INSERT [dbo].[CodeStates] ([Abbr], [StatesName], [StatesNo]) VALUES (N'NJ', N'New Jersey', 30)
INSERT [dbo].[CodeStates] ([Abbr], [StatesName], [StatesNo]) VALUES (N'NM', N'New Mexico', 31)
INSERT [dbo].[CodeStates] ([Abbr], [StatesName], [StatesNo]) VALUES (N'NY', N'New York', 32)
INSERT [dbo].[CodeStates] ([Abbr], [StatesName], [StatesNo]) VALUES (N'NC', N'North Carolina', 33)
INSERT [dbo].[CodeStates] ([Abbr], [StatesName], [StatesNo]) VALUES (N'ND', N'North Dakota', 34)
INSERT [dbo].[CodeStates] ([Abbr], [StatesName], [StatesNo]) VALUES (N'OH', N'Ohio', 35)
INSERT [dbo].[CodeStates] ([Abbr], [StatesName], [StatesNo]) VALUES (N'OK', N'Oklahoma', 36)
INSERT [dbo].[CodeStates] ([Abbr], [StatesName], [StatesNo]) VALUES (N'OR', N'Oregon', 37)
INSERT [dbo].[CodeStates] ([Abbr], [StatesName], [StatesNo]) VALUES (N'PA', N'Pennsylvania', 38)
INSERT [dbo].[CodeStates] ([Abbr], [StatesName], [StatesNo]) VALUES (N'RI', N'Rhode Island', 39)
INSERT [dbo].[CodeStates] ([Abbr], [StatesName], [StatesNo]) VALUES (N'SC', N'South Carolina', 40)
INSERT [dbo].[CodeStates] ([Abbr], [StatesName], [StatesNo]) VALUES (N'SD', N'South Dakota', 41)
INSERT [dbo].[CodeStates] ([Abbr], [StatesName], [StatesNo]) VALUES (N'TN', N'Tennessee', 42)
INSERT [dbo].[CodeStates] ([Abbr], [StatesName], [StatesNo]) VALUES (N'TX', N'Texas', 43)
INSERT [dbo].[CodeStates] ([Abbr], [StatesName], [StatesNo]) VALUES (N'UT', N'Utah', 44)
INSERT [dbo].[CodeStates] ([Abbr], [StatesName], [StatesNo]) VALUES (N'VT', N'Vermont', 45)
INSERT [dbo].[CodeStates] ([Abbr], [StatesName], [StatesNo]) VALUES (N'VA', N'Virginia', 46)
INSERT [dbo].[CodeStates] ([Abbr], [StatesName], [StatesNo]) VALUES (N'WA', N'Washington', 47)
INSERT [dbo].[CodeStates] ([Abbr], [StatesName], [StatesNo]) VALUES (N'WV', N'West Virginia', 48)
INSERT [dbo].[CodeStates] ([Abbr], [StatesName], [StatesNo]) VALUES (N'WI', N'Wisconsin', 49)
INSERT [dbo].[CodeStates] ([Abbr], [StatesName], [StatesNo]) VALUES (N'WY', N'Wyoming', 50)
INSERT [dbo].[CodeStates] ([Abbr], [StatesName], [StatesNo]) VALUES (N'AS', N'American Samoa', 54)
INSERT [dbo].[CodeStates] ([Abbr], [StatesName], [StatesNo]) VALUES (N'CZ', N'Canal Zone', NULL)
INSERT [dbo].[CodeStates] ([Abbr], [StatesName], [StatesNo]) VALUES (N'GU', N'Guam', NULL)
INSERT [dbo].[CodeStates] ([Abbr], [StatesName], [StatesNo]) VALUES (N'MY', N'Military', 53)
INSERT [dbo].[CodeStates] ([Abbr], [StatesName], [StatesNo]) VALUES (N'PR', N'Puerto Rico', 52)
INSERT [dbo].[CodeStates] ([Abbr], [StatesName], [StatesNo]) VALUES (N'VI', N'U.S. Virgin Islands', 55)
INSERT [dbo].[CodeStates] ([Abbr], [StatesName], [StatesNo]) VALUES (N'AB', N'Alberta', 56)
INSERT [dbo].[CodeStates] ([Abbr], [StatesName], [StatesNo]) VALUES (N'BC', N'British Columbia', 57)
INSERT [dbo].[CodeStates] ([Abbr], [StatesName], [StatesNo]) VALUES (N'MB', N'Manitoba', 58)
INSERT [dbo].[CodeStates] ([Abbr], [StatesName], [StatesNo]) VALUES (N'NB', N'New Brunswick', 59)
INSERT [dbo].[CodeStates] ([Abbr], [StatesName], [StatesNo]) VALUES (N'NF', N'Newfoundland', 60)
INSERT [dbo].[CodeStates] ([Abbr], [StatesName], [StatesNo]) VALUES (N'NT', N'NW Territory', 66)
INSERT [dbo].[CodeStates] ([Abbr], [StatesName], [StatesNo]) VALUES (N'NS', N'Nova Scotia', 61)
INSERT [dbo].[CodeStates] ([Abbr], [StatesName], [StatesNo]) VALUES (N'ON', N'Ontario', 62)
INSERT [dbo].[CodeStates] ([Abbr], [StatesName], [StatesNo]) VALUES (N'PE', N'Price Edward Is.', 63)
INSERT [dbo].[CodeStates] ([Abbr], [StatesName], [StatesNo]) VALUES (N'PQ', N'Quebec', 64)
INSERT [dbo].[CodeStates] ([Abbr], [StatesName], [StatesNo]) VALUES (N'SK', N'Saskatchewan', 65)
INSERT [dbo].[CodeStates] ([Abbr], [StatesName], [StatesNo]) VALUES (N'YT', N'Yukon Territory', 67)
INSERT [dbo].[CodeStates] ([Abbr], [StatesName], [StatesNo]) VALUES (N'RA', N'Resident Alien', 77)
INSERT [dbo].[CodeStates] ([Abbr], [StatesName], [StatesNo]) VALUES (N'AE', N'Armed Forces Africa', NULL)
INSERT [dbo].[CodeStates] ([Abbr], [StatesName], [StatesNo]) VALUES (N'AE', N'Armed Forces Canada', NULL)
INSERT [dbo].[CodeStates] ([Abbr], [StatesName], [StatesNo]) VALUES (N'AE', N'Armed Forces Europe', NULL)
INSERT [dbo].[CodeStates] ([Abbr], [StatesName], [StatesNo]) VALUES (N'AE', N'Armed Forces Middle East', NULL)
INSERT [dbo].[CodeStates] ([Abbr], [StatesName], [StatesNo]) VALUES (N'AA', N'Armed Forces Americas', NULL)
INSERT [dbo].[CodeStates] ([Abbr], [StatesName], [StatesNo]) VALUES (N'AP', N'Armed Forces Pacific', NULL)
SET IDENTITY_INSERT [dbo].[Coupon] ON 

INSERT [dbo].[Coupon] ([SerialNo], [CouponCode], [Salesman], [StartDate], [EndDate], [DCRate], [Products]) VALUES (CAST(1 AS Numeric(18, 0)), N'ABC', N'SI Cho', CAST(N'2007-12-01T12:00:00.000' AS DateTime), CAST(N'2008-01-30T23:59:59.000' AS DateTime), 15, N' ')
INSERT [dbo].[Coupon] ([SerialNo], [CouponCode], [Salesman], [StartDate], [EndDate], [DCRate], [Products]) VALUES (CAST(2 AS Numeric(18, 0)), N'ABB', N'Wally Lee', CAST(N'2008-01-05T00:00:00.000' AS DateTime), CAST(N'2008-01-30T23:59:59.000' AS DateTime), 20, N' ')
INSERT [dbo].[Coupon] ([SerialNo], [CouponCode], [Salesman], [StartDate], [EndDate], [DCRate], [Products]) VALUES (CAST(3 AS Numeric(18, 0)), N'ABA', N'Derek Yim', CAST(N'2007-12-01T01:00:00.000' AS DateTime), CAST(N'2007-12-25T23:59:59.000' AS DateTime), 20, N' ')
SET IDENTITY_INSERT [dbo].[Coupon] OFF
SET IDENTITY_INSERT [dbo].[Log_ClientMaster] ON 

INSERT [dbo].[Log_ClientMaster] ([LogSerial], [SerialNo], [ClientNameF], [ClientNameM], [ClientNameL], [Email], [Phone], [Street1], [Street2], [City], [State], [Zip], [Country], [MailOPT], [Password], [Class], [RegDate], [WholesaleLevel], [ModifyDate], [Modifier]) VALUES (CAST(1 AS Numeric(18, 0)), CAST(10 AS Numeric(18, 0)), N'Sung il', N'', N'Cho', N'si', N'626-848-8771', N'2401 s. Hacienda Bl.', N'Apt #38', N'hacienda heights', N'CA', N'91745', N'USA', N'YES', N'a', N'ADMIN', CAST(N'2007-11-01T00:00:00.000' AS DateTime), N'NA', CAST(N'2008-01-28T15:32:06.960' AS DateTime), NULL)
INSERT [dbo].[Log_ClientMaster] ([LogSerial], [SerialNo], [ClientNameF], [ClientNameM], [ClientNameL], [Email], [Phone], [Street1], [Street2], [City], [State], [Zip], [Country], [MailOPT], [Password], [Class], [RegDate], [WholesaleLevel], [ModifyDate], [Modifier]) VALUES (CAST(2 AS Numeric(18, 0)), CAST(18 AS Numeric(18, 0)), N'Sung IL', N'', N'Cho', N'si', N'626-848-8771', N'2401 s. Hacienda Bl.', N'', N'hacienda heights', N'CA', N'91745', N'USA', N'YES', N'a', N'ADMIN', CAST(N'2008-01-05T23:55:58.000' AS DateTime), N'NA', CAST(N'2008-01-28T15:33:35.173' AS DateTime), NULL)
INSERT [dbo].[Log_ClientMaster] ([LogSerial], [SerialNo], [ClientNameF], [ClientNameM], [ClientNameL], [Email], [Phone], [Street1], [Street2], [City], [State], [Zip], [Country], [MailOPT], [Password], [Class], [RegDate], [WholesaleLevel], [ModifyDate], [Modifier]) VALUES (CAST(3 AS Numeric(18, 0)), CAST(10 AS Numeric(18, 0)), N'Sung il', N'', N'Cho', N'si', N'626-848-8771', N'2401 s. Hacienda Bl.', N'Apt #38', N'hacienda heights', N'CA', N'91745', N'USA', N'YES', N'a', N'USER', CAST(N'2008-01-28T15:32:06.973' AS DateTime), N'NA', CAST(N'2008-01-28T15:34:17.027' AS DateTime), NULL)
INSERT [dbo].[Log_ClientMaster] ([LogSerial], [SerialNo], [ClientNameF], [ClientNameM], [ClientNameL], [Email], [Phone], [Street1], [Street2], [City], [State], [Zip], [Country], [MailOPT], [Password], [Class], [RegDate], [WholesaleLevel], [ModifyDate], [Modifier]) VALUES (CAST(4 AS Numeric(18, 0)), CAST(18 AS Numeric(18, 0)), N'Sung IL', N'', N'Cho', N'si@Hot.com', N'626-848-8771', N'2401 s. Hacienda Bl.', N'', N'hacienda heights', N'CA', N'91745', N'USA', N'YES', N'a', N'ADMIN', CAST(N'2008-01-28T15:33:35.177' AS DateTime), N'NA', CAST(N'2008-01-28T15:34:54.200' AS DateTime), NULL)
INSERT [dbo].[Log_ClientMaster] ([LogSerial], [SerialNo], [ClientNameF], [ClientNameM], [ClientNameL], [Email], [Phone], [Street1], [Street2], [City], [State], [Zip], [Country], [MailOPT], [Password], [Class], [RegDate], [WholesaleLevel], [ModifyDate], [Modifier]) VALUES (CAST(5 AS Numeric(18, 0)), CAST(18 AS Numeric(18, 0)), N'Sung IL', N'', N'Cho', N'si@Hot.com', N'626-848-8771', N'2401 s. Hacienda Bl.', N'', N'hacienda heights', N'CA', N'91745', N'USA', N'YES', N'', N'WHOLESALE', CAST(N'2008-01-28T15:34:54.203' AS DateTime), N'E', CAST(N'2008-01-28T15:36:05.887' AS DateTime), NULL)
INSERT [dbo].[Log_ClientMaster] ([LogSerial], [SerialNo], [ClientNameF], [ClientNameM], [ClientNameL], [Email], [Phone], [Street1], [Street2], [City], [State], [Zip], [Country], [MailOPT], [Password], [Class], [RegDate], [WholesaleLevel], [ModifyDate], [Modifier]) VALUES (CAST(6 AS Numeric(18, 0)), CAST(20 AS Numeric(18, 0)), N'', N'', N'', N'si@hot.com', N'', N'', N'', N'', N'AL', N'', N'USA', N'YES', N'123456', N'PREWHOLESALE', CAST(N'2008-01-16T20:38:50.320' AS DateTime), N'E', CAST(N'2008-01-28T16:22:27.327' AS DateTime), N'')
INSERT [dbo].[Log_ClientMaster] ([LogSerial], [SerialNo], [ClientNameF], [ClientNameM], [ClientNameL], [Email], [Phone], [Street1], [Street2], [City], [State], [Zip], [Country], [MailOPT], [Password], [Class], [RegDate], [WholesaleLevel], [ModifyDate], [Modifier]) VALUES (CAST(7 AS Numeric(18, 0)), CAST(20 AS Numeric(18, 0)), N'', N'', N'', N'Retired_si@hot.com', N'', N'', N'', N'', N'AL', N'', N'USA', N'YES', N'Retired_', N'PREWHOLESALE', CAST(N'2008-01-28T16:22:27.333' AS DateTime), N'E', CAST(N'2008-01-28T16:25:16.457' AS DateTime), N'')
SET IDENTITY_INSERT [dbo].[Log_ClientMaster] OFF
SET IDENTITY_INSERT [dbo].[OrderDetail] ON 

INSERT [dbo].[OrderDetail] ([SerialNo], [OrderNo], [ProductNo], [ColorName], [SizeName], [Qty], [UnitPrice], [Amount], [Remarks]) VALUES (CAST(1 AS Numeric(18, 0)), N'AL10002', N'MLFH101', N'White', N'Small', CAST(1 AS Numeric(18, 0)), 182.5, 182.5, N'')
INSERT [dbo].[OrderDetail] ([SerialNo], [OrderNo], [ProductNo], [ColorName], [SizeName], [Qty], [UnitPrice], [Amount], [Remarks]) VALUES (CAST(2 AS Numeric(18, 0)), N'AL10002', N'Style026', N'black', N'Small', CAST(2 AS Numeric(18, 0)), 55, 110, N'')
INSERT [dbo].[OrderDetail] ([SerialNo], [OrderNo], [ProductNo], [ColorName], [SizeName], [Qty], [UnitPrice], [Amount], [Remarks]) VALUES (CAST(3 AS Numeric(18, 0)), N'AL10003', N'MLFT101', N'Black', N'Small', CAST(1 AS Numeric(18, 0)), 62, 62, N'')
INSERT [dbo].[OrderDetail] ([SerialNo], [OrderNo], [ProductNo], [ColorName], [SizeName], [Qty], [UnitPrice], [Amount], [Remarks]) VALUES (CAST(4 AS Numeric(18, 0)), N'AL10004', N'MLFL101blk', N'Black', N'Small', CAST(2 AS Numeric(18, 0)), 150, 300, N'')
INSERT [dbo].[OrderDetail] ([SerialNo], [OrderNo], [ProductNo], [ColorName], [SizeName], [Qty], [UnitPrice], [Amount], [Remarks]) VALUES (CAST(5 AS Numeric(18, 0)), N'AL10005', N'Style001', N'Black', N'Extra Small', CAST(1 AS Numeric(18, 0)), 55, 55, N'')
INSERT [dbo].[OrderDetail] ([SerialNo], [OrderNo], [ProductNo], [ColorName], [SizeName], [Qty], [UnitPrice], [Amount], [Remarks]) VALUES (CAST(7 AS Numeric(18, 0)), N'AL10007', N'MLFT102', N'Black', N'Small', CAST(1 AS Numeric(18, 0)), 62, 62, N'')
INSERT [dbo].[OrderDetail] ([SerialNo], [OrderNo], [ProductNo], [ColorName], [SizeName], [Qty], [UnitPrice], [Amount], [Remarks]) VALUES (CAST(8 AS Numeric(18, 0)), N'AL10007', N'MLMH103BLK', N'Brown', N'Medium', CAST(1 AS Numeric(18, 0)), 125, 125, N'')
INSERT [dbo].[OrderDetail] ([SerialNo], [OrderNo], [ProductNo], [ColorName], [SizeName], [Qty], [UnitPrice], [Amount], [Remarks]) VALUES (CAST(9 AS Numeric(18, 0)), N'AL10008', N'MLFT102', N'Grey', N'Large', CAST(1 AS Numeric(18, 0)), 62, 62, N'')
INSERT [dbo].[OrderDetail] ([SerialNo], [OrderNo], [ProductNo], [ColorName], [SizeName], [Qty], [UnitPrice], [Amount], [Remarks]) VALUES (CAST(10 AS Numeric(18, 0)), N'AL10008', N'MLMH103BLK', N'Brown', N'Medium', CAST(1 AS Numeric(18, 0)), 125, 125, N'')
INSERT [dbo].[OrderDetail] ([SerialNo], [OrderNo], [ProductNo], [ColorName], [SizeName], [Qty], [UnitPrice], [Amount], [Remarks]) VALUES (CAST(11 AS Numeric(18, 0)), N'AL10009', N'MLFT102', N'Grey', N'Small', CAST(1 AS Numeric(18, 0)), 62, 62, N'')
INSERT [dbo].[OrderDetail] ([SerialNo], [OrderNo], [ProductNo], [ColorName], [SizeName], [Qty], [UnitPrice], [Amount], [Remarks]) VALUES (CAST(12 AS Numeric(18, 0)), N'AL10010', N'MLFT102', N'Grey', N'Small', CAST(1 AS Numeric(18, 0)), 62, 62, N'')
INSERT [dbo].[OrderDetail] ([SerialNo], [OrderNo], [ProductNo], [ColorName], [SizeName], [Qty], [UnitPrice], [Amount], [Remarks]) VALUES (CAST(13 AS Numeric(18, 0)), N'AL10011', N'MLFT102', N'Grey', N'Small', CAST(1 AS Numeric(18, 0)), 62, 62, N'')
INSERT [dbo].[OrderDetail] ([SerialNo], [OrderNo], [ProductNo], [ColorName], [SizeName], [Qty], [UnitPrice], [Amount], [Remarks]) VALUES (CAST(14 AS Numeric(18, 0)), N'AL10012', N'MLFT102', N'Grey', N'Small', CAST(1 AS Numeric(18, 0)), 62, 62, N'')
INSERT [dbo].[OrderDetail] ([SerialNo], [OrderNo], [ProductNo], [ColorName], [SizeName], [Qty], [UnitPrice], [Amount], [Remarks]) VALUES (CAST(17 AS Numeric(18, 0)), N'AL10014', N'Style026', N'black', N'Small', CAST(1 AS Numeric(18, 0)), 55, 55, N'')
INSERT [dbo].[OrderDetail] ([SerialNo], [OrderNo], [ProductNo], [ColorName], [SizeName], [Qty], [UnitPrice], [Amount], [Remarks]) VALUES (CAST(18 AS Numeric(18, 0)), N'AL10015', N'MLFH101', N'White', N'Medium', CAST(1 AS Numeric(18, 0)), 194, 194, N'')
INSERT [dbo].[OrderDetail] ([SerialNo], [OrderNo], [ProductNo], [ColorName], [SizeName], [Qty], [UnitPrice], [Amount], [Remarks]) VALUES (CAST(19 AS Numeric(18, 0)), N'AL10016', N'MLFH101', N'White', N'Medium', CAST(1 AS Numeric(18, 0)), 194, 194, N'')
INSERT [dbo].[OrderDetail] ([SerialNo], [OrderNo], [ProductNo], [ColorName], [SizeName], [Qty], [UnitPrice], [Amount], [Remarks]) VALUES (CAST(20 AS Numeric(18, 0)), N'AL10017', N'MLFH101', N'White', N'Small', CAST(20 AS Numeric(18, 0)), 194, 3880, N'')
INSERT [dbo].[OrderDetail] ([SerialNo], [OrderNo], [ProductNo], [ColorName], [SizeName], [Qty], [UnitPrice], [Amount], [Remarks]) VALUES (CAST(21 AS Numeric(18, 0)), N'AL10017', N'MLFH103', N'White', N'Small', CAST(20 AS Numeric(18, 0)), 194, 3880, N'')
INSERT [dbo].[OrderDetail] ([SerialNo], [OrderNo], [ProductNo], [ColorName], [SizeName], [Qty], [UnitPrice], [Amount], [Remarks]) VALUES (CAST(22 AS Numeric(18, 0)), N'AL10018', N'MLFH101', N'Black', N'Medium', CAST(50 AS Numeric(18, 0)), 194, 9700, N'')
INSERT [dbo].[OrderDetail] ([SerialNo], [OrderNo], [ProductNo], [ColorName], [SizeName], [Qty], [UnitPrice], [Amount], [Remarks]) VALUES (CAST(23 AS Numeric(18, 0)), N'AL10019', N'MLFT102', N'Black', N'Small', CAST(100 AS Numeric(18, 0)), 62, 6200, N'')
INSERT [dbo].[OrderDetail] ([SerialNo], [OrderNo], [ProductNo], [ColorName], [SizeName], [Qty], [UnitPrice], [Amount], [Remarks]) VALUES (CAST(24 AS Numeric(18, 0)), N'AL10020', N'MLFH101', N'White', N'Small', CAST(25 AS Numeric(18, 0)), 194, 4850, N'')
INSERT [dbo].[OrderDetail] ([SerialNo], [OrderNo], [ProductNo], [ColorName], [SizeName], [Qty], [UnitPrice], [Amount], [Remarks]) VALUES (CAST(25 AS Numeric(18, 0)), N'AL10020', N'MLFT107', N'White', N'Small', CAST(25 AS Numeric(18, 0)), 70, 1750, N'')
INSERT [dbo].[OrderDetail] ([SerialNo], [OrderNo], [ProductNo], [ColorName], [SizeName], [Qty], [UnitPrice], [Amount], [Remarks]) VALUES (CAST(26 AS Numeric(18, 0)), N'AL10021', N'MLFT102', N'Black', N'Small', CAST(20 AS Numeric(18, 0)), 62, 1240, N'')
INSERT [dbo].[OrderDetail] ([SerialNo], [OrderNo], [ProductNo], [ColorName], [SizeName], [Qty], [UnitPrice], [Amount], [Remarks]) VALUES (CAST(27 AS Numeric(18, 0)), N'AL10021', N'MLFT107', N'White', N'Small', CAST(20 AS Numeric(18, 0)), 70, 1400, N'')
INSERT [dbo].[OrderDetail] ([SerialNo], [OrderNo], [ProductNo], [ColorName], [SizeName], [Qty], [UnitPrice], [Amount], [Remarks]) VALUES (CAST(28 AS Numeric(18, 0)), N'AL10021', N'MLFH101', N'White', N'Small', CAST(20 AS Numeric(18, 0)), 194, 3880, N'')
INSERT [dbo].[OrderDetail] ([SerialNo], [OrderNo], [ProductNo], [ColorName], [SizeName], [Qty], [UnitPrice], [Amount], [Remarks]) VALUES (CAST(29 AS Numeric(18, 0)), N'AL10022', N'MLFH101', N'White', N'Small', CAST(1 AS Numeric(18, 0)), 194, 194, N'')
INSERT [dbo].[OrderDetail] ([SerialNo], [OrderNo], [ProductNo], [ColorName], [SizeName], [Qty], [UnitPrice], [Amount], [Remarks]) VALUES (CAST(30 AS Numeric(18, 0)), N'AL10023', N'MLFH102', N'Black', N'Medium', CAST(1 AS Numeric(18, 0)), 194, 194, N'')
INSERT [dbo].[OrderDetail] ([SerialNo], [OrderNo], [ProductNo], [ColorName], [SizeName], [Qty], [UnitPrice], [Amount], [Remarks]) VALUES (CAST(32 AS Numeric(18, 0)), N'AL10025', N'MLFT102', N'Grey', N'Small', CAST(1 AS Numeric(18, 0)), 62, 62, N'')
INSERT [dbo].[OrderDetail] ([SerialNo], [OrderNo], [ProductNo], [ColorName], [SizeName], [Qty], [UnitPrice], [Amount], [Remarks]) VALUES (CAST(34 AS Numeric(18, 0)), N'AL10027', N'MLFH101', N'White', N'Small', CAST(100 AS Numeric(18, 0)), 194, 19400, N'')
INSERT [dbo].[OrderDetail] ([SerialNo], [OrderNo], [ProductNo], [ColorName], [SizeName], [Qty], [UnitPrice], [Amount], [Remarks]) VALUES (CAST(35 AS Numeric(18, 0)), N'AL10027', N'MLFT102', N'Grey', N'Small', CAST(100 AS Numeric(18, 0)), 62, 6200, N'')
INSERT [dbo].[OrderDetail] ([SerialNo], [OrderNo], [ProductNo], [ColorName], [SizeName], [Qty], [UnitPrice], [Amount], [Remarks]) VALUES (CAST(36 AS Numeric(18, 0)), N'AL10027', N'MLFT103', N'White', N'Small', CAST(100 AS Numeric(18, 0)), 62, 6200, N'')
INSERT [dbo].[OrderDetail] ([SerialNo], [OrderNo], [ProductNo], [ColorName], [SizeName], [Qty], [UnitPrice], [Amount], [Remarks]) VALUES (CAST(37 AS Numeric(18, 0)), N'AL10027', N'MLFT107', N'White', N'Medium', CAST(100 AS Numeric(18, 0)), 70, 7000, N'')
INSERT [dbo].[OrderDetail] ([SerialNo], [OrderNo], [ProductNo], [ColorName], [SizeName], [Qty], [UnitPrice], [Amount], [Remarks]) VALUES (CAST(38 AS Numeric(18, 0)), N'AL10028', N'MLFT105', N'Black', N'Medium', CAST(1000 AS Numeric(18, 0)), 84, 84000, N'')
INSERT [dbo].[OrderDetail] ([SerialNo], [OrderNo], [ProductNo], [ColorName], [SizeName], [Qty], [UnitPrice], [Amount], [Remarks]) VALUES (CAST(39 AS Numeric(18, 0)), N'BA10029', N'MLFH101', N'White', N'Medium', CAST(1 AS Numeric(18, 0)), 194, 194, N'')
INSERT [dbo].[OrderDetail] ([SerialNo], [OrderNo], [ProductNo], [ColorName], [SizeName], [Qty], [UnitPrice], [Amount], [Remarks]) VALUES (CAST(6 AS Numeric(18, 0)), N'AL10006', N'MLFL101blk', N'Black', N'Small', CAST(1 AS Numeric(18, 0)), 150, 150, N'')
INSERT [dbo].[OrderDetail] ([SerialNo], [OrderNo], [ProductNo], [ColorName], [SizeName], [Qty], [UnitPrice], [Amount], [Remarks]) VALUES (CAST(15 AS Numeric(18, 0)), N'AL10013', N'MLFT102', N'Grey', N'Medium', CAST(1 AS Numeric(18, 0)), 62, 62, N'')
INSERT [dbo].[OrderDetail] ([SerialNo], [OrderNo], [ProductNo], [ColorName], [SizeName], [Qty], [UnitPrice], [Amount], [Remarks]) VALUES (CAST(16 AS Numeric(18, 0)), N'AL10013', N'MLMH102', N'Brown', N'Medium', CAST(1 AS Numeric(18, 0)), 125, 125, N'')
INSERT [dbo].[OrderDetail] ([SerialNo], [OrderNo], [ProductNo], [ColorName], [SizeName], [Qty], [UnitPrice], [Amount], [Remarks]) VALUES (CAST(31 AS Numeric(18, 0)), N'AL10024', N'MLFT102', N'Grey', N'Small', CAST(1 AS Numeric(18, 0)), 62, 62, N'')
INSERT [dbo].[OrderDetail] ([SerialNo], [OrderNo], [ProductNo], [ColorName], [SizeName], [Qty], [UnitPrice], [Amount], [Remarks]) VALUES (CAST(33 AS Numeric(18, 0)), N'AL10026', N'MLFT103', N'Grey', N'Small', CAST(1 AS Numeric(18, 0)), 62, 62, N'')
SET IDENTITY_INSERT [dbo].[OrderDetail] OFF
SET IDENTITY_INSERT [dbo].[OrderMaster] ON 

INSERT [dbo].[OrderMaster] ([SerialNo], [OrderNo], [OrderDate], [ClientNo], [Email], [Street1], [Street2], [City], [State], [Zip], [Country], [CouponCode], [CouponDCRate], [OrderAmount], [TaxAmount], [DCAmount], [WrappingCharge], [ShippingAmount], [TotalAmount], [PayMethod], [Paystatus], [ShipMethod], [OrderStatus], [TrackingNo], [CommentFromClient], [CommentToClient], [IsGift], [GiftWrapping], [RecipientName], [RecipientStreet1], [RecipientStreet2], [RecipientCity], [RecipientState], [RecipientZip], [RecipientCountry], [RecipientPhone], [GiftComment], [UserIP]) VALUES (CAST(1 AS Numeric(18, 0)), N'AL10001', CAST(N'2007-12-08T07:20:30.327' AS DateTime), CAST(10 AS Numeric(18, 0)), N'sicho77@gmail.com', N'2401', N'', N'hacienda heights', N'CA', N'91745', N'United States', N'', 0, 292.5, 24.8625, 0, 0, 19, 336.3625, N'VISA', N'PrePayment', N'UPS 2 Days', N'09', N'', N'N/A', N'', N'N/A', N'N/A', N'si cho', N'2401', N'', N'hacienda heights', N'CA', N'91745', N'United States', NULL, N'N/A', N'76.234.63.204')
INSERT [dbo].[OrderMaster] ([SerialNo], [OrderNo], [OrderDate], [ClientNo], [Email], [Street1], [Street2], [City], [State], [Zip], [Country], [CouponCode], [CouponDCRate], [OrderAmount], [TaxAmount], [DCAmount], [WrappingCharge], [ShippingAmount], [TotalAmount], [PayMethod], [Paystatus], [ShipMethod], [OrderStatus], [TrackingNo], [CommentFromClient], [CommentToClient], [IsGift], [GiftWrapping], [RecipientName], [RecipientStreet1], [RecipientStreet2], [RecipientCity], [RecipientState], [RecipientZip], [RecipientCountry], [RecipientPhone], [GiftComment], [UserIP]) VALUES (CAST(2 AS Numeric(18, 0)), N'AL10002', CAST(N'2007-12-08T07:21:27.203' AS DateTime), CAST(10 AS Numeric(18, 0)), N'sicho77@gmail.com', N'2401', N'', N'hacienda heights', N'CA', N'91745', N'United States', N'', 0, 292.5, 24.8625, 0, 0, 19, 336.3625, N'VISA', N'PrePayment', N'UPS 2 Days', N'09', N'', N'N/A', N'', N'N/A', N'N/A', N'si cho', N'2401', N'', N'hacienda heights', N'CA', N'91745', N'United States', NULL, N'N/A', N'76.234.63.204')
INSERT [dbo].[OrderMaster] ([SerialNo], [OrderNo], [OrderDate], [ClientNo], [Email], [Street1], [Street2], [City], [State], [Zip], [Country], [CouponCode], [CouponDCRate], [OrderAmount], [TaxAmount], [DCAmount], [WrappingCharge], [ShippingAmount], [TotalAmount], [PayMethod], [Paystatus], [ShipMethod], [OrderStatus], [TrackingNo], [CommentFromClient], [CommentToClient], [IsGift], [GiftWrapping], [RecipientName], [RecipientStreet1], [RecipientStreet2], [RecipientCity], [RecipientState], [RecipientZip], [RecipientCountry], [RecipientPhone], [GiftComment], [UserIP]) VALUES (CAST(3 AS Numeric(18, 0)), N'AL10003', CAST(N'2007-12-10T10:51:04.767' AS DateTime), CAST(6 AS Numeric(18, 0)), N'evan@goodpersona.com', N'6333 Lexington ave', N'', N'LA', N'CA', N'90038', N'United States', N'', 0, 62, 5.2700000000000005, 0, 0, 0, 67.27, N'VISA', N'PrePayment', N'UPS Ground', N'09', N'', N'N/A', N'', N'N/A', N'N/A', N'evan weitzberg', N'6333 Lexington ave', N'', N'LA', N'CA', N'90038', N'United States', NULL, N'N/A', N'76.168.242.83')
INSERT [dbo].[OrderMaster] ([SerialNo], [OrderNo], [OrderDate], [ClientNo], [Email], [Street1], [Street2], [City], [State], [Zip], [Country], [CouponCode], [CouponDCRate], [OrderAmount], [TaxAmount], [DCAmount], [WrappingCharge], [ShippingAmount], [TotalAmount], [PayMethod], [Paystatus], [ShipMethod], [OrderStatus], [TrackingNo], [CommentFromClient], [CommentToClient], [IsGift], [GiftWrapping], [RecipientName], [RecipientStreet1], [RecipientStreet2], [RecipientCity], [RecipientState], [RecipientZip], [RecipientCountry], [RecipientPhone], [GiftComment], [UserIP]) VALUES (CAST(4 AS Numeric(18, 0)), N'AL10004', CAST(N'2007-12-11T12:20:54.767' AS DateTime), CAST(7 AS Numeric(18, 0)), N'wally@trendyrags.com', N'3243 rgafg', N'', N'LA', N'CA', N'92656', N'United States', N'', 0, 300, 25.500000000000004, 0, 0, 19, 344.5, N'VISA (****-****-****-5436)', N'Normal', N'UPS 2 Days', N'20', N'1234567891', N'N/A', N'', N'N/A', N'N/A', N'wally lee', N'3243 rgafg', N'', N'LA', N'CA', N'92656', N'United States', N'949-293-6881', N'N/A', N'76.234.63.204')
INSERT [dbo].[OrderMaster] ([SerialNo], [OrderNo], [OrderDate], [ClientNo], [Email], [Street1], [Street2], [City], [State], [Zip], [Country], [CouponCode], [CouponDCRate], [OrderAmount], [TaxAmount], [DCAmount], [WrappingCharge], [ShippingAmount], [TotalAmount], [PayMethod], [Paystatus], [ShipMethod], [OrderStatus], [TrackingNo], [CommentFromClient], [CommentToClient], [IsGift], [GiftWrapping], [RecipientName], [RecipientStreet1], [RecipientStreet2], [RecipientCity], [RecipientState], [RecipientZip], [RecipientCountry], [RecipientPhone], [GiftComment], [UserIP]) VALUES (CAST(5 AS Numeric(18, 0)), N'AL10005', CAST(N'2007-12-12T22:26:28.937' AS DateTime), CAST(6 AS Numeric(18, 0)), N'evan@goodpersona.com', N'6333 Lexington ave', N'', N'LA', N'CA', N'90038', N'United States', N'', 0, 55, 4.6750000000000007, 0, 0, 0, 59.675, N'VISA (****-****-****-)', N'Normal', N'UPS Ground', N'20', N'1234567891', N'N/A', N'', N'N/A', N'N/A', N'evan weitzberg', N'6333 Lexington ave', N'', N'LA', N'CA', N'90038', N'United States', N'323-252-5428', N'N/A', N'76.168.242.83')
INSERT [dbo].[OrderMaster] ([SerialNo], [OrderNo], [OrderDate], [ClientNo], [Email], [Street1], [Street2], [City], [State], [Zip], [Country], [CouponCode], [CouponDCRate], [OrderAmount], [TaxAmount], [DCAmount], [WrappingCharge], [ShippingAmount], [TotalAmount], [PayMethod], [Paystatus], [ShipMethod], [OrderStatus], [TrackingNo], [CommentFromClient], [CommentToClient], [IsGift], [GiftWrapping], [RecipientName], [RecipientStreet1], [RecipientStreet2], [RecipientCity], [RecipientState], [RecipientZip], [RecipientCountry], [RecipientPhone], [GiftComment], [UserIP]) VALUES (CAST(6 AS Numeric(18, 0)), N'AL10006', CAST(N'2007-12-14T00:54:34.173' AS DateTime), CAST(7 AS Numeric(18, 0)), N'wally@trendyrags.com', N'3243 rgafg', N'', N'LA', N'CA', N'92656', N'United States', N'', 0, 150, 12.750000000000002, 0, 0, 0, 162.75, N'VISA (****-****-****-5243)', N'Normal', N'UPS Ground', N'20', N'1234567891', N'N/A', N'', N'N/A', N'N/A', N'wally lee', N'3243 rgafg', N'', N'LA', N'CA', N'92656', N'United States', N'949-293-6881', N'N/A', N'76.234.63.204')
INSERT [dbo].[OrderMaster] ([SerialNo], [OrderNo], [OrderDate], [ClientNo], [Email], [Street1], [Street2], [City], [State], [Zip], [Country], [CouponCode], [CouponDCRate], [OrderAmount], [TaxAmount], [DCAmount], [WrappingCharge], [ShippingAmount], [TotalAmount], [PayMethod], [Paystatus], [ShipMethod], [OrderStatus], [TrackingNo], [CommentFromClient], [CommentToClient], [IsGift], [GiftWrapping], [RecipientName], [RecipientStreet1], [RecipientStreet2], [RecipientCity], [RecipientState], [RecipientZip], [RecipientCountry], [RecipientPhone], [GiftComment], [UserIP]) VALUES (CAST(7 AS Numeric(18, 0)), N'AL10007', CAST(N'2007-12-14T02:23:37.517' AS DateTime), CAST(10 AS Numeric(18, 0)), N'sicho77@gmail.com', N'은평구 구산동 224번지', N'경남아파트 107-501', N'서울시', N'AL', N'91745', N'Korea, Republic of', N'', 0, 187, 15.895000000000001, 0, 0, 17, 219.895, N'VISA (****-****-****-9541)', N'PrePayment', N'UPS 2 Days', N'09', N'1234567891', N'N/A', N'', N'N/A', N'N/A', N'SI Cho', N'2401 S. Hacienda Bl. ', N'Apt #38', N'Hacienda Hts.', N'CA', N'91745', N'United States', N'626-848-8771', N'N/A', N'127.0.0.1')
INSERT [dbo].[OrderMaster] ([SerialNo], [OrderNo], [OrderDate], [ClientNo], [Email], [Street1], [Street2], [City], [State], [Zip], [Country], [CouponCode], [CouponDCRate], [OrderAmount], [TaxAmount], [DCAmount], [WrappingCharge], [ShippingAmount], [TotalAmount], [PayMethod], [Paystatus], [ShipMethod], [OrderStatus], [TrackingNo], [CommentFromClient], [CommentToClient], [IsGift], [GiftWrapping], [RecipientName], [RecipientStreet1], [RecipientStreet2], [RecipientCity], [RecipientState], [RecipientZip], [RecipientCountry], [RecipientPhone], [GiftComment], [UserIP]) VALUES (CAST(8 AS Numeric(18, 0)), N'AL10008', CAST(N'2007-12-14T02:26:43.780' AS DateTime), CAST(10 AS Numeric(18, 0)), N'sicho77@gmail.com', N'은평구 구산동 224번지', N'경남아파트 107-501', N'서울시', N'AL', N'91745', N'Korea, Republic of', N'', 0, 187, 15.895000000000001, 0, 0, 25, 227.895, N'VISA (****-****-****-1111)', N'Normal', N'UPS Next Day', N'20', N'1234567891', N'N/A', N'', N'N/A', N'N/A', N'SI Cho', N'2401 S. Hacienda Bl. ', N'Apt #38', N'Hacienda Hts.', N'CA', N'91745', N'United States', N'626-848-8771', N'N/A', N'127.0.0.1')
INSERT [dbo].[OrderMaster] ([SerialNo], [OrderNo], [OrderDate], [ClientNo], [Email], [Street1], [Street2], [City], [State], [Zip], [Country], [CouponCode], [CouponDCRate], [OrderAmount], [TaxAmount], [DCAmount], [WrappingCharge], [ShippingAmount], [TotalAmount], [PayMethod], [Paystatus], [ShipMethod], [OrderStatus], [TrackingNo], [CommentFromClient], [CommentToClient], [IsGift], [GiftWrapping], [RecipientName], [RecipientStreet1], [RecipientStreet2], [RecipientCity], [RecipientState], [RecipientZip], [RecipientCountry], [RecipientPhone], [GiftComment], [UserIP]) VALUES (CAST(9 AS Numeric(18, 0)), N'AL10009', CAST(N'2007-12-14T14:37:44.153' AS DateTime), CAST(10 AS Numeric(18, 0)), N'sicho77@gmail.com', N'은평구 구산동 224번지', N'경남아파트 107-501', N'서울시', N'AL', N'91745', N'Korea, Republic of', N'', 0, 62, 5.2700000000000005, 0, 0, 14, 81.27, N'VISA (****-****-****-9541)', N'PrePayment', N'UPS 2 Days', N'09', N'', N'N/A', N'', N'N/A', N'N/A', N'성일 조', N'은평구 구산동 224번지', N'경남아파트 107-501', N'서울시', N'AL', N'91745', N'Korea, Republic of', N'626-848-8771', N'N/A', N'127.0.0.1')
INSERT [dbo].[OrderMaster] ([SerialNo], [OrderNo], [OrderDate], [ClientNo], [Email], [Street1], [Street2], [City], [State], [Zip], [Country], [CouponCode], [CouponDCRate], [OrderAmount], [TaxAmount], [DCAmount], [WrappingCharge], [ShippingAmount], [TotalAmount], [PayMethod], [Paystatus], [ShipMethod], [OrderStatus], [TrackingNo], [CommentFromClient], [CommentToClient], [IsGift], [GiftWrapping], [RecipientName], [RecipientStreet1], [RecipientStreet2], [RecipientCity], [RecipientState], [RecipientZip], [RecipientCountry], [RecipientPhone], [GiftComment], [UserIP]) VALUES (CAST(10 AS Numeric(18, 0)), N'AL10010', CAST(N'2007-12-14T14:39:22.950' AS DateTime), CAST(10 AS Numeric(18, 0)), N'sicho77@gmail.com', N'은평구 구산동 224번지', N'경남아파트 107-501', N'서울시', N'AL', N'91745', N'Korea, Republic of', N'', 0, 62, 5.2700000000000005, 0, 0, 14, 81.27, N'VISA (****-****-****-9541)', N'PrePayment', N'UPS 2 Days', N'09', N'', N'N/A', N'', N'N/A', N'N/A', N'성일 조', N'은평구 구산동 224번지', N'경남아파트 107-501', N'서울시', N'AL', N'91745', N'Korea, Republic of', N'626-848-8771', N'N/A', N'127.0.0.1')
INSERT [dbo].[OrderMaster] ([SerialNo], [OrderNo], [OrderDate], [ClientNo], [Email], [Street1], [Street2], [City], [State], [Zip], [Country], [CouponCode], [CouponDCRate], [OrderAmount], [TaxAmount], [DCAmount], [WrappingCharge], [ShippingAmount], [TotalAmount], [PayMethod], [Paystatus], [ShipMethod], [OrderStatus], [TrackingNo], [CommentFromClient], [CommentToClient], [IsGift], [GiftWrapping], [RecipientName], [RecipientStreet1], [RecipientStreet2], [RecipientCity], [RecipientState], [RecipientZip], [RecipientCountry], [RecipientPhone], [GiftComment], [UserIP]) VALUES (CAST(13 AS Numeric(18, 0)), N'AL10013', CAST(N'2007-12-14T14:46:43.340' AS DateTime), CAST(10 AS Numeric(18, 0)), N'sicho77@gmail.com', N'2401 s. Hacienda Bl.', N'Apt #38', N'hacienda heights', N'CA', N'91745', N'United States', N'', 0, 187, 15.895000000000001, 0, 0, 0, 202.895, N'VISA (****-****-****-1374)', N'Normal', N'UPS Ground', N'30', N'', N'N/A', N'', N'N/A', N'N/A', N'Sung il Cho', N'2401 s. Hacienda Bl.', N'Apt #38', N'hacienda heights', N'CA', N'91745', N'United States', N'626-848-8771', N'N/A', N'127.0.0.1')
INSERT [dbo].[OrderMaster] ([SerialNo], [OrderNo], [OrderDate], [ClientNo], [Email], [Street1], [Street2], [City], [State], [Zip], [Country], [CouponCode], [CouponDCRate], [OrderAmount], [TaxAmount], [DCAmount], [WrappingCharge], [ShippingAmount], [TotalAmount], [PayMethod], [Paystatus], [ShipMethod], [OrderStatus], [TrackingNo], [CommentFromClient], [CommentToClient], [IsGift], [GiftWrapping], [RecipientName], [RecipientStreet1], [RecipientStreet2], [RecipientCity], [RecipientState], [RecipientZip], [RecipientCountry], [RecipientPhone], [GiftComment], [UserIP]) VALUES (CAST(14 AS Numeric(18, 0)), N'AL10014', CAST(N'2007-12-17T19:52:15.377' AS DateTime), CAST(10 AS Numeric(18, 0)), N'sicho77@gmail.com', N'2401 s. Hacienda Bl.', N'Apt #38', N'hacienda heights', N'CA', N'91745', N'United States', N'', 0, 55, 4.67, 0, 0, 0, 59.67, N'VISA (****-****-****-4444)', N'3 [6]', N'UPS Ground', N'09', N'', N'N/A', N'', N'N/A', N'N/A', N'Sung il Cho', N'2401 s. Hacienda Bl.', N'Apt #38', N'hacienda heights', N'CA', N'91745', N'United States', N'626-848-8771', N'N/A', N'127.0.0.1')
INSERT [dbo].[OrderMaster] ([SerialNo], [OrderNo], [OrderDate], [ClientNo], [Email], [Street1], [Street2], [City], [State], [Zip], [Country], [CouponCode], [CouponDCRate], [OrderAmount], [TaxAmount], [DCAmount], [WrappingCharge], [ShippingAmount], [TotalAmount], [PayMethod], [Paystatus], [ShipMethod], [OrderStatus], [TrackingNo], [CommentFromClient], [CommentToClient], [IsGift], [GiftWrapping], [RecipientName], [RecipientStreet1], [RecipientStreet2], [RecipientCity], [RecipientState], [RecipientZip], [RecipientCountry], [RecipientPhone], [GiftComment], [UserIP]) VALUES (CAST(17 AS Numeric(18, 0)), N'AL10017', CAST(N'2007-12-24T22:07:16.233' AS DateTime), CAST(10 AS Numeric(18, 0)), N'sicho77@gmail.com', N'2401 s. Hacienda Bl.', N'Apt #38', N'hacienda heights', N'CA', N'91745', N'United States', N'', 0, 7760, 659.6, 0, 0, 35, 8454.6, N'VISA (****-****-****-1374)', N'Normal', N'UPS Next Day', N'30', N'', N'N/A', N'', N'N/A', N'N/A', N'Sung il Cho', N'2401 s. Hacienda Bl.', N'Apt #38', N'hacienda heights', N'CA', N'91745', N'United States', N'626-848-8771', N'N/A', N'127.0.0.1')
INSERT [dbo].[OrderMaster] ([SerialNo], [OrderNo], [OrderDate], [ClientNo], [Email], [Street1], [Street2], [City], [State], [Zip], [Country], [CouponCode], [CouponDCRate], [OrderAmount], [TaxAmount], [DCAmount], [WrappingCharge], [ShippingAmount], [TotalAmount], [PayMethod], [Paystatus], [ShipMethod], [OrderStatus], [TrackingNo], [CommentFromClient], [CommentToClient], [IsGift], [GiftWrapping], [RecipientName], [RecipientStreet1], [RecipientStreet2], [RecipientCity], [RecipientState], [RecipientZip], [RecipientCountry], [RecipientPhone], [GiftComment], [UserIP]) VALUES (CAST(20 AS Numeric(18, 0)), N'AL10020', CAST(N'2007-12-24T22:19:17.593' AS DateTime), CAST(10 AS Numeric(18, 0)), N'sicho77@gmail.com', N'2401 s. Hacienda Bl.', N'Apt #38', N'hacienda heights', N'CA', N'91745', N'United States', N'', 0, 6600, 561, 0, 0, 35, 7196, N'VISA (****-****-****-1374)', N'Normal', N'UPS Next Day', N'30', N'', N'N/A', N'', N'N/A', N'N/A', N'Sung il Cho', N'2401 s. Hacienda Bl.', N'Apt #38', N'hacienda heights', N'CA', N'91745', N'United States', N'626-848-8771', N'N/A', N'127.0.0.1')
INSERT [dbo].[OrderMaster] ([SerialNo], [OrderNo], [OrderDate], [ClientNo], [Email], [Street1], [Street2], [City], [State], [Zip], [Country], [CouponCode], [CouponDCRate], [OrderAmount], [TaxAmount], [DCAmount], [WrappingCharge], [ShippingAmount], [TotalAmount], [PayMethod], [Paystatus], [ShipMethod], [OrderStatus], [TrackingNo], [CommentFromClient], [CommentToClient], [IsGift], [GiftWrapping], [RecipientName], [RecipientStreet1], [RecipientStreet2], [RecipientCity], [RecipientState], [RecipientZip], [RecipientCountry], [RecipientPhone], [GiftComment], [UserIP]) VALUES (CAST(11 AS Numeric(18, 0)), N'AL10011', CAST(N'2007-12-14T14:39:45.933' AS DateTime), CAST(10 AS Numeric(18, 0)), N'sicho77@gmail.com', N'은평구 구산동 224번지', N'경남아파트 107-501', N'서울시', N'AL', N'91745', N'Korea, Republic of', N'', 0, 62, 5.2700000000000005, 0, 0, 14, 81.27, N'VISA (****-****-****-9541)', N'PrePayment', N'UPS 2 Days', N'09', N'', N'N/A', N'', N'N/A', N'N/A', N'성일 조', N'은평구 구산동 224번지', N'경남아파트 107-501', N'서울시', N'AL', N'91745', N'Korea, Republic of', N'626-848-8771', N'N/A', N'127.0.0.1')
INSERT [dbo].[OrderMaster] ([SerialNo], [OrderNo], [OrderDate], [ClientNo], [Email], [Street1], [Street2], [City], [State], [Zip], [Country], [CouponCode], [CouponDCRate], [OrderAmount], [TaxAmount], [DCAmount], [WrappingCharge], [ShippingAmount], [TotalAmount], [PayMethod], [Paystatus], [ShipMethod], [OrderStatus], [TrackingNo], [CommentFromClient], [CommentToClient], [IsGift], [GiftWrapping], [RecipientName], [RecipientStreet1], [RecipientStreet2], [RecipientCity], [RecipientState], [RecipientZip], [RecipientCountry], [RecipientPhone], [GiftComment], [UserIP]) VALUES (CAST(15 AS Numeric(18, 0)), N'AL10015', CAST(N'2007-12-17T19:55:00.937' AS DateTime), CAST(10 AS Numeric(18, 0)), N'sicho77@gmail.com', N'2401 s. Hacienda Bl.', N'Apt #38', N'hacienda heights', N'CA', N'91745', N'United States', N'', 0, 194, 16.49, 0, 0, 0, 210.49, N'VISA (****-****-****-4444)', N'3 [6]', N'UPS Ground', N'09', N'', N'N/A', N'', N'N/A', N'N/A', N'Sung il Cho', N'2401 s. Hacienda Bl.', N'Apt #38', N'hacienda heights', N'CA', N'91745', N'United States', N'626-848-8771', N'N/A', N'127.0.0.1')
INSERT [dbo].[OrderMaster] ([SerialNo], [OrderNo], [OrderDate], [ClientNo], [Email], [Street1], [Street2], [City], [State], [Zip], [Country], [CouponCode], [CouponDCRate], [OrderAmount], [TaxAmount], [DCAmount], [WrappingCharge], [ShippingAmount], [TotalAmount], [PayMethod], [Paystatus], [ShipMethod], [OrderStatus], [TrackingNo], [CommentFromClient], [CommentToClient], [IsGift], [GiftWrapping], [RecipientName], [RecipientStreet1], [RecipientStreet2], [RecipientCity], [RecipientState], [RecipientZip], [RecipientCountry], [RecipientPhone], [GiftComment], [UserIP]) VALUES (CAST(18 AS Numeric(18, 0)), N'AL10018', CAST(N'2007-12-24T22:10:12.750' AS DateTime), CAST(10 AS Numeric(18, 0)), N'sicho77@gmail.com', N'2401 s. Hacienda Bl.', N'Apt #38', N'hacienda heights', N'CA', N'91745', N'United States', N'', 0, 9700, 824.5, 0, 0, 0, 10524.5, N'VISA (****-****-****-1374)', N'Normal', N'UPS Ground', N'20', N'', N'N/A', N'', N'N/A', N'N/A', N'Sung il Cho', N'2401 s. Hacienda Bl.', N'Apt #38', N'hacienda heights', N'CA', N'91745', N'United States', N'626-848-8771', N'N/A', N'127.0.0.1')
INSERT [dbo].[OrderMaster] ([SerialNo], [OrderNo], [OrderDate], [ClientNo], [Email], [Street1], [Street2], [City], [State], [Zip], [Country], [CouponCode], [CouponDCRate], [OrderAmount], [TaxAmount], [DCAmount], [WrappingCharge], [ShippingAmount], [TotalAmount], [PayMethod], [Paystatus], [ShipMethod], [OrderStatus], [TrackingNo], [CommentFromClient], [CommentToClient], [IsGift], [GiftWrapping], [RecipientName], [RecipientStreet1], [RecipientStreet2], [RecipientCity], [RecipientState], [RecipientZip], [RecipientCountry], [RecipientPhone], [GiftComment], [UserIP]) VALUES (CAST(12 AS Numeric(18, 0)), N'AL10012', CAST(N'2007-12-14T14:43:09.607' AS DateTime), CAST(10 AS Numeric(18, 0)), N'sicho77@gmail.com', N'2401 s. hacienda bl.', N'Apt #38', N'Hacienda Hts.', N'CA', N'91745', N'United States', N'', 0, 62, 5.2700000000000005, 0, 0, 14, 81.27, N'VISA (****-****-****-9541)', N'Normal', N'UPS 2 Days', N'20', N'', N'N/A', N'', N'N/A', N'N/A', N'Sung Il Cho', N'2401 s. hacienda bl.', N'Apt #38', N'Hacienda Hts.', N'CA', N'91745', N'United States', N'626-848-8771', N'N/A', N'127.0.0.1')
INSERT [dbo].[OrderMaster] ([SerialNo], [OrderNo], [OrderDate], [ClientNo], [Email], [Street1], [Street2], [City], [State], [Zip], [Country], [CouponCode], [CouponDCRate], [OrderAmount], [TaxAmount], [DCAmount], [WrappingCharge], [ShippingAmount], [TotalAmount], [PayMethod], [Paystatus], [ShipMethod], [OrderStatus], [TrackingNo], [CommentFromClient], [CommentToClient], [IsGift], [GiftWrapping], [RecipientName], [RecipientStreet1], [RecipientStreet2], [RecipientCity], [RecipientState], [RecipientZip], [RecipientCountry], [RecipientPhone], [GiftComment], [UserIP]) VALUES (CAST(19 AS Numeric(18, 0)), N'AL10019', CAST(N'2007-12-24T22:11:59.267' AS DateTime), CAST(10 AS Numeric(18, 0)), N'sicho77@gmail.com', N'2401 s. Hacienda Bl.', N'Apt #38', N'hacienda heights', N'CA', N'91745', N'United States', N'', 0, 6200, 527, 0, 0, 0, 6727, N'VISA (****-****-****-1111)', N'Normal', N'UPS Ground', N'20', N'', N'N/A', N'Thank you JJin!', N'N/A', N'N/A', N'Sung il Cho', N'2401 s. Hacienda Bl.', N'Apt #38', N'hacienda heights', N'CA', N'91745', N'United States', N'626-848-8771', N'N/A', N'127.0.0.1')
INSERT [dbo].[OrderMaster] ([SerialNo], [OrderNo], [OrderDate], [ClientNo], [Email], [Street1], [Street2], [City], [State], [Zip], [Country], [CouponCode], [CouponDCRate], [OrderAmount], [TaxAmount], [DCAmount], [WrappingCharge], [ShippingAmount], [TotalAmount], [PayMethod], [Paystatus], [ShipMethod], [OrderStatus], [TrackingNo], [CommentFromClient], [CommentToClient], [IsGift], [GiftWrapping], [RecipientName], [RecipientStreet1], [RecipientStreet2], [RecipientCity], [RecipientState], [RecipientZip], [RecipientCountry], [RecipientPhone], [GiftComment], [UserIP]) VALUES (CAST(16 AS Numeric(18, 0)), N'AL10016', CAST(N'2007-12-17T19:57:12.517' AS DateTime), CAST(10 AS Numeric(18, 0)), N'sicho77@gmail.com', N'2401 s. Hacienda Bl.', N'Apt #38', N'hacienda heights', N'CA', N'91745', N'United States', N'', 0, 194, 16.49, 0, 0, 0, 210.49, N'VISA (****-****-****-4444)', N'3 [6]', N'UPS Ground', N'09', N'', N'N/A', N'', N'N/A', N'N/A', N'Sung il Cho', N'2401 s. Hacienda Bl.', N'Apt #38', N'hacienda heights', N'CA', N'91745', N'United States', N'626-848-8771', N'N/A', N'127.0.0.1')
INSERT [dbo].[OrderMaster] ([SerialNo], [OrderNo], [OrderDate], [ClientNo], [Email], [Street1], [Street2], [City], [State], [Zip], [Country], [CouponCode], [CouponDCRate], [OrderAmount], [TaxAmount], [DCAmount], [WrappingCharge], [ShippingAmount], [TotalAmount], [PayMethod], [Paystatus], [ShipMethod], [OrderStatus], [TrackingNo], [CommentFromClient], [CommentToClient], [IsGift], [GiftWrapping], [RecipientName], [RecipientStreet1], [RecipientStreet2], [RecipientCity], [RecipientState], [RecipientZip], [RecipientCountry], [RecipientPhone], [GiftComment], [UserIP]) VALUES (CAST(21 AS Numeric(18, 0)), N'AL10021', CAST(N'2007-12-24T22:25:19.360' AS DateTime), CAST(10 AS Numeric(18, 0)), N'sicho77@gmail.com', N'2401 s. Hacienda Bl.', N'Apt #38', N'hacienda heights', N'CA', N'91745', N'United States', N'', 0, 6520, 554.2, 0, 0, 0, 7074.2, N'VISA (****-****-****-9541)', N'Normal', N'UPS Ground', N'20', N'', N'N/A', N'', N'N/A', N'N/A', N'Sung il Cho', N'2401 s. Hacienda Bl.', N'Apt #38', N'hacienda heights', N'CA', N'91745', N'United States', N'626-848-8771', N'N/A', N'127.0.0.1')
INSERT [dbo].[OrderMaster] ([SerialNo], [OrderNo], [OrderDate], [ClientNo], [Email], [Street1], [Street2], [City], [State], [Zip], [Country], [CouponCode], [CouponDCRate], [OrderAmount], [TaxAmount], [DCAmount], [WrappingCharge], [ShippingAmount], [TotalAmount], [PayMethod], [Paystatus], [ShipMethod], [OrderStatus], [TrackingNo], [CommentFromClient], [CommentToClient], [IsGift], [GiftWrapping], [RecipientName], [RecipientStreet1], [RecipientStreet2], [RecipientCity], [RecipientState], [RecipientZip], [RecipientCountry], [RecipientPhone], [GiftComment], [UserIP]) VALUES (CAST(22 AS Numeric(18, 0)), N'AL10022', CAST(N'2007-12-27T18:36:06.423' AS DateTime), CAST(10 AS Numeric(18, 0)), N'sicho77@gmail.com', N'2401 s. Hacienda Bl.', N'Apt #38', N'hacienda heights', N'CA', N'91745', N'United States', N'abc', 15, 194, 14.01, 29.099999999999998, 0, 0, 178.91, N'VISA (****-****-****-1111)', N'Normal', N'UPS Ground', N'20', N'', N'N/A', N'', N'N/A', N'N/A', N'Sung il Cho', N'2401 s. Hacienda Bl.', N'Apt #38', N'hacienda heights', N'CA', N'91745', N'United States', N'626-848-8771', N'N/A', N'127.0.0.1')
INSERT [dbo].[OrderMaster] ([SerialNo], [OrderNo], [OrderDate], [ClientNo], [Email], [Street1], [Street2], [City], [State], [Zip], [Country], [CouponCode], [CouponDCRate], [OrderAmount], [TaxAmount], [DCAmount], [WrappingCharge], [ShippingAmount], [TotalAmount], [PayMethod], [Paystatus], [ShipMethod], [OrderStatus], [TrackingNo], [CommentFromClient], [CommentToClient], [IsGift], [GiftWrapping], [RecipientName], [RecipientStreet1], [RecipientStreet2], [RecipientCity], [RecipientState], [RecipientZip], [RecipientCountry], [RecipientPhone], [GiftComment], [UserIP]) VALUES (CAST(23 AS Numeric(18, 0)), N'AL10023', CAST(N'2007-12-27T18:56:24.437' AS DateTime), CAST(10 AS Numeric(18, 0)), N'sicho77@gmail.com', N'2401 s. Hacienda Bl.', N'Apt #38', N'hacienda heights', N'CA', N'91745', N'United States', N'abc', 15, 194, 14.01, 29.099999999999998, 0, 0, 178.91, N'VISA (****-****-****-9541)', N'Normal', N'UPS Ground', N'40', N'', N'N/A', N'', N'N/A', N'N/A', N'Sung il Cho', N'2401 s. Hacienda Bl.', N'Apt #38', N'hacienda heights', N'CA', N'91745', N'United States', N'626-848-8771', N'N/A', N'127.0.0.1')
INSERT [dbo].[OrderMaster] ([SerialNo], [OrderNo], [OrderDate], [ClientNo], [Email], [Street1], [Street2], [City], [State], [Zip], [Country], [CouponCode], [CouponDCRate], [OrderAmount], [TaxAmount], [DCAmount], [WrappingCharge], [ShippingAmount], [TotalAmount], [PayMethod], [Paystatus], [ShipMethod], [OrderStatus], [TrackingNo], [CommentFromClient], [CommentToClient], [IsGift], [GiftWrapping], [RecipientName], [RecipientStreet1], [RecipientStreet2], [RecipientCity], [RecipientState], [RecipientZip], [RecipientCountry], [RecipientPhone], [GiftComment], [UserIP]) VALUES (CAST(24 AS Numeric(18, 0)), N'AL10024', CAST(N'2007-12-30T16:42:36.983' AS DateTime), CAST(10 AS Numeric(18, 0)), N'sicho77@gmail.com', N'2401 s. Hacienda Bl.', N'Apt #38', N'hacienda heights', N'CA', N'91745', N'United States', N'', 0, 62, 5.27, 0, 0, 0, 67.27, N'VISA (****-****-****-4444)', N'Normal', N'UPS Ground', N'20', N'1234567891', N'N/A', N'', N'N/A', N'N/A', N'Sung il Cho', N'2401 s. Hacienda Bl.', N'Apt #38', N'hacienda heights', N'CA', N'91745', N'United States', N'626-848-8771', N'N/A', N'127.0.0.1')
INSERT [dbo].[OrderMaster] ([SerialNo], [OrderNo], [OrderDate], [ClientNo], [Email], [Street1], [Street2], [City], [State], [Zip], [Country], [CouponCode], [CouponDCRate], [OrderAmount], [TaxAmount], [DCAmount], [WrappingCharge], [ShippingAmount], [TotalAmount], [PayMethod], [Paystatus], [ShipMethod], [OrderStatus], [TrackingNo], [CommentFromClient], [CommentToClient], [IsGift], [GiftWrapping], [RecipientName], [RecipientStreet1], [RecipientStreet2], [RecipientCity], [RecipientState], [RecipientZip], [RecipientCountry], [RecipientPhone], [GiftComment], [UserIP]) VALUES (CAST(27 AS Numeric(18, 0)), N'AL10027', CAST(N'2007-12-30T17:10:16.360' AS DateTime), CAST(10 AS Numeric(18, 0)), N'sicho77@gmail.com', N'2401 s. Hacienda Bl.', N'Apt #38', N'hacienda heights', N'CA', N'91745', N'United States', N'', 0, 38800, 3298, 0, 0, 0, 42098, N'VISA (****-****-****-9541)', N'Normal', N'UPS Ground', N'20', N'', N'N/A', N'', N'N/A', N'N/A', N'Sung il Cho', N'2401 s. Hacienda Bl.', N'Apt #38', N'hacienda heights', N'CA', N'91745', N'United States', N'626-848-8771', N'N/A', N'127.0.0.1')
INSERT [dbo].[OrderMaster] ([SerialNo], [OrderNo], [OrderDate], [ClientNo], [Email], [Street1], [Street2], [City], [State], [Zip], [Country], [CouponCode], [CouponDCRate], [OrderAmount], [TaxAmount], [DCAmount], [WrappingCharge], [ShippingAmount], [TotalAmount], [PayMethod], [Paystatus], [ShipMethod], [OrderStatus], [TrackingNo], [CommentFromClient], [CommentToClient], [IsGift], [GiftWrapping], [RecipientName], [RecipientStreet1], [RecipientStreet2], [RecipientCity], [RecipientState], [RecipientZip], [RecipientCountry], [RecipientPhone], [GiftComment], [UserIP]) VALUES (CAST(25 AS Numeric(18, 0)), N'AL10025', CAST(N'2007-12-30T16:48:49.437' AS DateTime), CAST(10 AS Numeric(18, 0)), N'sicho77@gmail.com', N'2401 s. Hacienda Bl.', N'Apt #38', N'hacienda heights', N'CA', N'91745', N'United States', N'', 0, 62, 5.27, 0, 0, 0, 67.27, N'VISA (****-****-****-9541)', N'Normal', N'UPS Ground', N'30', N'', N'N/A', N'', N'N/A', N'N/A', N'Sung il Cho', N'2401 s. Hacienda Bl.', N'Apt #38', N'hacienda heights', N'CA', N'91745', N'United States', N'626-848-8771', N'N/A', N'127.0.0.1')
INSERT [dbo].[OrderMaster] ([SerialNo], [OrderNo], [OrderDate], [ClientNo], [Email], [Street1], [Street2], [City], [State], [Zip], [Country], [CouponCode], [CouponDCRate], [OrderAmount], [TaxAmount], [DCAmount], [WrappingCharge], [ShippingAmount], [TotalAmount], [PayMethod], [Paystatus], [ShipMethod], [OrderStatus], [TrackingNo], [CommentFromClient], [CommentToClient], [IsGift], [GiftWrapping], [RecipientName], [RecipientStreet1], [RecipientStreet2], [RecipientCity], [RecipientState], [RecipientZip], [RecipientCountry], [RecipientPhone], [GiftComment], [UserIP]) VALUES (CAST(26 AS Numeric(18, 0)), N'AL10026', CAST(N'2007-12-30T17:03:44.157' AS DateTime), CAST(10 AS Numeric(18, 0)), N'sicho77@gmail.com', N'2401 s. Hacienda Bl.', N'Apt #38', N'hacienda heights', N'CA', N'91745', N'United States', N'', 0, 62, 5.27, 0, 0, 0, 67.27, N'VISA (****-****-****-1111)', N'Normal', N'UPS Ground', N'30', N'', N'N/A', N'Thank you George...', N'N/A', N'N/A', N'Sung il Cho', N'2401 s. Hacienda Bl.', N'Apt #38', N'hacienda heights', N'CA', N'91745', N'United States', N'626-848-8771', N'N/A', N'127.0.0.1')
INSERT [dbo].[OrderMaster] ([SerialNo], [OrderNo], [OrderDate], [ClientNo], [Email], [Street1], [Street2], [City], [State], [Zip], [Country], [CouponCode], [CouponDCRate], [OrderAmount], [TaxAmount], [DCAmount], [WrappingCharge], [ShippingAmount], [TotalAmount], [PayMethod], [Paystatus], [ShipMethod], [OrderStatus], [TrackingNo], [CommentFromClient], [CommentToClient], [IsGift], [GiftWrapping], [RecipientName], [RecipientStreet1], [RecipientStreet2], [RecipientCity], [RecipientState], [RecipientZip], [RecipientCountry], [RecipientPhone], [GiftComment], [UserIP]) VALUES (CAST(28 AS Numeric(18, 0)), N'AL10028', CAST(N'2007-12-30T17:16:59.187' AS DateTime), CAST(10 AS Numeric(18, 0)), N'sicho77@gmail.com', N'2401 s. Hacienda Bl.', N'Apt #38', N'hacienda heights', N'CA', N'91745', N'United States', N'', 0, 84000, 7140, 0, 0, 0, 91140, N'VISA (****-****-****-9541)', N'Normal', N'UPS Ground', N'20', N'', N'N/A', N'', N'N/A', N'N/A', N'Sung il Cho', N'2401 s. Hacienda Bl.', N'Apt #38', N'hacienda heights', N'CA', N'91745', N'United States', N'626-848-8771', N'N/A', N'127.0.0.1')
INSERT [dbo].[OrderMaster] ([SerialNo], [OrderNo], [OrderDate], [ClientNo], [Email], [Street1], [Street2], [City], [State], [Zip], [Country], [CouponCode], [CouponDCRate], [OrderAmount], [TaxAmount], [DCAmount], [WrappingCharge], [ShippingAmount], [TotalAmount], [PayMethod], [Paystatus], [ShipMethod], [OrderStatus], [TrackingNo], [CommentFromClient], [CommentToClient], [IsGift], [GiftWrapping], [RecipientName], [RecipientStreet1], [RecipientStreet2], [RecipientCity], [RecipientState], [RecipientZip], [RecipientCountry], [RecipientPhone], [GiftComment], [UserIP]) VALUES (CAST(29 AS Numeric(18, 0)), N'BA10029', CAST(N'2008-01-06T00:38:47.677' AS DateTime), CAST(10 AS Numeric(18, 0)), N'sicho77@gmail.com', N'2401 s. Hacienda Bl.', N'Apt #38', N'hacienda heights', N'CA', N'91745', N'United States', N'', 0, 194, 16.49, 0, 0, 0, 210.49, N'VISA (****-****-****-4444)', N'Normal', N'UPS Ground', N'90', N'', N'N/A', N'', N'N/A', N'N/A', N'', N'', N'', N'', N'AL', N'', N'Afghanistan', N'', N'N/A', N'127.0.0.1')
SET IDENTITY_INSERT [dbo].[OrderMaster] OFF
SET IDENTITY_INSERT [dbo].[OrderTemp] ON 

INSERT [dbo].[OrderTemp] ([SerialNo], [SessionID], [CardType], [CardNumber], [CardExpires], [CardCVV], [BillName], [BillAddress1], [BillAddress2], [BillCity], [BillState], [BillZip], [BillCountry], [BillPhone], [ShipName], [ShipAddress1], [ShipAddress2], [ShipCity], [ShipState], [ShipZip], [ShipCountry], [ShipPhone], [ShippingMethod], [RegDate], [CouponCode], [CouponDCRate]) VALUES (CAST(1 AS Numeric(18, 0)), N'sdpxy2nb2355te45cixpemma', N'VISA', N'1234345687654321', N'10/10', N'567', N'si cho', N'2401', N'', N'hacienda heights', N'CA', N'91745', N'United States', N'626-848-8771', N'si cho', N'2401', N'', N'hacienda heights', N'CA', N'91745', N'United States', N'626-848-8771', N'UPS 2 Days', CAST(N'2007-12-08T06:53:29.343' AS DateTime), NULL, NULL)
INSERT [dbo].[OrderTemp] ([SerialNo], [SessionID], [CardType], [CardNumber], [CardExpires], [CardCVV], [BillName], [BillAddress1], [BillAddress2], [BillCity], [BillState], [BillZip], [BillCountry], [BillPhone], [ShipName], [ShipAddress1], [ShipAddress2], [ShipCity], [ShipState], [ShipZip], [ShipCountry], [ShipPhone], [ShippingMethod], [RegDate], [CouponCode], [CouponDCRate]) VALUES (CAST(2 AS Numeric(18, 0)), N'3fpn2f45mfodz2552le3m5vu', N'VISA', N'', N'', N'', N'evan weitzberg', N'6333 Lexington ave', N'', N'LA', N'CA', N'90038', N'United States', N'323-252-5428', N'evan weitzberg', N'6333 Lexington ave', N'', N'LA', N'CA', N'90038', N'United States', N'323-252-5428', N'UPS Ground', CAST(N'2007-12-10T10:50:56.153' AS DateTime), NULL, NULL)
INSERT [dbo].[OrderTemp] ([SerialNo], [SessionID], [CardType], [CardNumber], [CardExpires], [CardCVV], [BillName], [BillAddress1], [BillAddress2], [BillCity], [BillState], [BillZip], [BillCountry], [BillPhone], [ShipName], [ShipAddress1], [ShipAddress2], [ShipCity], [ShipState], [ShipZip], [ShipCountry], [ShipPhone], [ShippingMethod], [RegDate], [CouponCode], [CouponDCRate]) VALUES (CAST(3 AS Numeric(18, 0)), N'xm5dtx453qii0w551hrj1hiz', N'VISA', N'435436', N'02/08', N'445', N'wally lee', N'3243 rgafg', N'', N'LA', N'CA', N'92656', N'United States', N'949-293-6881', N'wally lee', N'3243 rgafg', N'', N'LA', N'CA', N'92656', N'United States', N'949-293-6881', N'UPS 2 Days', CAST(N'2007-12-11T12:16:53.077' AS DateTime), NULL, NULL)
INSERT [dbo].[OrderTemp] ([SerialNo], [SessionID], [CardType], [CardNumber], [CardExpires], [CardCVV], [BillName], [BillAddress1], [BillAddress2], [BillCity], [BillState], [BillZip], [BillCountry], [BillPhone], [ShipName], [ShipAddress1], [ShipAddress2], [ShipCity], [ShipState], [ShipZip], [ShipCountry], [ShipPhone], [ShippingMethod], [RegDate], [CouponCode], [CouponDCRate]) VALUES (CAST(4 AS Numeric(18, 0)), N'0u5hvd450hpgup553bie1h3y', N'VISA', N'', N'', N'', N'evan weitzberg', N'6333 Lexington ave', N'', N'LA', N'CA', N'90038', N'United States', N'323-252-5428', N'evan weitzberg', N'6333 Lexington ave', N'', N'LA', N'CA', N'90038', N'United States', N'323-252-5428', N'UPS Ground', CAST(N'2007-12-12T22:26:21.123' AS DateTime), NULL, NULL)
INSERT [dbo].[OrderTemp] ([SerialNo], [SessionID], [CardType], [CardNumber], [CardExpires], [CardCVV], [BillName], [BillAddress1], [BillAddress2], [BillCity], [BillState], [BillZip], [BillCountry], [BillPhone], [ShipName], [ShipAddress1], [ShipAddress2], [ShipCity], [ShipState], [ShipZip], [ShipCountry], [ShipPhone], [ShippingMethod], [RegDate], [CouponCode], [CouponDCRate]) VALUES (CAST(5 AS Numeric(18, 0)), N'1203ylvs2u41ud550bw4ppqj', N'VISA', N'23435243', N'05/07', N'993', N'wally lee', N'3243 rgafg', N'', N'LA', N'CA', N'92656', N'United States', N'949-293-6881', N'wally lee', N'3243 rgafg', N'', N'LA', N'CA', N'92656', N'United States', N'949-293-6881', N'UPS Ground', CAST(N'2007-12-14T00:54:29.217' AS DateTime), NULL, NULL)
INSERT [dbo].[OrderTemp] ([SerialNo], [SessionID], [CardType], [CardNumber], [CardExpires], [CardCVV], [BillName], [BillAddress1], [BillAddress2], [BillCity], [BillState], [BillZip], [BillCountry], [BillPhone], [ShipName], [ShipAddress1], [ShipAddress2], [ShipCity], [ShipState], [ShipZip], [ShipCountry], [ShipPhone], [ShippingMethod], [RegDate], [CouponCode], [CouponDCRate]) VALUES (CAST(6 AS Numeric(18, 0)), N'si55q3v13zjko0uewssen245', N'VISA', N'1234856235789541', N'122010', N'589', N'성일 조', N'은평구 구산동 224번지', N'경남아파트 107-501', N'서울시', N'AL', N'91745', N'Korea, Republic of', N'626-848-8771', N'SI Cho', N'2401 S. Hacienda Bl. ', N'Apt #38', N'Hacienda Hts.', N'CA', N'91745', N'United States', N'626-848-8771', N'UPS 2 Days', CAST(N'2007-12-14T02:23:27.123' AS DateTime), NULL, NULL)
INSERT [dbo].[OrderTemp] ([SerialNo], [SessionID], [CardType], [CardNumber], [CardExpires], [CardCVV], [BillName], [BillAddress1], [BillAddress2], [BillCity], [BillState], [BillZip], [BillCountry], [BillPhone], [ShipName], [ShipAddress1], [ShipAddress2], [ShipCity], [ShipState], [ShipZip], [ShipCountry], [ShipPhone], [ShippingMethod], [RegDate], [CouponCode], [CouponDCRate]) VALUES (CAST(7 AS Numeric(18, 0)), N'kanjjm551v0pavbfcsbmo255', N'VISA', N'4444333322221111', N'122010', N'589', N'성일 조', N'은평구 구산동 224번지', N'경남아파트 107-501', N'서울시', N'AL', N'91745', N'Korea, Republic of', N'626-848-8771', N'SI Cho', N'2401 S. Hacienda Bl. ', N'Apt #38', N'Hacienda Hts.', N'CA', N'91745', N'United States', N'626-848-8771', N'UPS Next Day', CAST(N'2007-12-14T02:26:38.107' AS DateTime), NULL, NULL)
INSERT [dbo].[OrderTemp] ([SerialNo], [SessionID], [CardType], [CardNumber], [CardExpires], [CardCVV], [BillName], [BillAddress1], [BillAddress2], [BillCity], [BillState], [BillZip], [BillCountry], [BillPhone], [ShipName], [ShipAddress1], [ShipAddress2], [ShipCity], [ShipState], [ShipZip], [ShipCountry], [ShipPhone], [ShippingMethod], [RegDate], [CouponCode], [CouponDCRate]) VALUES (CAST(8 AS Numeric(18, 0)), N'1aejh345hpdm2t451nambizp', N'VISA', N'4719278565231374', N'102010', N'507', N'Sung il Cho', N'2401 s. Hacienda Bl.', N'Apt #38', N'hacienda heights', N'CA', N'91745', N'United States', N'626-848-8771', N'Sung il Cho', N'2401 s. Hacienda Bl.', N'Apt #38', N'hacienda heights', N'CA', N'91745', N'United States', N'626-848-8771', N'UPS Ground', CAST(N'2007-12-14T14:37:39.963' AS DateTime), NULL, NULL)
INSERT [dbo].[OrderTemp] ([SerialNo], [SessionID], [CardType], [CardNumber], [CardExpires], [CardCVV], [BillName], [BillAddress1], [BillAddress2], [BillCity], [BillState], [BillZip], [BillCountry], [BillPhone], [ShipName], [ShipAddress1], [ShipAddress2], [ShipCity], [ShipState], [ShipZip], [ShipCountry], [ShipPhone], [ShippingMethod], [RegDate], [CouponCode], [CouponDCRate]) VALUES (CAST(9 AS Numeric(18, 0)), N'0eno2m55054uak45wtmyzurp', N'VISA', N'4444333322221111', N'122010', N'589', N'Sung il Cho', N'2401 s. Hacienda Bl.', N'Apt #38', N'hacienda heights', N'CA', N'91745', N'United States', N'626-848-8771', N'Sung il Cho', N'2401 s. Hacienda Bl.', N'Apt #38', N'hacienda heights', N'CA', N'91745', N'United States', N'626-848-8771', N'UPS Ground', CAST(N'2007-12-17T19:28:04.030' AS DateTime), NULL, NULL)
INSERT [dbo].[OrderTemp] ([SerialNo], [SessionID], [CardType], [CardNumber], [CardExpires], [CardCVV], [BillName], [BillAddress1], [BillAddress2], [BillCity], [BillState], [BillZip], [BillCountry], [BillPhone], [ShipName], [ShipAddress1], [ShipAddress2], [ShipCity], [ShipState], [ShipZip], [ShipCountry], [ShipPhone], [ShippingMethod], [RegDate], [CouponCode], [CouponDCRate]) VALUES (CAST(10 AS Numeric(18, 0)), N'wermux3t5cxr0n45xmmbwmu3', N'VISA', N'1111222233334444', N'102010', N'507', N'Sung il Cho', N'2401 s. Hacienda Bl.', N'Apt #38', N'hacienda heights', N'CA', N'91745', N'United States', N'626-848-8771', N'Sung il Cho', N'2401 s. Hacienda Bl.', N'Apt #38', N'hacienda heights', N'CA', N'91745', N'United States', N'626-848-8771', N'UPS Ground', CAST(N'2007-12-17T19:52:10.547' AS DateTime), NULL, NULL)
INSERT [dbo].[OrderTemp] ([SerialNo], [SessionID], [CardType], [CardNumber], [CardExpires], [CardCVV], [BillName], [BillAddress1], [BillAddress2], [BillCity], [BillState], [BillZip], [BillCountry], [BillPhone], [ShipName], [ShipAddress1], [ShipAddress2], [ShipCity], [ShipState], [ShipZip], [ShipCountry], [ShipPhone], [ShippingMethod], [RegDate], [CouponCode], [CouponDCRate]) VALUES (CAST(11 AS Numeric(18, 0)), N'rx0yjsqes3a0aq55fjyp5e45', N'VISA', N'1111222233334444', N'102010', N'589', N'Sung il Cho', N'2401 s. Hacienda Bl.', N'Apt #38', N'hacienda heights', N'CA', N'91745', N'United States', N'626-848-8771', N'Sung il Cho', N'2401 s. Hacienda Bl.', N'Apt #38', N'hacienda heights', N'CA', N'91745', N'United States', N'626-848-8771', N'UPS Ground', CAST(N'2007-12-17T19:54:58.077' AS DateTime), NULL, NULL)
INSERT [dbo].[OrderTemp] ([SerialNo], [SessionID], [CardType], [CardNumber], [CardExpires], [CardCVV], [BillName], [BillAddress1], [BillAddress2], [BillCity], [BillState], [BillZip], [BillCountry], [BillPhone], [ShipName], [ShipAddress1], [ShipAddress2], [ShipCity], [ShipState], [ShipZip], [ShipCountry], [ShipPhone], [ShippingMethod], [RegDate], [CouponCode], [CouponDCRate]) VALUES (CAST(12 AS Numeric(18, 0)), N'vphgbkbkalac2nikyu4nso55', N'VISA', N'1111222233334444', N'102010', N'507', N'Sung il Cho', N'2401 s. Hacienda Bl.', N'Apt #38', N'hacienda heights', N'CA', N'91745', N'United States', N'626-848-8771', N'Sung il Cho', N'2401 s. Hacienda Bl.', N'Apt #38', N'hacienda heights', N'CA', N'91745', N'United States', N'626-848-8771', N'UPS Ground', CAST(N'2007-12-17T19:57:08.577' AS DateTime), NULL, NULL)
INSERT [dbo].[OrderTemp] ([SerialNo], [SessionID], [CardType], [CardNumber], [CardExpires], [CardCVV], [BillName], [BillAddress1], [BillAddress2], [BillCity], [BillState], [BillZip], [BillCountry], [BillPhone], [ShipName], [ShipAddress1], [ShipAddress2], [ShipCity], [ShipState], [ShipZip], [ShipCountry], [ShipPhone], [ShippingMethod], [RegDate], [CouponCode], [CouponDCRate]) VALUES (CAST(13 AS Numeric(18, 0)), N'01mdmz55v1uwka55papjpcai', N'VISA', N'4444333322221111', N'122010', N'507', N'Sung il Cho', N'2401 s. Hacienda Bl.', N'Apt #38', N'hacienda heights', N'CA', N'91745', N'United States', N'626-848-8771', N'Sung il Cho', N'2401 s. Hacienda Bl.', N'Apt #38', N'hacienda heights', N'CA', N'91745', N'United States', N'626-848-8771', N'UPS Ground', CAST(N'2007-12-24T22:07:07.890' AS DateTime), NULL, NULL)
INSERT [dbo].[OrderTemp] ([SerialNo], [SessionID], [CardType], [CardNumber], [CardExpires], [CardCVV], [BillName], [BillAddress1], [BillAddress2], [BillCity], [BillState], [BillZip], [BillCountry], [BillPhone], [ShipName], [ShipAddress1], [ShipAddress2], [ShipCity], [ShipState], [ShipZip], [ShipCountry], [ShipPhone], [ShippingMethod], [RegDate], [CouponCode], [CouponDCRate]) VALUES (CAST(15 AS Numeric(18, 0)), N'cfdfdp55ysafqn55svahp245', N'VISA', N'1234856235789541', N'102010', N'', N'Sung il Cho', N'2401 s. Hacienda Bl.', N'Apt #38', N'hacienda heights', N'CA', N'91745', N'United States', N'626-848-8771', N'Sung il Cho', N'2401 s. Hacienda Bl.', N'Apt #38', N'hacienda heights', N'CA', N'91745', N'United States', N'626-848-8771', N'UPS Ground', CAST(N'2007-12-24T22:25:14.873' AS DateTime), NULL, NULL)
INSERT [dbo].[OrderTemp] ([SerialNo], [SessionID], [CardType], [CardNumber], [CardExpires], [CardCVV], [BillName], [BillAddress1], [BillAddress2], [BillCity], [BillState], [BillZip], [BillCountry], [BillPhone], [ShipName], [ShipAddress1], [ShipAddress2], [ShipCity], [ShipState], [ShipZip], [ShipCountry], [ShipPhone], [ShippingMethod], [RegDate], [CouponCode], [CouponDCRate]) VALUES (CAST(16 AS Numeric(18, 0)), N'vsd1ntvfhkgt4xrlfwqmo3zh', N'VISA', N'1234856235789541', N'102010', N'507', N'Sung il Cho', N'2401 s. Hacienda Bl.', N'Apt #38', N'hacienda heights', N'CA', N'91745', N'United States', N'626-848-8771', N'Sung il Cho', N'2401 s. Hacienda Bl.', N'Apt #38', N'hacienda heights', N'CA', N'91745', N'United States', N'626-848-8771', N'UPS Ground', CAST(N'2007-12-27T18:32:37.843' AS DateTime), N'abc', 15)
INSERT [dbo].[OrderTemp] ([SerialNo], [SessionID], [CardType], [CardNumber], [CardExpires], [CardCVV], [BillName], [BillAddress1], [BillAddress2], [BillCity], [BillState], [BillZip], [BillCountry], [BillPhone], [ShipName], [ShipAddress1], [ShipAddress2], [ShipCity], [ShipState], [ShipZip], [ShipCountry], [ShipPhone], [ShippingMethod], [RegDate], [CouponCode], [CouponDCRate]) VALUES (CAST(25 AS Numeric(18, 0)), N'y3tugw55jlncla55ohnwcdj3', N'VISA', N'12345678901234', N'', N'', N' ', N'', N'', N'', N'AL', N'', N'United States', N'', N' ', N'', N'', N'', N'AL', N'', N'United States', N'', N'UPS Ground', CAST(N'2008-01-16T20:47:47.353' AS DateTime), N'', 0)
INSERT [dbo].[OrderTemp] ([SerialNo], [SessionID], [CardType], [CardNumber], [CardExpires], [CardCVV], [BillName], [BillAddress1], [BillAddress2], [BillCity], [BillState], [BillZip], [BillCountry], [BillPhone], [ShipName], [ShipAddress1], [ShipAddress2], [ShipCity], [ShipState], [ShipZip], [ShipCountry], [ShipPhone], [ShippingMethod], [RegDate], [CouponCode], [CouponDCRate]) VALUES (CAST(14 AS Numeric(18, 0)), N'm4kbmj55ttnyuzaz1ckoxa55', N'VISA', N'4719278565231374', N'102010', N'589', N'Sung il Cho', N'2401 s. Hacienda Bl.', N'Apt #38', N'hacienda heights', N'CA', N'91745', N'United States', N'626-848-8771', N'Sung il Cho', N'2401 s. Hacienda Bl.', N'Apt #38', N'hacienda heights', N'CA', N'91745', N'United States', N'626-848-8771', N'UPS Next Day', CAST(N'2007-12-24T22:19:12.200' AS DateTime), NULL, NULL)
INSERT [dbo].[OrderTemp] ([SerialNo], [SessionID], [CardType], [CardNumber], [CardExpires], [CardCVV], [BillName], [BillAddress1], [BillAddress2], [BillCity], [BillState], [BillZip], [BillCountry], [BillPhone], [ShipName], [ShipAddress1], [ShipAddress2], [ShipCity], [ShipState], [ShipZip], [ShipCountry], [ShipPhone], [ShippingMethod], [RegDate], [CouponCode], [CouponDCRate]) VALUES (CAST(26 AS Numeric(18, 0)), N'rzxsor55h0unzu55rc3y4xnc', N'VISA', N'', N'', N'', N' ', N'', N'', N'', N'AL', N'', N'United States', N'', N' ', N'', N'', N'', N'AL', N'', N'United States', N'', N'UPS Ground', CAST(N'2008-01-16T21:22:49.430' AS DateTime), N'', 0)
INSERT [dbo].[OrderTemp] ([SerialNo], [SessionID], [CardType], [CardNumber], [CardExpires], [CardCVV], [BillName], [BillAddress1], [BillAddress2], [BillCity], [BillState], [BillZip], [BillCountry], [BillPhone], [ShipName], [ShipAddress1], [ShipAddress2], [ShipCity], [ShipState], [ShipZip], [ShipCountry], [ShipPhone], [ShippingMethod], [RegDate], [CouponCode], [CouponDCRate]) VALUES (CAST(27 AS Numeric(18, 0)), N'crgxlt45r5fw0z55x3qbay55', N'VISA', N'1234567890123456', N'', N'', N' ', N'', N'', N'', N'AL', N'', N'United States', N'', N' ', N'', N'', N'', N'AL', N'', N'United States', N'', N'UPS Ground', CAST(N'2008-01-16T21:29:40.057' AS DateTime), N'', 0)
INSERT [dbo].[OrderTemp] ([SerialNo], [SessionID], [CardType], [CardNumber], [CardExpires], [CardCVV], [BillName], [BillAddress1], [BillAddress2], [BillCity], [BillState], [BillZip], [BillCountry], [BillPhone], [ShipName], [ShipAddress1], [ShipAddress2], [ShipCity], [ShipState], [ShipZip], [ShipCountry], [ShipPhone], [ShippingMethod], [RegDate], [CouponCode], [CouponDCRate]) VALUES (CAST(29 AS Numeric(18, 0)), N'slbzlbi4upt2sped4uwlqg45', N'VISA', N'', N'', N'', N'SI_WA Cho', N'2401 s. Hacienda Bl.', N'', N'hacienda heights', N'CA', N'91745', N'United States', N'626-848-8771', N'SI_WA Cho', N'2401 s. Hacienda Bl.', N'', N'hacienda heights', N'CA', N'91745', N'United States', N'626-848-8771', N'UPS Ground', CAST(N'2008-02-01T18:30:35.580' AS DateTime), N'', 0)
INSERT [dbo].[OrderTemp] ([SerialNo], [SessionID], [CardType], [CardNumber], [CardExpires], [CardCVV], [BillName], [BillAddress1], [BillAddress2], [BillCity], [BillState], [BillZip], [BillCountry], [BillPhone], [ShipName], [ShipAddress1], [ShipAddress2], [ShipCity], [ShipState], [ShipZip], [ShipCountry], [ShipPhone], [ShippingMethod], [RegDate], [CouponCode], [CouponDCRate]) VALUES (CAST(30 AS Numeric(18, 0)), N'e43cbl45ptbgb4asusu0wn55', N'VISA', N'', N'', N'', N'SI_WA Cho', N'2401 s. Hacienda Bl.', N'', N'hacienda heights', N'CA', N'91745', N'United States', N'626-848-8771', N'SI_WA Cho', N'2401 s. Hacienda Bl.', N'', N'hacienda heights', N'CA', N'91745', N'United States', N'626-848-8771', N'UPS Ground', CAST(N'2008-02-01T19:13:10.343' AS DateTime), N'', 0)
INSERT [dbo].[OrderTemp] ([SerialNo], [SessionID], [CardType], [CardNumber], [CardExpires], [CardCVV], [BillName], [BillAddress1], [BillAddress2], [BillCity], [BillState], [BillZip], [BillCountry], [BillPhone], [ShipName], [ShipAddress1], [ShipAddress2], [ShipCity], [ShipState], [ShipZip], [ShipCountry], [ShipPhone], [ShippingMethod], [RegDate], [CouponCode], [CouponDCRate]) VALUES (CAST(28 AS Numeric(18, 0)), N'zlwjah55tradxc451a5goq55', N'VISA', N'1234567890123456', N'102010', N'111', N'11', N'11', N'11', N'11', N'CA', N'91745', N'United States', N'111', N'11', N'11', N'11', N'11', N'CA', N'91745', N'United States', N'111', N'UPS Ground', CAST(N'2008-01-16T21:37:41.490' AS DateTime), N'', 0)
SET IDENTITY_INSERT [dbo].[OrderTemp] OFF
SET IDENTITY_INSERT [dbo].[Pictures] ON 

INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1593 AS Numeric(18, 0)), N'MLFT104', N'Rep', N'All', N'MLFT104_Rep_x440.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1594 AS Numeric(18, 0)), N'MLFT104', N'Thumb', N'All', N'MLFT104_detail2_x87.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1595 AS Numeric(18, 0)), N'MLFT104', N'Thumb', N'All', N'MLFT104_Detail3_x87.jpg', 2, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1596 AS Numeric(18, 0)), N'MLFT104', N'Thumb', N'All', N'MLFT104_detail4_x87.jpg', 3, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1597 AS Numeric(18, 0)), N'MLFT104', N'Thumb', N'All', N'MLFT104_Rep_detail_x87.jpg', 4, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1598 AS Numeric(18, 0)), N'MLFT104', N'Detail', N'All', N'MLFT104_detail2.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1599 AS Numeric(18, 0)), N'MLFT104', N'Detail', N'All', N'MLFT104_Detail3.jpg', 2, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1600 AS Numeric(18, 0)), N'MLFT104', N'Detail', N'All', N'MLFT104_detail4.jpg', 3, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1601 AS Numeric(18, 0)), N'MLFT104', N'Detail', N'All', N'MLFT104_Rep_detail_x800.jpg', 4, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1655 AS Numeric(18, 0)), N'MLFT106', N'Rep', N'All', N'MLFT106_rep_x440.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1656 AS Numeric(18, 0)), N'MLFT106', N'Thumb', N'All', N'MLFT106_detail1_x87.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1657 AS Numeric(18, 0)), N'MLFT106', N'Thumb', N'All', N'MLFT106_detail2_x87.jpg', 2, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1658 AS Numeric(18, 0)), N'MLFT106', N'Thumb', N'All', N'MLFT106_detail3_x87.jpg', 3, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1659 AS Numeric(18, 0)), N'MLFT106', N'Thumb', N'All', N'MLFT106_detail4_x87.jpg', 4, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1660 AS Numeric(18, 0)), N'MLFT106', N'Detail', N'All', N'MLFT106_detail1.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1661 AS Numeric(18, 0)), N'MLFT106', N'Detail', N'All', N'MLFT106_detail2.jpg', 2, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1662 AS Numeric(18, 0)), N'MLFT106', N'Detail', N'All', N'MLFT106_detail3.jpg', 3, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1663 AS Numeric(18, 0)), N'MLFT106', N'Detail', N'All', N'MLFT106_detail4.jpg', 4, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1611 AS Numeric(18, 0)), N'MLFL101BLK', N'Rep', N'All', N'MLFL101BLK_chelsea_Front_440.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1612 AS Numeric(18, 0)), N'MLFL101BLK', N'Thumb', N'All', N'MLFL101BLK_chelsea_back_87.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1613 AS Numeric(18, 0)), N'MLFL101BLK', N'Thumb', N'All', N'MLFL101blk_celsea_front2_87.jpg', 2, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1614 AS Numeric(18, 0)), N'MLFL101BLK', N'Thumb', N'All', N'MLFL101blk_chelsea_leftside_87.jpg', 3, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(222 AS Numeric(18, 0)), N'LGMB101', N'Rep', N'All', N'image2.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(223 AS Numeric(18, 0)), N'LGMB101', N'Thumb', N'All', N'image2_60.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(224 AS Numeric(18, 0)), N'LGMB101', N'Detail', N'All', N'adame2005612867_prod_category_thumbnail.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1615 AS Numeric(18, 0)), N'MLFL101BLK', N'Thumb', N'All', N'MLFL101BLK_chelsea_rightside_87.jpg', 4, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1616 AS Numeric(18, 0)), N'MLFL101BLK', N'Detail', N'All', N'MLFL101BLK_chelsea_back_800.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1617 AS Numeric(18, 0)), N'MLFL101BLK', N'Detail', N'All', N'MLFL101blk_celsea_front2_800.jpg', 2, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1618 AS Numeric(18, 0)), N'MLFL101BLK', N'Detail', N'All', N'MLFL101blk_chelsea_leftside_800.jpg', 3, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1619 AS Numeric(18, 0)), N'MLFL101BLK', N'Detail', N'All', N'MLFL101BLK_chelsea_rightside_800.jpg', 4, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1671 AS Numeric(18, 0)), N'MLFH101', N'Thumb', N'All', N'MLFH101_detail7_x87.jpg', 7, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1672 AS Numeric(18, 0)), N'MLFH101', N'Detail', N'All', N'MLFH101_detail1.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1673 AS Numeric(18, 0)), N'MLFH101', N'Detail', N'All', N'MLFH101_detail2.jpg', 2, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(233 AS Numeric(18, 0)), N'LGML101', N'Rep', N'All', N'LGML101_rep_x440.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(234 AS Numeric(18, 0)), N'LGML101', N'Thumb', N'All', N'LGML101_rep_x87.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(235 AS Numeric(18, 0)), N'LGML101', N'Detail', N'All', N'LGML101_rep_x800.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(236 AS Numeric(18, 0)), N'LGMT101', N'Rep', N'All', N'LGMT101_rep._x440.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(237 AS Numeric(18, 0)), N'LGMT101', N'Thumb', N'All', N'LGMT101_detail1_x87.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(238 AS Numeric(18, 0)), N'LGMT101', N'Thumb', N'All', N'LGMT101_rep._x87.jpg', 2, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1674 AS Numeric(18, 0)), N'MLFH101', N'Detail', N'All', N'MLFH101_detail3.jpg', 3, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1675 AS Numeric(18, 0)), N'MLFH101', N'Detail', N'All', N'MLFH101_detail4.jpg', 4, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1676 AS Numeric(18, 0)), N'MLFH101', N'Detail', N'All', N'MLFH101_detail5.jpg', 5, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(242 AS Numeric(18, 0)), N'LGMT101', N'Detail', N'All', N'LGMT101_detail1_x800.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(243 AS Numeric(18, 0)), N'LGMT101', N'Detail', N'All', N'LGMT101_rep._x800.jpg', 2, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1677 AS Numeric(18, 0)), N'MLFH101', N'Detail', N'All', N'MLFH101_detail6.jpg', 6, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1678 AS Numeric(18, 0)), N'MLFH101', N'Detail', N'All', N'MLFH101_detail8.jpg', 7, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(250 AS Numeric(18, 0)), N'LGMT108', N'Rep', N'All', N'LGMT108_rep_x440.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(251 AS Numeric(18, 0)), N'LGMT108', N'Thumb', N'All', N'LGMT108_detail1_x87.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(252 AS Numeric(18, 0)), N'LGMT108', N'Thumb', N'All', N'LGMT108_detail2_x87.jpg', 2, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(253 AS Numeric(18, 0)), N'LGMT108', N'Thumb', N'All', N'LGMT108_rep_x87.jpg', 3, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(254 AS Numeric(18, 0)), N'LGMT108', N'Detail', N'All', N'LGMT108_detail1_x800.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(255 AS Numeric(18, 0)), N'LGMT108', N'Detail', N'All', N'LGMT108_detail2_x800.jpg', 2, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(256 AS Numeric(18, 0)), N'LGMT108', N'Detail', N'All', N'LGMT108_rep_x800.jpg', 3, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(257 AS Numeric(18, 0)), N'LGMT109', N'Rep', N'All', N'LGMT109_rep_x440.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(258 AS Numeric(18, 0)), N'LGMT109', N'Thumb', N'All', N'LGMT109_rep_x87.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(259 AS Numeric(18, 0)), N'LGMT109', N'Thumb', N'All', N'LGMT109-detail_x87.jpg', 2, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(260 AS Numeric(18, 0)), N'LGMT109', N'Detail', N'All', N'LGMT109_rep_x800.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(261 AS Numeric(18, 0)), N'LGMT109', N'Detail', N'All', N'LGMT109-detail_x800.jpg', 2, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(262 AS Numeric(18, 0)), N'LGMT111', N'Rep', N'All', N'LGMT111_rep_x440.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(263 AS Numeric(18, 0)), N'LGMT111', N'Thumb', N'All', N'LGMT111_detail_x87_002.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(264 AS Numeric(18, 0)), N'LGMT111', N'Thumb', N'All', N'LGMT111_rep_x87_001.jpg', 2, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(265 AS Numeric(18, 0)), N'LGMT111', N'Detail', N'All', N'LGMT111_detail_x800.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(266 AS Numeric(18, 0)), N'LGMT111', N'Detail', N'All', N'LGMT111_rep_x800.jpg', 2, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1080 AS Numeric(18, 0)), N'MLMH104', N'Rep', N'All', N'MLMH104_rep_x440.JPG', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1081 AS Numeric(18, 0)), N'MLMH104', N'Thumb', N'All', N'MLMH104_detail1_x87.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1082 AS Numeric(18, 0)), N'MLMH104', N'Thumb', N'All', N'MLMH104_detail2_x87.JPG', 2, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1083 AS Numeric(18, 0)), N'MLMH104', N'Thumb', N'All', N'MLMH104_detail3_x87.jpg', 3, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1072 AS Numeric(18, 0)), N'MLMH103BRN', N'Thumb', N'All', N'MLMH103-3_detail5_x87.JPG', 5, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1073 AS Numeric(18, 0)), N'MLMH103BRN', N'Thumb', N'All', N'MLMH103-3_detail6_x87.JPG', 6, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1074 AS Numeric(18, 0)), N'MLMH103BRN', N'Detail', N'All', N'MLMH103-3_detail1_x800.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1075 AS Numeric(18, 0)), N'MLMH103BRN', N'Detail', N'All', N'MLMH103-3_detail2_x800.JPG', 2, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1076 AS Numeric(18, 0)), N'MLMH103BRN', N'Detail', N'All', N'MLMH103-3_detail3_x800.jpg', 3, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1077 AS Numeric(18, 0)), N'MLMH103BRN', N'Detail', N'All', N'MLMH103-3_detail4_x800.jpg', 4, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1078 AS Numeric(18, 0)), N'MLMH103BRN', N'Detail', N'All', N'MLMH103-3_detail5_x800.JPG', 5, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1084 AS Numeric(18, 0)), N'MLMH104', N'Thumb', N'All', N'MLMH104_detail4_x87.JPG', 4, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1085 AS Numeric(18, 0)), N'MLMH104', N'Thumb', N'All', N'MLMH104_detail5_87.jpg', 5, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1086 AS Numeric(18, 0)), N'MLMH104', N'Thumb', N'All', N'MLMH104_detail6_x87.JPG', 6, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(297 AS Numeric(18, 0)), N'MLMT107', N'Rep', N'All', N'MLMT107_rep_x440.JPG', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(298 AS Numeric(18, 0)), N'MLMT107', N'Thumb', N'All', N'MLMT107_detail1_x87.JPG', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(299 AS Numeric(18, 0)), N'MLMT107', N'Thumb', N'All', N'MLMT107_detail2_x87.JPG', 2, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(300 AS Numeric(18, 0)), N'MLMT107', N'Thumb', N'All', N'MLMT107_detail3_x87.JPG', 3, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(301 AS Numeric(18, 0)), N'MLMT107', N'Thumb', N'All', N'MLMT107_rep_x87.JPG', 4, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(302 AS Numeric(18, 0)), N'MLMT107', N'Detail', N'All', N'MLMT107_detail1_x800.JPG', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(303 AS Numeric(18, 0)), N'MLMT107', N'Detail', N'All', N'MLMT107_detail2_x800.JPG', 2, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(304 AS Numeric(18, 0)), N'MLMT107', N'Detail', N'All', N'MLMT107_detail3_x800.JPG', 3, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(305 AS Numeric(18, 0)), N'MLMT107', N'Detail', N'All', N'MLMT107_rep_x800.JPG', 4, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(306 AS Numeric(18, 0)), N'MLMH105', N'Rep', N'All', N'MLMH105_rep_x440.JPG', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(307 AS Numeric(18, 0)), N'MLMH105', N'Thumb', N'All', N'MLMH105_detail6_x87_002.JPG', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(308 AS Numeric(18, 0)), N'MLMH105', N'Thumb', N'All', N'MLMH105_detail4_x87.JPG', 2, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(309 AS Numeric(18, 0)), N'MLMH105', N'Thumb', N'All', N'MLMH105_detail2_x87.JPG', 3, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(310 AS Numeric(18, 0)), N'MLMH105', N'Thumb', N'All', N'MLMH105_detail3_x87.jpg', 4, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(311 AS Numeric(18, 0)), N'MLMH105', N'Thumb', N'All', N'MLMH105_detail5_x87.jpg', 5, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(312 AS Numeric(18, 0)), N'MLMH105', N'Detail', N'All', N'MLMH105_detail6_x800.JPG', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(313 AS Numeric(18, 0)), N'MLMH105', N'Detail', N'All', N'MLMH105_detail4_x800.JPG', 2, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(314 AS Numeric(18, 0)), N'MLMH105', N'Detail', N'All', N'MLMH105_detail2_x800.JPG', 3, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(315 AS Numeric(18, 0)), N'MLMH105', N'Detail', N'All', N'MLMH105_detail3_x800.jpg', 4, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(316 AS Numeric(18, 0)), N'MLMH105', N'Detail', N'All', N'MLMH105_detail5_x800.jpg', 5, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(317 AS Numeric(18, 0)), N'MLMT108BLK', N'Rep', N'All', N'MLMT108B_rep_440.JPG', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(318 AS Numeric(18, 0)), N'MLMT108BLK', N'Thumb', N'All', N'MLMT108B_detail1_x87.jpg', 1, N'YES')
GO
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(319 AS Numeric(18, 0)), N'MLMT108BLK', N'Thumb', N'All', N'MLMT108B_detail2_x87.JPG', 2, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(320 AS Numeric(18, 0)), N'MLMT108BLK', N'Thumb', N'All', N'MLMT108B_detail3_x87.JPG', 3, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(321 AS Numeric(18, 0)), N'MLMT108BLK', N'Thumb', N'All', N'MLMT108B_rep_87.JPG', 4, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(322 AS Numeric(18, 0)), N'MLMT108BLK', N'Detail', N'All', N'MLMT108B_detail1_x800.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(323 AS Numeric(18, 0)), N'MLMT108BLK', N'Detail', N'All', N'MLMT108B_detail2_x800.JPG', 2, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(324 AS Numeric(18, 0)), N'MLMT108BLK', N'Detail', N'All', N'MLMT108B_detail3_x800.JPG', 3, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(325 AS Numeric(18, 0)), N'MLMT108BLK', N'Detail', N'All', N'MLMT108B_rep_800.JPG', 4, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1236 AS Numeric(18, 0)), N'MLFT101', N'Rep', N'All', N'MLFT101_rep_x440.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1237 AS Numeric(18, 0)), N'MLFT101', N'Thumb', N'All', N'MLFT101_detail1_x87.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1238 AS Numeric(18, 0)), N'MLFT101', N'Thumb', N'All', N'MLFT101_detail2_x87.jpg', 2, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1239 AS Numeric(18, 0)), N'MLFT101', N'Thumb', N'All', N'MLFT101_Detail3_x87.jpg', 3, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1240 AS Numeric(18, 0)), N'MLFT101', N'Thumb', N'All', N'MLFT101_detail4_x87.jpg', 4, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1241 AS Numeric(18, 0)), N'MLFT101', N'Thumb', N'All', N'MLFT101_detail5_x87.jpg', 5, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1242 AS Numeric(18, 0)), N'MLFT101', N'Thumb', N'All', N'MLFT101_detail6_x87.jpg', 6, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1243 AS Numeric(18, 0)), N'MLFT101', N'Thumb', N'All', N'MLFT101_detail7_x87.jpg', 7, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1244 AS Numeric(18, 0)), N'MLFT101', N'Detail', N'All', N'MLFT101_detail1.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1245 AS Numeric(18, 0)), N'MLFT101', N'Detail', N'All', N'MLFT101_detail2.jpg', 2, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1246 AS Numeric(18, 0)), N'MLFT101', N'Detail', N'All', N'MLFT101_Detail3.jpg', 3, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1247 AS Numeric(18, 0)), N'MLFT101', N'Detail', N'All', N'MLFT101_detail4.jpg', 4, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1248 AS Numeric(18, 0)), N'MLFT101', N'Detail', N'All', N'MLFT101_detail5.jpg', 5, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1249 AS Numeric(18, 0)), N'MLFT101', N'Detail', N'All', N'MLFT101_detail6.jpg', 6, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1250 AS Numeric(18, 0)), N'MLFT101', N'Detail', N'All', N'MLFT101_detail7.jpg', 7, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(345 AS Numeric(18, 0)), N'LGMP103', N'Rep', N'All', N'LGMP103_rep_x440.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(346 AS Numeric(18, 0)), N'LGMP103', N'Thumb', N'All', N'LGMP103_detail_x87.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(347 AS Numeric(18, 0)), N'LGMP103', N'Thumb', N'All', N'LGMP103_rep_x87.jpg', 2, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(348 AS Numeric(18, 0)), N'LGMP103', N'Detail', N'All', N'LGMP103_detail_x800.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(349 AS Numeric(18, 0)), N'LGMP103', N'Detail', N'All', N'LGMP103_rep_x800.jpg', 2, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1284 AS Numeric(18, 0)), N'MLFT105', N'Rep', N'All', N'MLFT105_rep_x440.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1285 AS Numeric(18, 0)), N'MLFT105', N'Thumb', N'All', N'MLFT105-detail2_x87.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1286 AS Numeric(18, 0)), N'MLFT105', N'Thumb', N'All', N'MLFT105_detail1_x87.jpg', 2, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1287 AS Numeric(18, 0)), N'MLFT105', N'Thumb', N'All', N'MLFT105_detail3_x87.jpg', 3, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1288 AS Numeric(18, 0)), N'MLFT105', N'Thumb', N'All', N'MLFT105_detail4_x87.jpg', 4, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1289 AS Numeric(18, 0)), N'MLFT105', N'Thumb', N'All', N'MLFT105_rep_x87.jpg', 5, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1290 AS Numeric(18, 0)), N'MLFT105', N'Detail', N'All', N'MLFT105-detail2.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1291 AS Numeric(18, 0)), N'MLFT105', N'Detail', N'All', N'MLFT105_detail1.jpg', 2, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1292 AS Numeric(18, 0)), N'MLFT105', N'Detail', N'All', N'MLFT105_detail3.jpg', 3, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1293 AS Numeric(18, 0)), N'MLFT105', N'Detail', N'All', N'MLFT105_detail4.jpg', 4, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1294 AS Numeric(18, 0)), N'MLFT105', N'Detail', N'All', N'MLFT105_rep_x800.jpg', 5, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1370 AS Numeric(18, 0)), N'MLFT110', N'Rep', N'All', N'MLFT110_rep_x440.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1371 AS Numeric(18, 0)), N'MLFT110', N'Thumb', N'All', N'MLFT110_detail1_x87.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1372 AS Numeric(18, 0)), N'MLFT110', N'Thumb', N'All', N'MLFT110_detail2_x87.jpg', 2, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1373 AS Numeric(18, 0)), N'MLFT110', N'Thumb', N'All', N'MLFT110_rep_x87.jpg', 3, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1374 AS Numeric(18, 0)), N'MLFT110', N'Detail', N'All', N'MLFT110_detail1.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1375 AS Numeric(18, 0)), N'MLFT110', N'Detail', N'All', N'MLFT110_detail2.jpg', 2, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1376 AS Numeric(18, 0)), N'MLFT110', N'Detail', N'All', N'MLFT110_rep_x800.jpg', 3, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1382 AS Numeric(18, 0)), N'MLMH101', N'Rep', N'All', N'MLMH101_rep_x440.JPG', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1383 AS Numeric(18, 0)), N'MLMH101', N'Thumb', N'All', N'MLMH101_detail1_x87.JPG', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1384 AS Numeric(18, 0)), N'MLMH101', N'Thumb', N'All', N'MLMH101_detail2_x87.jpg', 2, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(385 AS Numeric(18, 0)), N'LGMH103', N'Rep', N'All', N'LGMH103_rep_x440.JPG', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(386 AS Numeric(18, 0)), N'LGMH103', N'Thumb', N'All', N'LGMH103_detail4_87.JPG', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(387 AS Numeric(18, 0)), N'LGMH103', N'Detail', N'All', N'LGMH103_detail4_x800.JPG', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(388 AS Numeric(18, 0)), N'LGMH104', N'Rep', N'All', N'LGMH104_rep_x440.JPG', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(389 AS Numeric(18, 0)), N'LGMH104', N'Thumb', N'All', N'LGMH104_detail1_x87.JPG', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(390 AS Numeric(18, 0)), N'LGMH104', N'Detail', N'All', N'LGMH104_detail1_x800.JPG', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(391 AS Numeric(18, 0)), N'LGMP101', N'Rep', N'All', N'LGMP101_rep_x440.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(392 AS Numeric(18, 0)), N'LGMP101', N'Thumb', N'All', N'LGMP101_rep_x87.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(393 AS Numeric(18, 0)), N'LGMP101', N'Thumb', N'All', N'LGMP101_detail._x87.jpg', 2, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(394 AS Numeric(18, 0)), N'LGMP101', N'Detail', N'All', N'LGMP101_rep_x800.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(395 AS Numeric(18, 0)), N'LGMP101', N'Detail', N'All', N'LGMP101_detail._x800.jpg', 2, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(396 AS Numeric(18, 0)), N'LGMP102', N'Rep', N'All', N'LGMP102_rep_x440.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(397 AS Numeric(18, 0)), N'LGMP102', N'Thumb', N'All', N'LGMP102_detail_x87.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(398 AS Numeric(18, 0)), N'LGMP102', N'Detail', N'All', N'LGMP102_detail_x800.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(399 AS Numeric(18, 0)), N'LGMP104', N'Rep', N'All', N'LGMP104_rep_x440.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(400 AS Numeric(18, 0)), N'LGMP104', N'Thumb', N'All', N'LGMP104_rep_x87.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(401 AS Numeric(18, 0)), N'LGMP104', N'Detail', N'All', N'LGMP104_rep_x800.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(402 AS Numeric(18, 0)), N'LGMP105', N'Rep', N'All', N'LGMP105_rep_x440.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(403 AS Numeric(18, 0)), N'LGMP105', N'Thumb', N'All', N'LGMP105_detail_x87.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(404 AS Numeric(18, 0)), N'LGMP105', N'Thumb', N'All', N'LGMP105_rep_x87.jpg', 2, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(405 AS Numeric(18, 0)), N'LGMP105', N'Detail', N'All', N'LGMP105_detail_x800.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(406 AS Numeric(18, 0)), N'LGMP105', N'Detail', N'All', N'LGMP105_rep_x800.jpg', 2, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(407 AS Numeric(18, 0)), N'LGMT102', N'Rep', N'All', N'LGMT102_rep_x440.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(408 AS Numeric(18, 0)), N'LGMT102', N'Thumb', N'All', N'LGMT102_detail1_x87.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(409 AS Numeric(18, 0)), N'LGMT102', N'Thumb', N'All', N'LGMT102_rep_x87.jpg', 2, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(410 AS Numeric(18, 0)), N'LGMT102', N'Detail', N'All', N'LGMT102_detail1_x800.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(411 AS Numeric(18, 0)), N'LGMT102', N'Detail', N'All', N'LGMT102_rep_x800.jpg', 2, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(412 AS Numeric(18, 0)), N'LGMT103', N'Rep', N'All', N'LGMT103_rep_x440.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(413 AS Numeric(18, 0)), N'LGMT103', N'Thumb', N'All', N'LGMT103_detail_87.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(414 AS Numeric(18, 0)), N'LGMT103', N'Thumb', N'All', N'LGMT103_rep_x87.jpg', 2, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(415 AS Numeric(18, 0)), N'LGMT103', N'Detail', N'All', N'LGMT103_detail_800.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(416 AS Numeric(18, 0)), N'LGMT103', N'Detail', N'All', N'LGMP103_rep_x800.jpg', 2, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(417 AS Numeric(18, 0)), N'LGMT104', N'Rep', N'All', N'LGMT104_rep_x440.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(418 AS Numeric(18, 0)), N'LGMT104', N'Thumb', N'All', N'LGMT104_detail_x87.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(419 AS Numeric(18, 0)), N'LGMT104', N'Thumb', N'All', N'LGMT104_rep_x87.jpg', 2, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(420 AS Numeric(18, 0)), N'LGMT104', N'Detail', N'All', N'LGMT104_detail_x800.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(421 AS Numeric(18, 0)), N'LGMT104', N'Detail', N'All', N'LGMT104_rep_x800.jpg', 2, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(422 AS Numeric(18, 0)), N'LGMT107', N'Rep', N'All', N'LGMT107_rep_x440.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(423 AS Numeric(18, 0)), N'LGMT107', N'Thumb', N'All', N'LGMT107_rep_x87.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(424 AS Numeric(18, 0)), N'LGMT107', N'Thumb', N'All', N'LGMT107_detail_x87.jpg', 2, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(425 AS Numeric(18, 0)), N'LGMT107', N'Detail', N'All', N'LGMT107_rep_x800.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(426 AS Numeric(18, 0)), N'LGMT107', N'Detail', N'All', N'LGMT107_detail_x800.jpg', 2, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1052 AS Numeric(18, 0)), N'MLMH103BLK', N'Rep', N'All', N'MLMH103_rep_x440.JPG', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1053 AS Numeric(18, 0)), N'MLMH103BLK', N'Thumb', N'All', N'MLMH103_detail1_x87.JPG', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1067 AS Numeric(18, 0)), N'MLMH103BRN', N'Rep', N'All', N'MLMH103-3_rep_x440.JPG', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(430 AS Numeric(18, 0)), N'LGMT110', N'Rep', N'All', N'LGMT110_rep_x440.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(431 AS Numeric(18, 0)), N'LGMT110', N'Thumb', N'All', N'LGMT110_detail_x87.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(432 AS Numeric(18, 0)), N'LGMT110', N'Thumb', N'All', N'LGMT110_rep_x87.jpg', 2, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(433 AS Numeric(18, 0)), N'LGMT110', N'Detail', N'All', N'LGMT110_detail_x800.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(434 AS Numeric(18, 0)), N'LGMT110', N'Detail', N'All', N'LGMT110_rep_x800.jpg', 2, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(435 AS Numeric(18, 0)), N'LGMT112', N'Rep', N'All', N'LGMT112_rep_x440.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(436 AS Numeric(18, 0)), N'LGMT112', N'Thumb', N'All', N'LGMT112_rep_x87.jpg', 1, N'YES')
GO
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(437 AS Numeric(18, 0)), N'LGMT112', N'Detail', N'All', N'LGMT112_rep_x800.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(438 AS Numeric(18, 0)), N'LGMT115', N'Rep', N'All', N'LGMT115_rep_x440.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(439 AS Numeric(18, 0)), N'LGMT115', N'Thumb', N'All', N'LGMT115_detail_x87.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(440 AS Numeric(18, 0)), N'LGMT115', N'Thumb', N'All', N'LGMT115_rep_x87.jpg', 2, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(441 AS Numeric(18, 0)), N'LGMT115', N'Detail', N'All', N'LGMT115_detail_x800.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(442 AS Numeric(18, 0)), N'LGMT115', N'Detail', N'All', N'LGMT115_rep_x800.jpg', 2, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(443 AS Numeric(18, 0)), N'LGMT116', N'Rep', N'All', N'LGMT116_rep_x440.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(444 AS Numeric(18, 0)), N'LGMT116', N'Thumb', N'All', N'LGMT116_rep_x87.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(445 AS Numeric(18, 0)), N'LGMT116', N'Detail', N'All', N'LGMT116_rep_x800.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1068 AS Numeric(18, 0)), N'MLMH103BRN', N'Thumb', N'All', N'MLMH103-3_detail1_x87.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1069 AS Numeric(18, 0)), N'MLMH103BRN', N'Thumb', N'All', N'MLMH103-3_detail2_x87.JPG', 2, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1093 AS Numeric(18, 0)), N'MLML101', N'Rep', N'All', N'MLML101-2_rep_x440.JPG', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(449 AS Numeric(18, 0)), N'MLML101BLK', N'Rep', N'All', N'MLML101-3_rep_x440.JPG', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(450 AS Numeric(18, 0)), N'MLML101BLK', N'Thumb', N'All', N'MLML101-3_detail2_x87.JPG', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(451 AS Numeric(18, 0)), N'MLML101BLK', N'Thumb', N'All', N'MLML101-3_detail1_x87.JPG', 2, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(452 AS Numeric(18, 0)), N'MLML101BLK', N'Detail', N'All', N'MLML101-3_detail2_x800.JPG', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(453 AS Numeric(18, 0)), N'MLML101BLK', N'Detail', N'All', N'MLML101-3_detail1_x800.JPG', 2, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1094 AS Numeric(18, 0)), N'MLML101', N'Thumb', N'All', N'MLML101-2_detail1_x87.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1095 AS Numeric(18, 0)), N'MLML101', N'Thumb', N'All', N'MLML101-2_detail2_x87.JPG', 2, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1096 AS Numeric(18, 0)), N'MLML101', N'Thumb', N'All', N'MLML101-2_detail3_x87.JPG', 3, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1097 AS Numeric(18, 0)), N'MLML101', N'Thumb', N'All', N'MLML101-2_detail4_x87.JPG', 4, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1098 AS Numeric(18, 0)), N'MLML101', N'Detail', N'All', N'MLML101-2_detail1_x800.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(462 AS Numeric(18, 0)), N'MLML102', N'Rep', N'All', N'MLML102_rep_x440.JPG', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(463 AS Numeric(18, 0)), N'MLML102', N'Thumb', N'All', N'MLML102_detail5_x87.JPG', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(464 AS Numeric(18, 0)), N'MLML102', N'Thumb', N'All', N'MLML102_detail4_x87.jpg', 2, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(465 AS Numeric(18, 0)), N'MLML102', N'Thumb', N'All', N'MLML102_detail3_x87.JPG', 3, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(466 AS Numeric(18, 0)), N'MLML102', N'Thumb', N'All', N'MLML102_detail2_x87.jpg', 4, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(467 AS Numeric(18, 0)), N'MLML102', N'Detail', N'All', N'MLML102_detail5_x800.JPG', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(468 AS Numeric(18, 0)), N'MLML102', N'Detail', N'All', N'MLML102_detail4_x800.jpg', 2, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(469 AS Numeric(18, 0)), N'MLML102', N'Detail', N'All', N'MLML102_detail3_x800.JPG', 3, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(470 AS Numeric(18, 0)), N'MLML102', N'Detail', N'All', N'MLML102_detail2_x800.jpg', 4, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1385 AS Numeric(18, 0)), N'MLMH101', N'Thumb', N'All', N'MLMH101_detail3_x87.jpg', 3, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1386 AS Numeric(18, 0)), N'MLMH101', N'Thumb', N'All', N'MLMH101_detail4_x87.JPG', 4, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1387 AS Numeric(18, 0)), N'MLMH101', N'Thumb', N'All', N'MLMH101_detail5_x87.jpg', 5, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1388 AS Numeric(18, 0)), N'MLMH101', N'Thumb', N'All', N'MLMH101_detail6_x87.JPG', 6, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1389 AS Numeric(18, 0)), N'MLMH101', N'Thumb', N'All', N'MLMH101_detail7_x87.JPG', 7, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1390 AS Numeric(18, 0)), N'MLMH101', N'Detail', N'All', N'MLMH101_detail1_x800.JPG', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(498 AS Numeric(18, 0)), N'MLMT101', N'Rep', N'All', N'MLMT101_rep_x440.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(499 AS Numeric(18, 0)), N'MLMT101', N'Thumb', N'All', N'MLMT101_detail_x87.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(500 AS Numeric(18, 0)), N'MLMT101', N'Thumb', N'All', N'MLMT101_rep_x87.jpg', 2, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(501 AS Numeric(18, 0)), N'MLMT101', N'Detail', N'All', N'MLMT101_detail_x800.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(502 AS Numeric(18, 0)), N'MLMT101', N'Detail', N'All', N'MLMT101_rep_x800.jpg', 2, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(503 AS Numeric(18, 0)), N'MLMT102', N'Rep', N'All', N'MLMT102_rep_x440.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(504 AS Numeric(18, 0)), N'MLMT102', N'Thumb', N'All', N'MLMT102_detail_x87.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(505 AS Numeric(18, 0)), N'MLMT102', N'Thumb', N'All', N'MLMT102_rep_x87.jpg', 2, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(506 AS Numeric(18, 0)), N'MLMT102', N'Detail', N'All', N'MLMT102_detail_x800.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(507 AS Numeric(18, 0)), N'MLMT102', N'Detail', N'All', N'MLMT102_rep_x800.jpg', 2, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1483 AS Numeric(18, 0)), N'MLMT106W', N'Rep', N'All', N'MLMT106W_rep_x440.JPG', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1484 AS Numeric(18, 0)), N'MLMT106W', N'Thumb', N'All', N'MLMT106W_detail1_x87.JPG', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1485 AS Numeric(18, 0)), N'MLMT106W', N'Thumb', N'All', N'MLMT106W_detail2_x87.JPG', 2, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1486 AS Numeric(18, 0)), N'MLMT106W', N'Thumb', N'All', N'MLMT106W_detail3_x87.JPG', 3, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1487 AS Numeric(18, 0)), N'MLMT106W', N'Thumb', N'All', N'MLMT106W_detail4_x87.JPG', 4, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1488 AS Numeric(18, 0)), N'MLMT106W', N'Thumb', N'All', N'MLMT106W_rep_x87.JPG', 5, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1489 AS Numeric(18, 0)), N'MLMT106W', N'Detail', N'All', N'MLMT106W_detail1_x800.JPG', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1490 AS Numeric(18, 0)), N'MLMT106W', N'Detail', N'All', N'MLMT106W_detail2_x800.JPG', 2, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1491 AS Numeric(18, 0)), N'MLMT106W', N'Detail', N'All', N'MLMT106W_detail3_x800.JPG', 3, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1664 AS Numeric(18, 0)), N'MLFH101', N'Rep', N'All', N'MLFH101_rep_x440.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1665 AS Numeric(18, 0)), N'MLFH101', N'Thumb', N'All', N'MLFH101_detail1_x87.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1666 AS Numeric(18, 0)), N'MLFH101', N'Thumb', N'All', N'MLFH101_detail2_x87.jpg', 2, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1667 AS Numeric(18, 0)), N'MLFH101', N'Thumb', N'All', N'MLFH101_detail3_x87.jpg', 3, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1668 AS Numeric(18, 0)), N'MLFH101', N'Thumb', N'All', N'MLFH101_detail4_x87.jpg', 4, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1669 AS Numeric(18, 0)), N'MLFH101', N'Thumb', N'All', N'MLFH101_detail5_x87.jpg', 5, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1670 AS Numeric(18, 0)), N'MLFH101', N'Thumb', N'All', N'MLFH101_detail6_x87.jpg', 6, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(542 AS Numeric(18, 0)), N'MLMT109', N'Rep', N'All', N'MLMT109_rep_x440.JPG', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(543 AS Numeric(18, 0)), N'MLMT109', N'Thumb', N'All', N'MLMT109_detail1_x87.JPG', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(544 AS Numeric(18, 0)), N'MLMT109', N'Thumb', N'All', N'MLMT109_detail2_x87.JPG', 2, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(545 AS Numeric(18, 0)), N'MLMT109', N'Thumb', N'All', N'MLMT109_detail3_x87.JPG', 3, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(546 AS Numeric(18, 0)), N'MLMT109', N'Thumb', N'All', N'MLMT109_detail4_x87.JPG', 4, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(547 AS Numeric(18, 0)), N'MLMT109', N'Thumb', N'All', N'MLMT109_rep_x87.JPG', 5, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(548 AS Numeric(18, 0)), N'MLMT109', N'Detail', N'All', N'MLMT109_detail1_x800.JPG', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(549 AS Numeric(18, 0)), N'MLMT109', N'Detail', N'All', N'MLMT109_detail2_x800.JPG', 2, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(550 AS Numeric(18, 0)), N'MLMT109', N'Detail', N'All', N'MLMT109_detail3_x800.JPG', 3, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(551 AS Numeric(18, 0)), N'MLMT109', N'Detail', N'All', N'MLMT109_detail4_x800.JPG', 4, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(552 AS Numeric(18, 0)), N'MLMT109', N'Detail', N'All', N'MLMT109_rep_x800.JPG', 5, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(579 AS Numeric(18, 0)), N'STYLE041', N'Rep', N'All', N'SHOT_35_017_2_x440.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(580 AS Numeric(18, 0)), N'STYLE041', N'Thumb', N'All', N'SHOT_35_022_2_x87.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(581 AS Numeric(18, 0)), N'STYLE041', N'Thumb', N'All', N'SHOT_35_017_2_x87.jpg', 2, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(582 AS Numeric(18, 0)), N'STYLE041', N'Detail', N'All', N'SHOT_35_022_2_x800.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(583 AS Numeric(18, 0)), N'STYLE041', N'Detail', N'All', N'SHOT_35_017_2_x800.jpg', 2, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(655 AS Numeric(18, 0)), N'STYLE041H', N'Rep', N'All', N'Love&Faith_back_Hootie_X440.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(656 AS Numeric(18, 0)), N'STYLE041H', N'Thumb', N'All', N'Love&faith_front_hoodie_x87.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(657 AS Numeric(18, 0)), N'STYLE041H', N'Thumb', N'All', N'Love&Faith_back_Hootie_X87.jpg', 2, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(658 AS Numeric(18, 0)), N'STYLE041H', N'Detail', N'All', N'Love&faith_front_hoodie_x800.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(659 AS Numeric(18, 0)), N'STYLE041H', N'Detail', N'All', N'Love&Faith_back_Hootie_x800.jpg', 2, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(695 AS Numeric(18, 0)), N'STYLE001', N'Rep', N'All', N'FF_SHOT_03_02_x440.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(696 AS Numeric(18, 0)), N'STYLE001', N'Thumb', N'All', N'FF_SHOT_03_19_x87.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(697 AS Numeric(18, 0)), N'STYLE001', N'Thumb', N'All', N'FF_SHOT_03_02_x87.jpg', 2, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(698 AS Numeric(18, 0)), N'STYLE001', N'Thumb', N'All', N'FF_SHOT_07_005_x87.jpg', 3, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(699 AS Numeric(18, 0)), N'STYLE001', N'Thumb', N'All', N'FF_SHOT_07_014_x87.jpg', 4, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(633 AS Numeric(18, 0)), N'Style040T', N'Rep', N'All', N'SHOT_25_001_x440.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(634 AS Numeric(18, 0)), N'Style040T', N'Thumb', N'All', N'SHOT_25_010_x87.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(635 AS Numeric(18, 0)), N'Style040T', N'Thumb', N'All', N'SHOT_25_001_x87.jpg', 2, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(636 AS Numeric(18, 0)), N'Style040T', N'Detail', N'All', N'SHOT_25_010_x800.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(637 AS Numeric(18, 0)), N'Style040T', N'Detail', N'All', N'SHOT_25_001_x800.jpg', 2, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(647 AS Numeric(18, 0)), N'STYLE040L', N'Rep', N'All', N'SHOT_29_001_x440.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(648 AS Numeric(18, 0)), N'STYLE040L', N'Thumb', N'All', N'SHOT_29_009_x87.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(649 AS Numeric(18, 0)), N'STYLE040L', N'Thumb', N'All', N'SHOT_29_001_x87.jpg', 2, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(650 AS Numeric(18, 0)), N'STYLE040L', N'Detail', N'All', N'SHOT_29_009_x800.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(651 AS Numeric(18, 0)), N'STYLE040L', N'Detail', N'All', N'SHOT_29_001_x800.jpg', 2, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(700 AS Numeric(18, 0)), N'STYLE001', N'Detail', N'All', N'FF_SHOT_03_19_x800.jpg', 1, N'YES')
GO
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(701 AS Numeric(18, 0)), N'STYLE001', N'Detail', N'All', N'FF_SHOT_03_02_x800.jpg', 2, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(702 AS Numeric(18, 0)), N'STYLE001', N'Detail', N'All', N'FF_SHOT_07_005_x800.jpg', 3, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(703 AS Numeric(18, 0)), N'STYLE001', N'Detail', N'All', N'FF_SHOT_07_014_x800.jpg', 4, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(750 AS Numeric(18, 0)), N'STYLE001T', N'Rep', N'All', N'FF_SHOT_15_008_x440.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(751 AS Numeric(18, 0)), N'STYLE001T', N'Thumb', N'All', N'FF_SHOT_01_01_x87.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(752 AS Numeric(18, 0)), N'STYLE001T', N'Thumb', N'All', N'FF_SHOT_15_008_x87.jpg', 2, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(733 AS Numeric(18, 0)), N'Style004', N'Rep', N'All', N'FF_SHOT_09_013_x440.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(734 AS Numeric(18, 0)), N'Style004', N'Thumb', N'All', N'FF_SHOT_09_013_x87.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(735 AS Numeric(18, 0)), N'Style004', N'Detail', N'All', N'FF_SHOT_09_013_x800.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(721 AS Numeric(18, 0)), N'STYLE003', N'Rep', N'All', N'FF_SHOT_04_07_x440.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(722 AS Numeric(18, 0)), N'STYLE003', N'Thumb', N'All', N'FF_SHOT_04_07_x87.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(723 AS Numeric(18, 0)), N'STYLE003', N'Detail', N'All', N'FF_SHOT_04_07_x800.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(724 AS Numeric(18, 0)), N'STYLE002', N'Rep', N'All', N'FF_SHOT_02_07_x440.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(725 AS Numeric(18, 0)), N'STYLE002', N'Thumb', N'All', N'FF_SHOT_02_07_x87.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(726 AS Numeric(18, 0)), N'STYLE002', N'Detail', N'All', N'FF_SHOT_02_07_x800.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(753 AS Numeric(18, 0)), N'STYLE001T', N'Detail', N'All', N'FF_SHOT_01_01_x800.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(754 AS Numeric(18, 0)), N'STYLE001T', N'Detail', N'All', N'FF_SHOT_15_008_x800.jpg', 2, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(758 AS Numeric(18, 0)), N'LGMT106', N'Rep', N'All', N'LGMT106_rep_x440.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(759 AS Numeric(18, 0)), N'LGMT106', N'Thumb', N'All', N'LGMT106_detail_x87.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(760 AS Numeric(18, 0)), N'LGMT106', N'Thumb', N'All', N'LGMT106_rep_x87.jpg', 2, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(761 AS Numeric(18, 0)), N'LGMT106', N'Detail', N'All', N'LGMT106_detail_x800.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(762 AS Numeric(18, 0)), N'LGMT106', N'Detail', N'All', N'LGMT106_rep_x800.jpg', 2, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(842 AS Numeric(18, 0)), N'MLFB101', N'Rep', N'All', N'MLFT101_rep_x440.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(843 AS Numeric(18, 0)), N'MLFB101', N'Thumb', N'All', N'', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(844 AS Numeric(18, 0)), N'MLFB101', N'Detail', N'All', N'', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1391 AS Numeric(18, 0)), N'MLMH101', N'Detail', N'All', N'MLMH101_detail2_x800.jpg', 2, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1392 AS Numeric(18, 0)), N'MLMH101', N'Detail', N'All', N'MLMH101_detail3_x800.jpg', 3, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1393 AS Numeric(18, 0)), N'MLMH101', N'Detail', N'All', N'MLMH101_detail4_x800.JPG', 4, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1394 AS Numeric(18, 0)), N'MLMH101', N'Detail', N'All', N'MLMH101_detail5_x800.jpg', 5, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1395 AS Numeric(18, 0)), N'MLMH101', N'Detail', N'All', N'MLMH101_detail6_x800.JPG', 6, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1396 AS Numeric(18, 0)), N'MLMH101', N'Detail', N'All', N'MLMH101_detail7_x800.JPG', 7, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1397 AS Numeric(18, 0)), N'MLMH102', N'Rep', N'All', N'MLMH102_rep_x440.JPG', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1398 AS Numeric(18, 0)), N'MLMH102', N'Thumb', N'All', N'MLMH102_detail1_x87.JPG', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1399 AS Numeric(18, 0)), N'MLMH102', N'Thumb', N'All', N'MLMH102_detail2_x87.JPG', 2, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1400 AS Numeric(18, 0)), N'MLMH102', N'Thumb', N'All', N'MLMH102_detail3_x87.jpg', 3, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1401 AS Numeric(18, 0)), N'MLMH102', N'Thumb', N'All', N'MLMH102_detail4_x87.JPG', 4, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1402 AS Numeric(18, 0)), N'MLMH102', N'Thumb', N'All', N'MLMH102_detail5_x87.jpg', 5, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1403 AS Numeric(18, 0)), N'MLMH102', N'Thumb', N'All', N'MLMH102_detail6_x87.JPG', 6, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1404 AS Numeric(18, 0)), N'MLMH102', N'Thumb', N'All', N'MLMH102_detail7_x87.jpg', 7, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1405 AS Numeric(18, 0)), N'MLMH102', N'Detail', N'All', N'MLMH102_detail1_x800.JPG', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1406 AS Numeric(18, 0)), N'MLMH102', N'Detail', N'All', N'MLMH102_detail2_x800.JPG', 2, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1407 AS Numeric(18, 0)), N'MLMH102', N'Detail', N'All', N'MLMH102_detail3_x800.jpg', 3, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1408 AS Numeric(18, 0)), N'MLMH102', N'Detail', N'All', N'MLMH102_detail4_x800.JPG', 4, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1409 AS Numeric(18, 0)), N'MLMH102', N'Detail', N'All', N'MLMH102_detail5_x800.jpg', 5, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1410 AS Numeric(18, 0)), N'MLMH102', N'Detail', N'All', N'MLMH102_detail6_x800.JPG', 6, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1411 AS Numeric(18, 0)), N'MLMH102', N'Detail', N'All', N'MLMH102_detail7_x800.jpg', 7, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1434 AS Numeric(18, 0)), N'MLML103S', N'Rep', N'All', N'MLML103S_rep_x440.JPG', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1435 AS Numeric(18, 0)), N'MLML103S', N'Thumb', N'All', N'MLML103S_detail5_x87.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1436 AS Numeric(18, 0)), N'MLML103S', N'Thumb', N'All', N'MLML103S_Detail4_x87.JPG', 2, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1437 AS Numeric(18, 0)), N'MLML103S', N'Thumb', N'All', N'MLML103S_detail3_x87.JPG', 3, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(675 AS Numeric(18, 0)), N'STYLE001L', N'Rep', N'All', N'FF_SHOT_03_02_x440.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(676 AS Numeric(18, 0)), N'STYLE001L', N'Thumb', N'All', N'FF_SHOT_01_01_x87.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(677 AS Numeric(18, 0)), N'STYLE001L', N'Thumb', N'All', N'FF_SHOT_03_19_x87.jpg', 2, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(628 AS Numeric(18, 0)), N'STYLE021H', N'Rep', N'All', N'LBMC_lipstick_back_hootie_x440.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(629 AS Numeric(18, 0)), N'STYLE021H', N'Thumb', N'All', N'LBMC_lipstick_back_hootie_x87.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(630 AS Numeric(18, 0)), N'STYLE021H', N'Thumb', N'All', N'LBMC_Lipstick_front_hootie_x87.jpg', 2, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(631 AS Numeric(18, 0)), N'STYLE021H', N'Detail', N'All', N'LBMC_lipstick_back_hootie_x800.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(632 AS Numeric(18, 0)), N'STYLE021H', N'Detail', N'All', N'LBMC_Lipstick_front_hootie_x800.jpg', 2, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(678 AS Numeric(18, 0)), N'STYLE001L', N'Thumb', N'All', N'FF_SHOT_03_02_x87.jpg', 3, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(679 AS Numeric(18, 0)), N'STYLE001L', N'Thumb', N'All', N'FF_SHOT_07_005_x87.jpg', 4, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(680 AS Numeric(18, 0)), N'STYLE001L', N'Thumb', N'All', N'FF_SHOT_07_014_x87.jpg', 5, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(681 AS Numeric(18, 0)), N'STYLE001L', N'Detail', N'All', N'FF_SHOT_01_01_x800.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(682 AS Numeric(18, 0)), N'STYLE001L', N'Detail', N'All', N'FF_SHOT_03_19_x800.jpg', 2, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(683 AS Numeric(18, 0)), N'STYLE001L', N'Detail', N'All', N'FF_SHOT_03_02_x800.jpg', 3, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(684 AS Numeric(18, 0)), N'STYLE001L', N'Detail', N'All', N'FF_SHOT_07_005_x800.jpg', 4, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(685 AS Numeric(18, 0)), N'STYLE001L', N'Detail', N'All', N'FF_SHOT_07_014_x800.jpg', 5, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(755 AS Numeric(18, 0)), N'LGMT105', N'Rep', N'All', N'LGMT105_rep_x440.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(756 AS Numeric(18, 0)), N'LGMT105', N'Thumb', N'All', N'LGMT105_rep_x87.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(757 AS Numeric(18, 0)), N'LGMT105', N'Detail', N'All', N'LGMT105_rep_x800.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1266 AS Numeric(18, 0)), N'MLFT103', N'Rep', N'All', N'MLFT103_rep._x440.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1267 AS Numeric(18, 0)), N'MLFT103', N'Thumb', N'All', N'MLFT103_detail1_x87.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1268 AS Numeric(18, 0)), N'MLFT103', N'Thumb', N'All', N'MLFT103_detail2_x87.jpg', 2, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1269 AS Numeric(18, 0)), N'MLFT103', N'Thumb', N'All', N'MLFT103_detail3_x87.jpg', 3, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1270 AS Numeric(18, 0)), N'MLFT103', N'Thumb', N'All', N'MLFT103_rep._x87.jpg', 4, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1271 AS Numeric(18, 0)), N'MLFT103', N'Detail', N'All', N'MLFT103_detail1.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1272 AS Numeric(18, 0)), N'MLFT103', N'Detail', N'All', N'MLFT103_detail2.jpg', 2, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1273 AS Numeric(18, 0)), N'MLFT103', N'Detail', N'All', N'MLFT103_detail3.jpg', 3, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1274 AS Numeric(18, 0)), N'MLFT103', N'Detail', N'All', N'MLFT103_rep._x800.jpg', 4, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1041 AS Numeric(18, 0)), N'MLMH103', N'Rep', N'All', N'MLMH103_rep2_x440.JPG', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1042 AS Numeric(18, 0)), N'MLMH103', N'Thumb', N'All', N'MLMH103-2_detail1_x87.JPG', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1043 AS Numeric(18, 0)), N'MLMH103', N'Thumb', N'All', N'MLMH103-2_detail2_x87.jpg', 2, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1044 AS Numeric(18, 0)), N'MLMH103', N'Thumb', N'All', N'MLMH103-2_detail3_x87.JPG', 3, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1045 AS Numeric(18, 0)), N'MLMH103', N'Thumb', N'All', N'MLMH103-2_detail4_x87.JPG', 4, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1046 AS Numeric(18, 0)), N'MLMH103', N'Thumb', N'All', N'MLMH103_rep2_x87.JPG', 5, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1047 AS Numeric(18, 0)), N'MLMH103', N'Detail', N'All', N'MLMH103-2_detail1_x800.JPG', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1048 AS Numeric(18, 0)), N'MLMH103', N'Detail', N'All', N'MLMH103-2_detail2_x800.jpg', 2, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1049 AS Numeric(18, 0)), N'MLMH103', N'Detail', N'All', N'MLMH103-2_detail3_x800.JPG', 3, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1050 AS Numeric(18, 0)), N'MLMH103', N'Detail', N'All', N'MLMH103-2_detail4_x800.JPG', 4, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1051 AS Numeric(18, 0)), N'MLMH103', N'Detail', N'All', N'MLMH103_rep2_x800.JPG', 5, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1164 AS Numeric(18, 0)), N'MLMT108BRN', N'Rep', N'All', N'MLMT108BN_rep_440.JPG', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1165 AS Numeric(18, 0)), N'MLMT108BRN', N'Thumb', N'All', N'MLMT108BN_detail1_x87.JPG', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1166 AS Numeric(18, 0)), N'MLMT108BRN', N'Thumb', N'All', N'MLMT108BN_detail2_x87.JPG', 2, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1167 AS Numeric(18, 0)), N'MLMT108BRN', N'Thumb', N'All', N'MLMT108BN_detail4_x87.JPG', 3, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1168 AS Numeric(18, 0)), N'MLMT108BRN', N'Detail', N'All', N'MLMT108BN_detail1_800x.JPG', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1169 AS Numeric(18, 0)), N'MLMT108BRN', N'Detail', N'All', N'MLMT108BN_detail2_x800.JPG', 2, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1170 AS Numeric(18, 0)), N'MLMT108BRN', N'Detail', N'All', N'MLMT108BN_detail4_x800.JPG', 3, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1197 AS Numeric(18, 0)), N'MLFH103', N'Rep', N'All', N'MLFH103_rep_x440.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1198 AS Numeric(18, 0)), N'MLFH103', N'Thumb', N'All', N'MLFH103_detail3_x87.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1199 AS Numeric(18, 0)), N'MLFH103', N'Thumb', N'All', N'MLFH103_detail4_x87.jpg', 2, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1200 AS Numeric(18, 0)), N'MLFH103', N'Thumb', N'All', N'MLFH103_detail5_x87.jpg', 3, N'YES')
GO
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1201 AS Numeric(18, 0)), N'MLFH103', N'Thumb', N'All', N'MLFH103_detail6_x87.jpg', 4, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1202 AS Numeric(18, 0)), N'MLFH103', N'Thumb', N'All', N'MLFH103_detail7_x87.jpg', 5, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1203 AS Numeric(18, 0)), N'MLFH103', N'Thumb', N'All', N'MLFH103_detail8_x87.jpg', 6, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1204 AS Numeric(18, 0)), N'MLFH103', N'Thumb', N'All', N'MLFH103_detail9_x87.jpg', 7, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1205 AS Numeric(18, 0)), N'MLFH103', N'Detail', N'All', N'MLFH103_detail3.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1206 AS Numeric(18, 0)), N'MLFH103', N'Detail', N'All', N'MLFH103_detail4.jpg', 2, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1207 AS Numeric(18, 0)), N'MLFH103', N'Detail', N'All', N'MLFH103_detail5.jpg', 3, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1208 AS Numeric(18, 0)), N'MLFH103', N'Detail', N'All', N'MLFH103_detail6.jpg', 4, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1209 AS Numeric(18, 0)), N'MLFH103', N'Detail', N'All', N'MLFH103_detail7.jpg', 5, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(590 AS Numeric(18, 0)), N'STYLE04V', N'Rep', N'All', N'SHOT_28_017_x440.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(591 AS Numeric(18, 0)), N'STYLE04V', N'Thumb', N'All', N'041_love_faith_front._x87.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(592 AS Numeric(18, 0)), N'STYLE04V', N'Thumb', N'All', N'SHOT_28_014_x87.jpg', 2, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(593 AS Numeric(18, 0)), N'STYLE04V', N'Thumb', N'All', N'SHOT_28_017_x87.jpg', 3, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(594 AS Numeric(18, 0)), N'STYLE04V', N'Detail', N'All', N'041_love_faith_front._x800.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(595 AS Numeric(18, 0)), N'STYLE04V', N'Detail', N'All', N'SHOT_28_014_x800.jpg', 2, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(596 AS Numeric(18, 0)), N'STYLE04V', N'Detail', N'All', N'SHOT_28_017_x800.jpg', 3, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(730 AS Numeric(18, 0)), N'STYLE002H', N'Rep', N'All', N'FF_SHOT_08_007_x440.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(731 AS Numeric(18, 0)), N'STYLE002H', N'Thumb', N'All', N'FF_SHOT_08_007_x87.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(732 AS Numeric(18, 0)), N'STYLE002H', N'Detail', N'All', N'FF_SHOT_08_007_x800.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(736 AS Numeric(18, 0)), N'STYLE005', N'Rep', N'All', N'FF_SHOT_06_04_x440.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(737 AS Numeric(18, 0)), N'STYLE005', N'Thumb', N'All', N'FF_SHOT_06_04_x87.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(738 AS Numeric(18, 0)), N'STYLE005', N'Thumb', N'All', N'FF_SHOT_06_14_x87.jpg', 2, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(739 AS Numeric(18, 0)), N'STYLE005', N'Thumb', N'All', N'FF_SHOT_11_013_x87.jpg', 3, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(620 AS Numeric(18, 0)), N'STYLE040H', N'Rep', N'All', N'LBMC_back_hootie_X440.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(621 AS Numeric(18, 0)), N'STYLE040H', N'Thumb', N'All', N'LBMC_Hootie_front_x87.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(622 AS Numeric(18, 0)), N'STYLE040H', N'Thumb', N'All', N'LBMC_back_hootie_X87.jpg', 2, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(623 AS Numeric(18, 0)), N'STYLE040H', N'Detail', N'All', N'LBMC_Hootie_front_x800.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(624 AS Numeric(18, 0)), N'STYLE040H', N'Detail', N'All', N'LBMC_back_hootie_X800.jpg', 2, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(641 AS Numeric(18, 0)), N'STYLE026', N'Rep', N'All', N'SHOT_26_006_x440.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(642 AS Numeric(18, 0)), N'STYLE026', N'Thumb', N'All', N'SHOT_26_006_x87.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(643 AS Numeric(18, 0)), N'STYLE026', N'Detail', N'All', N'SHOT_26_006_x800.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(740 AS Numeric(18, 0)), N'STYLE005', N'Detail', N'All', N'FF_SHOT_06_04_x800.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(741 AS Numeric(18, 0)), N'STYLE005', N'Detail', N'All', N'FF_SHOT_06_14_x800.jpg', 2, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(742 AS Numeric(18, 0)), N'STYLE005', N'Detail', N'All', N'FF_SHOT_11_013_x800.jpg', 3, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(743 AS Numeric(18, 0)), N'Style006', N'Rep', N'All', N'FF_SHOT_16_028_x440.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(744 AS Numeric(18, 0)), N'Style006', N'Thumb', N'All', N'FF_SHOT_16_028_x87.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(745 AS Numeric(18, 0)), N'Style006', N'Thumb', N'All', N'FF_SHOT_16_034_x87.jpg', 2, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(746 AS Numeric(18, 0)), N'Style006', N'Thumb', N'All', N'FF_SHOT_14_009_x87.jpg', 3, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(747 AS Numeric(18, 0)), N'Style006', N'Detail', N'All', N'FF_SHOT_16_028_x800.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(748 AS Numeric(18, 0)), N'Style006', N'Detail', N'All', N'FF_SHOT_16_034_x800.jpg', 2, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(749 AS Numeric(18, 0)), N'Style006', N'Detail', N'All', N'FF_SHOT_14_009_x800.jpg', 3, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1210 AS Numeric(18, 0)), N'MLFH103', N'Detail', N'All', N'MLFH103_detail8.jpg', 6, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1223 AS Numeric(18, 0)), N'MLFL102', N'Rep', N'All', N'MLFL102_Rep_x440.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1224 AS Numeric(18, 0)), N'MLFL102', N'Thumb', N'All', N'MLFL102_detail1_x87.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1225 AS Numeric(18, 0)), N'MLFL102', N'Thumb', N'All', N'MLFL102_detail2_x87.jpg', 2, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1226 AS Numeric(18, 0)), N'MLFL102', N'Thumb', N'All', N'MLFL102_detail3_x87.jpg', 3, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1227 AS Numeric(18, 0)), N'MLFL102', N'Thumb', N'All', N'MLFL102_detail4_x87.jpg', 4, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1228 AS Numeric(18, 0)), N'MLFL102', N'Thumb', N'All', N'MLFL102_detail5_x87.jpg', 5, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1229 AS Numeric(18, 0)), N'MLFL102', N'Thumb', N'All', N'MLFL102_Rep_x87.jpg', 6, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1230 AS Numeric(18, 0)), N'MLFL102', N'Detail', N'All', N'MLFL102_detail1.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1231 AS Numeric(18, 0)), N'MLFL102', N'Detail', N'All', N'MLFL102_detail2.jpg', 2, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1232 AS Numeric(18, 0)), N'MLFL102', N'Detail', N'All', N'MLFL102_detail3.jpg', 3, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1233 AS Numeric(18, 0)), N'MLFL102', N'Detail', N'All', N'MLFL102_detail4.jpg', 4, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1234 AS Numeric(18, 0)), N'MLFL102', N'Detail', N'All', N'MLFL102_detail5.jpg', 5, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1235 AS Numeric(18, 0)), N'MLFL102', N'Detail', N'All', N'MLFL102_Rep_x800.jpg', 6, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1251 AS Numeric(18, 0)), N'MLFT102', N'Rep', N'All', N'MLFT102_rep_x440.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1252 AS Numeric(18, 0)), N'MLFT102', N'Thumb', N'All', N'MLFT102_detail1_x87.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1253 AS Numeric(18, 0)), N'MLFT102', N'Thumb', N'All', N'MLFT102_detail3_x87.jpg', 2, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1254 AS Numeric(18, 0)), N'MLFT102', N'Thumb', N'All', N'MLFT102_detail4_x87.jpg', 3, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1255 AS Numeric(18, 0)), N'MLFT102', N'Thumb', N'All', N'MLFT102_detail5_x87.jpg', 4, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1256 AS Numeric(18, 0)), N'MLFT102', N'Thumb', N'All', N'MLFT102_detail6_x87.jpg', 5, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1257 AS Numeric(18, 0)), N'MLFT102', N'Thumb', N'All', N'MLFT102_detail8_x87.jpg', 6, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1258 AS Numeric(18, 0)), N'MLFT102', N'Thumb', N'All', N'MLFT102_detail9_x87.jpg', 7, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1259 AS Numeric(18, 0)), N'MLFT102', N'Detail', N'All', N'MLFT102_detail1.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1260 AS Numeric(18, 0)), N'MLFT102', N'Detail', N'All', N'MLFT102_detail3.jpg', 2, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1261 AS Numeric(18, 0)), N'MLFT102', N'Detail', N'All', N'MLFT102_detail4.jpg', 3, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1262 AS Numeric(18, 0)), N'MLFT102', N'Detail', N'All', N'MLFT102_detail5.jpg', 4, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1263 AS Numeric(18, 0)), N'MLFT102', N'Detail', N'All', N'MLFT102_detail6.jpg', 5, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1264 AS Numeric(18, 0)), N'MLFT102', N'Detail', N'All', N'MLFT102_detail8.jpg', 6, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1265 AS Numeric(18, 0)), N'MLFT102', N'Detail', N'All', N'MLFT102_detail9.jpg', 7, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1445 AS Numeric(18, 0)), N'MLML103', N'Rep', N'All', N'MLML103_Rep_x440.JPG', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1446 AS Numeric(18, 0)), N'MLML103', N'Thumb', N'All', N'MLML103_detail1_x87.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1447 AS Numeric(18, 0)), N'MLML103', N'Thumb', N'All', N'MLML103_detail2_x87..JPG', 2, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1448 AS Numeric(18, 0)), N'MLML103', N'Thumb', N'All', N'MLML103_detail3_x87.jpg', 3, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1449 AS Numeric(18, 0)), N'MLML103', N'Thumb', N'All', N'MLML103_detail4_x87.JPG', 4, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1450 AS Numeric(18, 0)), N'MLML103', N'Thumb', N'All', N'MLML103_detail5_x87.jpg', 5, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1451 AS Numeric(18, 0)), N'MLML103', N'Detail', N'All', N'MLML103_detail1_x800.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1452 AS Numeric(18, 0)), N'MLML103', N'Detail', N'All', N'MLML103_detail2_x800.JPG', 2, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1453 AS Numeric(18, 0)), N'MLML103', N'Detail', N'All', N'MLML103_detail3_x800.jpg', 3, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1454 AS Numeric(18, 0)), N'MLML103', N'Detail', N'All', N'MLML103_detail4_x800.JPG', 4, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1455 AS Numeric(18, 0)), N'MLML103', N'Detail', N'All', N'MLML103S_detail5_x800.jpg', 5, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1644 AS Numeric(18, 0)), N'MLFH102', N'Rep', N'All', N'MLFH102_rep_x440.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1645 AS Numeric(18, 0)), N'MLFH102', N'Thumb', N'All', N'MLFH102_detail1x87.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1646 AS Numeric(18, 0)), N'MLFH102', N'Thumb', N'All', N'MLFH102_detail2_x87.jpg', 2, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1054 AS Numeric(18, 0)), N'MLMH103BLK', N'Thumb', N'All', N'MLMH103_detail2_x87.jpg', 2, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1055 AS Numeric(18, 0)), N'MLMH103BLK', N'Thumb', N'All', N'MLMH103_detail3_x87.JPG', 3, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1056 AS Numeric(18, 0)), N'MLMH103BLK', N'Thumb', N'All', N'MLMH103_detail4_x87.jpg', 4, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1057 AS Numeric(18, 0)), N'MLMH103BLK', N'Thumb', N'All', N'MLMH103_detail5_x87.JPG', 5, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1058 AS Numeric(18, 0)), N'MLMH103BLK', N'Thumb', N'All', N'MLMH103_detail6_x87.jpg', 6, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1059 AS Numeric(18, 0)), N'MLMH103BLK', N'Thumb', N'All', N'MLMH103_detail7_x87.jpg', 7, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1060 AS Numeric(18, 0)), N'MLMH103BLK', N'Detail', N'All', N'MLMH103_detail1_x800.JPG', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1061 AS Numeric(18, 0)), N'MLMH103BLK', N'Detail', N'All', N'MLMH103_detail2_x800.jpg', 2, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1062 AS Numeric(18, 0)), N'MLMH103BLK', N'Detail', N'All', N'MLMH103_detail3_x800.JPG', 3, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1063 AS Numeric(18, 0)), N'MLMH103BLK', N'Detail', N'All', N'MLMH103_detail4_x800.jpg', 4, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1064 AS Numeric(18, 0)), N'MLMH103BLK', N'Detail', N'All', N'MLMH103_detail5_x800.JPG', 5, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1065 AS Numeric(18, 0)), N'MLMH103BLK', N'Detail', N'All', N'MLMH103_detail6_x800.jpg', 6, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1066 AS Numeric(18, 0)), N'MLMH103BLK', N'Detail', N'All', N'MLMH103_detail7_x800.jpg', 7, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1070 AS Numeric(18, 0)), N'MLMH103BRN', N'Thumb', N'All', N'MLMH103-3_detail3_x87.jpg', 3, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1071 AS Numeric(18, 0)), N'MLMH103BRN', N'Thumb', N'All', N'MLMH103-3_detail4_x88.jpg', 4, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1079 AS Numeric(18, 0)), N'MLMH103BRN', N'Detail', N'All', N'MLMH103-3_detail6_x800.JPG', 6, N'YES')
GO
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1087 AS Numeric(18, 0)), N'MLMH104', N'Detail', N'All', N'MLMH104_detail1_x800.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1088 AS Numeric(18, 0)), N'MLMH104', N'Detail', N'All', N'MLMH104_detail2_x800.JPG', 2, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1089 AS Numeric(18, 0)), N'MLMH104', N'Detail', N'All', N'MLMH104_detail3_x800.jpg', 3, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1090 AS Numeric(18, 0)), N'MLMH104', N'Detail', N'All', N'MLMH104_detail4_x800.JPG', 4, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1091 AS Numeric(18, 0)), N'MLMH104', N'Detail', N'All', N'MLMH104_detail5_800.jpg', 5, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1092 AS Numeric(18, 0)), N'MLMH104', N'Detail', N'All', N'MLMH104_detail6_x800.JPG', 6, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1647 AS Numeric(18, 0)), N'MLFH102', N'Thumb', N'All', N'MLFH102_detail3_x87.jpg', 3, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1648 AS Numeric(18, 0)), N'MLFH102', N'Thumb', N'All', N'MLFH102_detail4_x87.jpg', 4, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1649 AS Numeric(18, 0)), N'MLFH102', N'Thumb', N'All', N'MLFH102_detail5_x87.jpg', 5, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1650 AS Numeric(18, 0)), N'MLFH102', N'Detail', N'All', N'MLFH102_detail1.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1651 AS Numeric(18, 0)), N'MLFH102', N'Detail', N'All', N'MLFH102_detail2.jpg', 2, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1652 AS Numeric(18, 0)), N'MLFH102', N'Detail', N'All', N'MLFH102_detail3.jpg', 3, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1653 AS Numeric(18, 0)), N'MLFH102', N'Detail', N'All', N'MLFH102_detail4.jpg', 4, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1654 AS Numeric(18, 0)), N'MLFH102', N'Detail', N'All', N'MLFH102_detail5.jpg', 5, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1456 AS Numeric(18, 0)), N'MLML103W', N'Rep', N'All', N'MLML103W_rep_x440.JPG', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1457 AS Numeric(18, 0)), N'MLML103W', N'Thumb', N'All', N'MLML103W_detail4_x87.JPG', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1458 AS Numeric(18, 0)), N'MLML103W', N'Thumb', N'All', N'MLML103W_detail3_x87.jpg', 2, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1459 AS Numeric(18, 0)), N'MLML103W', N'Thumb', N'All', N'MLML103W_detail2_x87.JPG', 3, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1460 AS Numeric(18, 0)), N'MLML103W', N'Thumb', N'All', N'MLML103W_detail1_x87.jpg', 4, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1461 AS Numeric(18, 0)), N'MLML103W', N'Detail', N'All', N'MLML103W_detail4_x800_2.JPG', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1462 AS Numeric(18, 0)), N'MLML103W', N'Detail', N'All', N'MLML103W_detail3_x800.jpg', 2, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1463 AS Numeric(18, 0)), N'MLML103W', N'Detail', N'All', N'MLML103W_detail2_x800.JPG', 3, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1464 AS Numeric(18, 0)), N'MLML103W', N'Detail', N'All', N'MLML103W_detail1_x800.jpg', 4, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1492 AS Numeric(18, 0)), N'MLMT106W', N'Detail', N'All', N'MLMT106W_detail4_x800.JPG', 4, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1493 AS Numeric(18, 0)), N'MLMT106W', N'Detail', N'All', N'MLMT106W_rep_x800.JPG', 5, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1521 AS Numeric(18, 0)), N'MLFL101', N'Rep', N'All', N'MLFL101_Chelsea_440.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1522 AS Numeric(18, 0)), N'MLFL101', N'Thumb', N'All', N'MLFL101_chelsea_back_87.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1523 AS Numeric(18, 0)), N'MLFL101', N'Thumb', N'All', N'MLFL101_detail1_x87.jpg', 2, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1524 AS Numeric(18, 0)), N'MLFL101', N'Thumb', N'All', N'MLFL101_detail2_x87.jpg', 3, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1525 AS Numeric(18, 0)), N'MLFL101', N'Thumb', N'All', N'MLFL101_detail3_x87.jpg', 4, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1526 AS Numeric(18, 0)), N'MLFL101', N'Thumb', N'All', N'MLFL101_detail4_x87.jpg', 5, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1527 AS Numeric(18, 0)), N'MLFL101', N'Detail', N'All', N'MLFL101_chelsea_back_800.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1528 AS Numeric(18, 0)), N'MLFL101', N'Detail', N'All', N'MLFL101_detail1.jpg', 2, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1529 AS Numeric(18, 0)), N'MLFL101', N'Detail', N'All', N'MLFL101_detail2.jpg', 3, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1530 AS Numeric(18, 0)), N'MLFL101', N'Detail', N'All', N'MLFL101_detail3.jpg', 4, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1531 AS Numeric(18, 0)), N'MLFL101', N'Detail', N'All', N'MLFL101_detail4.jpg', 5, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1573 AS Numeric(18, 0)), N'MLFT109', N'Rep', N'All', N'MLFT109_rep_x440.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1574 AS Numeric(18, 0)), N'MLFT109', N'Thumb', N'All', N'MLFT109_detail1_x87.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1575 AS Numeric(18, 0)), N'MLFT109', N'Thumb', N'All', N'MLFT108_detail3_x87.jpg', 2, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1576 AS Numeric(18, 0)), N'MLFT109', N'Thumb', N'All', N'MLFT108blk_chelsea_back_87.jpg', 3, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1577 AS Numeric(18, 0)), N'MLFT109', N'Thumb', N'All', N'MLFT108gr_chelseaback2_87.jpg', 4, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1578 AS Numeric(18, 0)), N'MLFT109', N'Thumb', N'All', N'MLFT108gr_chelseaback_87.jpg', 5, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1579 AS Numeric(18, 0)), N'MLFT109', N'Detail', N'All', N'MLFT109_detail1.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1580 AS Numeric(18, 0)), N'MLFT109', N'Detail', N'All', N'MLFT108_detail3.jpg', 2, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1581 AS Numeric(18, 0)), N'MLFT109', N'Detail', N'All', N'MLFT108blk_chelsea_back_800.jpg', 3, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1582 AS Numeric(18, 0)), N'MLFT109', N'Detail', N'All', N'MLFT108gr_chelseaback2_800.jpg', 4, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1583 AS Numeric(18, 0)), N'MLFT109', N'Detail', N'All', N'MLFT108gr_chelseaback_800.jpg', 5, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1099 AS Numeric(18, 0)), N'MLML101', N'Detail', N'All', N'MLML101-2_detail2_x800.JPG', 2, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1100 AS Numeric(18, 0)), N'MLML101', N'Detail', N'All', N'MLML101-2_detail3_x800.JPG', 3, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1101 AS Numeric(18, 0)), N'MLML101', N'Detail', N'All', N'MLML101-2_detail4_x800.JPG', 4, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1102 AS Numeric(18, 0)), N'MLML101GR', N'Rep', N'All', N'MLML101_rep_x440.JPG', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1103 AS Numeric(18, 0)), N'MLML101GR', N'Thumb', N'All', N'MLML101_detail1_x87.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1104 AS Numeric(18, 0)), N'MLML101GR', N'Thumb', N'All', N'MLML101_detail2_x87.JPG', 2, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1105 AS Numeric(18, 0)), N'MLML101GR', N'Thumb', N'All', N'MLML101_detail3_x87.jpg', 3, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1106 AS Numeric(18, 0)), N'MLML101GR', N'Thumb', N'All', N'MLML101_detail4_x87.JPG', 4, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1107 AS Numeric(18, 0)), N'MLML101GR', N'Thumb', N'All', N'MLML101_detail5_x87.JPG', 5, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1108 AS Numeric(18, 0)), N'MLML101GR', N'Detail', N'All', N'MLML101_detail1_x800.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1109 AS Numeric(18, 0)), N'MLML101GR', N'Detail', N'All', N'MLML101_detail2_x800.JPG', 2, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1110 AS Numeric(18, 0)), N'MLML101GR', N'Detail', N'All', N'MLML101_detail3_x800.jpg', 3, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1111 AS Numeric(18, 0)), N'MLML101GR', N'Detail', N'All', N'MLML101_detail4_x800.JPG', 4, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1112 AS Numeric(18, 0)), N'MLML101GR', N'Detail', N'All', N'MLML101_detail5_x800.JPG', 5, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1211 AS Numeric(18, 0)), N'MLFH103', N'Detail', N'All', N'MLFH103_detail9.jpg', 7, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1560 AS Numeric(18, 0)), N'MLFT108', N'Rep', N'All', N'MLFT108blk_chelsea_front_440.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1561 AS Numeric(18, 0)), N'MLFT108', N'Thumb', N'All', N'MLFT108_detail1_x87.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1562 AS Numeric(18, 0)), N'MLFT108', N'Thumb', N'All', N'MLFT108_detail3_x87.jpg', 2, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1563 AS Numeric(18, 0)), N'MLFT108', N'Thumb', N'All', N'MLFT108blk_chelsea_back_87.jpg', 3, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1564 AS Numeric(18, 0)), N'MLFT108', N'Thumb', N'All', N'MLFT108blk_chelsea_front2_87.jpg', 4, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1565 AS Numeric(18, 0)), N'MLFT108', N'Thumb', N'All', N'MLFT108gr_chelseaback2_87.jpg', 5, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1566 AS Numeric(18, 0)), N'MLFT108', N'Thumb', N'All', N'MLFT108gr_chelseaback_87.jpg', 6, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1567 AS Numeric(18, 0)), N'MLFT108', N'Detail', N'All', N'MLFT108_detail1.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1568 AS Numeric(18, 0)), N'MLFT108', N'Detail', N'All', N'MLFT108_detail3.jpg', 2, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1569 AS Numeric(18, 0)), N'MLFT108', N'Detail', N'All', N'MLFT108blk_chelsea_back_800.jpg', 3, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1570 AS Numeric(18, 0)), N'MLFT108', N'Detail', N'All', N'MLFT108blk_chelsea_front2_800.jpg', 4, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1571 AS Numeric(18, 0)), N'MLFT108', N'Detail', N'All', N'MLFT108gr_chelseaback2_800.jpg', 5, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1572 AS Numeric(18, 0)), N'MLFT108', N'Detail', N'All', N'MLFT108gr_chelseaback_800.jpg', 6, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1304 AS Numeric(18, 0)), N'MLFT107', N'Rep', N'All', N'MLFT107_rep_440.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1305 AS Numeric(18, 0)), N'MLFT107', N'Thumb', N'All', N'MLFT107_detail1_x87.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1306 AS Numeric(18, 0)), N'MLFT107', N'Thumb', N'All', N'MLFT107_detail2_x87.jpg', 2, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1307 AS Numeric(18, 0)), N'MLFT107', N'Thumb', N'All', N'MLFT107_detail3_x87.jpg', 3, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1308 AS Numeric(18, 0)), N'MLFT107', N'Thumb', N'All', N'MLFT107_rep_87.jpg', 4, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1309 AS Numeric(18, 0)), N'MLFT107', N'Detail', N'All', N'MLFT107_detail1.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1310 AS Numeric(18, 0)), N'MLFT107', N'Detail', N'All', N'MLFT107_detail2.jpg', 2, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1311 AS Numeric(18, 0)), N'MLFT107', N'Detail', N'All', N'MLFT107_detail3.jpg', 3, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1312 AS Numeric(18, 0)), N'MLFT107', N'Detail', N'All', N'MLFT107_rep_800.jpg', 4, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1470 AS Numeric(18, 0)), N'MLMT105', N'Rep', N'All', N'MLMT105W_rep_x440.JPG', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1471 AS Numeric(18, 0)), N'MLMT105', N'Thumb', N'All', N'MLMT105W_detail4_x87.JPG', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1472 AS Numeric(18, 0)), N'MLMT105', N'Thumb', N'All', N'MLMT105W_detail3_x87.JPG', 2, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1473 AS Numeric(18, 0)), N'MLMT105', N'Thumb', N'All', N'MLMT105w_detail2_x87.JPG', 3, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1474 AS Numeric(18, 0)), N'MLMT105', N'Thumb', N'All', N'MLMT105W_detail1_x87.jpg', 4, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1475 AS Numeric(18, 0)), N'MLMT105', N'Thumb', N'All', N'MLMT105B_detail6_x87.jpg', 5, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1476 AS Numeric(18, 0)), N'MLMT105', N'Thumb', N'All', N'MLMT105B_detail5_x87.JPG', 6, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1477 AS Numeric(18, 0)), N'MLMT105', N'Detail', N'All', N'MLMT105W_detail4_x800.JPG', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1478 AS Numeric(18, 0)), N'MLMT105', N'Detail', N'All', N'MLMT105W_detail3_x800.JPG', 2, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1479 AS Numeric(18, 0)), N'MLMT105', N'Detail', N'All', N'MLMT105w_detail2_x800.JPG', 3, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1480 AS Numeric(18, 0)), N'MLMT105', N'Detail', N'All', N'MLMT105W_detail1_x800.jpg', 4, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1481 AS Numeric(18, 0)), N'MLMT105', N'Detail', N'All', N'MLMT105B_detail6_x800.jpg', 5, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1482 AS Numeric(18, 0)), N'MLMT105', N'Detail', N'All', N'MLMT105B_detail5_x800.JPG', 6, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1438 AS Numeric(18, 0)), N'MLML103S', N'Thumb', N'All', N'MLML103S_detail2_x87.jpg', 4, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1439 AS Numeric(18, 0)), N'MLML103S', N'Thumb', N'All', N'MLML103S_detail1_x87.JPG', 5, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1440 AS Numeric(18, 0)), N'MLML103S', N'Detail', N'All', N'MLML103S_detail5_x800.jpg', 1, N'YES')
GO
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1441 AS Numeric(18, 0)), N'MLML103S', N'Detail', N'All', N'MLML103S_Detail4_x800.JPG', 2, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1442 AS Numeric(18, 0)), N'MLML103S', N'Detail', N'All', N'MLML103S_detail3_x800.JPG', 3, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1443 AS Numeric(18, 0)), N'MLML103S', N'Detail', N'All', N'MLML103S_detail2_x800.jpg', 4, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1444 AS Numeric(18, 0)), N'MLML103S', N'Detail', N'All', N'MLML103S_detail1_x800.JPG', 5, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1465 AS Numeric(18, 0)), N'MLMT103', N'Rep', N'All', N'MLMT103_rep_x440.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1466 AS Numeric(18, 0)), N'MLMT103', N'Thumb', N'All', N'MLMT103_detail_x87.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1467 AS Numeric(18, 0)), N'MLMT103', N'Thumb', N'All', N'MLMT103_rep_x87.jpg', 2, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1468 AS Numeric(18, 0)), N'MLMT103', N'Detail', N'All', N'MLMT103_detail_x800.jpg', 1, N'YES')
INSERT [dbo].[Pictures] ([SerialNo], [ProductNo], [Usage], [ColorName], [FileName], [DisplayOrder], [Status]) VALUES (CAST(1469 AS Numeric(18, 0)), N'MLMT103', N'Detail', N'All', N'MLMT103_rep_x800.jpg', 2, N'YES')
SET IDENTITY_INSERT [dbo].[Pictures] OFF
SET IDENTITY_INSERT [dbo].[ProductColor] ON 

INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(867 AS Numeric(18, 0)), N'MLFT102', N'Black', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(868 AS Numeric(18, 0)), N'MLFT102', N'Grey', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(869 AS Numeric(18, 0)), N'MLFT102', N'White', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(870 AS Numeric(18, 0)), N'MLFT103', N'Black', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(751 AS Numeric(18, 0)), N'MLFB101', N'White', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(212 AS Numeric(18, 0)), N'LGML101', N'Black', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(752 AS Numeric(18, 0)), N'MLFB101', N'Grey', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(213 AS Numeric(18, 0)), N'LGML101', N'Brown', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(214 AS Numeric(18, 0)), N'LGML101', N'Grey', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(215 AS Numeric(18, 0)), N'LGML101', N'White', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(241 AS Numeric(18, 0)), N'LGMT101', N'black', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(242 AS Numeric(18, 0)), N'LGMT101', N'white', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(723 AS Numeric(18, 0)), N'LGMT106', N'Black', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(724 AS Numeric(18, 0)), N'LGMT106', N'Blue', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(266 AS Numeric(18, 0)), N'LGMT108', N'Black', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(877 AS Numeric(18, 0)), N'MLFT107', N'Black', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(878 AS Numeric(18, 0)), N'MLFT107', N'White', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(914 AS Numeric(18, 0)), N'MLML103S', N'Black', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(915 AS Numeric(18, 0)), N'MLML103S', N'Blue', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(948 AS Numeric(18, 0)), N'MLFT108', N'Black', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(267 AS Numeric(18, 0)), N'LGMT108', N'Blue', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(268 AS Numeric(18, 0)), N'LGMT108', N'Brown', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(269 AS Numeric(18, 0)), N'LGMT108', N'White', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(916 AS Numeric(18, 0)), N'MLML103S', N'White', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(270 AS Numeric(18, 0)), N'LGMT109', N'Black', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(271 AS Numeric(18, 0)), N'LGMT109', N'Blue', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(272 AS Numeric(18, 0)), N'LGMT109', N'Brown', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(287 AS Numeric(18, 0)), N'LGMT111', N'black', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(288 AS Numeric(18, 0)), N'LGMT111', N'white', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(820 AS Numeric(18, 0)), N'MLML101', N'Black', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(821 AS Numeric(18, 0)), N'MLML101', N'Blue', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(822 AS Numeric(18, 0)), N'MLML101', N'White', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(823 AS Numeric(18, 0)), N'MLML101GR', N'Black', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(824 AS Numeric(18, 0)), N'MLML101GR', N'Blue', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(825 AS Numeric(18, 0)), N'MLML101GR', N'White', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(826 AS Numeric(18, 0)), N'MLML101GR', N'Grey', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(970 AS Numeric(18, 0)), N'MLFT106', N'Black', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(926 AS Numeric(18, 0)), N'MLMT103', N'White', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(512 AS Numeric(18, 0)), N'MLMT107', N'Black', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(513 AS Numeric(18, 0)), N'MLMT107', N'Blue', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(514 AS Numeric(18, 0)), N'MLMT107', N'Brown', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(515 AS Numeric(18, 0)), N'MLMT107', N'White', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(549 AS Numeric(18, 0)), N'STYLE041', N'Black', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(550 AS Numeric(18, 0)), N'STYLE041', N'Blue', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(551 AS Numeric(18, 0)), N'STYLE041', N'White', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(552 AS Numeric(18, 0)), N'STYLE041', N'Grey', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(553 AS Numeric(18, 0)), N'STYLE041', N'Purple', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(562 AS Numeric(18, 0)), N'STYLE04V', N'Black', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(563 AS Numeric(18, 0)), N'STYLE04V', N'Blue', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(564 AS Numeric(18, 0)), N'STYLE04V', N'White', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(565 AS Numeric(18, 0)), N'STYLE04V', N'Grey', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(616 AS Numeric(18, 0)), N'STYLE041H', N'Black', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(617 AS Numeric(18, 0)), N'STYLE041H', N'Grey', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(618 AS Numeric(18, 0)), N'STYLE041H', N'White', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(619 AS Numeric(18, 0)), N'STYLE041H', N'Black', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(620 AS Numeric(18, 0)), N'STYLE041H', N'Grey', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(621 AS Numeric(18, 0)), N'STYLE041H', N'White', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(581 AS Numeric(18, 0)), N'STYLE040H', N'Black', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(582 AS Numeric(18, 0)), N'STYLE040H', N'Blue', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(583 AS Numeric(18, 0)), N'STYLE040H', N'White', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(590 AS Numeric(18, 0)), N'Style040T', N'Black', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(591 AS Numeric(18, 0)), N'Style040T', N'White', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(600 AS Numeric(18, 0)), N'STYLE040L', N'Black', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(601 AS Numeric(18, 0)), N'STYLE040L', N'Blue', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(602 AS Numeric(18, 0)), N'STYLE040L', N'White', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(603 AS Numeric(18, 0)), N'STYLE040L', N'Grey', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(622 AS Numeric(18, 0)), N'STYLE041H', N'Black', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(623 AS Numeric(18, 0)), N'STYLE041H', N'Grey', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(624 AS Numeric(18, 0)), N'STYLE041H', N'White', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(625 AS Numeric(18, 0)), N'STYLE041H', N'Black', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(626 AS Numeric(18, 0)), N'STYLE041H', N'Grey', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(627 AS Numeric(18, 0)), N'STYLE041H', N'White', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(657 AS Numeric(18, 0)), N'STYLE001', N'Black', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(658 AS Numeric(18, 0)), N'STYLE001', N'Blue', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(659 AS Numeric(18, 0)), N'STYLE001', N'Purple', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(660 AS Numeric(18, 0)), N'STYLE001', N'Pink', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(661 AS Numeric(18, 0)), N'STYLE001', N'White', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(717 AS Numeric(18, 0)), N'STYLE001T', N'Black', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(718 AS Numeric(18, 0)), N'STYLE001T', N'Blue', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(719 AS Numeric(18, 0)), N'STYLE001T', N'Purple', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(720 AS Numeric(18, 0)), N'STYLE001T', N'Pink', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(721 AS Numeric(18, 0)), N'STYLE001T', N'White', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(685 AS Numeric(18, 0)), N'STYLE003', N'Black', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(686 AS Numeric(18, 0)), N'STYLE003', N'White', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(687 AS Numeric(18, 0)), N'STYLE003', N'Pink', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(688 AS Numeric(18, 0)), N'STYLE002', N'Black', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(689 AS Numeric(18, 0)), N'STYLE002', N'Blue', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(690 AS Numeric(18, 0)), N'STYLE002', N'White', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(691 AS Numeric(18, 0)), N'STYLE002', N'Pink', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(753 AS Numeric(18, 0)), N'MLFB101', N'Black', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(858 AS Numeric(18, 0)), N'MLFH103', N'Black', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(859 AS Numeric(18, 0)), N'MLFH103', N'White', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(949 AS Numeric(18, 0)), N'MLFT108', N'Grey', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(950 AS Numeric(18, 0)), N'MLFT108', N'White', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(871 AS Numeric(18, 0)), N'MLFT103', N'Grey', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(872 AS Numeric(18, 0)), N'MLFT103', N'White', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(917 AS Numeric(18, 0)), N'MLML103S', N'Grey', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(956 AS Numeric(18, 0)), N'MLFT104', N'Black', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(957 AS Numeric(18, 0)), N'MLFT104', N'White', CAST(0 AS Numeric(18, 0)), N'YES')
GO
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(918 AS Numeric(18, 0)), N'MLML103', N'Black', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(919 AS Numeric(18, 0)), N'MLML103', N'Blue', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(971 AS Numeric(18, 0)), N'MLFT106', N'White', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(920 AS Numeric(18, 0)), N'MLML103', N'White', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(921 AS Numeric(18, 0)), N'MLML103', N'Grey', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(927 AS Numeric(18, 0)), N'MLMT105', N'Black', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(928 AS Numeric(18, 0)), N'MLMT105', N'White', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(972 AS Numeric(18, 0)), N'MLFT106', N'Grey', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(973 AS Numeric(18, 0)), N'MLFH101', N'White', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(974 AS Numeric(18, 0)), N'MLFH101', N'Black', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(961 AS Numeric(18, 0)), N'MLFL101BLK', N'Black', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(962 AS Numeric(18, 0)), N'MLFL101BLK', N'White', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(461 AS Numeric(18, 0)), N'MLMH105', N'Black', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(462 AS Numeric(18, 0)), N'MLMH105', N'Blue', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(463 AS Numeric(18, 0)), N'MLMH105', N'White', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(464 AS Numeric(18, 0)), N'MLMH105', N'Grey', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(516 AS Numeric(18, 0)), N'MLMT108BLK', N'Black', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(517 AS Numeric(18, 0)), N'MLMT108BLK', N'Blue', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(518 AS Numeric(18, 0)), N'MLMT108BLK', N'Brown', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(519 AS Numeric(18, 0)), N'MLMT108BLK', N'Grey', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(520 AS Numeric(18, 0)), N'MLMT108BLK', N'White', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(702 AS Numeric(18, 0)), N'Style004', N'Black', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(703 AS Numeric(18, 0)), N'Style004', N'Blue', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(704 AS Numeric(18, 0)), N'Style004', N'Purple', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(705 AS Numeric(18, 0)), N'Style004', N'Pink', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(706 AS Numeric(18, 0)), N'Style004', N'White', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(804 AS Numeric(18, 0)), N'MLMH103', N'Black', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(805 AS Numeric(18, 0)), N'MLMH103', N'Gray', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(806 AS Numeric(18, 0)), N'MLMH103', N'Brown', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(807 AS Numeric(18, 0)), N'MLMH103', N'White', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(862 AS Numeric(18, 0)), N'MLFL102', N'Black', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(875 AS Numeric(18, 0)), N'MLFT105', N'Black', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(233 AS Numeric(18, 0)), N'LGMP103', N'Black', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(234 AS Numeric(18, 0)), N'LGMP103', N'Blue', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(235 AS Numeric(18, 0)), N'LGMP103', N'Brown', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(236 AS Numeric(18, 0)), N'LGMP103', N'White', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(863 AS Numeric(18, 0)), N'MLFL102', N'White', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(206 AS Numeric(18, 0)), N'LGMH103', N'Black', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(207 AS Numeric(18, 0)), N'LGMH103', N'Brown', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(208 AS Numeric(18, 0)), N'LGMH103', N'Grey', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(587 AS Numeric(18, 0)), N'STYLE021H', N'Black', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(588 AS Numeric(18, 0)), N'STYLE021H', N'White', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(589 AS Numeric(18, 0)), N'STYLE021H', N'Pink', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(896 AS Numeric(18, 0)), N'MLFT110', N'Olive', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(922 AS Numeric(18, 0)), N'MLML103W', N'Black', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(923 AS Numeric(18, 0)), N'MLML103W', N'Blue', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(924 AS Numeric(18, 0)), N'MLML103W', N'White', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(925 AS Numeric(18, 0)), N'MLML103W', N'Grey', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(929 AS Numeric(18, 0)), N'MLMT106W', N'Grey', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(930 AS Numeric(18, 0)), N'MLMT106W', N'White', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(931 AS Numeric(18, 0)), N'MLMT106W', N'Brown', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(76 AS Numeric(18, 0)), N'LGMB101', N'White', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(77 AS Numeric(18, 0)), N'LGMB101', N'Black', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(932 AS Numeric(18, 0)), N'MLMT106W', N'', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(849 AS Numeric(18, 0)), N'MLMT108BRN', N'Black', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(850 AS Numeric(18, 0)), N'MLMT108BRN', N'Blue', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(250 AS Numeric(18, 0)), N'LGMT104', N'Black', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(251 AS Numeric(18, 0)), N'LGMT104', N'Blue', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(252 AS Numeric(18, 0)), N'LGMT104', N'White', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(722 AS Numeric(18, 0)), N'LGMT105', N'Brown', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(851 AS Numeric(18, 0)), N'MLMT108BRN', N'Brown', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(852 AS Numeric(18, 0)), N'MLMT108BRN', N'Grey', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(853 AS Numeric(18, 0)), N'MLMT108BRN', N'White', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(968 AS Numeric(18, 0)), N'MLFH102', N'Black', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(417 AS Numeric(18, 0)), N'MLML102', N'Black', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(418 AS Numeric(18, 0)), N'MLML102', N'Blue', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(419 AS Numeric(18, 0)), N'MLML102', N'White', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(420 AS Numeric(18, 0)), N'MLML102', N'Grey', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(497 AS Numeric(18, 0)), N'MLMT101', N'Black', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(498 AS Numeric(18, 0)), N'MLMT101', N'Blue', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(499 AS Numeric(18, 0)), N'MLMT101', N'White', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(500 AS Numeric(18, 0)), N'MLMT101', N'Grey', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(969 AS Numeric(18, 0)), N'MLFH102', N'White', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(642 AS Numeric(18, 0)), N'STYLE001L', N'Black', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(643 AS Numeric(18, 0)), N'STYLE001L', N'Blue', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(644 AS Numeric(18, 0)), N'STYLE001L', N'Purple', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(645 AS Numeric(18, 0)), N'STYLE001L', N'Pink', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(646 AS Numeric(18, 0)), N'STYLE001L', N'White', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(647 AS Numeric(18, 0)), N'STYLE001L', N'Black', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(648 AS Numeric(18, 0)), N'STYLE001L', N'Blue', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(649 AS Numeric(18, 0)), N'STYLE001L', N'Purple', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(650 AS Numeric(18, 0)), N'STYLE001L', N'Pink', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(651 AS Numeric(18, 0)), N'STYLE001L', N'White', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(864 AS Numeric(18, 0)), N'MLFT101', N'White', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(865 AS Numeric(18, 0)), N'MLFT101', N'Black', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(866 AS Numeric(18, 0)), N'MLFT101', N'', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(900 AS Numeric(18, 0)), N'MLMH101', N'White', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(222 AS Numeric(18, 0)), N'LGMP101', N'Black', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(223 AS Numeric(18, 0)), N'LGMP101', N'White', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(292 AS Numeric(18, 0)), N'LGMT115', N'Khaki', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(293 AS Numeric(18, 0)), N'LGMT115', N'White', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(413 AS Numeric(18, 0)), N'MLML101BLK', N'Black', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(414 AS Numeric(18, 0)), N'MLML101BLK', N'Blue', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(415 AS Numeric(18, 0)), N'MLML101BLK', N'White', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(416 AS Numeric(18, 0)), N'MLML101BLK', N'Grey', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(594 AS Numeric(18, 0)), N'STYLE026', N'black', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(595 AS Numeric(18, 0)), N'STYLE026', N'white', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(901 AS Numeric(18, 0)), N'MLMH102', N'Black', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(902 AS Numeric(18, 0)), N'MLMH102', N'Gray', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(903 AS Numeric(18, 0)), N'MLMH102', N'Brown', CAST(0 AS Numeric(18, 0)), N'YES')
GO
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(904 AS Numeric(18, 0)), N'MLMH102', N'White', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(905 AS Numeric(18, 0)), N'MLMH102', N'', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(808 AS Numeric(18, 0)), N'MLMH103BLK', N'Black', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(809 AS Numeric(18, 0)), N'MLMH103BLK', N'Blue', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(810 AS Numeric(18, 0)), N'MLMH103BLK', N'Brown', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(811 AS Numeric(18, 0)), N'MLMH103BLK', N'White', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(816 AS Numeric(18, 0)), N'MLMH104', N'Black', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(817 AS Numeric(18, 0)), N'MLMH104', N'Blue', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(818 AS Numeric(18, 0)), N'MLMH104', N'Brown', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(819 AS Numeric(18, 0)), N'MLMH104', N'White', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(209 AS Numeric(18, 0)), N'LGMH104', N'Black', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(210 AS Numeric(18, 0)), N'LGMH104', N'Brown', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(211 AS Numeric(18, 0)), N'LGMH104', N'Grey', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(230 AS Numeric(18, 0)), N'LGMP102', N'Black', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(231 AS Numeric(18, 0)), N'LGMP102', N'Blue', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(232 AS Numeric(18, 0)), N'LGMP102', N'White', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(237 AS Numeric(18, 0)), N'LGMP104', N'Green', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(238 AS Numeric(18, 0)), N'LGMP105', N'Black', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(239 AS Numeric(18, 0)), N'LGMP105', N'Blue', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(240 AS Numeric(18, 0)), N'LGMP105', N'White', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(243 AS Numeric(18, 0)), N'LGMT102', N'Black', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(244 AS Numeric(18, 0)), N'LGMT102', N'Blue', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(245 AS Numeric(18, 0)), N'LGMT102', N'White', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(246 AS Numeric(18, 0)), N'LGMT103', N'white', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(253 AS Numeric(18, 0)), N'LGMT107', N'Black', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(254 AS Numeric(18, 0)), N'LGMT107', N'Blue', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(273 AS Numeric(18, 0)), N'LGMT110', N'Black', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(274 AS Numeric(18, 0)), N'LGMT110', N'Blue', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(289 AS Numeric(18, 0)), N'LGMT112', N'Black', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(290 AS Numeric(18, 0)), N'LGMT112', N'Blue', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(291 AS Numeric(18, 0)), N'LGMT112', N'Brown', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(294 AS Numeric(18, 0)), N'LGMT116', N'Black', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(295 AS Numeric(18, 0)), N'LGMT116', N'Blue', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(501 AS Numeric(18, 0)), N'MLMT102', N'Black', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(502 AS Numeric(18, 0)), N'MLMT102', N'Blue', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(526 AS Numeric(18, 0)), N'MLMT109', N'White-Grey', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(712 AS Numeric(18, 0)), N'Style006', N'Black', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(713 AS Numeric(18, 0)), N'Style006', N'Blue', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(714 AS Numeric(18, 0)), N'Style006', N'Purple', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(715 AS Numeric(18, 0)), N'Style006', N'Pink', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(716 AS Numeric(18, 0)), N'Style006', N'White', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(940 AS Numeric(18, 0)), N'MLFL101', N'Black', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(941 AS Numeric(18, 0)), N'MLFL101', N'White', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(951 AS Numeric(18, 0)), N'MLFT109', N'Black', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(952 AS Numeric(18, 0)), N'MLFT109', N'Grey', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(953 AS Numeric(18, 0)), N'MLFT109', N'White', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(697 AS Numeric(18, 0)), N'STYLE002H', N'Black', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(698 AS Numeric(18, 0)), N'STYLE002H', N'Blue', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(699 AS Numeric(18, 0)), N'STYLE002H', N'Purple', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(700 AS Numeric(18, 0)), N'STYLE002H', N'Pink', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(701 AS Numeric(18, 0)), N'STYLE002H', N'White', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(707 AS Numeric(18, 0)), N'STYLE005', N'Black', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(708 AS Numeric(18, 0)), N'STYLE005', N'Blue', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(709 AS Numeric(18, 0)), N'STYLE005', N'Purple', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(710 AS Numeric(18, 0)), N'STYLE005', N'Pink', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(711 AS Numeric(18, 0)), N'STYLE005', N'White', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(812 AS Numeric(18, 0)), N'MLMH103BRN', N'Black', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(813 AS Numeric(18, 0)), N'MLMH103BRN', N'Blue', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(814 AS Numeric(18, 0)), N'MLMH103BRN', N'Brown', CAST(0 AS Numeric(18, 0)), N'YES')
INSERT [dbo].[ProductColor] ([SerialNo], [ProductNo], [ColorName], [ColorStock], [ColorStatus]) VALUES (CAST(815 AS Numeric(18, 0)), N'MLMH103BRN', N'Grey', CAST(0 AS Numeric(18, 0)), N'YES')
SET IDENTITY_INSERT [dbo].[ProductColor] OFF
SET IDENTITY_INSERT [dbo].[ProductMaster] ON 

INSERT [dbo].[ProductMaster] ([SerialNo], [ProductNo], [BrandName], [Category], [Gender], [NewItem], [ExclusiveSales], [ProductName], [ModelName], [BriefDescription], [Description], [PriceRetail], [PriceRetailEvent1], [PriceRetailEvent2], [PriceWholesale1], [PriceWholesale2], [PriceWholesale3], [PriceWholesale4], [PriceWholesale5], [Stock], [Status], [WebDisplay], [DisplayOrder]) VALUES (CAST(1 AS Numeric(18, 0)), N'LGMB101', N'Legends of Style', N'T-Shirt(Basic)', N'Men', N'YES', N'Ordinary', N'Skull & Bones', N'Fall/Winter 2007', N'Skull and Bones 79', N'Water based ink prints, super vintage feel, silver foil printed front and back', 52.5, 0, 0, 21, 25, 0, 0, 0, CAST(0 AS Numeric(18, 0)), N'Retired', N'NO', NULL)
INSERT [dbo].[ProductMaster] ([SerialNo], [ProductNo], [BrandName], [Category], [Gender], [NewItem], [ExclusiveSales], [ProductName], [ModelName], [BriefDescription], [Description], [PriceRetail], [PriceRetailEvent1], [PriceRetailEvent2], [PriceWholesale1], [PriceWholesale2], [PriceWholesale3], [PriceWholesale4], [PriceWholesale5], [Stock], [Status], [WebDisplay], [DisplayOrder]) VALUES (CAST(3 AS Numeric(18, 0)), N'MLFT104', N'Motor City Legends', N'T-Shirt(Basic)', N'Women', N'YES', N'Ordinary', N'Rock Legends Crown with Wings', N'', N'', N'This Rock Legends with Crown with Wings.  The Swarovski crystals are hand placed.  The base 100% cotton shirt is hand dyed with vintage strips in the front and back.', 1, 0, 0, 48, 0, 0, 0, 0, CAST(0 AS Numeric(18, 0)), N'Live', N'YES', NULL)
INSERT [dbo].[ProductMaster] ([SerialNo], [ProductNo], [BrandName], [Category], [Gender], [NewItem], [ExclusiveSales], [ProductName], [ModelName], [BriefDescription], [Description], [PriceRetail], [PriceRetailEvent1], [PriceRetailEvent2], [PriceWholesale1], [PriceWholesale2], [PriceWholesale3], [PriceWholesale4], [PriceWholesale5], [Stock], [Status], [WebDisplay], [DisplayOrder]) VALUES (CAST(11 AS Numeric(18, 0)), N'MLFL101', N'Motor City Legends', N'Thermals', N'Women', N'YES', N'Ordinary', N'Skull and Bones Union Jack', N'', N'', N'Skull and Bones Union Jack with hand placed Swarovski crystals with red foil in the front and union jack flag foiled in blue.  Swarovski crystals placed on the sleeves as well as blue and red foil.', 150, 0, 0, 68, 0, 0, 0, 0, CAST(1 AS Numeric(18, 0)), N'Live', N'YES', NULL)
INSERT [dbo].[ProductMaster] ([SerialNo], [ProductNo], [BrandName], [Category], [Gender], [NewItem], [ExclusiveSales], [ProductName], [ModelName], [BriefDescription], [Description], [PriceRetail], [PriceRetailEvent1], [PriceRetailEvent2], [PriceWholesale1], [PriceWholesale2], [PriceWholesale3], [PriceWholesale4], [PriceWholesale5], [Stock], [Status], [WebDisplay], [DisplayOrder]) VALUES (CAST(5 AS Numeric(18, 0)), N'MLFH101', N'Motor City Legends', N'Hoodies', N'Women', N'YES', N'Ordinary', N'MCL Union Jack', N'', N'', N'This Rock Underground Union Jack with Skull and Bones is highlighted with Swarovski Crystal Stones in the British flag and the Skull.  All the stones are hand placed.  The Union Jack Crystal are also hand placed on the sleeves to create brillant sparkles.', 194, 0, 0, 88, 0, 0, 0, 0, CAST(2 AS Numeric(18, 0)), N'Live', N'YES', CAST(100 AS Numeric(18, 0)))
INSERT [dbo].[ProductMaster] ([SerialNo], [ProductNo], [BrandName], [Category], [Gender], [NewItem], [ExclusiveSales], [ProductName], [ModelName], [BriefDescription], [Description], [PriceRetail], [PriceRetailEvent1], [PriceRetailEvent2], [PriceWholesale1], [PriceWholesale2], [PriceWholesale3], [PriceWholesale4], [PriceWholesale5], [Stock], [Status], [WebDisplay], [DisplayOrder]) VALUES (CAST(7 AS Numeric(18, 0)), N'MLFH102', N'Motor City Legends', N'Hoodies', N'Women', N'YES', N'Ordinary', N'MCL Diamond and Cross with Swarovski Crystal', N'', N'', N'MCL Diamond and Cross with hand placed Swarovski crystals inside front small diamond print and inside back large diamond print.  Large Swarovski stones on both sleeves.  Silver foiled', 194, 0, 0, 88, 0, 0, 0, 0, CAST(1 AS Numeric(18, 0)), N'Live', N'YES', CAST(90 AS Numeric(18, 0)))
INSERT [dbo].[ProductMaster] ([SerialNo], [ProductNo], [BrandName], [Category], [Gender], [NewItem], [ExclusiveSales], [ProductName], [ModelName], [BriefDescription], [Description], [PriceRetail], [PriceRetailEvent1], [PriceRetailEvent2], [PriceWholesale1], [PriceWholesale2], [PriceWholesale3], [PriceWholesale4], [PriceWholesale5], [Stock], [Status], [WebDisplay], [DisplayOrder]) VALUES (CAST(12 AS Numeric(18, 0)), N'MLFH103', N'Motor City Legends', N'Hoodies', N'Women', N'YES', N'Ordinary', N'MCL 79 Diamonds and  Wings with Stones', N'', N'', N'MCL Diamond and Wings with hand placed Swarovski crystals inside front small diamond print and inside back large diamond print.  Large Swarovski stones on both sleeves.  Silver foiled', 194, 0, 0, 0, 0, 0, 0, 0, CAST(0 AS Numeric(18, 0)), N'Live', N'YES', NULL)
INSERT [dbo].[ProductMaster] ([SerialNo], [ProductNo], [BrandName], [Category], [Gender], [NewItem], [ExclusiveSales], [ProductName], [ModelName], [BriefDescription], [Description], [PriceRetail], [PriceRetailEvent1], [PriceRetailEvent2], [PriceWholesale1], [PriceWholesale2], [PriceWholesale3], [PriceWholesale4], [PriceWholesale5], [Stock], [Status], [WebDisplay], [DisplayOrder]) VALUES (CAST(13 AS Numeric(18, 0)), N'MLFL102', N'Motor City Legends', N'Thermals', N'Women', N'YES', N'Ordinary', N'MCL Motorcycle Club', N'', N'', N'MCL Motorcycle Club designed in the spirit of two wheeling freedom of the 50''s.  This thermal is accented by hand placed  Swarovski crystal on the sleeves and inside the banner on the back design.', 136, 0, 0, 62, 0, 0, 0, 0, CAST(1 AS Numeric(18, 0)), N'Live', N'YES', NULL)
INSERT [dbo].[ProductMaster] ([SerialNo], [ProductNo], [BrandName], [Category], [Gender], [NewItem], [ExclusiveSales], [ProductName], [ModelName], [BriefDescription], [Description], [PriceRetail], [PriceRetailEvent1], [PriceRetailEvent2], [PriceWholesale1], [PriceWholesale2], [PriceWholesale3], [PriceWholesale4], [PriceWholesale5], [Stock], [Status], [WebDisplay], [DisplayOrder]) VALUES (CAST(14 AS Numeric(18, 0)), N'MLFT102', N'Motor City Legends', N'T-Shirt(Basic)', N'Women', N'YES', N'Ordinary', N'Diamonds and Cross', N'', N'', N'MCL diamond front, sleeve and large diamond back.  The print is silver foiled on a  black shirt and gold foiled on a white shirt.', 62, 0, 0, 28, 0, 0, 0, 0, CAST(1 AS Numeric(18, 0)), N'Live', N'YES', NULL)
INSERT [dbo].[ProductMaster] ([SerialNo], [ProductNo], [BrandName], [Category], [Gender], [NewItem], [ExclusiveSales], [ProductName], [ModelName], [BriefDescription], [Description], [PriceRetail], [PriceRetailEvent1], [PriceRetailEvent2], [PriceWholesale1], [PriceWholesale2], [PriceWholesale3], [PriceWholesale4], [PriceWholesale5], [Stock], [Status], [WebDisplay], [DisplayOrder]) VALUES (CAST(15 AS Numeric(18, 0)), N'MLFT103', N'Motor City Legends', N'T-Shirt(Basic)', N'Women', N'YES', N'Ordinary', N'Skull and bones British Rock', N'', N'', N'Blue foiled Union Jack in the front and red foiled inscription " Live Hard"', 62, 0, 0, 28, 0, 0, 0, 0, CAST(1 AS Numeric(18, 0)), N'Live', N'YES', NULL)
INSERT [dbo].[ProductMaster] ([SerialNo], [ProductNo], [BrandName], [Category], [Gender], [NewItem], [ExclusiveSales], [ProductName], [ModelName], [BriefDescription], [Description], [PriceRetail], [PriceRetailEvent1], [PriceRetailEvent2], [PriceWholesale1], [PriceWholesale2], [PriceWholesale3], [PriceWholesale4], [PriceWholesale5], [Stock], [Status], [WebDisplay], [DisplayOrder]) VALUES (CAST(16 AS Numeric(18, 0)), N'MLFT105', N'Motor City Legends', N'T-Shirt(Basic)', N'Women', N'YES', N'Exclusive', N'MCL Motor Wings', N'', N'', N'MCL Motor Wings on a vintage hand dyed 100% cotton T-shirt. Silver foiled front and back.  Each shirt is custom made and has unique dye patterns.', 84, 0, 0, 38, 0, 0, 0, 0, CAST(1 AS Numeric(18, 0)), N'Live', N'YES', NULL)
INSERT [dbo].[ProductMaster] ([SerialNo], [ProductNo], [BrandName], [Category], [Gender], [NewItem], [ExclusiveSales], [ProductName], [ModelName], [BriefDescription], [Description], [PriceRetail], [PriceRetailEvent1], [PriceRetailEvent2], [PriceWholesale1], [PriceWholesale2], [PriceWholesale3], [PriceWholesale4], [PriceWholesale5], [Stock], [Status], [WebDisplay], [DisplayOrder]) VALUES (CAST(17 AS Numeric(18, 0)), N'MLFT106', N'Motor City Legends', N'T-Shirt(Basic)', N'Women', N'YES', N'Exclusive', N'MCL Skull and Bones', N'', N'', N'MCL Skull and Bones on a vintage hand dyed 100% cotton T-shirt. Silver foiled front, back and side.  Each shirt is custom made and has unique dye patterns.', 84, 0, 0, 38, 0, 0, 0, 0, CAST(1 AS Numeric(18, 0)), N'Live', N'YES', CAST(100 AS Numeric(18, 0)))
INSERT [dbo].[ProductMaster] ([SerialNo], [ProductNo], [BrandName], [Category], [Gender], [NewItem], [ExclusiveSales], [ProductName], [ModelName], [BriefDescription], [Description], [PriceRetail], [PriceRetailEvent1], [PriceRetailEvent2], [PriceWholesale1], [PriceWholesale2], [PriceWholesale3], [PriceWholesale4], [PriceWholesale5], [Stock], [Status], [WebDisplay], [DisplayOrder]) VALUES (CAST(18 AS Numeric(18, 0)), N'MLFT107', N'Motor City Legends', N'T-Shirt(Basic)', N'Women', N'YES', N'Ordinary', N'British Rock Suspenders', N'', N'', N'Skull and Union Jack printed and foiled in the front and faux suspenders front and back', 70, 0, 0, 32, 0, 0, 0, 0, CAST(1 AS Numeric(18, 0)), N'Live', N'YES', NULL)
INSERT [dbo].[ProductMaster] ([SerialNo], [ProductNo], [BrandName], [Category], [Gender], [NewItem], [ExclusiveSales], [ProductName], [ModelName], [BriefDescription], [Description], [PriceRetail], [PriceRetailEvent1], [PriceRetailEvent2], [PriceWholesale1], [PriceWholesale2], [PriceWholesale3], [PriceWholesale4], [PriceWholesale5], [Stock], [Status], [WebDisplay], [DisplayOrder]) VALUES (CAST(21 AS Numeric(18, 0)), N'MLMH101', N'Motor City Legends', N'Hoodies', N'Men', N'YES', N'Exclusive', N'Motorcycle Club', N'', N'', N'MCL Motorcycle Club with Swarovski Crystal on Sleeves.  Hand dyed', 195, 0, 0, 0, 0, 0, 0, 0, CAST(1 AS Numeric(18, 0)), N'Live', N'YES', NULL)
INSERT [dbo].[ProductMaster] ([SerialNo], [ProductNo], [BrandName], [Category], [Gender], [NewItem], [ExclusiveSales], [ProductName], [ModelName], [BriefDescription], [Description], [PriceRetail], [PriceRetailEvent1], [PriceRetailEvent2], [PriceWholesale1], [PriceWholesale2], [PriceWholesale3], [PriceWholesale4], [PriceWholesale5], [Stock], [Status], [WebDisplay], [DisplayOrder]) VALUES (CAST(22 AS Numeric(18, 0)), N'MLMH102', N'Motor City Legends', N'Hoodies', N'Men', N'YES', N'Ordinary', N'MCL Dragon', N'', N'', N'MCL Gold Foiled Dragon', 125, 0, 0, 0, 0, 0, 0, 0, CAST(600 AS Numeric(18, 0)), N'Live', N'YES', NULL)
INSERT [dbo].[ProductMaster] ([SerialNo], [ProductNo], [BrandName], [Category], [Gender], [NewItem], [ExclusiveSales], [ProductName], [ModelName], [BriefDescription], [Description], [PriceRetail], [PriceRetailEvent1], [PriceRetailEvent2], [PriceWholesale1], [PriceWholesale2], [PriceWholesale3], [PriceWholesale4], [PriceWholesale5], [Stock], [Status], [WebDisplay], [DisplayOrder]) VALUES (CAST(23 AS Numeric(18, 0)), N'MLMH103', N'Motor City Legends', N'Hoodies', N'Men', N'YES', N'Ordinary', N'MCL Motorcycle Club with Wings', N'', N'', N'MCL Motorcycle Club with Wings', 125, 0, 0, 0, 0, 0, 0, 0, CAST(600 AS Numeric(18, 0)), N'Live', N'YES', NULL)
INSERT [dbo].[ProductMaster] ([SerialNo], [ProductNo], [BrandName], [Category], [Gender], [NewItem], [ExclusiveSales], [ProductName], [ModelName], [BriefDescription], [Description], [PriceRetail], [PriceRetailEvent1], [PriceRetailEvent2], [PriceWholesale1], [PriceWholesale2], [PriceWholesale3], [PriceWholesale4], [PriceWholesale5], [Stock], [Status], [WebDisplay], [DisplayOrder]) VALUES (CAST(24 AS Numeric(18, 0)), N'LGMH103', N'Legends of Style', N'Hoodies', N'Men', N'YES', N'Ordinary', N'Legends 79 Skull and Bones with hand foiled highlights', N'', N'', N'Legends 79 Skull and Bones with hand foiled highlights', 110, 0, 0, 0, 0, 0, 0, 0, CAST(1 AS Numeric(18, 0)), N'Live', N'YES', NULL)
INSERT [dbo].[ProductMaster] ([SerialNo], [ProductNo], [BrandName], [Category], [Gender], [NewItem], [ExclusiveSales], [ProductName], [ModelName], [BriefDescription], [Description], [PriceRetail], [PriceRetailEvent1], [PriceRetailEvent2], [PriceWholesale1], [PriceWholesale2], [PriceWholesale3], [PriceWholesale4], [PriceWholesale5], [Stock], [Status], [WebDisplay], [DisplayOrder]) VALUES (CAST(25 AS Numeric(18, 0)), N'LGMH104', N'Legends of Style', N'Hoodies', N'Men', N'YES', N'Ordinary', N'Legends 79 Skull and Bones with hand foiled', N'', N'', N'Legends 79 Skull and Bones with hand foiled', 110, 0, 0, 0, 0, 0, 0, 0, CAST(1 AS Numeric(18, 0)), N'Live', N'YES', NULL)
INSERT [dbo].[ProductMaster] ([SerialNo], [ProductNo], [BrandName], [Category], [Gender], [NewItem], [ExclusiveSales], [ProductName], [ModelName], [BriefDescription], [Description], [PriceRetail], [PriceRetailEvent1], [PriceRetailEvent2], [PriceWholesale1], [PriceWholesale2], [PriceWholesale3], [PriceWholesale4], [PriceWholesale5], [Stock], [Status], [WebDisplay], [DisplayOrder]) VALUES (CAST(28 AS Numeric(18, 0)), N'LGMP102', N'Legends of Style', N'Polo', N'Men', N'YES', N'Ordinary', N'Skull MC Club', N'', N'', N'Skull Motorcycle Club is a water based ink print of tattoo like Skull bones and wings', 65, 0, 0, 0, 0, 0, 0, 0, CAST(1 AS Numeric(18, 0)), N'Live', N'YES', NULL)
INSERT [dbo].[ProductMaster] ([SerialNo], [ProductNo], [BrandName], [Category], [Gender], [NewItem], [ExclusiveSales], [ProductName], [ModelName], [BriefDescription], [Description], [PriceRetail], [PriceRetailEvent1], [PriceRetailEvent2], [PriceWholesale1], [PriceWholesale2], [PriceWholesale3], [PriceWholesale4], [PriceWholesale5], [Stock], [Status], [WebDisplay], [DisplayOrder]) VALUES (CAST(29 AS Numeric(18, 0)), N'LGMP103', N'Legends of Style', N'Polo', N'Men', N'YES', N'Ordinary', N'True Love', N'', N'', N'Vintage print of our Legends True Love design with hand drip paint accents', 65, 0, 0, 0, 0, 0, 0, 0, CAST(1 AS Numeric(18, 0)), N'Live', N'YES', NULL)
INSERT [dbo].[ProductMaster] ([SerialNo], [ProductNo], [BrandName], [Category], [Gender], [NewItem], [ExclusiveSales], [ProductName], [ModelName], [BriefDescription], [Description], [PriceRetail], [PriceRetailEvent1], [PriceRetailEvent2], [PriceWholesale1], [PriceWholesale2], [PriceWholesale3], [PriceWholesale4], [PriceWholesale5], [Stock], [Status], [WebDisplay], [DisplayOrder]) VALUES (CAST(30 AS Numeric(18, 0)), N'LGMP104', N'Legends of Style', N'Polo', N'Men', N'YES', N'Ordinary', N'Citizen of the World', N'', N'', N'This is a hand foiled crown and wings design called Citizen of the World', 75, 0, 0, 0, 0, 0, 0, 0, CAST(1 AS Numeric(18, 0)), N'Live', N'YES', NULL)
INSERT [dbo].[ProductMaster] ([SerialNo], [ProductNo], [BrandName], [Category], [Gender], [NewItem], [ExclusiveSales], [ProductName], [ModelName], [BriefDescription], [Description], [PriceRetail], [PriceRetailEvent1], [PriceRetailEvent2], [PriceWholesale1], [PriceWholesale2], [PriceWholesale3], [PriceWholesale4], [PriceWholesale5], [Stock], [Status], [WebDisplay], [DisplayOrder]) VALUES (CAST(31 AS Numeric(18, 0)), N'LGMP105', N'Legends of Style', N'Polo', N'Men', N'YES', N'Ordinary', N'Eagle, Snake, and Dagger', N'', N'', N'Polynesian tattoo style print of Eagle, Snake and Dagger with hand foiled design', 65, 0, 0, 0, 0, 0, 0, 0, CAST(1 AS Numeric(18, 0)), N'Live', N'YES', NULL)
INSERT [dbo].[ProductMaster] ([SerialNo], [ProductNo], [BrandName], [Category], [Gender], [NewItem], [ExclusiveSales], [ProductName], [ModelName], [BriefDescription], [Description], [PriceRetail], [PriceRetailEvent1], [PriceRetailEvent2], [PriceWholesale1], [PriceWholesale2], [PriceWholesale3], [PriceWholesale4], [PriceWholesale5], [Stock], [Status], [WebDisplay], [DisplayOrder]) VALUES (CAST(33 AS Numeric(18, 0)), N'LGMT102', N'Legends of Style', N'T-Shirt(Basic)', N'Men', N'YES', N'Ordinary', N'Legends 79', N'', N'', N'Legends of Style 79 with foiled prints', 45, 0, 0, 0, 0, 0, 0, 0, CAST(0 AS Numeric(18, 0)), N'Live', N'YES', NULL)
INSERT [dbo].[ProductMaster] ([SerialNo], [ProductNo], [BrandName], [Category], [Gender], [NewItem], [ExclusiveSales], [ProductName], [ModelName], [BriefDescription], [Description], [PriceRetail], [PriceRetailEvent1], [PriceRetailEvent2], [PriceWholesale1], [PriceWholesale2], [PriceWholesale3], [PriceWholesale4], [PriceWholesale5], [Stock], [Status], [WebDisplay], [DisplayOrder]) VALUES (CAST(34 AS Numeric(18, 0)), N'LGMT103', N'Legends of Style', N'T-Shirt(Basic)', N'Men', N'YES', N'Ordinary', N'Legends Bandit', N'', N'', N'Legends Bandit Print wih Gun and Bandana and Legends foil print', 45, 0, 0, 0, 0, 0, 0, 0, CAST(1 AS Numeric(18, 0)), N'Live', N'YES', NULL)
INSERT [dbo].[ProductMaster] ([SerialNo], [ProductNo], [BrandName], [Category], [Gender], [NewItem], [ExclusiveSales], [ProductName], [ModelName], [BriefDescription], [Description], [PriceRetail], [PriceRetailEvent1], [PriceRetailEvent2], [PriceWholesale1], [PriceWholesale2], [PriceWholesale3], [PriceWholesale4], [PriceWholesale5], [Stock], [Status], [WebDisplay], [DisplayOrder]) VALUES (CAST(36 AS Numeric(18, 0)), N'LGMT107', N'Motor City Legends', N'T-Shirt(Basic)', N'Men', N'YES', N'Ordinary', N'Motor City Legends', N'', N'', N'Motor City Legends Hand Foil Print', 45, 0, 0, 0, 0, 0, 0, 0, CAST(1 AS Numeric(18, 0)), N'Live', N'YES', NULL)
INSERT [dbo].[ProductMaster] ([SerialNo], [ProductNo], [BrandName], [Category], [Gender], [NewItem], [ExclusiveSales], [ProductName], [ModelName], [BriefDescription], [Description], [PriceRetail], [PriceRetailEvent1], [PriceRetailEvent2], [PriceWholesale1], [PriceWholesale2], [PriceWholesale3], [PriceWholesale4], [PriceWholesale5], [Stock], [Status], [WebDisplay], [DisplayOrder]) VALUES (CAST(37 AS Numeric(18, 0)), N'LGMT105', N'Legends of Style', N'T-Shirt(Basic)', N'Men', N'NO', N'Ordinary', N'Tokyo Tattoo', N'', N'', N'Tokyo Tattoo', 40, 0, 0, 0, 0, 0, 0, 0, CAST(1 AS Numeric(18, 0)), N'Retired', N'NO', NULL)
INSERT [dbo].[ProductMaster] ([SerialNo], [ProductNo], [BrandName], [Category], [Gender], [NewItem], [ExclusiveSales], [ProductName], [ModelName], [BriefDescription], [Description], [PriceRetail], [PriceRetailEvent1], [PriceRetailEvent2], [PriceWholesale1], [PriceWholesale2], [PriceWholesale3], [PriceWholesale4], [PriceWholesale5], [Stock], [Status], [WebDisplay], [DisplayOrder]) VALUES (CAST(38 AS Numeric(18, 0)), N'LGMT106', N'Legends of Style', N'T-Shirt(Basic)', N'Men', N'YES', N'Ordinary', N'Tokyo Tattoo', N'', N'', N'Tokyo Tattoo', 40, 0, 0, 0, 0, 0, 0, 0, CAST(1 AS Numeric(18, 0)), N'Live', N'YES', NULL)
INSERT [dbo].[ProductMaster] ([SerialNo], [ProductNo], [BrandName], [Category], [Gender], [NewItem], [ExclusiveSales], [ProductName], [ModelName], [BriefDescription], [Description], [PriceRetail], [PriceRetailEvent1], [PriceRetailEvent2], [PriceWholesale1], [PriceWholesale2], [PriceWholesale3], [PriceWholesale4], [PriceWholesale5], [Stock], [Status], [WebDisplay], [DisplayOrder]) VALUES (CAST(39 AS Numeric(18, 0)), N'LGMT108', N'Legends of Style', N'T-Shirt(Basic)', N'Men', N'YES', N'Ordinary', N'Snake Tattoo', N'', N'', N'Snake Tattoo', 55, 0, 0, 0, 0, 0, 0, 0, CAST(1 AS Numeric(18, 0)), N'Live', N'YES', NULL)
INSERT [dbo].[ProductMaster] ([SerialNo], [ProductNo], [BrandName], [Category], [Gender], [NewItem], [ExclusiveSales], [ProductName], [ModelName], [BriefDescription], [Description], [PriceRetail], [PriceRetailEvent1], [PriceRetailEvent2], [PriceWholesale1], [PriceWholesale2], [PriceWholesale3], [PriceWholesale4], [PriceWholesale5], [Stock], [Status], [WebDisplay], [DisplayOrder]) VALUES (CAST(40 AS Numeric(18, 0)), N'LGMT109', N'Legends of Style', N'T-Shirt(Basic)', N'Men', N'YES', N'Ordinary', N'True Love', N'', N'', N'True Love', 55, 0, 0, 0, 0, 0, 0, 0, CAST(0 AS Numeric(18, 0)), N'Live', N'YES', NULL)
INSERT [dbo].[ProductMaster] ([SerialNo], [ProductNo], [BrandName], [Category], [Gender], [NewItem], [ExclusiveSales], [ProductName], [ModelName], [BriefDescription], [Description], [PriceRetail], [PriceRetailEvent1], [PriceRetailEvent2], [PriceWholesale1], [PriceWholesale2], [PriceWholesale3], [PriceWholesale4], [PriceWholesale5], [Stock], [Status], [WebDisplay], [DisplayOrder]) VALUES (CAST(41 AS Numeric(18, 0)), N'LGMT110', N'Legends of Style', N'T-Shirt(Basic)', N'Men', N'YES', N'Ordinary', N'Motor City Club', N'', N'', N'Motor City Club', 40, 0, 0, 0, 0, 0, 0, 0, CAST(0 AS Numeric(18, 0)), N'Live', N'YES', NULL)
INSERT [dbo].[ProductMaster] ([SerialNo], [ProductNo], [BrandName], [Category], [Gender], [NewItem], [ExclusiveSales], [ProductName], [ModelName], [BriefDescription], [Description], [PriceRetail], [PriceRetailEvent1], [PriceRetailEvent2], [PriceWholesale1], [PriceWholesale2], [PriceWholesale3], [PriceWholesale4], [PriceWholesale5], [Stock], [Status], [WebDisplay], [DisplayOrder]) VALUES (CAST(42 AS Numeric(18, 0)), N'LGMT111', N'Legends of Style', N'T-Shirt(Basic)', N'Men', N'YES', N'Ordinary', N'One Rule MC Club', N'', N'', N'Legends Motorcycle Club Skulls and Bones hand foiled', 45, 0, 0, 0, 0, 0, 0, 0, CAST(0 AS Numeric(18, 0)), N'Live', N'YES', NULL)
INSERT [dbo].[ProductMaster] ([SerialNo], [ProductNo], [BrandName], [Category], [Gender], [NewItem], [ExclusiveSales], [ProductName], [ModelName], [BriefDescription], [Description], [PriceRetail], [PriceRetailEvent1], [PriceRetailEvent2], [PriceWholesale1], [PriceWholesale2], [PriceWholesale3], [PriceWholesale4], [PriceWholesale5], [Stock], [Status], [WebDisplay], [DisplayOrder]) VALUES (CAST(43 AS Numeric(18, 0)), N'LGMT112', N'Legends of Style', N'T-Shirt(Basic)', N'Men', N'YES', N'Ordinary', N'Skull and Bomes Crest', N'', N'', N'Skull and Bomes Crest with Hand Foil', 45, 0, 0, 0, 0, 0, 0, 0, CAST(1 AS Numeric(18, 0)), N'Live', N'YES', NULL)
INSERT [dbo].[ProductMaster] ([SerialNo], [ProductNo], [BrandName], [Category], [Gender], [NewItem], [ExclusiveSales], [ProductName], [ModelName], [BriefDescription], [Description], [PriceRetail], [PriceRetailEvent1], [PriceRetailEvent2], [PriceWholesale1], [PriceWholesale2], [PriceWholesale3], [PriceWholesale4], [PriceWholesale5], [Stock], [Status], [WebDisplay], [DisplayOrder]) VALUES (CAST(44 AS Numeric(18, 0)), N'LGMT115', N'Legends of Style', N'T-Shirt(Basic)', N'Men', N'YES', N'Ordinary', N'Ink Art Tiger Tatto', N'', N'', N'Ink Art Tiger Tatto', 65, 0, 0, 0, 0, 0, 0, 0, CAST(1 AS Numeric(18, 0)), N'Live', N'YES', NULL)
INSERT [dbo].[ProductMaster] ([SerialNo], [ProductNo], [BrandName], [Category], [Gender], [NewItem], [ExclusiveSales], [ProductName], [ModelName], [BriefDescription], [Description], [PriceRetail], [PriceRetailEvent1], [PriceRetailEvent2], [PriceWholesale1], [PriceWholesale2], [PriceWholesale3], [PriceWholesale4], [PriceWholesale5], [Stock], [Status], [WebDisplay], [DisplayOrder]) VALUES (CAST(45 AS Numeric(18, 0)), N'LGMT116', N'Legends of Style', N'T-Shirt(Basic)', N'Men', N'YES', N'Ordinary', N'Tattoo Studio 1', N'', N'', N'Tattoo Studio 1', 45, 0, 0, 0, 0, 0, 0, 0, CAST(1 AS Numeric(18, 0)), N'Live', N'YES', NULL)
INSERT [dbo].[ProductMaster] ([SerialNo], [ProductNo], [BrandName], [Category], [Gender], [NewItem], [ExclusiveSales], [ProductName], [ModelName], [BriefDescription], [Description], [PriceRetail], [PriceRetailEvent1], [PriceRetailEvent2], [PriceWholesale1], [PriceWholesale2], [PriceWholesale3], [PriceWholesale4], [PriceWholesale5], [Stock], [Status], [WebDisplay], [DisplayOrder]) VALUES (CAST(46 AS Numeric(18, 0)), N'MLMH103BRN', N'Motor City Legends', N'Hoodies', N'Men', N'YES', N'Ordinary', N'MCL Motorcycle Club with Wings', N'', N'', N'MCL Motorcycle Club with Wings', 125, 0, 0, 0, 0, 0, 0, 0, CAST(1 AS Numeric(18, 0)), N'Live', N'YES', NULL)
INSERT [dbo].[ProductMaster] ([SerialNo], [ProductNo], [BrandName], [Category], [Gender], [NewItem], [ExclusiveSales], [ProductName], [ModelName], [BriefDescription], [Description], [PriceRetail], [PriceRetailEvent1], [PriceRetailEvent2], [PriceWholesale1], [PriceWholesale2], [PriceWholesale3], [PriceWholesale4], [PriceWholesale5], [Stock], [Status], [WebDisplay], [DisplayOrder]) VALUES (CAST(47 AS Numeric(18, 0)), N'MLMH103BLK', N'Motor City Legends', N'Hoodies', N'Men', N'YES', N'Ordinary', N'MCL Motorcycle Club with Wings', N'', N'', N'MCL Motorcycle Club with Wings', 125, 0, 0, 0, 0, 0, 0, 0, CAST(1 AS Numeric(18, 0)), N'Live', N'YES', NULL)
INSERT [dbo].[ProductMaster] ([SerialNo], [ProductNo], [BrandName], [Category], [Gender], [NewItem], [ExclusiveSales], [ProductName], [ModelName], [BriefDescription], [Description], [PriceRetail], [PriceRetailEvent1], [PriceRetailEvent2], [PriceWholesale1], [PriceWholesale2], [PriceWholesale3], [PriceWholesale4], [PriceWholesale5], [Stock], [Status], [WebDisplay], [DisplayOrder]) VALUES (CAST(52 AS Numeric(18, 0)), N'MLML101', N'Motor City Legends', N'Thermals', N'Men', N'YES', N'Ordinary', N'Diamond and Cross (White)', N'', N'', N'Diamond and Cross with Swartzski Crystal', 85, 0, 0, 0, 0, 0, 0, 0, CAST(1 AS Numeric(18, 0)), N'Live', N'YES', NULL)
INSERT [dbo].[ProductMaster] ([SerialNo], [ProductNo], [BrandName], [Category], [Gender], [NewItem], [ExclusiveSales], [ProductName], [ModelName], [BriefDescription], [Description], [PriceRetail], [PriceRetailEvent1], [PriceRetailEvent2], [PriceWholesale1], [PriceWholesale2], [PriceWholesale3], [PriceWholesale4], [PriceWholesale5], [Stock], [Status], [WebDisplay], [DisplayOrder]) VALUES (CAST(53 AS Numeric(18, 0)), N'MLML101BLK', N'Motor City Legends', N'Thermals', N'Men', N'YES', N'Ordinary', N'Diamond and Cross (Black)', N'', N'', N'Diamond and Cross', 85, 0, 0, 0, 0, 0, 0, 0, CAST(1 AS Numeric(18, 0)), N'Live', N'YES', NULL)
INSERT [dbo].[ProductMaster] ([SerialNo], [ProductNo], [BrandName], [Category], [Gender], [NewItem], [ExclusiveSales], [ProductName], [ModelName], [BriefDescription], [Description], [PriceRetail], [PriceRetailEvent1], [PriceRetailEvent2], [PriceWholesale1], [PriceWholesale2], [PriceWholesale3], [PriceWholesale4], [PriceWholesale5], [Stock], [Status], [WebDisplay], [DisplayOrder]) VALUES (CAST(56 AS Numeric(18, 0)), N'MLML102', N'Motor City Legends', N'Thermals', N'Men', N'YES', N'Ordinary', N'Diamond and Wings', N'', N'', N'Diamond and Wings', 85, 0, 0, 0, 0, 0, 0, 0, CAST(0 AS Numeric(18, 0)), N'Live', N'YES', NULL)
INSERT [dbo].[ProductMaster] ([SerialNo], [ProductNo], [BrandName], [Category], [Gender], [NewItem], [ExclusiveSales], [ProductName], [ModelName], [BriefDescription], [Description], [PriceRetail], [PriceRetailEvent1], [PriceRetailEvent2], [PriceWholesale1], [PriceWholesale2], [PriceWholesale3], [PriceWholesale4], [PriceWholesale5], [Stock], [Status], [WebDisplay], [DisplayOrder]) VALUES (CAST(58 AS Numeric(18, 0)), N'MLML103S', N'Motor City Legends', N'Thermals', N'Men', N'YES', N'Ordinary', N'Motor City Club (Swarovski Crystal)', N'', N'', N'Motor City Club .  Swartzeski stones are added by hand to accent the MC', 105, 0, 0, 0, 0, 0, 0, 0, CAST(1 AS Numeric(18, 0)), N'Live', N'YES', NULL)
INSERT [dbo].[ProductMaster] ([SerialNo], [ProductNo], [BrandName], [Category], [Gender], [NewItem], [ExclusiveSales], [ProductName], [ModelName], [BriefDescription], [Description], [PriceRetail], [PriceRetailEvent1], [PriceRetailEvent2], [PriceWholesale1], [PriceWholesale2], [PriceWholesale3], [PriceWholesale4], [PriceWholesale5], [Stock], [Status], [WebDisplay], [DisplayOrder]) VALUES (CAST(19 AS Numeric(18, 0)), N'MLFT109', N'Motor City Legends', N'T-Shirt(V-Neck)', N'Women', N'YES', N'Ordinary', N'Motor City Legends', N'', N'', N'Motor City Legends designed in the spirit of two wheeling freedom of the 50''s.  This t-shirt is accented by foil on the front and back.', 62, 0, 0, 0, 0, 0, 0, 0, CAST(1 AS Numeric(18, 0)), N'Live', N'YES', NULL)
INSERT [dbo].[ProductMaster] ([SerialNo], [ProductNo], [BrandName], [Category], [Gender], [NewItem], [ExclusiveSales], [ProductName], [ModelName], [BriefDescription], [Description], [PriceRetail], [PriceRetailEvent1], [PriceRetailEvent2], [PriceWholesale1], [PriceWholesale2], [PriceWholesale3], [PriceWholesale4], [PriceWholesale5], [Stock], [Status], [WebDisplay], [DisplayOrder]) VALUES (CAST(20 AS Numeric(18, 0)), N'MLFT110', N'Motor City Legends', N'T-Shirt(Basic)', N'Women', N'YES', N'Exclusive', N'MCL Bird and Rose Tattoo', N'', N'', N'This design is uniquely hand dyed  with hand sewn patches of bird and rose tattoo prints.  Motor City Legend print accented with Swarovski crystals. Lightly grinded to gives super vintage feel.', 148, 0, 0, 58, 0, 0, 0, 0, CAST(1 AS Numeric(18, 0)), N'Live', N'YES', NULL)
INSERT [dbo].[ProductMaster] ([SerialNo], [ProductNo], [BrandName], [Category], [Gender], [NewItem], [ExclusiveSales], [ProductName], [ModelName], [BriefDescription], [Description], [PriceRetail], [PriceRetailEvent1], [PriceRetailEvent2], [PriceWholesale1], [PriceWholesale2], [PriceWholesale3], [PriceWholesale4], [PriceWholesale5], [Stock], [Status], [WebDisplay], [DisplayOrder]) VALUES (CAST(26 AS Numeric(18, 0)), N'LGML101', N'Legends of Style', N'Thermals', N'Men', N'YES', N'Ordinary', N'Legends Skull and Bones Crest', N'', N'', N'Legends Skull and Bones Crest', 65, 0, 0, 0, 0, 0, 0, 0, CAST(1 AS Numeric(18, 0)), N'Live', N'YES', NULL)
INSERT [dbo].[ProductMaster] ([SerialNo], [ProductNo], [BrandName], [Category], [Gender], [NewItem], [ExclusiveSales], [ProductName], [ModelName], [BriefDescription], [Description], [PriceRetail], [PriceRetailEvent1], [PriceRetailEvent2], [PriceWholesale1], [PriceWholesale2], [PriceWholesale3], [PriceWholesale4], [PriceWholesale5], [Stock], [Status], [WebDisplay], [DisplayOrder]) VALUES (CAST(32 AS Numeric(18, 0)), N'LGMT101', N'Legends of Style', N'T-Shirt(Basic)', N'Men', N'YES', N'Ordinary', N'Legends 79 Skull and Bones', N'', N'', N'Skull and Bones design with silver foil accent base', 45, 0, 0, 0, 0, 0, 0, 0, CAST(1 AS Numeric(18, 0)), N'Live', N'YES', NULL)
INSERT [dbo].[ProductMaster] ([SerialNo], [ProductNo], [BrandName], [Category], [Gender], [NewItem], [ExclusiveSales], [ProductName], [ModelName], [BriefDescription], [Description], [PriceRetail], [PriceRetailEvent1], [PriceRetailEvent2], [PriceWholesale1], [PriceWholesale2], [PriceWholesale3], [PriceWholesale4], [PriceWholesale5], [Stock], [Status], [WebDisplay], [DisplayOrder]) VALUES (CAST(35 AS Numeric(18, 0)), N'LGMT104', N'Legends of Style', N'T-Shirt(Basic)', N'Men', N'YES', N'Ordinary', N'King of the Road', N'', N'', N'Legends King of the Road with Sparkplug and Bones design hand foiled print', 55, 0, 0, 0, 0, 0, 0, 0, CAST(1 AS Numeric(18, 0)), N'Live', N'YES', NULL)
INSERT [dbo].[ProductMaster] ([SerialNo], [ProductNo], [BrandName], [Category], [Gender], [NewItem], [ExclusiveSales], [ProductName], [ModelName], [BriefDescription], [Description], [PriceRetail], [PriceRetailEvent1], [PriceRetailEvent2], [PriceWholesale1], [PriceWholesale2], [PriceWholesale3], [PriceWholesale4], [PriceWholesale5], [Stock], [Status], [WebDisplay], [DisplayOrder]) VALUES (CAST(48 AS Numeric(18, 0)), N'MLMH104', N'Motor City Legends', N'Hoodies', N'Men', N'YES', N'Ordinary', N'Twin Dragons', N'', N'', N'Twin Dragons With Hand Foil Accents', 125, 0, 0, 0, 0, 0, 0, 0, CAST(1 AS Numeric(18, 0)), N'Live', N'YES', NULL)
INSERT [dbo].[ProductMaster] ([SerialNo], [ProductNo], [BrandName], [Category], [Gender], [NewItem], [ExclusiveSales], [ProductName], [ModelName], [BriefDescription], [Description], [PriceRetail], [PriceRetailEvent1], [PriceRetailEvent2], [PriceWholesale1], [PriceWholesale2], [PriceWholesale3], [PriceWholesale4], [PriceWholesale5], [Stock], [Status], [WebDisplay], [DisplayOrder]) VALUES (CAST(55 AS Numeric(18, 0)), N'MLML101GR', N'Motor City Legends', N'Thermals', N'Men', N'YES', N'Ordinary', N'Diamond and Cross (Grey)', N'', N'', N'Diamond and Cross', 85, 0, 0, 0, 0, 0, 0, 0, CAST(1 AS Numeric(18, 0)), N'Live', N'YES', NULL)
INSERT [dbo].[ProductMaster] ([SerialNo], [ProductNo], [BrandName], [Category], [Gender], [NewItem], [ExclusiveSales], [ProductName], [ModelName], [BriefDescription], [Description], [PriceRetail], [PriceRetailEvent1], [PriceRetailEvent2], [PriceWholesale1], [PriceWholesale2], [PriceWholesale3], [PriceWholesale4], [PriceWholesale5], [Stock], [Status], [WebDisplay], [DisplayOrder]) VALUES (CAST(57 AS Numeric(18, 0)), N'MLML103', N'Motor City Legends', N'Thermals', N'Men', N'YES', N'Ordinary', N'Motor City Club', N'', N'', N'Motor City Club', 95, 0, 0, 0, 0, 0, 0, 0, CAST(1 AS Numeric(18, 0)), N'Live', N'YES', NULL)
INSERT [dbo].[ProductMaster] ([SerialNo], [ProductNo], [BrandName], [Category], [Gender], [NewItem], [ExclusiveSales], [ProductName], [ModelName], [BriefDescription], [Description], [PriceRetail], [PriceRetailEvent1], [PriceRetailEvent2], [PriceWholesale1], [PriceWholesale2], [PriceWholesale3], [PriceWholesale4], [PriceWholesale5], [Stock], [Status], [WebDisplay], [DisplayOrder]) VALUES (CAST(62 AS Numeric(18, 0)), N'MLMT103', N'Motor City Legends', N'T-Shirt(Basic)', N'Men', N'YES', N'Exclusive', N'Motor City Club', N'', N'', N'Hand Dyed and sprayed and hand grinded', 90, 0, 0, 0, 0, 0, 0, 0, CAST(1 AS Numeric(18, 0)), N'Live', N'YES', NULL)
INSERT [dbo].[ProductMaster] ([SerialNo], [ProductNo], [BrandName], [Category], [Gender], [NewItem], [ExclusiveSales], [ProductName], [ModelName], [BriefDescription], [Description], [PriceRetail], [PriceRetailEvent1], [PriceRetailEvent2], [PriceWholesale1], [PriceWholesale2], [PriceWholesale3], [PriceWholesale4], [PriceWholesale5], [Stock], [Status], [WebDisplay], [DisplayOrder]) VALUES (CAST(66 AS Numeric(18, 0)), N'MLMT107', N'Motor City Legends', N'T-Shirt(Basic)', N'Men', N'YES', N'Ordinary', N'Rock Skull and Bones', N'', N'', N'Rock Skull and Bones with Hand Foiled Accents', 65, 0, 0, 0, 0, 0, 0, 0, CAST(1 AS Numeric(18, 0)), N'Live', N'YES', NULL)
INSERT [dbo].[ProductMaster] ([SerialNo], [ProductNo], [BrandName], [Category], [Gender], [NewItem], [ExclusiveSales], [ProductName], [ModelName], [BriefDescription], [Description], [PriceRetail], [PriceRetailEvent1], [PriceRetailEvent2], [PriceWholesale1], [PriceWholesale2], [PriceWholesale3], [PriceWholesale4], [PriceWholesale5], [Stock], [Status], [WebDisplay], [DisplayOrder]) VALUES (CAST(73 AS Numeric(18, 0)), N'Style04V', N'Lipstick Bandits', N'T-Shirt(V-Neck)', N'Women', N'YES', N'Ordinary', N'Love & Faith', N'', N'', N'Love & Faith', 78, 0, 0, 0, 0, 0, 0, 0, CAST(1 AS Numeric(18, 0)), N'Live', N'YES', NULL)
INSERT [dbo].[ProductMaster] ([SerialNo], [ProductNo], [BrandName], [Category], [Gender], [NewItem], [ExclusiveSales], [ProductName], [ModelName], [BriefDescription], [Description], [PriceRetail], [PriceRetailEvent1], [PriceRetailEvent2], [PriceWholesale1], [PriceWholesale2], [PriceWholesale3], [PriceWholesale4], [PriceWholesale5], [Stock], [Status], [WebDisplay], [DisplayOrder]) VALUES (CAST(93 AS Numeric(18, 0)), N'MLFT108', N'Motor City Legends', N'T-Shirt(Basic)', N'Women', N'YES', N'Ordinary', N'Motor City Legends', N'', N'', N'Motor City Legends designed in the spirit of two wheeling freedom of the 50''s.  This t-shirt is accented by foil on the front and back.', 62, 0, 0, 28, 0, 0, 0, 0, CAST(1 AS Numeric(18, 0)), N'Live', N'YES', NULL)
INSERT [dbo].[ProductMaster] ([SerialNo], [ProductNo], [BrandName], [Category], [Gender], [NewItem], [ExclusiveSales], [ProductName], [ModelName], [BriefDescription], [Description], [PriceRetail], [PriceRetailEvent1], [PriceRetailEvent2], [PriceWholesale1], [PriceWholesale2], [PriceWholesale3], [PriceWholesale4], [PriceWholesale5], [Stock], [Status], [WebDisplay], [DisplayOrder]) VALUES (CAST(77 AS Numeric(18, 0)), N'Style041H', N'Lipstick Bandits', N'Hoodies', N'Women', N'YES', N'Ordinary', N'Love & Faith', N'', N'', N'Love & Faith', 125, 0, 0, 0, 0, 0, 0, 0, CAST(1 AS Numeric(18, 0)), N'Live', N'YES', NULL)
INSERT [dbo].[ProductMaster] ([SerialNo], [ProductNo], [BrandName], [Category], [Gender], [NewItem], [ExclusiveSales], [ProductName], [ModelName], [BriefDescription], [Description], [PriceRetail], [PriceRetailEvent1], [PriceRetailEvent2], [PriceWholesale1], [PriceWholesale2], [PriceWholesale3], [PriceWholesale4], [PriceWholesale5], [Stock], [Status], [WebDisplay], [DisplayOrder]) VALUES (CAST(78 AS Numeric(18, 0)), N'Style040H', N'Lipstick Bandits', N'Hoodies', N'Women', N'YES', N'Ordinary', N'Crown', N'', N'', N'Crown -Queen of the Road', 118, 0, 0, 0, 0, 0, 0, 0, CAST(2 AS Numeric(18, 0)), N'Live', N'YES', NULL)
INSERT [dbo].[ProductMaster] ([SerialNo], [ProductNo], [BrandName], [Category], [Gender], [NewItem], [ExclusiveSales], [ProductName], [ModelName], [BriefDescription], [Description], [PriceRetail], [PriceRetailEvent1], [PriceRetailEvent2], [PriceWholesale1], [PriceWholesale2], [PriceWholesale3], [PriceWholesale4], [PriceWholesale5], [Stock], [Status], [WebDisplay], [DisplayOrder]) VALUES (CAST(79 AS Numeric(18, 0)), N'Style021H', N'Lipstick Bandits', N'Hoodies', N'Women', N'YES', N'Ordinary', N'Hearts & Bones', N'', N'', N'Hearts & Bones', 138, 0, 0, 0, 0, 0, 0, 0, CAST(1 AS Numeric(18, 0)), N'Live', N'YES', NULL)
INSERT [dbo].[ProductMaster] ([SerialNo], [ProductNo], [BrandName], [Category], [Gender], [NewItem], [ExclusiveSales], [ProductName], [ModelName], [BriefDescription], [Description], [PriceRetail], [PriceRetailEvent1], [PriceRetailEvent2], [PriceWholesale1], [PriceWholesale2], [PriceWholesale3], [PriceWholesale4], [PriceWholesale5], [Stock], [Status], [WebDisplay], [DisplayOrder]) VALUES (CAST(80 AS Numeric(18, 0)), N'Style040T', N'Lipstick Bandits', N'T-Shirt(Basic)', N'Women', N'YES', N'Ordinary', N'Crown', N'', N'', N'Crown', 78, 0, 0, 0, 0, 0, 0, 0, CAST(1 AS Numeric(18, 0)), N'Live', N'YES', NULL)
INSERT [dbo].[ProductMaster] ([SerialNo], [ProductNo], [BrandName], [Category], [Gender], [NewItem], [ExclusiveSales], [ProductName], [ModelName], [BriefDescription], [Description], [PriceRetail], [PriceRetailEvent1], [PriceRetailEvent2], [PriceWholesale1], [PriceWholesale2], [PriceWholesale3], [PriceWholesale4], [PriceWholesale5], [Stock], [Status], [WebDisplay], [DisplayOrder]) VALUES (CAST(82 AS Numeric(18, 0)), N'Style040L', N'Lipstick Bandits', N'Thermals', N'Women', N'YES', N'Ordinary', N'Crown', N'', N'', N'Crown-Queen of the Road', 95, 0, 0, 0, 0, 0, 0, 0, CAST(0 AS Numeric(18, 0)), N'Live', N'YES', NULL)
INSERT [dbo].[ProductMaster] ([SerialNo], [ProductNo], [BrandName], [Category], [Gender], [NewItem], [ExclusiveSales], [ProductName], [ModelName], [BriefDescription], [Description], [PriceRetail], [PriceRetailEvent1], [PriceRetailEvent2], [PriceWholesale1], [PriceWholesale2], [PriceWholesale3], [PriceWholesale4], [PriceWholesale5], [Stock], [Status], [WebDisplay], [DisplayOrder]) VALUES (CAST(86 AS Numeric(18, 0)), N'Style001T', N'Fresh and Famous', N'T-Shirt(Basic)', N'Women', N'NO', N'Ordinary', N'One Puff', N'', N'', N'One Puff', 45, 0, 0, 0, 0, 0, 0, 0, CAST(1 AS Numeric(18, 0)), N'Live', N'YES', NULL)
INSERT [dbo].[ProductMaster] ([SerialNo], [ProductNo], [BrandName], [Category], [Gender], [NewItem], [ExclusiveSales], [ProductName], [ModelName], [BriefDescription], [Description], [PriceRetail], [PriceRetailEvent1], [PriceRetailEvent2], [PriceWholesale1], [PriceWholesale2], [PriceWholesale3], [PriceWholesale4], [PriceWholesale5], [Stock], [Status], [WebDisplay], [DisplayOrder]) VALUES (CAST(27 AS Numeric(18, 0)), N'LGMP101', N'Legends of Style', N'Polo', N'Men', N'YES', N'Ordinary', N'Legends One Rule Motorcycle Club', N'', N'', N'Legends One Rule Motorcycle Club', 75, 0, 0, 0, 0, 0, 0, 0, CAST(1 AS Numeric(18, 0)), N'Live', N'YES', NULL)
INSERT [dbo].[ProductMaster] ([SerialNo], [ProductNo], [BrandName], [Category], [Gender], [NewItem], [ExclusiveSales], [ProductName], [ModelName], [BriefDescription], [Description], [PriceRetail], [PriceRetailEvent1], [PriceRetailEvent2], [PriceWholesale1], [PriceWholesale2], [PriceWholesale3], [PriceWholesale4], [PriceWholesale5], [Stock], [Status], [WebDisplay], [DisplayOrder]) VALUES (CAST(54 AS Numeric(18, 0)), N'MLMH105', N'Motor City Legends', N'Hoodies', N'Men', N'YES', N'Ordinary', N'Motorcycle Club with Skull Wings', N'', N'', N'Motorcycle Club with Skull Wings', 125, 0, 0, 0, 0, 0, 0, 0, CAST(0 AS Numeric(18, 0)), N'Live', N'YES', NULL)
INSERT [dbo].[ProductMaster] ([SerialNo], [ProductNo], [BrandName], [Category], [Gender], [NewItem], [ExclusiveSales], [ProductName], [ModelName], [BriefDescription], [Description], [PriceRetail], [PriceRetailEvent1], [PriceRetailEvent2], [PriceWholesale1], [PriceWholesale2], [PriceWholesale3], [PriceWholesale4], [PriceWholesale5], [Stock], [Status], [WebDisplay], [DisplayOrder]) VALUES (CAST(67 AS Numeric(18, 0)), N'MLMT108BLK', N'Motor City Legends', N'T-Shirt(Basic)', N'Men', N'YES', N'Ordinary', N'Twin Dragons', N'', N'', N'Full Description with Hand Foiled  Accents', 55, 0, 0, 0, 0, 0, 0, 0, CAST(0 AS Numeric(18, 0)), N'Live', N'YES', NULL)
INSERT [dbo].[ProductMaster] ([SerialNo], [ProductNo], [BrandName], [Category], [Gender], [NewItem], [ExclusiveSales], [ProductName], [ModelName], [BriefDescription], [Description], [PriceRetail], [PriceRetailEvent1], [PriceRetailEvent2], [PriceWholesale1], [PriceWholesale2], [PriceWholesale3], [PriceWholesale4], [PriceWholesale5], [Stock], [Status], [WebDisplay], [DisplayOrder]) VALUES (CAST(89 AS Numeric(18, 0)), N'Style002H', N'Fresh and Famous', N'Hoodies', N'Women', N'NO', N'Ordinary', N'Skull Lolipop', N'', N'', N'Skull Lolipop', 85, 0, 0, 0, 0, 0, 0, 0, CAST(0 AS Numeric(18, 0)), N'Live', N'YES', NULL)
INSERT [dbo].[ProductMaster] ([SerialNo], [ProductNo], [BrandName], [Category], [Gender], [NewItem], [ExclusiveSales], [ProductName], [ModelName], [BriefDescription], [Description], [PriceRetail], [PriceRetailEvent1], [PriceRetailEvent2], [PriceWholesale1], [PriceWholesale2], [PriceWholesale3], [PriceWholesale4], [PriceWholesale5], [Stock], [Status], [WebDisplay], [DisplayOrder]) VALUES (CAST(90 AS Numeric(18, 0)), N'Style004', N'Fresh and Famous', N'T-Shirt(Basic)', N'Women', N'NO', N'Ordinary', N'Guns and Raindbows', N'', N'', N'Guns and Raindbows', 45, 0, 0, 0, 0, 0, 0, 0, CAST(1 AS Numeric(18, 0)), N'Live', N'YES', NULL)
INSERT [dbo].[ProductMaster] ([SerialNo], [ProductNo], [BrandName], [Category], [Gender], [NewItem], [ExclusiveSales], [ProductName], [ModelName], [BriefDescription], [Description], [PriceRetail], [PriceRetailEvent1], [PriceRetailEvent2], [PriceWholesale1], [PriceWholesale2], [PriceWholesale3], [PriceWholesale4], [PriceWholesale5], [Stock], [Status], [WebDisplay], [DisplayOrder]) VALUES (CAST(59 AS Numeric(18, 0)), N'MLML103W', N'Motor City Legends', N'Thermals', N'Men', N'YES', N'Ordinary', N'Motor City Club (White)', N'', N'', N'Motor City Club', 95, 0, 0, 0, 0, 0, 0, 0, CAST(0 AS Numeric(18, 0)), N'Live', N'YES', NULL)
INSERT [dbo].[ProductMaster] ([SerialNo], [ProductNo], [BrandName], [Category], [Gender], [NewItem], [ExclusiveSales], [ProductName], [ModelName], [BriefDescription], [Description], [PriceRetail], [PriceRetailEvent1], [PriceRetailEvent2], [PriceWholesale1], [PriceWholesale2], [PriceWholesale3], [PriceWholesale4], [PriceWholesale5], [Stock], [Status], [WebDisplay], [DisplayOrder]) VALUES (CAST(88 AS Numeric(18, 0)), N'Style005', N'Fresh and Famous', N'Hoodies', N'Women', N'YES', N'Ordinary', N'Elements', N'', N'', N'Elements', 85, 0, 0, 0, 0, 0, 0, 0, CAST(1 AS Numeric(18, 0)), N'Live', N'YES', NULL)
INSERT [dbo].[ProductMaster] ([SerialNo], [ProductNo], [BrandName], [Category], [Gender], [NewItem], [ExclusiveSales], [ProductName], [ModelName], [BriefDescription], [Description], [PriceRetail], [PriceRetailEvent1], [PriceRetailEvent2], [PriceWholesale1], [PriceWholesale2], [PriceWholesale3], [PriceWholesale4], [PriceWholesale5], [Stock], [Status], [WebDisplay], [DisplayOrder]) VALUES (CAST(65 AS Numeric(18, 0)), N'MLMT106W', N'Motor City Legends', N'T-Shirt(Basic)', N'Men', N'YES', N'Ordinary', N'Rock Legends', N'', N'', N'Rock Legends with Swarovski Stones and Gold Foiled', 75, 0, 0, 0, 0, 0, 0, 0, CAST(0 AS Numeric(18, 0)), N'Live', N'YES', NULL)
INSERT [dbo].[ProductMaster] ([SerialNo], [ProductNo], [BrandName], [Category], [Gender], [NewItem], [ExclusiveSales], [ProductName], [ModelName], [BriefDescription], [Description], [PriceRetail], [PriceRetailEvent1], [PriceRetailEvent2], [PriceWholesale1], [PriceWholesale2], [PriceWholesale3], [PriceWholesale4], [PriceWholesale5], [Stock], [Status], [WebDisplay], [DisplayOrder]) VALUES (CAST(60 AS Numeric(18, 0)), N'MLMT101', N'Motor City Legends', N'T-Shirt(Basic)', N'Men', N'YES', N'Ordinary', N'Motor City Club', N'', N'', N'Motor City Club', 55, 0, 0, 0, 0, 0, 0, 0, CAST(1 AS Numeric(18, 0)), N'Live', N'YES', NULL)
INSERT [dbo].[ProductMaster] ([SerialNo], [ProductNo], [BrandName], [Category], [Gender], [NewItem], [ExclusiveSales], [ProductName], [ModelName], [BriefDescription], [Description], [PriceRetail], [PriceRetailEvent1], [PriceRetailEvent2], [PriceWholesale1], [PriceWholesale2], [PriceWholesale3], [PriceWholesale4], [PriceWholesale5], [Stock], [Status], [WebDisplay], [DisplayOrder]) VALUES (CAST(63 AS Numeric(18, 0)), N'MLMT105', N'Motor City Legends', N'T-Shirt(Basic)', N'Men', N'YES', N'Ordinary', N'Motorcycle Club', N'', N'', N'Motorcycle Club', 65, 0, 0, 0, 0, 0, 0, 0, CAST(0 AS Numeric(18, 0)), N'Live', N'YES', NULL)
INSERT [dbo].[ProductMaster] ([SerialNo], [ProductNo], [BrandName], [Category], [Gender], [NewItem], [ExclusiveSales], [ProductName], [ModelName], [BriefDescription], [Description], [PriceRetail], [PriceRetailEvent1], [PriceRetailEvent2], [PriceWholesale1], [PriceWholesale2], [PriceWholesale3], [PriceWholesale4], [PriceWholesale5], [Stock], [Status], [WebDisplay], [DisplayOrder]) VALUES (CAST(72 AS Numeric(18, 0)), N'Style041', N'Lipstick Bandits', N'T-Shirt(Basic)', N'Women', N'YES', N'Ordinary', N'Love & Faith', N'', N'', N'Love & Faith', 78, 0, 0, 0, 0, 0, 0, 0, CAST(0 AS Numeric(18, 0)), N'Live', N'YES', NULL)
INSERT [dbo].[ProductMaster] ([SerialNo], [ProductNo], [BrandName], [Category], [Gender], [NewItem], [ExclusiveSales], [ProductName], [ModelName], [BriefDescription], [Description], [PriceRetail], [PriceRetailEvent1], [PriceRetailEvent2], [PriceWholesale1], [PriceWholesale2], [PriceWholesale3], [PriceWholesale4], [PriceWholesale5], [Stock], [Status], [WebDisplay], [DisplayOrder]) VALUES (CAST(94 AS Numeric(18, 0)), N'MLFL101blk', N'Motor City Legends', N'Thermals', N'Women', N'YES', N'Ordinary', N'Skull and Bones Union Jack', N'', N'', N'Skull and Bones Union Jack with hand placed Swarovski crystals with red foil in the front and union jack flag foiled in blue.  Swarovski crystals placed on the sleeves as well as blue and red foil.', 150, 0, 0, 68, 0, 0, 0, 0, CAST(0 AS Numeric(18, 0)), N'Live', N'YES', NULL)
INSERT [dbo].[ProductMaster] ([SerialNo], [ProductNo], [BrandName], [Category], [Gender], [NewItem], [ExclusiveSales], [ProductName], [ModelName], [BriefDescription], [Description], [PriceRetail], [PriceRetailEvent1], [PriceRetailEvent2], [PriceWholesale1], [PriceWholesale2], [PriceWholesale3], [PriceWholesale4], [PriceWholesale5], [Stock], [Status], [WebDisplay], [DisplayOrder]) VALUES (CAST(61 AS Numeric(18, 0)), N'MLMT102', N'Motor City Legends', N'T-Shirt(Basic)', N'Men', N'YES', N'Exclusive', N'Motor City Skull Cross Wing', N'', N'', N'Motor City Skull Cross Wing.  Hand patched on backside', 143, 0, 0, 0, 0, 0, 0, 0, CAST(1 AS Numeric(18, 0)), N'Live', N'YES', NULL)
INSERT [dbo].[ProductMaster] ([SerialNo], [ProductNo], [BrandName], [Category], [Gender], [NewItem], [ExclusiveSales], [ProductName], [ModelName], [BriefDescription], [Description], [PriceRetail], [PriceRetailEvent1], [PriceRetailEvent2], [PriceWholesale1], [PriceWholesale2], [PriceWholesale3], [PriceWholesale4], [PriceWholesale5], [Stock], [Status], [WebDisplay], [DisplayOrder]) VALUES (CAST(68 AS Numeric(18, 0)), N'MLMT108BRN', N'Motor City Legends', N'T-Shirt(Basic)', N'Men', N'YES', N'Ordinary', N'Twin Dragons', N'', N'', N'Twin Dragons with hand foiled accents', 55, 0, 0, 0, 0, 0, 0, 0, CAST(1 AS Numeric(18, 0)), N'Live', N'YES', NULL)
INSERT [dbo].[ProductMaster] ([SerialNo], [ProductNo], [BrandName], [Category], [Gender], [NewItem], [ExclusiveSales], [ProductName], [ModelName], [BriefDescription], [Description], [PriceRetail], [PriceRetailEvent1], [PriceRetailEvent2], [PriceWholesale1], [PriceWholesale2], [PriceWholesale3], [PriceWholesale4], [PriceWholesale5], [Stock], [Status], [WebDisplay], [DisplayOrder]) VALUES (CAST(69 AS Numeric(18, 0)), N'MLMT109', N'Motor City Legends', N'T-Shirt(Basic)', N'Men', N'YES', N'Exclusive', N'Hand Dyed Rock Skulls and Bones', N'', N'', N'Hand Dyed Rock Skulls and Bones with silver foil and hand grinded', 95, 0, 0, 0, 0, 0, 0, 0, CAST(1 AS Numeric(18, 0)), N'Live', N'YES', NULL)
INSERT [dbo].[ProductMaster] ([SerialNo], [ProductNo], [BrandName], [Category], [Gender], [NewItem], [ExclusiveSales], [ProductName], [ModelName], [BriefDescription], [Description], [PriceRetail], [PriceRetailEvent1], [PriceRetailEvent2], [PriceWholesale1], [PriceWholesale2], [PriceWholesale3], [PriceWholesale4], [PriceWholesale5], [Stock], [Status], [WebDisplay], [DisplayOrder]) VALUES (CAST(81 AS Numeric(18, 0)), N'Style026', N'Lipstick Bandits', N'T-Shirt(Basic)', N'Women', N'YES', N'Exclusive', N'Death By Sexy', N'', N'', N'Death By Sexy', 55, 0, 0, 0, 0, 0, 0, 0, CAST(1 AS Numeric(18, 0)), N'Live', N'YES', NULL)
INSERT [dbo].[ProductMaster] ([SerialNo], [ProductNo], [BrandName], [Category], [Gender], [NewItem], [ExclusiveSales], [ProductName], [ModelName], [BriefDescription], [Description], [PriceRetail], [PriceRetailEvent1], [PriceRetailEvent2], [PriceWholesale1], [PriceWholesale2], [PriceWholesale3], [PriceWholesale4], [PriceWholesale5], [Stock], [Status], [WebDisplay], [DisplayOrder]) VALUES (CAST(84 AS Numeric(18, 0)), N'Style002', N'Fresh and Famous', N'Tank Top', N'Women', N'NO', N'Ordinary', N'Skull Lolipop', N'', N'', N'Skull Lolipop', 45, 0, 0, 0, 0, 0, 0, 0, CAST(1 AS Numeric(18, 0)), N'Live', N'YES', NULL)
INSERT [dbo].[ProductMaster] ([SerialNo], [ProductNo], [BrandName], [Category], [Gender], [NewItem], [ExclusiveSales], [ProductName], [ModelName], [BriefDescription], [Description], [PriceRetail], [PriceRetailEvent1], [PriceRetailEvent2], [PriceWholesale1], [PriceWholesale2], [PriceWholesale3], [PriceWholesale4], [PriceWholesale5], [Stock], [Status], [WebDisplay], [DisplayOrder]) VALUES (CAST(91 AS Numeric(18, 0)), N'Style006', N'Fresh and Famous', N'T-Shirt(Basic)', N'Women', N'NO', N'Ordinary', N'United Kingdom', N'', N'', N'United Kingdom', 55, 0, 0, 0, 0, 0, 0, 0, CAST(1 AS Numeric(18, 0)), N'Live', N'YES', NULL)
INSERT [dbo].[ProductMaster] ([SerialNo], [ProductNo], [BrandName], [Category], [Gender], [NewItem], [ExclusiveSales], [ProductName], [ModelName], [BriefDescription], [Description], [PriceRetail], [PriceRetailEvent1], [PriceRetailEvent2], [PriceWholesale1], [PriceWholesale2], [PriceWholesale3], [PriceWholesale4], [PriceWholesale5], [Stock], [Status], [WebDisplay], [DisplayOrder]) VALUES (CAST(92 AS Numeric(18, 0)), N'MLFT101', N'Motor City Legends', N'T-Shirt(Basic)', N'Women', N'YES', N'Ordinary', N'Diamonds and Wings', N'', N'', N'MCL diamond front, sleeve and angel wings back.  The print is silver foiled on a  black shirt and gold foiled on a white shirt.', 62, 0, 0, 0, 0, 0, 0, 0, CAST(1 AS Numeric(18, 0)), N'Live', N'YES', NULL)
INSERT [dbo].[ProductMaster] ([SerialNo], [ProductNo], [BrandName], [Category], [Gender], [NewItem], [ExclusiveSales], [ProductName], [ModelName], [BriefDescription], [Description], [PriceRetail], [PriceRetailEvent1], [PriceRetailEvent2], [PriceWholesale1], [PriceWholesale2], [PriceWholesale3], [PriceWholesale4], [PriceWholesale5], [Stock], [Status], [WebDisplay], [DisplayOrder]) VALUES (CAST(85 AS Numeric(18, 0)), N'Style001', N'Fresh and Famous', N'Thermals', N'Women', N'YES', N'Ordinary', N'One Puff', N'', N'', N'One Puff', 55, 0, 0, 0, 0, 0, 0, 0, CAST(1 AS Numeric(18, 0)), N'Live', N'YES', NULL)
INSERT [dbo].[ProductMaster] ([SerialNo], [ProductNo], [BrandName], [Category], [Gender], [NewItem], [ExclusiveSales], [ProductName], [ModelName], [BriefDescription], [Description], [PriceRetail], [PriceRetailEvent1], [PriceRetailEvent2], [PriceWholesale1], [PriceWholesale2], [PriceWholesale3], [PriceWholesale4], [PriceWholesale5], [Stock], [Status], [WebDisplay], [DisplayOrder]) VALUES (CAST(87 AS Numeric(18, 0)), N'Style003', N'Fresh and Famous', N'T-Shirt(Basic)', N'Women', N'NO', N'Ordinary', N'Say No', N'', N'', N'Say No', 45, 0, 0, 0, 0, 0, 0, 0, CAST(1 AS Numeric(18, 0)), N'Live', N'YES', NULL)
SET IDENTITY_INSERT [dbo].[ProductMaster] OFF
SET IDENTITY_INSERT [dbo].[ProductSize] ON 

INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(1087 AS Numeric(18, 0)), N'MLFT107', N'Small', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(1088 AS Numeric(18, 0)), N'MLFT107', N'Medium', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(1089 AS Numeric(18, 0)), N'MLFT107', N'Large', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(1135 AS Numeric(18, 0)), N'MLML103S', N'Small', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(924 AS Numeric(18, 0)), N'MLFB101', N'Extra Small', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(925 AS Numeric(18, 0)), N'MLFB101', N'Small', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(926 AS Numeric(18, 0)), N'MLFB101', N'Medium', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(927 AS Numeric(18, 0)), N'MLFB101', N'Large', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(928 AS Numeric(18, 0)), N'MLFB101', N'X-Large', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(94 AS Numeric(18, 0)), N'LGMB101', N'Small', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(95 AS Numeric(18, 0)), N'LGMB101', N'Medium', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(96 AS Numeric(18, 0)), N'LGMB101', N'Large', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(97 AS Numeric(18, 0)), N'LGMB101', N'X-Large', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(296 AS Numeric(18, 0)), N'LGML101', N'Small', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(297 AS Numeric(18, 0)), N'LGML101', N'Medium', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(298 AS Numeric(18, 0)), N'LGML101', N'Large', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(299 AS Numeric(18, 0)), N'LGML101', N'Extra Large', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(340 AS Numeric(18, 0)), N'LGMT101', N'Small', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(341 AS Numeric(18, 0)), N'LGMT101', N'Medium', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(342 AS Numeric(18, 0)), N'LGMT101', N'Large', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(343 AS Numeric(18, 0)), N'LGMT101', N'Extra Large', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(1070 AS Numeric(18, 0)), N'MLFT102', N'Extra Small', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(1071 AS Numeric(18, 0)), N'MLFT102', N'Small', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(1072 AS Numeric(18, 0)), N'MLFT102', N'Medium', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(1073 AS Numeric(18, 0)), N'MLFT102', N'Large', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(1057 AS Numeric(18, 0)), N'MLFH103', N'Small', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(874 AS Numeric(18, 0)), N'LGMT106', N'Small', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(875 AS Numeric(18, 0)), N'LGMT106', N'Medium', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(876 AS Numeric(18, 0)), N'LGMT106', N'Large', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(877 AS Numeric(18, 0)), N'LGMT106', N'Extra Large', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(1178 AS Numeric(18, 0)), N'MLFT108', N'Small', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(1179 AS Numeric(18, 0)), N'MLFT108', N'Medium', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(1180 AS Numeric(18, 0)), N'MLFT108', N'Large', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(1136 AS Numeric(18, 0)), N'MLML103S', N'Medium', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(374 AS Numeric(18, 0)), N'LGMT108', N'Small', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(375 AS Numeric(18, 0)), N'LGMT108', N'Medium', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(376 AS Numeric(18, 0)), N'LGMT108', N'Large', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(377 AS Numeric(18, 0)), N'LGMT108', N'Extra Large', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(1137 AS Numeric(18, 0)), N'MLML103S', N'Large', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(1138 AS Numeric(18, 0)), N'MLML103S', N'Extra Large', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(1139 AS Numeric(18, 0)), N'MLML103', N'Small', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(1140 AS Numeric(18, 0)), N'MLML103', N'Medium', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(378 AS Numeric(18, 0)), N'LGMT109', N'Small', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(379 AS Numeric(18, 0)), N'LGMT109', N'Medium', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(380 AS Numeric(18, 0)), N'LGMT109', N'Large', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(381 AS Numeric(18, 0)), N'LGMT109', N'Extra Large', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(410 AS Numeric(18, 0)), N'LGMT111', N'Small', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(411 AS Numeric(18, 0)), N'LGMT111', N'Medium', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(412 AS Numeric(18, 0)), N'LGMT111', N'Large', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(413 AS Numeric(18, 0)), N'LGMT111', N'Extra Large', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(1018 AS Numeric(18, 0)), N'MLML101', N'Small', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(1019 AS Numeric(18, 0)), N'MLML101', N'Medium', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(1020 AS Numeric(18, 0)), N'MLML101', N'Large', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(1021 AS Numeric(18, 0)), N'MLML101', N'Extra Large', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(1022 AS Numeric(18, 0)), N'MLML101GR', N'Small', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(1023 AS Numeric(18, 0)), N'MLML101GR', N'Medium', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(1024 AS Numeric(18, 0)), N'MLML101GR', N'Large', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(1025 AS Numeric(18, 0)), N'MLML101GR', N'Extra Large', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(1147 AS Numeric(18, 0)), N'MLMT103', N'Small', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(1148 AS Numeric(18, 0)), N'MLMT103', N'Medium', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(1149 AS Numeric(18, 0)), N'MLMT103', N'Large', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(1150 AS Numeric(18, 0)), N'MLMT103', N'Extra Large', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(654 AS Numeric(18, 0)), N'MLMT107', N'Small', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(655 AS Numeric(18, 0)), N'MLMT107', N'Medium', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(656 AS Numeric(18, 0)), N'MLMT107', N'Large', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(657 AS Numeric(18, 0)), N'MLMT107', N'Extra Large', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(1058 AS Numeric(18, 0)), N'MLFH103', N'Medium', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(1059 AS Numeric(18, 0)), N'MLFH103', N'Large', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(1187 AS Numeric(18, 0)), N'MLFT104', N'small', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(1188 AS Numeric(18, 0)), N'MLFT104', N'medium', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(1189 AS Numeric(18, 0)), N'MLFT104', N'large', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(696 AS Numeric(18, 0)), N'STYLE041', N'Extra Small', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(697 AS Numeric(18, 0)), N'STYLE041', N'Small', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(698 AS Numeric(18, 0)), N'STYLE041', N'Medium', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(699 AS Numeric(18, 0)), N'STYLE041', N'Large', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(708 AS Numeric(18, 0)), N'STYLE04V', N'Extra Small', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(709 AS Numeric(18, 0)), N'STYLE04V', N'Small', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(710 AS Numeric(18, 0)), N'STYLE04V', N'Medium', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(711 AS Numeric(18, 0)), N'STYLE04V', N'Large', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(780 AS Numeric(18, 0)), N'STYLE041H', N'Extra Small', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(781 AS Numeric(18, 0)), N'STYLE041H', N'Small', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(782 AS Numeric(18, 0)), N'STYLE041H', N'Medium', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(783 AS Numeric(18, 0)), N'STYLE041H', N'Large', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(784 AS Numeric(18, 0)), N'STYLE041H', N'Extra Small', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(785 AS Numeric(18, 0)), N'STYLE041H', N'Small', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(786 AS Numeric(18, 0)), N'STYLE041H', N'Medium', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(787 AS Numeric(18, 0)), N'STYLE041H', N'Large', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(732 AS Numeric(18, 0)), N'STYLE040H', N'Extra Small', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(733 AS Numeric(18, 0)), N'STYLE040H', N'Small', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(734 AS Numeric(18, 0)), N'STYLE040H', N'Medium', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(735 AS Numeric(18, 0)), N'STYLE040H', N'Large', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(744 AS Numeric(18, 0)), N'Style040T', N'Extra Small', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(745 AS Numeric(18, 0)), N'Style040T', N'Small', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(746 AS Numeric(18, 0)), N'Style040T', N'Medium', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(747 AS Numeric(18, 0)), N'Style040T', N'Large', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(760 AS Numeric(18, 0)), N'STYLE040L', N'Extra Small', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(761 AS Numeric(18, 0)), N'STYLE040L', N'Small', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(762 AS Numeric(18, 0)), N'STYLE040L', N'Medium', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(763 AS Numeric(18, 0)), N'STYLE040L', N'Large', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
GO
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(788 AS Numeric(18, 0)), N'STYLE041H', N'Extra Small', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(789 AS Numeric(18, 0)), N'STYLE041H', N'Small', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(790 AS Numeric(18, 0)), N'STYLE041H', N'Medium', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(791 AS Numeric(18, 0)), N'STYLE041H', N'Large', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(792 AS Numeric(18, 0)), N'STYLE041H', N'Extra Small', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(793 AS Numeric(18, 0)), N'STYLE041H', N'Small', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(794 AS Numeric(18, 0)), N'STYLE041H', N'Medium', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(795 AS Numeric(18, 0)), N'STYLE041H', N'Large', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(817 AS Numeric(18, 0)), N'STYLE001', N'Extra Small', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(818 AS Numeric(18, 0)), N'STYLE001', N'Small', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(819 AS Numeric(18, 0)), N'STYLE001', N'Medium', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(820 AS Numeric(18, 0)), N'STYLE001', N'Large', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(866 AS Numeric(18, 0)), N'STYLE001T', N'Extra Small', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(867 AS Numeric(18, 0)), N'STYLE001T', N'Small', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(868 AS Numeric(18, 0)), N'STYLE001T', N'Medium', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(869 AS Numeric(18, 0)), N'STYLE001T', N'Large', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(841 AS Numeric(18, 0)), N'STYLE003', N'Extra Small', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(842 AS Numeric(18, 0)), N'STYLE003', N'Small', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(843 AS Numeric(18, 0)), N'STYLE003', N'Medium', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(844 AS Numeric(18, 0)), N'STYLE003', N'Large', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(1074 AS Numeric(18, 0)), N'MLFT103', N'Extra Small', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(1075 AS Numeric(18, 0)), N'MLFT103', N'Small', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(1141 AS Numeric(18, 0)), N'MLML103', N'Large', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(1142 AS Numeric(18, 0)), N'MLML103', N'Extra Large', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(1151 AS Numeric(18, 0)), N'MLMT105', N'Small', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(1152 AS Numeric(18, 0)), N'MLMT105', N'Medium', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(1153 AS Numeric(18, 0)), N'MLMT105', N'Large', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(1154 AS Numeric(18, 0)), N'MLMT105', N'Extra Large', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(1076 AS Numeric(18, 0)), N'MLFT103', N'Medium', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(1077 AS Numeric(18, 0)), N'MLFT103', N'Large', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(594 AS Numeric(18, 0)), N'MLMH105', N'Small', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(595 AS Numeric(18, 0)), N'MLMH105', N'Medium', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(596 AS Numeric(18, 0)), N'MLMH105', N'Large', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(597 AS Numeric(18, 0)), N'MLMH105', N'Extra Large', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(658 AS Numeric(18, 0)), N'MLMT108BLK', N'Small', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(659 AS Numeric(18, 0)), N'MLMT108BLK', N'Medium', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(660 AS Numeric(18, 0)), N'MLMT108BLK', N'Large', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(661 AS Numeric(18, 0)), N'MLMT108BLK', N'Extra Large', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(854 AS Numeric(18, 0)), N'Style004', N'Extra Small', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(855 AS Numeric(18, 0)), N'Style004', N'Small', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(856 AS Numeric(18, 0)), N'Style004', N'Medium', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(857 AS Numeric(18, 0)), N'Style004', N'Large', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(1002 AS Numeric(18, 0)), N'MLMH103', N'Small', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(1003 AS Numeric(18, 0)), N'MLMH103', N'Medium', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(1004 AS Numeric(18, 0)), N'MLMH103', N'large', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(1005 AS Numeric(18, 0)), N'MLMH103', N'Extra large', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(1196 AS Numeric(18, 0)), N'MLFH102', N'Small', CAST(0 AS Numeric(18, 0)), N'YES', 1, CAST(N'2008-02-01T16:09:45.233' AS DateTime))
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(1197 AS Numeric(18, 0)), N'MLFH102', N'Medium', CAST(0 AS Numeric(18, 0)), N'YES', 1.2, CAST(N'2008-02-01T16:09:58.160' AS DateTime))
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(1198 AS Numeric(18, 0)), N'MLFH102', N'Large', CAST(0 AS Numeric(18, 0)), N'YES', 1.5, CAST(N'2008-02-01T16:10:01.727' AS DateTime))
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(1063 AS Numeric(18, 0)), N'MLFL102', N'Small', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(1064 AS Numeric(18, 0)), N'MLFL102', N'Medium', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(1065 AS Numeric(18, 0)), N'MLFL102', N'Large', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(1081 AS Numeric(18, 0)), N'MLFT105', N'Small', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(1082 AS Numeric(18, 0)), N'MLFT105', N'Medium', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(1083 AS Numeric(18, 0)), N'MLFT105', N'Large', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(328 AS Numeric(18, 0)), N'LGMP103', N'Small', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(329 AS Numeric(18, 0)), N'LGMP103', N'Medium', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(330 AS Numeric(18, 0)), N'LGMP103', N'Large', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(331 AS Numeric(18, 0)), N'LGMP103', N'Extra Large', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(1112 AS Numeric(18, 0)), N'MLFT110', N'Small', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(1113 AS Numeric(18, 0)), N'MLFT110', N'Medium', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(1114 AS Numeric(18, 0)), N'MLFT110', N'Large', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(1143 AS Numeric(18, 0)), N'MLML103W', N'Small', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(1144 AS Numeric(18, 0)), N'MLML103W', N'Medium', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(1145 AS Numeric(18, 0)), N'MLML103W', N'Large', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(1146 AS Numeric(18, 0)), N'MLML103W', N'Extra Large', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(288 AS Numeric(18, 0)), N'LGMH103', N'Small', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(289 AS Numeric(18, 0)), N'LGMH103', N'Medium', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(290 AS Numeric(18, 0)), N'LGMH103', N'Large', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(291 AS Numeric(18, 0)), N'LGMH103', N'Extra large', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(292 AS Numeric(18, 0)), N'LGMH104', N'Small', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(293 AS Numeric(18, 0)), N'LGMH104', N'Medium', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(294 AS Numeric(18, 0)), N'LGMH104', N'Large', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(295 AS Numeric(18, 0)), N'LGMH104', N'Extra Large', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(312 AS Numeric(18, 0)), N'LGMP101', N'Small', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(313 AS Numeric(18, 0)), N'LGMP101', N'Medium', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(314 AS Numeric(18, 0)), N'LGMP101', N'Large', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(315 AS Numeric(18, 0)), N'LGMP101', N'Extra Large', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(324 AS Numeric(18, 0)), N'LGMP102', N'Small', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(325 AS Numeric(18, 0)), N'LGMP102', N'Medium', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(326 AS Numeric(18, 0)), N'LGMP102', N'Large', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(327 AS Numeric(18, 0)), N'LGMP102', N'Extra Large', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(332 AS Numeric(18, 0)), N'LGMP104', N'Small', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(333 AS Numeric(18, 0)), N'LGMP104', N'Medium', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(334 AS Numeric(18, 0)), N'LGMP104', N'Large', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(335 AS Numeric(18, 0)), N'LGMP104', N'Extra Large', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(336 AS Numeric(18, 0)), N'LGMP105', N'Small', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(337 AS Numeric(18, 0)), N'LGMP105', N'Medium', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(338 AS Numeric(18, 0)), N'LGMP105', N'Large', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(339 AS Numeric(18, 0)), N'LGMP105', N'Extra Large', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(344 AS Numeric(18, 0)), N'LGMT102', N'Small', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(345 AS Numeric(18, 0)), N'LGMT102', N'Medium', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(346 AS Numeric(18, 0)), N'LGMT102', N'Large', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(347 AS Numeric(18, 0)), N'LGMT102', N'Extra Large', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(348 AS Numeric(18, 0)), N'LGMT103', N'Small', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(349 AS Numeric(18, 0)), N'LGMT103', N'Medium', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(350 AS Numeric(18, 0)), N'LGMT103', N'Large', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(351 AS Numeric(18, 0)), N'LGMT103', N'Extra Large', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(354 AS Numeric(18, 0)), N'LGMT107', N'Small', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(355 AS Numeric(18, 0)), N'LGMT107', N'Medium', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
GO
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(356 AS Numeric(18, 0)), N'LGMT107', N'Large', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(357 AS Numeric(18, 0)), N'LGMT107', N'Extra Large', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(870 AS Numeric(18, 0)), N'LGMT105', N'Small', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(871 AS Numeric(18, 0)), N'LGMT105', N'Medium', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(872 AS Numeric(18, 0)), N'LGMT105', N'Large', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(873 AS Numeric(18, 0)), N'LGMT105', N'Extra Large', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(382 AS Numeric(18, 0)), N'LGMT110', N'Small', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(383 AS Numeric(18, 0)), N'LGMT110', N'Medium', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(384 AS Numeric(18, 0)), N'LGMT110', N'Large', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(385 AS Numeric(18, 0)), N'LGMT110', N'Extra Large', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(414 AS Numeric(18, 0)), N'LGMT112', N'Small', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(415 AS Numeric(18, 0)), N'LGMT112', N'Medium', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(416 AS Numeric(18, 0)), N'LGMT112', N'Large', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(417 AS Numeric(18, 0)), N'LGMT112', N'Extra Large', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(418 AS Numeric(18, 0)), N'LGMT115', N'Small', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(419 AS Numeric(18, 0)), N'LGMT115', N'Medium', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(420 AS Numeric(18, 0)), N'LGMT115', N'Large', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(421 AS Numeric(18, 0)), N'LGMT115', N'Extra Large', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(422 AS Numeric(18, 0)), N'LGMT116', N'Small', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(423 AS Numeric(18, 0)), N'LGMT116', N'Medium', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(424 AS Numeric(18, 0)), N'LGMT116', N'Large', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(425 AS Numeric(18, 0)), N'LGMT116', N'Extra Large', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(546 AS Numeric(18, 0)), N'MLML101BLK', N'Small', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(547 AS Numeric(18, 0)), N'MLML101BLK', N'Medium', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(548 AS Numeric(18, 0)), N'MLML101BLK', N'Large', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(549 AS Numeric(18, 0)), N'MLML101BLK', N'Extra Large', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(550 AS Numeric(18, 0)), N'MLML102', N'Small', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(551 AS Numeric(18, 0)), N'MLML102', N'Medium', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(552 AS Numeric(18, 0)), N'MLML102', N'Large', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(553 AS Numeric(18, 0)), N'MLML102', N'Extra Large', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(630 AS Numeric(18, 0)), N'MLMT101', N'Small', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(631 AS Numeric(18, 0)), N'MLMT101', N'Medium', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(632 AS Numeric(18, 0)), N'MLMT101', N'Large', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(633 AS Numeric(18, 0)), N'MLMT101', N'Extra Large', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(634 AS Numeric(18, 0)), N'MLMT102', N'Small', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(635 AS Numeric(18, 0)), N'MLMT102', N'Medium', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(636 AS Numeric(18, 0)), N'MLMT102', N'Large', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(637 AS Numeric(18, 0)), N'MLMT102', N'Extra Large', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(1014 AS Numeric(18, 0)), N'MLMH104', N'Small', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(1015 AS Numeric(18, 0)), N'MLMH104', N'Medium', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(1016 AS Numeric(18, 0)), N'MLMH104', N'Large', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(1017 AS Numeric(18, 0)), N'MLMH104', N'Extra Large', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(1155 AS Numeric(18, 0)), N'MLMT106W', N'Small', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(1156 AS Numeric(18, 0)), N'MLMT106W', N'Medium', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(1157 AS Numeric(18, 0)), N'MLMT106W', N'Large', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(1158 AS Numeric(18, 0)), N'MLMT106W', N'Extra Large', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(1046 AS Numeric(18, 0)), N'MLMT108BRN', N'Small', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(666 AS Numeric(18, 0)), N'MLMT109', N'Small', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(667 AS Numeric(18, 0)), N'MLMT109', N'Medium', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(668 AS Numeric(18, 0)), N'MLMT109', N'Large', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(669 AS Numeric(18, 0)), N'MLMT109', N'Extra Large', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(862 AS Numeric(18, 0)), N'Style006', N'Extra Small', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(805 AS Numeric(18, 0)), N'STYLE001L', N'Extra Small', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(806 AS Numeric(18, 0)), N'STYLE001L', N'Small', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(807 AS Numeric(18, 0)), N'STYLE001L', N'Medium', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(808 AS Numeric(18, 0)), N'STYLE001L', N'Large', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(809 AS Numeric(18, 0)), N'STYLE001L', N'Extra Small', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(810 AS Numeric(18, 0)), N'STYLE001L', N'Small', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(811 AS Numeric(18, 0)), N'STYLE001L', N'Medium', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(740 AS Numeric(18, 0)), N'STYLE021H', N'Extra Small', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(741 AS Numeric(18, 0)), N'STYLE021H', N'Small', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(742 AS Numeric(18, 0)), N'STYLE021H', N'Medium', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(743 AS Numeric(18, 0)), N'STYLE021H', N'Large', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(752 AS Numeric(18, 0)), N'STYLE026', N'Extra Small', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(753 AS Numeric(18, 0)), N'STYLE026', N'Small', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(754 AS Numeric(18, 0)), N'STYLE026', N'Medium', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(755 AS Numeric(18, 0)), N'STYLE026', N'Large', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(812 AS Numeric(18, 0)), N'STYLE001L', N'Large', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(863 AS Numeric(18, 0)), N'Style006', N'Small', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(864 AS Numeric(18, 0)), N'Style006', N'Medium', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(865 AS Numeric(18, 0)), N'Style006', N'Large', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(1066 AS Numeric(18, 0)), N'MLFT101', N'Extra Small', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(1067 AS Numeric(18, 0)), N'MLFT101', N'Small', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(1068 AS Numeric(18, 0)), N'MLFT101', N'Medium', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(1069 AS Numeric(18, 0)), N'MLFT101', N'Large', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(1169 AS Numeric(18, 0)), N'MLFL101', N'Small', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(1170 AS Numeric(18, 0)), N'MLFL101', N'Medium', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(1171 AS Numeric(18, 0)), N'MLFL101', N'Large', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(1118 AS Numeric(18, 0)), N'MLMH101', N'Small', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(1119 AS Numeric(18, 0)), N'MLMH101', N'Medium', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(1120 AS Numeric(18, 0)), N'MLMH101', N'Large', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(1121 AS Numeric(18, 0)), N'MLMH101', N'Extra Large', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(1122 AS Numeric(18, 0)), N'MLMH102', N'Small', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(1123 AS Numeric(18, 0)), N'MLMH102', N'Medium', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(1006 AS Numeric(18, 0)), N'MLMH103BLK', N'Small', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(1007 AS Numeric(18, 0)), N'MLMH103BLK', N'Medium', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(1008 AS Numeric(18, 0)), N'MLMH103BLK', N'Large', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(1009 AS Numeric(18, 0)), N'MLMH103BLK', N'Extra Large', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(1047 AS Numeric(18, 0)), N'MLMT108BRN', N'Medium', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(1048 AS Numeric(18, 0)), N'MLMT108BRN', N'Large', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(1049 AS Numeric(18, 0)), N'MLMT108BRN', N'Extra Large', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(1124 AS Numeric(18, 0)), N'MLMH102', N'large', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(1125 AS Numeric(18, 0)), N'MLMH102', N'Extra Large', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(1181 AS Numeric(18, 0)), N'MLFT109', N'Small', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(1182 AS Numeric(18, 0)), N'MLFT109', N'Medium', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(1183 AS Numeric(18, 0)), N'MLFT109', N'Large', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(850 AS Numeric(18, 0)), N'STYLE002H', N'Extra Small', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(851 AS Numeric(18, 0)), N'STYLE002H', N'Small', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(852 AS Numeric(18, 0)), N'STYLE002H', N'Medium', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(853 AS Numeric(18, 0)), N'STYLE002H', N'Large', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
GO
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(858 AS Numeric(18, 0)), N'STYLE005', N'Extra Small', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(859 AS Numeric(18, 0)), N'STYLE005', N'Small', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(860 AS Numeric(18, 0)), N'STYLE005', N'Medium', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(861 AS Numeric(18, 0)), N'STYLE005', N'Large', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(1010 AS Numeric(18, 0)), N'MLMH103BRN', N'Small', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(1011 AS Numeric(18, 0)), N'MLMH103BRN', N'Medium', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(1012 AS Numeric(18, 0)), N'MLMH103BRN', N'Large', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(1013 AS Numeric(18, 0)), N'MLMH103BRN', N'Extra Large', CAST(0 AS Numeric(18, 0)), N'YES', 1, NULL)
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(1202 AS Numeric(18, 0)), N'MLFH101', N'Small', CAST(0 AS Numeric(18, 0)), N'YES', 1.5, CAST(N'2008-02-01T16:18:34.557' AS DateTime))
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(1203 AS Numeric(18, 0)), N'MLFH101', N'Medium', CAST(0 AS Numeric(18, 0)), N'YES', 1.75, CAST(N'2008-02-01T16:18:34.557' AS DateTime))
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(1204 AS Numeric(18, 0)), N'MLFH101', N'Large', CAST(0 AS Numeric(18, 0)), N'YES', 2.1, CAST(N'2008-02-01T16:18:34.557' AS DateTime))
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(1199 AS Numeric(18, 0)), N'MLFT106', N'Small', CAST(0 AS Numeric(18, 0)), N'YES', 1, CAST(N'2008-02-01T16:17:01.500' AS DateTime))
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(1200 AS Numeric(18, 0)), N'MLFT106', N'Medium', CAST(0 AS Numeric(18, 0)), N'YES', 1.25, CAST(N'2008-02-01T16:17:04.363' AS DateTime))
INSERT [dbo].[ProductSize] ([SerialNo], [ProductNo], [SizeName], [SizeStock], [SizeStatus], [WeightLBS], [RegDate]) VALUES (CAST(1201 AS Numeric(18, 0)), N'MLFT106', N'Large', CAST(0 AS Numeric(18, 0)), N'YES', 1.5, CAST(N'2008-02-01T16:17:05.300' AS DateTime))
SET IDENTITY_INSERT [dbo].[ProductSize] OFF
SET IDENTITY_INSERT [dbo].[ShopList] ON 

INSERT [dbo].[ShopList] ([SerialNo], [DisplayOrder], [Class], [CompanyName], [AddressLine1], [SuiteNo], [AddressLine2], [Phone], [Fax], [Email]) VALUES (CAST(1 AS Numeric(18, 0)), CAST(1000 AS Numeric(18, 0)), N'Sales Lab', N'SHOWROOM 605', N'127 East 9th street ', N'#605', N'Los Angeles, CA 90015', N'(213)622-0397', N'(213)622-0797', N'')
INSERT [dbo].[ShopList] ([SerialNo], [DisplayOrder], [Class], [CompanyName], [AddressLine1], [SuiteNo], [AddressLine2], [Phone], [Fax], [Email]) VALUES (CAST(2 AS Numeric(18, 0)), CAST(1100 AS Numeric(18, 0)), N'Retail Shop', N'LUXI', N'1450 Ala Moana Blvd ', N'#3111', N'Honolulu, HI 96814', N'(808)955-8894', N'', N'jeinpark@yahoo.com')
INSERT [dbo].[ShopList] ([SerialNo], [DisplayOrder], [Class], [CompanyName], [AddressLine1], [SuiteNo], [AddressLine2], [Phone], [Fax], [Email]) VALUES (CAST(3 AS Numeric(18, 0)), CAST(1200 AS Numeric(18, 0)), N'Retail Shop', N'LOUNGE', N'593 Broadway', N'', N'New York, NY 10012', N'(212)226-7585', N'(646)613-7542', N'')
INSERT [dbo].[ShopList] ([SerialNo], [DisplayOrder], [Class], [CompanyName], [AddressLine1], [SuiteNo], [AddressLine2], [Phone], [Fax], [Email]) VALUES (CAST(4 AS Numeric(18, 0)), CAST(1300 AS Numeric(18, 0)), N'Retail Shop', N'NY SPEED', N'7522 Melrose Ave', N'', N'Los Angeles, CA 90046', N'(323)655-7940', N'(323)655-7269', N'NESSST69@HOTMAIL.COM')
INSERT [dbo].[ShopList] ([SerialNo], [DisplayOrder], [Class], [CompanyName], [AddressLine1], [SuiteNo], [AddressLine2], [Phone], [Fax], [Email]) VALUES (CAST(5 AS Numeric(18, 0)), CAST(1400 AS Numeric(18, 0)), N'Retail Shop', N'MARTIN & WALL', N'142 University Ave ', N'#A', N'San Diego, CA 92103', N'(619)2911422', N'', N'')
INSERT [dbo].[ShopList] ([SerialNo], [DisplayOrder], [Class], [CompanyName], [AddressLine1], [SuiteNo], [AddressLine2], [Phone], [Fax], [Email]) VALUES (CAST(6 AS Numeric(18, 0)), CAST(1500 AS Numeric(18, 0)), N'Retail Shop', N'STITCH BOUTIQUE', N'1636 Main St ', N'', N'Sarasota, FL 34236', N'(941)366-7268', N'(941)544-8309', N'')
INSERT [dbo].[ShopList] ([SerialNo], [DisplayOrder], [Class], [CompanyName], [AddressLine1], [SuiteNo], [AddressLine2], [Phone], [Fax], [Email]) VALUES (CAST(7 AS Numeric(18, 0)), CAST(1600 AS Numeric(18, 0)), N'Retail Shop', N'MINX', N'11525 Cantrell Rd ', N'#403', N'Little Rock, AR 72212', N'(501)223-887x', N'(501)223-8875', N'')
INSERT [dbo].[ShopList] ([SerialNo], [DisplayOrder], [Class], [CompanyName], [AddressLine1], [SuiteNo], [AddressLine2], [Phone], [Fax], [Email]) VALUES (CAST(8 AS Numeric(18, 0)), CAST(1700 AS Numeric(18, 0)), N'Retail Shop', N'Bella Moda', N'967 South Coast Highway 101', N'', N'Encinitas, CA 92024', N'(858)776-0727', N'', N'Bellamodaboutique@SBCGlobal.net')
INSERT [dbo].[ShopList] ([SerialNo], [DisplayOrder], [Class], [CompanyName], [AddressLine1], [SuiteNo], [AddressLine2], [Phone], [Fax], [Email]) VALUES (CAST(9 AS Numeric(18, 0)), CAST(1800 AS Numeric(18, 0)), N'Retail Shop', N'THE LOOK', N'401 Newport Center Dr ', N'#209', N'Newport Beach, CA 92660', N'(949)644-2400', N'(949)644-0600', N'ARLANFLAUM@COX.NET')
INSERT [dbo].[ShopList] ([SerialNo], [DisplayOrder], [Class], [CompanyName], [AddressLine1], [SuiteNo], [AddressLine2], [Phone], [Fax], [Email]) VALUES (CAST(10 AS Numeric(18, 0)), CAST(1900 AS Numeric(18, 0)), N'Retail Shop', N'YELLOW KISS', N'952 Chorro St', N'', N'San Luis Obispo, CA 93401', N'(805)550-6538', N'', N'')
INSERT [dbo].[ShopList] ([SerialNo], [DisplayOrder], [Class], [CompanyName], [AddressLine1], [SuiteNo], [AddressLine2], [Phone], [Fax], [Email]) VALUES (CAST(11 AS Numeric(18, 0)), CAST(2000 AS Numeric(18, 0)), N'Corporation', N'Planet Funk', N'4929 Wilshire Blvd', N'  Suite #407', N'Los Angeles, CA 90010', N'(323)930-9900', N'(323)930-9907', N'')
INSERT [dbo].[ShopList] ([SerialNo], [DisplayOrder], [Class], [CompanyName], [AddressLine1], [SuiteNo], [AddressLine2], [Phone], [Fax], [Email]) VALUES (CAST(13 AS Numeric(18, 0)), CAST(2110 AS Numeric(18, 0)), N'Retail Shop', N'Planet Funk<br>BEVERLY CENTER', N'8500 Beverly Blvd', N'Space #757', N'Los Angeles, CA 90048', N'(310)-652-2800', N'', N'')
INSERT [dbo].[ShopList] ([SerialNo], [DisplayOrder], [Class], [CompanyName], [AddressLine1], [SuiteNo], [AddressLine2], [Phone], [Fax], [Email]) VALUES (CAST(14 AS Numeric(18, 0)), CAST(2120 AS Numeric(18, 0)), N'Retail Shop', N'Planet Funk<br>BREA MALL', N'1065 Brea Mall ', N'#1103B', N'Brea, CA 92821', N'(714)-990-6200', N'', N'')
INSERT [dbo].[ShopList] ([SerialNo], [DisplayOrder], [Class], [CompanyName], [AddressLine1], [SuiteNo], [AddressLine2], [Phone], [Fax], [Email]) VALUES (CAST(15 AS Numeric(18, 0)), CAST(2130 AS Numeric(18, 0)), N'Retail Shop', N'Planet Funk<br>HOLLYWOOD & HIGHLAND', N'6801 Hollywood Blvd', N'Space A1-111', N'Hollywood, CA 90028', N'(323)-461-4300', N'', N'')
INSERT [dbo].[ShopList] ([SerialNo], [DisplayOrder], [Class], [CompanyName], [AddressLine1], [SuiteNo], [AddressLine2], [Phone], [Fax], [Email]) VALUES (CAST(16 AS Numeric(18, 0)), CAST(2140 AS Numeric(18, 0)), N'Retail Shop', N'Planet Funk<br>HORTON PLAZA', N'324 Horton Plaza ', N'Space #265', N'San Diego, CA 92101', N'(619)-231-4242', N'', N'')
INSERT [dbo].[ShopList] ([SerialNo], [DisplayOrder], [Class], [CompanyName], [AddressLine1], [SuiteNo], [AddressLine2], [Phone], [Fax], [Email]) VALUES (CAST(17 AS Numeric(18, 0)), CAST(2150 AS Numeric(18, 0)), N'Retail Shop', N'Planet Funk<br>MELROSE AVENUE', N'7571 Melrose Ave.', N'', N'LA, CA 90046', N'(323)-655-2990', N'', N'')
INSERT [dbo].[ShopList] ([SerialNo], [DisplayOrder], [Class], [CompanyName], [AddressLine1], [SuiteNo], [AddressLine2], [Phone], [Fax], [Email]) VALUES (CAST(18 AS Numeric(18, 0)), CAST(2160 AS Numeric(18, 0)), N'Retail Shop', N'Planet Funk<br>THE OAKS MALL', N'232 West Hillcrest Drive', N'', N'Thousand Oaks, CA 91360', N'(805)-778-1133', N'', N'')
INSERT [dbo].[ShopList] ([SerialNo], [DisplayOrder], [Class], [CompanyName], [AddressLine1], [SuiteNo], [AddressLine2], [Phone], [Fax], [Email]) VALUES (CAST(19 AS Numeric(18, 0)), CAST(2170 AS Numeric(18, 0)), N'Retail Shop', N'Planet Funk<br>PALOS VERDES AVENUE OF THE PENINSULA MALL', N'550 Deep Valley Dr. ', N'#269', N'Palos Verdes Peninsula, CA 90274', N'(310)-265-1000', N'', N'')
INSERT [dbo].[ShopList] ([SerialNo], [DisplayOrder], [Class], [CompanyName], [AddressLine1], [SuiteNo], [AddressLine2], [Phone], [Fax], [Email]) VALUES (CAST(20 AS Numeric(18, 0)), CAST(2180 AS Numeric(18, 0)), N'Retail Shop', N'Planet Funk<br>PARK MEADOWS', N'8401 Park Meadows Center Dr.', N'', N'Highlands Ranch, CO 80124', N'(303)-925-7448', N'', N'')
INSERT [dbo].[ShopList] ([SerialNo], [DisplayOrder], [Class], [CompanyName], [AddressLine1], [SuiteNo], [AddressLine2], [Phone], [Fax], [Email]) VALUES (CAST(21 AS Numeric(18, 0)), CAST(2190 AS Numeric(18, 0)), N'Retail Shop', N'Planet Funk<br>PASADENA PASEO COLORADO', N'372 E. Colorado Blvd.', N'', N'Pasadena, CA 91101', N'(626)-229-0300', N'', N'')
INSERT [dbo].[ShopList] ([SerialNo], [DisplayOrder], [Class], [CompanyName], [AddressLine1], [SuiteNo], [AddressLine2], [Phone], [Fax], [Email]) VALUES (CAST(22 AS Numeric(18, 0)), CAST(2200 AS Numeric(18, 0)), N'Retail Shop', N'Planet Funk<br>SANTA MONICA PLACE', N'126 Santa Monica Place', N'', N'Santa Monica, CA 90401', N'(310)-434-9777', N'', N'')
INSERT [dbo].[ShopList] ([SerialNo], [DisplayOrder], [Class], [CompanyName], [AddressLine1], [SuiteNo], [AddressLine2], [Phone], [Fax], [Email]) VALUES (CAST(23 AS Numeric(18, 0)), CAST(2210 AS Numeric(18, 0)), N'Retail Shop', N'Planet Funk<br>SHERMAN OAKS FASHION SQUARE', N'14006 Riverside Dr. ', N'#18', N'Sherman Oaks, CA 91423', N'(818)-784-7815', N'', N'')
INSERT [dbo].[ShopList] ([SerialNo], [DisplayOrder], [Class], [CompanyName], [AddressLine1], [SuiteNo], [AddressLine2], [Phone], [Fax], [Email]) VALUES (CAST(24 AS Numeric(18, 0)), CAST(2220 AS Numeric(18, 0)), N'Retail Shop', N'Planet Funk<br>SOUTH BAY GALLERIA', N'1815 Hawthorne Blvd. ', N'#138', N'Redondo Beach, CA 90278', N'(310)-214-2277', N'', N'')
INSERT [dbo].[ShopList] ([SerialNo], [DisplayOrder], [Class], [CompanyName], [AddressLine1], [SuiteNo], [AddressLine2], [Phone], [Fax], [Email]) VALUES (CAST(25 AS Numeric(18, 0)), CAST(2230 AS Numeric(18, 0)), N'Retail Shop', N'Planet Funk<br>VICTORIA GARDENS', N'12541 N. Main Street ', N'Space 3810', N'Rancho Cucamonga, CA 91739', N'(909)-463-4244', N'', N'')
INSERT [dbo].[ShopList] ([SerialNo], [DisplayOrder], [Class], [CompanyName], [AddressLine1], [SuiteNo], [AddressLine2], [Phone], [Fax], [Email]) VALUES (CAST(26 AS Numeric(18, 0)), CAST(2240 AS Numeric(18, 0)), N'Retail Shop', N'Planet Funk<br>WESTFIELD CENTURY CITY', N'10250 Santa Monica Blvd.', N'Space #1030', N'Los Angeles, CA 90067', N'(310)-229-0000', N'', N'')
INSERT [dbo].[ShopList] ([SerialNo], [DisplayOrder], [Class], [CompanyName], [AddressLine1], [SuiteNo], [AddressLine2], [Phone], [Fax], [Email]) VALUES (CAST(27 AS Numeric(18, 0)), CAST(2250 AS Numeric(18, 0)), N'Retail Shop', N'Planet Funk<br>WESTSIDE PAVILION', N'10800 W. Pico Blvd. ', N'#175', N'LA, CA 90064', N'(310)-441-9636', N'', N'')
INSERT [dbo].[ShopList] ([SerialNo], [DisplayOrder], [Class], [CompanyName], [AddressLine1], [SuiteNo], [AddressLine2], [Phone], [Fax], [Email]) VALUES (CAST(28 AS Numeric(18, 0)), CAST(2260 AS Numeric(18, 0)), N'Retail Shop', N'Planet Funk<br>WESTFIELD SAN FRANCISCO CENTRE', N'865 Market Street ', N'Space 244', N'San Francisco, CA 94103', N'(415)-777-4300', N'', N'')
INSERT [dbo].[ShopList] ([SerialNo], [DisplayOrder], [Class], [CompanyName], [AddressLine1], [SuiteNo], [AddressLine2], [Phone], [Fax], [Email]) VALUES (CAST(29 AS Numeric(18, 0)), CAST(2270 AS Numeric(18, 0)), N'Retail Shop', N'Planet Funk<br>WESTFIELD SHOPPINGTOWN MAINPLACE IN SANTA ANA', N'2800 N. Main St. ', N'Suite 412', N'Santa Ana, CA 92705', N'(714)-558-1700', N'', N'')
INSERT [dbo].[ShopList] ([SerialNo], [DisplayOrder], [Class], [CompanyName], [AddressLine1], [SuiteNo], [AddressLine2], [Phone], [Fax], [Email]) VALUES (CAST(30 AS Numeric(18, 0)), CAST(2280 AS Numeric(18, 0)), N'Retail Shop', N'Planet Funk<br>WESTFIELD TOPANGA', N'6600 Topanga Canyon Blvd. ', N'Space 2058', N'Canoga Park, CA 91303', N'(818)-992-6900', N'', N'')
SET IDENTITY_INSERT [dbo].[ShopList] OFF
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 1, 4.2, 4.32, 4.46, 4.65, 4.89, 4.97, 5.08, 15.67, 15.67, 20.67)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 2, 4.27, 4.54, 4.99, 5.08, 5.45, 5.58, 5.85, 17.5, 17.5, 22.5)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 3, 4.31, 4.75, 5.24, 5.42, 5.82, 6.01, 6.5, 19.12, 19.12, 24.12)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 4, 4.43, 4.92, 5.5, 5.78, 6.16, 6.36, 6.92, 20.82, 20.82, 25.82)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 5, 4.65, 5, 5.76, 6.05, 6.44, 6.69, 7.34, 22.85, 22.85, 27.85)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 6, 4.8, 5.17, 5.86, 6.23, 6.63, 6.95, 7.59, 25.07, 25.07, 30.07)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 7, 5.05, 5.33, 6, 6.45, 6.86, 7.2, 7.95, 26.89, 26.89, 31.89)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 8, 5.25, 5.51, 6.16, 6.6, 7.08, 7.53, 8.45, 28.83, 28.83, 33.83)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 9, 5.4, 5.67, 6.29, 6.77, 7.25, 7.94, 9, 30.96, 30.96, 35.96)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 10, 5.59, 5.71, 6.44, 6.96, 7.56, 8.51, 9.61, 32.91, 32.91, 37.91)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 11, 5.78, 5.98, 6.56, 7.11, 7.88, 9.12, 10.3, 34.95, 34.95, 39.95)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 12, 5.95, 6.18, 6.71, 7.27, 8.24, 9.73, 11.05, 36.67, 36.67, 41.67)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 13, 6.15, 6.38, 6.82, 7.44, 8.64, 10.35, 11.8, 38.28, 38.28, 43.28)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 14, 6.28, 6.58, 6.96, 7.61, 9.12, 10.95, 12.55, 40.03, 40.03, 45.03)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 15, 6.41, 6.79, 7.08, 7.79, 9.6, 11.56, 13.3, 41.66, 41.66, 46.66)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 16, 6.51, 6.92, 7.19, 7.94, 9.97, 12.06, 13.93, 43.71, 43.71, 48.71)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 17, 6.58, 7.15, 7.41, 8.27, 10.47, 12.65, 14.62, 45.54, 45.54, 50.54)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 18, 6.68, 7.38, 7.65, 8.69, 10.98, 13.22, 15.36, 47.6, 47.6, 52.6)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 19, 6.82, 7.62, 7.94, 9.09, 11.47, 13.8, 16.1, 49.54, 49.54, 54.54)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 20, 6.96, 7.87, 8.22, 9.51, 11.97, 14.39, 16.85, 51.37, 51.37, 56.37)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 21, 7.12, 8.12, 8.48, 9.91, 12.47, 14.96, 17.59, 52.9, 52.9, 57.9)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 22, 7.28, 8.36, 8.78, 10.28, 12.97, 15.55, 18.35, 54.54, 54.54, 59.54)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 23, 7.46, 8.61, 9.07, 10.66, 13.46, 16.12, 19.1, 56.36, 56.36, 61.36)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 24, 7.63, 8.83, 9.37, 11.01, 13.97, 16.69, 19.84, 58.21, 58.21, 63.21)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 25, 7.81, 9.07, 9.66, 11.34, 14.47, 17.26, 20.58, 60.05, 60.05, 65.05)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 26, 8.02, 9.29, 9.95, 11.71, 15, 17.83, 21.32, 62.09, 62.09, 67.09)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 27, 8.21, 9.5, 10.24, 12.07, 15.51, 18.4, 22.06, 63.82, 63.82, 68.82)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 28, 8.38, 9.73, 10.56, 12.44, 16.01, 18.97, 22.83, 65.56, 65.56, 70.56)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 29, 8.57, 9.95, 10.87, 12.8, 16.53, 19.54, 23.6, 67.4, 67.4, 72.4)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 30, 8.78, 10.2, 11.2, 13.18, 17.06, 20.11, 24.36, 69.04, 69.04, 74.04)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 31, 8.95, 10.41, 11.49, 13.54, 17.55, 20.68, 25.09, 70.77, 70.77, 75.77)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 32, 9.03, 10.63, 11.8, 13.92, 18.05, 21.25, 25.85, 72.3, 72.3, 77.3)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 33, 9.21, 10.87, 12.1, 14.3, 18.52, 21.82, 26.58, 73.83, 73.83, 78.83)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 34, 9.38, 11.11, 12.39, 14.67, 19.03, 22.39, 27.32, 75.46, 75.46, 80.46)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 35, 9.54, 11.37, 12.7, 15.04, 19.52, 22.96, 28.03, 77.32, 77.32, 82.32)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 36, 9.71, 11.57, 12.97, 15.41, 20, 23.53, 28.7, 79.15, 79.15, 84.15)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 37, 9.89, 11.83, 13.26, 15.78, 20.45, 24.1, 29.25, 80.98, 80.98, 85.98)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 38, 10.04, 12.05, 13.56, 16.16, 20.91, 24.67, 29.8, 82.91, 82.91, 87.91)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 39, 10.18, 12.28, 13.86, 16.52, 21.37, 25.24, 30.35, 84.55, 84.55, 89.55)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 40, 10.34, 12.55, 14.16, 16.9, 21.83, 25.81, 30.9, 86.49, 86.49, 91.49)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 41, 10.5, 12.76, 14.44, 17.27, 22.28, 26.38, 31.45, 88.33, 88.33, 93.33)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 42, 10.66, 12.99, 14.72, 17.64, 22.71, 26.95, 32, 90.17, 90.17, 95.17)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 43, 10.8, 13.22, 15.02, 18.02, 23.14, 27.52, 32.55, 92.01, 92.01, 97.01)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 44, 10.94, 13.44, 15.27, 18.39, 23.55, 28.09, 33.1, 93.85, 93.85, 98.85)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 45, 11.06, 13.68, 15.55, 18.76, 23.96, 28.66, 33.65, 95.68, 95.68, 100.68)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 46, 11.18, 13.9, 15.78, 19.1, 24.33, 29.23, 34.2, 97.52, 97.52, 102.52)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 47, 11.3, 14.1, 16.03, 19.45, 24.67, 29.8, 34.75, 99.37, 99.37, 104.37)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 48, 11.42, 14.3, 16.28, 19.78, 25.03, 30.37, 35.3, 101.08, 101.08, 106.08)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 49, 11.54, 14.48, 16.52, 20.12, 25.36, 30.94, 35.85, 102.83, 102.83, 107.83)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 50, 11.66, 14.65, 16.74, 20.42, 25.69, 31.51, 36.4, 104.56, 104.56, 109.56)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 51, 11.78, 14.78, 16.97, 20.73, 26, 32.05, 36.95, 106.3, 106.3, 111.3)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 52, 11.9, 14.91, 17.18, 21.01, 26.32, 32.55, 37.5, 108.04, 108.04, 113.04)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 53, 12.02, 15.07, 17.38, 21.29, 26.62, 32.95, 38.05, 109.67, 109.67, 114.67)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 54, 12.14, 15.2, 17.61, 21.57, 26.94, 33.25, 38.6, 111.4, 111.4, 116.4)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 55, 12.26, 15.33, 17.78, 21.88, 27.26, 33.5, 39.15, 113.14, 113.14, 118.14)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 56, 12.38, 15.47, 17.98, 22.19, 27.57, 33.75, 39.7, 114.88, 114.88, 119.88)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 57, 12.5, 15.63, 18.17, 22.51, 27.87, 34, 40.2, 116.72, 116.72, 121.72)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 58, 12.62, 15.8, 18.38, 22.75, 28.18, 34.2, 40.6, 118.45, 118.45, 123.45)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 59, 12.74, 15.97, 18.59, 22.97, 28.44, 34.4, 40.9, 120.28, 120.28, 125.28)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 60, 12.86, 16.14, 18.8, 23.14, 28.68, 34.6, 41.15, 122.13, 122.13, 127.13)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 61, 12.99, 16.29, 19, 23.4, 28.94, 34.8, 41.4, 123.64, 123.64, 128.64)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 62, 13.09, 16.42, 19.17, 23.6, 29.15, 35, 41.65, 125.68, 125.68, 130.68)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 63, 13.2, 16.58, 19.35, 23.8, 29.33, 35.23, 41.9, 127.71, 127.71, 132.71)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 64, 13.31, 16.75, 19.55, 23.98, 29.54, 35.47, 42.15, 129.85, 129.85, 134.85)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 65, 13.42, 16.94, 19.78, 24.14, 29.8, 35.66, 42.4, 131.98, 131.98, 136.98)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 66, 13.53, 17.15, 20, 24.3, 30.1, 35.83, 42.71, 134.01, 134.01, 139.01)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 67, 13.64, 17.33, 20.2, 24.44, 30.34, 36, 42.82, 136.04, 136.04, 141.04)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 68, 13.75, 17.5, 20.39, 24.58, 30.5, 36.2, 42.92, 138, 138, 143)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 69, 13.86, 17.67, 20.58, 24.72, 30.66, 36.4, 43.03, 140.01, 140.01, 145.01)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 70, 13.97, 17.84, 20.78, 24.86, 30.82, 36.6, 43.13, 142.05, 142.05, 147.05)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 71, 14.6, 18.36, 20.98, 25.3, 31.15, 36.75, 43.33, 144.49, 144.49, 149.49)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 72, 15.33, 19.06, 21.33, 25.75, 31.67, 37.25, 43.53, 146.93, 146.93, 151.93)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 73, 16.09, 19.75, 21.83, 26.4, 32.27, 37.9, 43.73, 149.37, 149.37, 154.37)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 74, 16.84, 20.44, 22.5, 27.1, 32.87, 38.56, 43.93, 151.3, 151.3, 156.3)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 75, 17.6, 21.13, 23.15, 27.79, 33.47, 39.25, 44.13, 153.03, 153.03, 158.03)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 76, 18.35, 21.83, 23.8, 28.44, 34.06, 39.98, 44.33, 154.76, 154.76, 159.76)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 77, 19.11, 22.52, 24.45, 29.09, 34.66, 40.72, 44.53, 156.49, 156.49, 161.49)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 78, 19.87, 23.21, 25.1, 29.74, 35.26, 41.41, 44.85, 158.33, 158.33, 163.33)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 79, 20.62, 23.91, 25.75, 30.39, 35.86, 42, 45.4, 160.04, 160.04, 165.04)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 80, 21.38, 24.6, 26.4, 31.04, 36.46, 42.58, 45.94, 161.87, 161.87, 166.87)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 81, 21.93, 25.19, 27.05, 31.49, 36.95, 43.17, 46.49, 163.71, 163.71, 168.71)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 82, 22.68, 25.8, 27.7, 32.11, 37.42, 43.76, 47.02, 165.65, 165.65, 170.65)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 83, 23.45, 26.43, 28.35, 32.74, 38, 44.35, 47.56, 167.47, 167.47, 172.47)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 84, 24.22, 27.1, 28.97, 33.37, 38.58, 44.9, 48.09, 169.39, 169.39, 174.39)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 85, 25, 27.76, 29.58, 33.99, 39.15, 45.39, 48.63, 171.34, 171.34, 176.34)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 86, 25.8, 28.43, 30.21, 34.63, 39.71, 45.87, 49.17, 173.16, 173.16, 178.16)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 87, 26.6, 29.1, 30.93, 35.25, 40.22, 46.35, 49.7, 175.1, 175.1, 180.1)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 88, 27.43, 29.77, 31.56, 35.88, 40.75, 46.83, 50.26, 177.03, 177.03, 182.03)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 89, 28.26, 30.43, 32.17, 36.5, 41.26, 47.32, 50.81, 178.87, 178.87, 183.87)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 90, 29.09, 31.09, 32.79, 37, 41.78, 47.78, 51.34, 180.69, 180.69, 185.69)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 91, 29.8, 31.77, 33.53, 37.63, 42.3, 48.26, 51.89, 182.63, 182.63, 187.63)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 92, 30.52, 32.43, 34.15, 38.14, 42.82, 48.79, 52.45, 184.36, 184.36, 189.36)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 93, 31.24, 33.09, 34.88, 38.76, 43.33, 49.3, 52.98, 186.17, 186.17, 191.17)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 94, 31.98, 33.75, 35.49, 39.26, 43.85, 49.83, 53.54, 187.92, 187.92, 192.92)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 95, 32.72, 34.42, 36.21, 39.88, 44.35, 50.35, 54.09, 189.73, 189.73, 194.73)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 96, 33.46, 35.08, 36.94, 40.49, 44.89, 50.86, 54.63, 191.47, 191.47, 196.47)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 97, 34.22, 35.74, 37.56, 41.12, 45.41, 51.39, 55.2, 193.3, 193.3, 198.3)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 98, 34.99, 36.32, 38.28, 41.62, 45.93, 51.91, 55.73, 195.02, 195.02, 200.02)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 99, 35.77, 36.9, 39.01, 42.14, 46.45, 52.43, 56.29, 196.85, 196.85, 201.85)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 100, 36.54, 37.5, 39.73, 42.76, 46.96, 52.95, 56.84, 198.68, 198.68, 203.68)
GO
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 101, 37.17, 38.09, 40.45, 43.37, 47.48, 53.47, 57.37, 200.5, 200.5, 205.5)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 102, 37.81, 38.68, 40.94, 43.95, 47.99, 53.99, 57.92, 202.35, 202.35, 207.35)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 103, 38.45, 39.29, 41.45, 44.42, 48.49, 54.52, 58.44, 204.17, 204.17, 209.17)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 104, 39.07, 39.88, 41.96, 44.89, 48.99, 55.03, 58.99, 206.11, 206.11, 211.11)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 105, 39.72, 40.5, 42.46, 45.38, 49.48, 55.56, 59.5, 207.94, 207.94, 212.94)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 106, 40.37, 41.11, 42.97, 45.85, 49.98, 56.07, 60.05, 209.86, 209.86, 214.86)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 107, 41.04, 41.74, 43.48, 46.34, 50.48, 56.59, 60.59, 211.8, 211.8, 216.8)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 108, 41.7, 42.35, 43.99, 46.82, 50.98, 57.11, 61.12, 213.73, 213.73, 218.73)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 109, 42.35, 42.97, 44.49, 47.3, 51.47, 57.62, 61.66, 215.56, 215.56, 220.56)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 110, 43.04, 43.61, 45.02, 47.78, 51.99, 58.15, 62.2, 217.38, 217.38, 222.38)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 111, 43.51, 44.11, 45.54, 48.26, 52.48, 58.66, 62.72, 219.32, 219.32, 224.32)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 112, 43.97, 44.6, 46.05, 48.75, 52.98, 59.19, 63.24, 221.26, 221.26, 226.26)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 113, 44.44, 45.12, 46.58, 49.23, 53.48, 59.7, 63.76, 223.19, 223.19, 228.19)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 114, 44.91, 45.63, 47.09, 49.72, 53.99, 60.21, 64.29, 225.12, 225.12, 230.12)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 115, 45.4, 46.15, 47.63, 50.21, 54.49, 60.74, 64.82, 227.04, 227.04, 232.04)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 116, 45.87, 46.66, 48.16, 50.71, 55, 61.25, 65.34, 228.88, 228.88, 233.88)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 117, 46.33, 47.17, 48.67, 51.18, 55.5, 61.77, 65.88, 230.71, 230.71, 235.71)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 118, 46.82, 47.69, 49.21, 51.67, 56, 62.29, 66.39, 232.55, 232.55, 237.55)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 119, 47.3, 48.22, 49.74, 52.16, 56.51, 62.81, 66.92, 234.77, 234.77, 239.77)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 120, 47.79, 48.73, 50.28, 52.66, 57.01, 63.32, 67.46, 236.71, 236.71, 241.71)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 121, 48.27, 49.26, 50.81, 53.15, 57.53, 63.84, 67.98, 238.74, 238.74, 243.74)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 122, 48.75, 49.78, 51.35, 53.64, 58.02, 64.35, 68.53, 240.77, 240.77, 245.77)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 123, 49.24, 50.3, 51.9, 54.13, 58.54, 64.87, 69.06, 242.81, 242.81, 247.81)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 124, 49.73, 50.84, 52.44, 54.64, 59.05, 65.39, 69.59, 244.85, 244.85, 249.85)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 125, 50.21, 51.37, 52.98, 55.12, 59.55, 65.9, 70.12, 246.88, 246.88, 251.88)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 126, 50.71, 51.9, 53.53, 55.63, 60.07, 66.42, 70.67, 248.9, 248.9, 253.9)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 127, 51.19, 52.43, 54.08, 56.12, 60.58, 66.93, 71.19, 250.93, 250.93, 255.93)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 128, 51.7, 52.98, 54.63, 56.62, 61.09, 67.44, 71.74, 252.97, 252.97, 257.97)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 129, 52.18, 53.52, 55.19, 57.13, 61.6, 67.96, 72.27, 255, 255, 260)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 130, 52.68, 54.05, 55.72, 57.61, 62.1, 68.48, 72.81, 257.04, 257.04, 262.04)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 131, 53.19, 54.6, 56.29, 58.13, 62.62, 69, 73.34, 259.07, 259.07, 264.07)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 132, 53.68, 55.15, 56.85, 58.62, 63.14, 69.51, 73.87, 261.1, 261.1, 266.1)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 133, 54.19, 55.7, 57.41, 59.12, 63.64, 70.03, 74.41, 263.14, 263.14, 268.14)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 134, 54.68, 56.24, 57.98, 59.64, 64.16, 70.54, 74.95, 265.17, 265.17, 270.17)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 135, 55.18, 56.8, 58.54, 60.13, 64.67, 71.05, 75.48, 267.21, 267.21, 272.21)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 136, 55.69, 57.34, 59.11, 60.64, 65.18, 71.57, 76.03, 269.23, 269.23, 274.23)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 137, 56.19, 57.9, 59.67, 61.14, 65.7, 72.07, 76.57, 271.28, 271.28, 276.28)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 138, 56.7, 58.45, 60.24, 61.66, 66.22, 72.59, 77.1, 273.32, 273.32, 278.32)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 139, 57.2, 59.02, 60.81, 62.17, 66.73, 73.1, 77.63, 275.35, 275.35, 280.35)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 140, 57.72, 59.59, 61.38, 62.68, 67.25, 73.62, 78.18, 277.27, 277.27, 282.27)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 141, 58.23, 60.14, 61.96, 63.18, 67.77, 74.13, 78.72, 279.2, 279.2, 284.2)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 142, 58.74, 60.71, 62.53, 63.69, 68.28, 74.64, 79.25, 281.16, 281.16, 286.16)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 143, 59.26, 61.27, 63.12, 64.21, 68.8, 75.16, 79.79, 283.07, 283.07, 288.07)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 144, 59.78, 61.83, 63.7, 64.71, 69.32, 75.67, 80.32, 285.01, 285.01, 290.01)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 145, 60.29, 62.41, 64.28, 65.24, 69.84, 76.18, 80.86, 287.04, 287.04, 292.04)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 146, 60.81, 62.97, 64.86, 65.74, 70.35, 76.69, 81.38, 289.08, 289.08, 294.08)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 147, 61.33, 63.56, 65.46, 66.26, 70.88, 77.2, 81.93, 291.11, 291.11, 296.11)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 148, 61.84, 64.12, 66.04, 66.78, 71.4, 77.72, 82.47, 293.14, 293.14, 298.14)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 149, 62.36, 64.7, 66.63, 67.29, 71.91, 78.22, 83, 295.18, 295.18, 300.18)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 150, 62.9, 65.29, 67.23, 67.81, 72.44, 78.74, 83.54, 297.21, 297.21, 302.21)
INSERT [dbo].[UPS_Rates] ([Area], [Class], [Weight], [Zone2], [Zone3], [Zone4], [Zone5], [Zone6], [Zone7], [Zone8], [Zone44], [Zone45], [Zone46]) VALUES (N'Domestic', N'Ground', 999, 0.42, 0.44, 0.45, 0.46, 0.49, 0.53, 0.56, 1.99, 1.99, 2.02)
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'004', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'005', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'006', N'045', N'000', N'225', N'000', N'000', N'125')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'007', N'045', N'000', N'225', N'000', N'000', N'125')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'009', N'045', N'000', N'225', N'000', N'000', N'125')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'010', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'011', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'012', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'013', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'014', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'015', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'016', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'017', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'018', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'019', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'020', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'021', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'022', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'023', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'024', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'025', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'026', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'027', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'028', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'029', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'030', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'031', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'032', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'033', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'034', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'035', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'036', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'037', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'038', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'039', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'040', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'041', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'042', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'043', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'044', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'045', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'046', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'047', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'048', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'049', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'050', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'051', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'052', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'053', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'054', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'055', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'056', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'057', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'058', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'059', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'060', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'061', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'062', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'063', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'064', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'065', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'066', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'067', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'068', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'069', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'070', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'071', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'072', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'073', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'074', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'075', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'076', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'077', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'078', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'079', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'080', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'081', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'082', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'083', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'084', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'085', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'086', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'087', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'088', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'089', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'100', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'101', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'102', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'103', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'104', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'105', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'106', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'107', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'108', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'109', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'110', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'111', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'112', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'113', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'114', N'008', N'308', N'208', N'248', N'138', N'108')
GO
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'115', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'116', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'117', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'118', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'119', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'120', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'121', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'122', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'123', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'124', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'125', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'126', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'127', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'128', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'129', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'130', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'131', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'132', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'133', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'134', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'135', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'136', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'137', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'138', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'139', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'140', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'141', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'142', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'143', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'144', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'145', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'146', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'147', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'148', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'149', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'150', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'151', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'152', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'153', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'154', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'155', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'156', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'157', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'158', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'159', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'160', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'161', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'162', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'163', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'164', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'165', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'166', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'167', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'168', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'169', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'170', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'171', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'172', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'173', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'174', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'175', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'176', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'177', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'178', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'179', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'180', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'181', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'182', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'183', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'184', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'185', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'186', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'187', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'188', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'189', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'190', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'191', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'192', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'193', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'194', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'195', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'196', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'197', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'198', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'199', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'200', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'201', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'202', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'203', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'204', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'205', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'206', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'207', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'208', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'209', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'210', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'211', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'212', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'213', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'214', N'008', N'308', N'208', N'248', N'138', N'108')
GO
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'215', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'216', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'217', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'218', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'219', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'220', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'221', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'222', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'223', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'224', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'225', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'226', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'227', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'228', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'229', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'230', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'231', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'232', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'233', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'234', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'235', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'236', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'237', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'238', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'239', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'240', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'241', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'242', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'243', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'244', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'245', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'246', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'247', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'248', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'249', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'250', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'251', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'252', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'253', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'254', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'255', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'256', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'257', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'258', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'259', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'260', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'261', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'262', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'263', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'264', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'265', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'266', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'267', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'268', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'269', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'270', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'271', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'272', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'273', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'274', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'275', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'276', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'277', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'278', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'279', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'280', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'281', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'282', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'283', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'284', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'285', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'286', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'287', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'288', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'289', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'290', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'291', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'292', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'293', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'294', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'295', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'296', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'297', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'298', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'299', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'300', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'301', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'302', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'303', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'304', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'305', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'306', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'307', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'308', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'309', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'310', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'311', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'312', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'313', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'314', N'008', N'308', N'208', N'248', N'138', N'108')
GO
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'315', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'316', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'317', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'318', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'319', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'320', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'321', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'322', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'323', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'324', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'325', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'326', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'327', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'328', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'329', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'330', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'331', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'332', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'333', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'334', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'335', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'336', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'337', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'338', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'339', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'341', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'342', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'343', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'344', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'345', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'346', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'347', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'348', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'349', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'350', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'351', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'352', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'353', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'354', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'355', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'356', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'357', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'358', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'359', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'360', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'361', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'362', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'363', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'364', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'365', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'366', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'367', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'368', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'369', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'370', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'371', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'372', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'373', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'374', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'375', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'376', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'377', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'378', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'379', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'380', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'381', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'382', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'383', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'384', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'385', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'386', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'387', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'388', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'389', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'390', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'391', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'392', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'393', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'394', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'395', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'396', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'397', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'398', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'399', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'400', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'401', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'402', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'403', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'404', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'405', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'406', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'407', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'408', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'409', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'410', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'411', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'412', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'413', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'414', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'415', N'008', N'308', N'208', N'248', N'138', N'108')
GO
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'416', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'417', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'418', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'420', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'421', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'422', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'423', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'424', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'425', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'426', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'427', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'428', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'429', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'430', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'431', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'432', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'433', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'434', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'435', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'436', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'437', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'438', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'439', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'440', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'441', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'442', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'443', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'444', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'445', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'446', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'447', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'448', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'449', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'450', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'451', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'452', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'453', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'454', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'455', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'456', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'457', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'458', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'459', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'460', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'461', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'462', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'463', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'464', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'465', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'466', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'467', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'468', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'469', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'470', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'471', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'472', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'473', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'474', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'475', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'476', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'477', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'478', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'479', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'480', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'481', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'482', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'483', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'484', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'485', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'486', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'487', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'488', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'489', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'490', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'491', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'492', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'493', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'494', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'495', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'496', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'497', N'008', N'308', N'208', N'248', N'138', N'108')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'498', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'499', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'500', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'501', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'502', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'503', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'504', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'505', N'006', N'306', N'206', N'246', N'136', N'106')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'506', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'507', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'508', N'006', N'306', N'206', N'246', N'136', N'106')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'509', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'510', N'006', N'306', N'206', N'246', N'136', N'106')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'511', N'006', N'306', N'206', N'246', N'136', N'106')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'512', N'006', N'306', N'206', N'246', N'136', N'106')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'513', N'006', N'306', N'206', N'246', N'136', N'106')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'514', N'006', N'306', N'206', N'246', N'136', N'106')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'515', N'006', N'306', N'206', N'246', N'136', N'106')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'516', N'006', N'306', N'206', N'246', N'136', N'106')
GO
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'520', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'521', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'522', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'523', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'524', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'525', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'526', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'527', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'528', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'529', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'530', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'531', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'532', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'533', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'534', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'535', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'536', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'537', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'538', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'539', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'540', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'541', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'542', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'543', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'544', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'545', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'546', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'547', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'548', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'549', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'550', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'551', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'552', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'553', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'554', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'555', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'556', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'557', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'558', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'559', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'560', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'561', N'006', N'306', N'206', N'246', N'136', N'106')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'562', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'563', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'564', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'565', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'566', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'567', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'570', N'006', N'306', N'206', N'246', N'136', N'106')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'571', N'006', N'306', N'206', N'246', N'136', N'106')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'572', N'006', N'306', N'206', N'246', N'136', N'106')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'573', N'006', N'306', N'206', N'246', N'136', N'106')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'574', N'006', N'306', N'206', N'246', N'136', N'106')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'575', N'006', N'306', N'206', N'246', N'136', N'106')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'576', N'006', N'306', N'206', N'246', N'136', N'106')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'577', N'006', N'306', N'206', N'246', N'136', N'106')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'578', N'006', N'306', N'206', N'246', N'136', N'106')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'579', N'006', N'306', N'206', N'246', N'136', N'106')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'580', N'006', N'306', N'206', N'246', N'136', N'106')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'581', N'006', N'306', N'206', N'246', N'136', N'106')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'582', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'583', N'006', N'306', N'206', N'246', N'136', N'106')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'584', N'006', N'306', N'206', N'246', N'136', N'106')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'585', N'006', N'306', N'206', N'246', N'136', N'106')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'586', N'006', N'306', N'206', N'246', N'136', N'106')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'587', N'006', N'306', N'206', N'246', N'136', N'106')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'588', N'006', N'306', N'206', N'246', N'136', N'106')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'590', N'005', N'305', N'205', N'245', N'135', N'105')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'591', N'005', N'305', N'205', N'245', N'135', N'105')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'592', N'006', N'306', N'206', N'246', N'136', N'106')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'293', N'006', N'306', N'206', N'246', N'136', N'106')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'594', N'005', N'305', N'205', N'245', N'135', N'105')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'595', N'006', N'306', N'206', N'246', N'136', N'106')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'596', N'005', N'305', N'205', N'245', N'135', N'105')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'597', N'005', N'305', N'205', N'245', N'135', N'105')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'598', N'005', N'305', N'205', N'245', N'135', N'105')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'599', N'005', N'305', N'205', N'245', N'135', N'105')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'600', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'601', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'602', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'603', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'604', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'605', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'606', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'607', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'608', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'609', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'610', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'611', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'612', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'613', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'614', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'615', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'616', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'617', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'618', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'619', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'620', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'621', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'622', N'007', N'307', N'207', N'247', N'137', N'107')
GO
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'623', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'624', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'625', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'626', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'627', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'628', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'629', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'630', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'631', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'632', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'633', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'634', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'635', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'636', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'637', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'638', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'639', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'640', N'006', N'306', N'206', N'246', N'136', N'106')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'641', N'006', N'306', N'206', N'246', N'136', N'106')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'642', N'006', N'306', N'206', N'246', N'136', N'106')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'643', N'006', N'306', N'206', N'246', N'136', N'106')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'644', N'006', N'306', N'206', N'246', N'136', N'106')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'645', N'006', N'306', N'206', N'246', N'136', N'106')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'646', N'006', N'306', N'206', N'246', N'136', N'106')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'647', N'006', N'306', N'206', N'246', N'136', N'106')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'648', N'006', N'306', N'206', N'246', N'136', N'106')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'649', N'006', N'306', N'206', N'246', N'136', N'106')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'650', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'651', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'652', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'653', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'654', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'655', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'656', N'006', N'306', N'206', N'246', N'136', N'106')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'657', N'006', N'306', N'206', N'246', N'136', N'106')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'658', N'006', N'306', N'206', N'246', N'136', N'106')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'659', N'006', N'306', N'206', N'246', N'136', N'106')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'660', N'006', N'306', N'206', N'246', N'136', N'106')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'661', N'006', N'306', N'206', N'246', N'136', N'106')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'662', N'006', N'306', N'206', N'246', N'136', N'106')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'663', N'006', N'306', N'206', N'246', N'136', N'106')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'664', N'006', N'306', N'206', N'246', N'136', N'106')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'665', N'006', N'306', N'206', N'246', N'136', N'106')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'666', N'006', N'306', N'206', N'246', N'136', N'106')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'667', N'006', N'306', N'206', N'246', N'136', N'106')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'668', N'006', N'306', N'206', N'246', N'136', N'106')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'669', N'006', N'306', N'206', N'246', N'136', N'106')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'670', N'006', N'306', N'206', N'246', N'136', N'106')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'671', N'006', N'306', N'206', N'246', N'136', N'106')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'672', N'006', N'306', N'206', N'246', N'136', N'106')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'673', N'006', N'306', N'206', N'246', N'136', N'106')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'674', N'006', N'306', N'206', N'246', N'136', N'106')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'675', N'006', N'306', N'206', N'246', N'136', N'106')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'676', N'006', N'306', N'206', N'246', N'136', N'106')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'677', N'005', N'305', N'205', N'245', N'135', N'105')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'678', N'006', N'306', N'206', N'246', N'136', N'106')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'679', N'005', N'305', N'205', N'245', N'135', N'105')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'680', N'006', N'306', N'206', N'246', N'136', N'106')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'681', N'006', N'306', N'206', N'246', N'136', N'106')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'682', N'006', N'306', N'206', N'246', N'136', N'106')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'683', N'006', N'306', N'206', N'246', N'136', N'106')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'684', N'006', N'306', N'206', N'246', N'136', N'106')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'685', N'006', N'306', N'206', N'246', N'136', N'106')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'686', N'006', N'306', N'206', N'246', N'136', N'106')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'687', N'006', N'306', N'206', N'246', N'136', N'106')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'688', N'006', N'306', N'206', N'246', N'136', N'106')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'689', N'006', N'306', N'206', N'246', N'136', N'106')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'690', N'006', N'306', N'206', N'246', N'136', N'106')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'691', N'006', N'306', N'206', N'246', N'136', N'106')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'692', N'006', N'306', N'206', N'246', N'136', N'106')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'693', N'005', N'305', N'205', N'245', N'135', N'105')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'700', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'701', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'702', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'703', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'704', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'705', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'706', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'707', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'708', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'709', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'710', N'006', N'306', N'206', N'246', N'136', N'106')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'711', N'006', N'306', N'206', N'246', N'136', N'106')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'712', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'713', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'714', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'715', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'716', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'717', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'718', N'006', N'306', N'206', N'246', N'136', N'106')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'719', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'720', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'721', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'722', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'723', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'724', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'725', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'726', N'006', N'306', N'206', N'246', N'136', N'106')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'727', N'006', N'306', N'206', N'246', N'136', N'106')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'728', N'007', N'307', N'207', N'247', N'137', N'107')
GO
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'729', N'006', N'306', N'206', N'246', N'136', N'106')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'730', N'006', N'306', N'206', N'246', N'136', N'106')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'731', N'006', N'306', N'206', N'246', N'136', N'106')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'732', N'006', N'306', N'206', N'246', N'136', N'106')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'733', N'006', N'306', N'206', N'246', N'136', N'106')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'734', N'006', N'306', N'206', N'246', N'136', N'106')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'735', N'006', N'306', N'206', N'246', N'136', N'106')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'736', N'006', N'306', N'206', N'246', N'136', N'106')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'737', N'006', N'306', N'206', N'246', N'136', N'106')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'738', N'006', N'306', N'206', N'246', N'136', N'106')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'739', N'005', N'305', N'205', N'245', N'135', N'105')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'740', N'006', N'306', N'206', N'246', N'136', N'106')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'741', N'006', N'306', N'206', N'246', N'136', N'106')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'742', N'006', N'306', N'206', N'246', N'136', N'106')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'743', N'006', N'306', N'206', N'246', N'136', N'106')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'744', N'006', N'306', N'206', N'246', N'136', N'106')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'745', N'006', N'306', N'206', N'246', N'136', N'106')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'746', N'006', N'306', N'206', N'246', N'136', N'106')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'747', N'006', N'306', N'206', N'246', N'136', N'106')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'748', N'006', N'306', N'206', N'246', N'136', N'106')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'749', N'006', N'306', N'206', N'246', N'136', N'106')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'750', N'006', N'306', N'206', N'246', N'136', N'106')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'751', N'006', N'306', N'206', N'246', N'136', N'106')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'752', N'006', N'306', N'206', N'246', N'136', N'106')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'753', N'006', N'306', N'206', N'246', N'136', N'106')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'754', N'006', N'306', N'206', N'246', N'136', N'106')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'755', N'006', N'306', N'206', N'246', N'136', N'106')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'756', N'006', N'306', N'206', N'246', N'136', N'106')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'757', N'006', N'306', N'206', N'246', N'136', N'106')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'758', N'006', N'306', N'206', N'246', N'136', N'106')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'759', N'006', N'306', N'206', N'246', N'136', N'106')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'760', N'006', N'306', N'206', N'246', N'136', N'106')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'761', N'006', N'306', N'206', N'246', N'136', N'106')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'762', N'006', N'306', N'206', N'246', N'136', N'106')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'763', N'006', N'306', N'206', N'246', N'136', N'106')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'764', N'006', N'306', N'206', N'246', N'136', N'106')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'765', N'006', N'306', N'206', N'246', N'136', N'106')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'766', N'006', N'306', N'206', N'246', N'136', N'106')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'767', N'006', N'306', N'206', N'246', N'136', N'106')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'768', N'006', N'306', N'206', N'246', N'136', N'106')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'769', N'006', N'306', N'206', N'246', N'136', N'106')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'770', N'006', N'306', N'206', N'246', N'136', N'106')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'771', N'006', N'306', N'206', N'246', N'136', N'106')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'772', N'006', N'306', N'206', N'246', N'136', N'106')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'773', N'006', N'306', N'206', N'246', N'136', N'106')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'774', N'006', N'306', N'206', N'246', N'136', N'106')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'775', N'006', N'306', N'206', N'246', N'136', N'106')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'776', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'777', N'007', N'307', N'207', N'247', N'137', N'107')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'778', N'006', N'306', N'206', N'246', N'136', N'106')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'779', N'006', N'306', N'206', N'246', N'136', N'106')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'780', N'006', N'306', N'206', N'246', N'136', N'106')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'781', N'006', N'306', N'206', N'246', N'136', N'106')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'782', N'006', N'306', N'206', N'246', N'136', N'106')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'783', N'006', N'306', N'206', N'246', N'136', N'106')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'784', N'006', N'306', N'206', N'246', N'136', N'106')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'785', N'006', N'306', N'206', N'246', N'136', N'106')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'786', N'006', N'306', N'206', N'246', N'136', N'106')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'787', N'006', N'306', N'206', N'246', N'136', N'106')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'788', N'006', N'306', N'206', N'246', N'136', N'106')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'789', N'006', N'306', N'206', N'246', N'136', N'106')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'790', N'005', N'305', N'205', N'245', N'135', N'105')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'791', N'005', N'305', N'205', N'245', N'135', N'105')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'792', N'006', N'306', N'206', N'246', N'136', N'106')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'793', N'005', N'305', N'205', N'245', N'135', N'105')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'794', N'005', N'305', N'205', N'245', N'135', N'105')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'795', N'006', N'306', N'206', N'246', N'136', N'106')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'796', N'006', N'306', N'206', N'246', N'136', N'106')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'797', N'005', N'305', N'205', N'245', N'135', N'105')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'798', N'005', N'305', N'205', N'245', N'135', N'105')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'799', N'005', N'305', N'205', N'245', N'135', N'105')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'800', N'005', N'305', N'205', N'245', N'135', N'105')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'801', N'005', N'305', N'205', N'245', N'135', N'105')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'802', N'005', N'305', N'205', N'245', N'135', N'105')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'803', N'005', N'305', N'205', N'245', N'135', N'105')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'804', N'005', N'305', N'205', N'245', N'135', N'105')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'805', N'005', N'305', N'205', N'245', N'135', N'105')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'806', N'005', N'305', N'205', N'245', N'135', N'105')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'807', N'005', N'305', N'205', N'245', N'135', N'105')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'808', N'005', N'305', N'205', N'245', N'135', N'105')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'809', N'005', N'305', N'205', N'245', N'135', N'105')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'810', N'005', N'305', N'205', N'245', N'135', N'105')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'811', N'005', N'305', N'205', N'245', N'135', N'105')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'812', N'005', N'305', N'205', N'245', N'135', N'105')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'813', N'005', N'305', N'205', N'245', N'135', N'105')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'814', N'005', N'305', N'205', N'245', N'135', N'105')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'815', N'005', N'305', N'205', N'245', N'135', N'105')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'816', N'005', N'305', N'205', N'245', N'135', N'105')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'817', N'005', N'305', N'205', N'245', N'135', N'105')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'818', N'005', N'305', N'205', N'245', N'135', N'105')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'819', N'005', N'305', N'205', N'245', N'135', N'105')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'820', N'005', N'305', N'205', N'245', N'135', N'105')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'821', N'005', N'305', N'205', N'245', N'135', N'105')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'822', N'005', N'305', N'205', N'245', N'135', N'105')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'823', N'005', N'305', N'205', N'245', N'135', N'105')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'824', N'005', N'305', N'205', N'245', N'135', N'105')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'825', N'005', N'305', N'205', N'245', N'135', N'105')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'826', N'005', N'305', N'205', N'245', N'135', N'105')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'827', N'005', N'305', N'205', N'245', N'135', N'105')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'828', N'005', N'305', N'205', N'245', N'135', N'105')
GO
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'829', N'005', N'305', N'205', N'245', N'135', N'105')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'830', N'005', N'305', N'205', N'245', N'135', N'105')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'831', N'005', N'305', N'205', N'245', N'135', N'105')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'832', N'005', N'305', N'205', N'245', N'135', N'105')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'833', N'005', N'305', N'205', N'245', N'135', N'105')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'834', N'005', N'305', N'205', N'245', N'135', N'105')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'835', N'005', N'305', N'205', N'245', N'135', N'105')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'836', N'005', N'305', N'205', N'245', N'135', N'105')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'837', N'005', N'305', N'205', N'245', N'135', N'105')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'838', N'005', N'305', N'205', N'245', N'135', N'105')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'840', N'004', N'304', N'204', N'244', N'134', N'104')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'841', N'004', N'304', N'204', N'244', N'134', N'104')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'842', N'004', N'304', N'204', N'244', N'134', N'104')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'843', N'004', N'304', N'204', N'244', N'134', N'104')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'844', N'004', N'304', N'204', N'244', N'134', N'104')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'845', N'004', N'304', N'204', N'244', N'134', N'104')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'846', N'004', N'304', N'204', N'244', N'134', N'104')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'847', N'004', N'304', N'204', N'244', N'134', N'104')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'848', N'004', N'304', N'204', N'244', N'134', N'104')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'849', N'004', N'304', N'204', N'244', N'134', N'104')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'850', N'004', N'304', N'204', N'244', N'134', N'104')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'851', N'004', N'304', N'204', N'244', N'134', N'104')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'852', N'004', N'304', N'204', N'244', N'134', N'104')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'853', N'004', N'304', N'204', N'244', N'134', N'104')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'854', N'003', N'303', N'203', N'243', N'133', N'103')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'855', N'004', N'304', N'204', N'244', N'134', N'104')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'856', N'004', N'304', N'204', N'244', N'134', N'104')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'857', N'004', N'304', N'204', N'244', N'134', N'104')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'858', N'004', N'304', N'204', N'244', N'134', N'104')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'859', N'004', N'304', N'204', N'244', N'134', N'104')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'860', N'004', N'304', N'204', N'244', N'134', N'104')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'861', N'004', N'304', N'204', N'244', N'134', N'104')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'862', N'004', N'304', N'204', N'244', N'134', N'104')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'863', N'004', N'304', N'204', N'244', N'134', N'104')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'864', N'003', N'303', N'203', N'243', N'133', N'103')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'865', N'004', N'304', N'204', N'244', N'134', N'104')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'870', N'005', N'305', N'205', N'245', N'135', N'105')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'871', N'005', N'305', N'205', N'245', N'135', N'105')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'872', N'005', N'305', N'205', N'245', N'135', N'105')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'873', N'004', N'304', N'204', N'244', N'134', N'104')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'874', N'004', N'304', N'204', N'244', N'134', N'104')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'875', N'005', N'305', N'205', N'245', N'135', N'105')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'876', N'005', N'305', N'205', N'245', N'135', N'105')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'877', N'005', N'305', N'205', N'245', N'135', N'105')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'878', N'005', N'305', N'205', N'245', N'135', N'105')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'879', N'005', N'305', N'205', N'245', N'135', N'105')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'880', N'005', N'305', N'205', N'245', N'135', N'105')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'881', N'005', N'305', N'205', N'245', N'135', N'105')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'882', N'005', N'305', N'205', N'245', N'135', N'105')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'883', N'005', N'305', N'205', N'245', N'135', N'105')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'884', N'005', N'305', N'205', N'245', N'135', N'105')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'885', N'005', N'305', N'205', N'245', N'135', N'105')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'889', N'003', N'303', N'203', N'243', N'133', N'103')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'890', N'003', N'303', N'203', N'243', N'133', N'103')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'891', N'003', N'303', N'203', N'243', N'133', N'103')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'892', N'003', N'303', N'203', N'243', N'133', N'103')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'893', N'004', N'304', N'204', N'244', N'134', N'104')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'894', N'004', N'304', N'204', N'244', N'134', N'104')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'895', N'004', N'304', N'204', N'244', N'134', N'104')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'896', N'004', N'304', N'204', N'244', N'134', N'104')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'897', N'004', N'304', N'204', N'244', N'134', N'104')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'898', N'004', N'304', N'204', N'244', N'134', N'104')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'900', N'002', N'302', N'202', N'242', N'132', N'102')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'901', N'002', N'302', N'202', N'242', N'132', N'102')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'902', N'002', N'302', N'202', N'242', N'132', N'102')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'903', N'002', N'302', N'202', N'242', N'132', N'102')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'904', N'002', N'302', N'202', N'242', N'132', N'102')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'905', N'002', N'302', N'202', N'242', N'132', N'102')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'906', N'002', N'302', N'202', N'242', N'132', N'102')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'907', N'002', N'302', N'202', N'242', N'132', N'102')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'908', N'002', N'302', N'202', N'242', N'132', N'102')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'909', N'002', N'302', N'202', N'242', N'132', N'102')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'910', N'002', N'302', N'202', N'242', N'132', N'102')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'911', N'002', N'302', N'202', N'242', N'132', N'102')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'912', N'002', N'302', N'202', N'242', N'132', N'102')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'913', N'002', N'302', N'202', N'242', N'132', N'102')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'914', N'002', N'302', N'202', N'242', N'132', N'102')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'915', N'002', N'302', N'202', N'242', N'132', N'102')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'916', N'002', N'302', N'202', N'242', N'132', N'102')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'917', N'002', N'302', N'202', N'242', N'132', N'102')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'918', N'002', N'302', N'202', N'242', N'132', N'102')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'919', N'002', N'302', N'202', N'242', N'132', N'102')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'920', N'002', N'302', N'202', N'242', N'132', N'102')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'921', N'002', N'302', N'202', N'242', N'132', N'102')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'922', N'002', N'302', N'202', N'242', N'132', N'102')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'923', N'002', N'302', N'202', N'242', N'132', N'102')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'924', N'002', N'302', N'202', N'242', N'132', N'102')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'925', N'002', N'302', N'202', N'242', N'132', N'102')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'926', N'002', N'302', N'202', N'242', N'132', N'102')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'927', N'002', N'302', N'202', N'242', N'132', N'102')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'928', N'002', N'302', N'202', N'242', N'132', N'102')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'929', N'002', N'302', N'202', N'242', N'132', N'102')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'930', N'002', N'302', N'202', N'242', N'132', N'102')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'931', N'002', N'302', N'202', N'242', N'132', N'102')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'932', N'002', N'302', N'202', N'242', N'132', N'102')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'933', N'002', N'302', N'202', N'242', N'132', N'102')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'934', N'002', N'302', N'202', N'242', N'132', N'102')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'935', N'002', N'302', N'202', N'242', N'132', N'102')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'936', N'003', N'303', N'203', N'243', N'133', N'103')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'937', N'003', N'303', N'203', N'243', N'133', N'103')
GO
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'938', N'003', N'303', N'203', N'243', N'133', N'103')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'939', N'003', N'303', N'203', N'243', N'133', N'103')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'940', N'004', N'304', N'204', N'244', N'134', N'104')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'941', N'004', N'304', N'204', N'244', N'134', N'104')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'942', N'004', N'304', N'204', N'244', N'134', N'104')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'943', N'003', N'303', N'203', N'243', N'133', N'103')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'944', N'004', N'304', N'204', N'244', N'134', N'104')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'945', N'004', N'304', N'204', N'244', N'134', N'104')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'946', N'004', N'304', N'204', N'244', N'134', N'104')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'947', N'004', N'304', N'204', N'244', N'134', N'104')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'948', N'004', N'304', N'204', N'244', N'134', N'104')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'949', N'004', N'304', N'204', N'244', N'134', N'104')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'950', N'003', N'303', N'203', N'243', N'133', N'103')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'951', N'003', N'303', N'203', N'243', N'133', N'103')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'952', N'003', N'303', N'203', N'243', N'133', N'103')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'953', N'003', N'303', N'203', N'243', N'133', N'103')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'954', N'004', N'304', N'204', N'244', N'134', N'104')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'955', N'004', N'304', N'204', N'244', N'134', N'104')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'956', N'004', N'304', N'204', N'244', N'134', N'104')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'957', N'004', N'304', N'204', N'244', N'134', N'104')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'958', N'004', N'304', N'204', N'244', N'134', N'104')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'959', N'004', N'304', N'204', N'244', N'134', N'104')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'960', N'004', N'304', N'204', N'244', N'134', N'104')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'961', N'004', N'304', N'204', N'244', N'134', N'104')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'970', N'005', N'305', N'205', N'245', N'135', N'105')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'971', N'005', N'305', N'205', N'245', N'135', N'105')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'972', N'005', N'305', N'205', N'245', N'135', N'105')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'973', N'005', N'305', N'205', N'245', N'135', N'105')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'974', N'005', N'305', N'205', N'245', N'135', N'105')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'975', N'004', N'304', N'204', N'244', N'134', N'104')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'976', N'004', N'304', N'204', N'244', N'134', N'104')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'977', N'005', N'305', N'205', N'245', N'135', N'105')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'978', N'005', N'305', N'205', N'245', N'135', N'105')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'979', N'005', N'305', N'205', N'245', N'135', N'105')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'980', N'005', N'305', N'205', N'245', N'135', N'105')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'981', N'005', N'305', N'205', N'245', N'135', N'105')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'982', N'005', N'305', N'205', N'245', N'135', N'105')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'983', N'005', N'305', N'205', N'245', N'135', N'105')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'984', N'005', N'305', N'205', N'245', N'135', N'105')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'985', N'005', N'305', N'205', N'245', N'135', N'105')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'986', N'005', N'305', N'205', N'245', N'135', N'105')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'988', N'005', N'305', N'205', N'245', N'135', N'105')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'989', N'005', N'305', N'205', N'245', N'135', N'105')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'990', N'005', N'305', N'205', N'245', N'135', N'105')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'991', N'005', N'305', N'205', N'245', N'135', N'105')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'992', N'005', N'305', N'205', N'245', N'135', N'105')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'993', N'005', N'305', N'205', N'245', N'135', N'105')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'994', N'005', N'305', N'205', N'245', N'135', N'105')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'96701', N'044', N'000', N'224', N'000', N'000', N'124')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'96706', N'044', N'000', N'224', N'000', N'000', N'124')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'96707', N'044', N'000', N'224', N'000', N'000', N'124')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'96709', N'044', N'000', N'224', N'000', N'000', N'124')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'96712', N'044', N'000', N'224', N'000', N'000', N'124')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'96717', N'044', N'000', N'224', N'000', N'000', N'124')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'96730', N'044', N'000', N'224', N'000', N'000', N'124')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'96731', N'044', N'000', N'224', N'000', N'000', N'124')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'96734', N'044', N'000', N'224', N'000', N'000', N'124')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'96744', N'044', N'000', N'224', N'000', N'000', N'124')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'96759', N'044', N'000', N'224', N'000', N'000', N'124')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'96762', N'044', N'000', N'224', N'000', N'000', N'124')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'96782', N'044', N'000', N'224', N'000', N'000', N'124')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'96786', N'044', N'000', N'224', N'000', N'000', N'124')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'96789', N'044', N'000', N'224', N'000', N'000', N'124')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'96791', N'044', N'000', N'224', N'000', N'000', N'124')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'96792', N'044', N'000', N'224', N'000', N'000', N'124')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'96795', N'044', N'000', N'224', N'000', N'000', N'124')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'96797', N'044', N'000', N'224', N'000', N'000', N'124')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'96801', N'044', N'000', N'224', N'000', N'000', N'124')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'96802', N'044', N'000', N'224', N'000', N'000', N'124')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'96803', N'044', N'000', N'224', N'000', N'000', N'124')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'96804', N'044', N'000', N'224', N'000', N'000', N'124')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'96805', N'044', N'000', N'224', N'000', N'000', N'124')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'96806', N'044', N'000', N'224', N'000', N'000', N'124')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'96807', N'044', N'000', N'224', N'000', N'000', N'124')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'96808', N'044', N'000', N'224', N'000', N'000', N'124')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'96809', N'044', N'000', N'224', N'000', N'000', N'124')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'96810', N'044', N'000', N'224', N'000', N'000', N'124')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'96811', N'044', N'000', N'224', N'000', N'000', N'124')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'96812', N'044', N'000', N'224', N'000', N'000', N'124')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'96813', N'044', N'000', N'224', N'000', N'000', N'124')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'96814', N'044', N'000', N'224', N'000', N'000', N'124')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'96815', N'044', N'000', N'224', N'000', N'000', N'124')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'96816', N'044', N'000', N'224', N'000', N'000', N'124')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'96817', N'044', N'000', N'224', N'000', N'000', N'124')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'96818', N'044', N'000', N'224', N'000', N'000', N'124')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'96819', N'044', N'000', N'224', N'000', N'000', N'124')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'96820', N'044', N'000', N'224', N'000', N'000', N'124')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'96821', N'044', N'000', N'224', N'000', N'000', N'124')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'96822', N'044', N'000', N'224', N'000', N'000', N'124')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'96823', N'044', N'000', N'224', N'000', N'000', N'124')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'96824', N'044', N'000', N'224', N'000', N'000', N'124')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'96825', N'044', N'000', N'224', N'000', N'000', N'124')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'96826', N'044', N'000', N'224', N'000', N'000', N'124')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'96827', N'044', N'000', N'224', N'000', N'000', N'124')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'96828', N'044', N'000', N'224', N'000', N'000', N'124')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'96830', N'044', N'000', N'224', N'000', N'000', N'124')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'96835', N'044', N'000', N'224', N'000', N'000', N'124')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'96836', N'044', N'000', N'224', N'000', N'000', N'124')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'96837', N'044', N'000', N'224', N'000', N'000', N'124')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'96838', N'044', N'000', N'224', N'000', N'000', N'124')
GO
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'96839', N'044', N'000', N'224', N'000', N'000', N'124')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'96840', N'044', N'000', N'224', N'000', N'000', N'124')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'96841', N'044', N'000', N'224', N'000', N'000', N'124')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'96842', N'044', N'000', N'224', N'000', N'000', N'124')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'96843', N'044', N'000', N'224', N'000', N'000', N'124')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'96844', N'044', N'000', N'224', N'000', N'000', N'124')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'96845', N'044', N'000', N'224', N'000', N'000', N'124')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'96846', N'044', N'000', N'224', N'000', N'000', N'124')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'96847', N'044', N'000', N'224', N'000', N'000', N'124')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'96848', N'044', N'000', N'224', N'000', N'000', N'124')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'96849', N'044', N'000', N'224', N'000', N'000', N'124')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'96850', N'044', N'000', N'224', N'000', N'000', N'124')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'96853', N'044', N'000', N'224', N'000', N'000', N'124')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'96854', N'044', N'000', N'224', N'000', N'000', N'124')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'96857', N'044', N'000', N'224', N'000', N'000', N'124')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'96858', N'044', N'000', N'224', N'000', N'000', N'124')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'96859', N'044', N'000', N'224', N'000', N'000', N'124')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'96860', N'044', N'000', N'224', N'000', N'000', N'124')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'96861', N'044', N'000', N'224', N'000', N'000', N'124')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'96862', N'044', N'000', N'224', N'000', N'000', N'124')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'96863', N'044', N'000', N'224', N'000', N'000', N'124')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'96898', N'044', N'000', N'224', N'000', N'000', N'124')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'96703', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'96704', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'96705', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'96708', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'96710', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'96713', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'96714', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'96715', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'96716', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'96718', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'96719', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'96720', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'96721', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'96722', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'96725', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'96726', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'96727', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'96728', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'96729', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'96732', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'96733', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'96737', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'96738', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'96739', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'96740', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'96741', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'96742', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'96743', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'96745', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'96746', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'96747', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'96748', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'96749', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'96750', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'96751', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'96752', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'96753', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'96754', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'96755', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'96756', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'96757', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'96760', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'96761', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'96763', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'96764', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'96765', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'96766', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'96767', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'96768', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'96769', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'96770', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'96771', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'96772', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'96773', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'96774', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'96775', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'96776', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'96777', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'96778', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'96779', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'96780', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'96781', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'96783', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'96784', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'96785', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'96788', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'96790', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'96793', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'96796', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99501', N'044', N'000', N'224', N'000', N'000', N'124')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99502', N'044', N'000', N'224', N'000', N'000', N'124')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99503', N'044', N'000', N'224', N'000', N'000', N'124')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99504', N'044', N'000', N'224', N'000', N'000', N'124')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99505', N'044', N'000', N'224', N'000', N'000', N'124')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99506', N'044', N'000', N'224', N'000', N'000', N'124')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99507', N'044', N'000', N'224', N'000', N'000', N'124')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99508', N'044', N'000', N'224', N'000', N'000', N'124')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99509', N'044', N'000', N'224', N'000', N'000', N'124')
GO
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99510', N'044', N'000', N'224', N'000', N'000', N'124')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99511', N'044', N'000', N'224', N'000', N'000', N'124')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99512', N'044', N'000', N'224', N'000', N'000', N'124')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99513', N'044', N'000', N'224', N'000', N'000', N'124')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99514', N'044', N'000', N'224', N'000', N'000', N'124')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99515', N'044', N'000', N'224', N'000', N'000', N'124')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99516', N'044', N'000', N'224', N'000', N'000', N'124')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99517', N'044', N'000', N'224', N'000', N'000', N'124')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99518', N'044', N'000', N'224', N'000', N'000', N'124')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99519', N'044', N'000', N'224', N'000', N'000', N'124')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99520', N'044', N'000', N'224', N'000', N'000', N'124')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99521', N'044', N'000', N'224', N'000', N'000', N'124')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99522', N'044', N'000', N'224', N'000', N'000', N'124')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99523', N'044', N'000', N'224', N'000', N'000', N'124')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99524', N'044', N'000', N'224', N'000', N'000', N'124')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99540', N'044', N'000', N'224', N'000', N'000', N'124')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99556', N'044', N'000', N'224', N'000', N'000', N'124')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99567', N'044', N'000', N'224', N'000', N'000', N'124')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99568', N'044', N'000', N'224', N'000', N'000', N'124')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99572', N'044', N'000', N'224', N'000', N'000', N'124')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99577', N'044', N'000', N'224', N'000', N'000', N'124')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99587', N'044', N'000', N'224', N'000', N'000', N'124')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99603', N'044', N'000', N'224', N'000', N'000', N'124')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99605', N'044', N'000', N'224', N'000', N'000', N'124')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99610', N'044', N'000', N'224', N'000', N'000', N'124')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99611', N'044', N'000', N'224', N'000', N'000', N'124')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99631', N'044', N'000', N'224', N'000', N'000', N'124')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99635', N'044', N'000', N'224', N'000', N'000', N'124')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99639', N'044', N'000', N'224', N'000', N'000', N'124')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99645', N'044', N'000', N'224', N'000', N'000', N'124')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99654', N'044', N'000', N'224', N'000', N'000', N'124')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99664', N'044', N'000', N'224', N'000', N'000', N'124')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99669', N'044', N'000', N'224', N'000', N'000', N'124')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99672', N'044', N'000', N'224', N'000', N'000', N'124')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99687', N'044', N'000', N'224', N'000', N'000', N'124')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99701', N'044', N'000', N'224', N'000', N'000', N'124')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99702', N'044', N'000', N'224', N'000', N'000', N'124')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99703', N'044', N'000', N'224', N'000', N'000', N'124')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99705', N'044', N'000', N'224', N'000', N'000', N'124')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99706', N'044', N'000', N'224', N'000', N'000', N'124')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99707', N'044', N'000', N'224', N'000', N'000', N'124')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99708', N'044', N'000', N'224', N'000', N'000', N'124')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99709', N'044', N'000', N'224', N'000', N'000', N'124')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99710', N'044', N'000', N'224', N'000', N'000', N'124')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99711', N'044', N'000', N'224', N'000', N'000', N'124')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99712', N'044', N'000', N'224', N'000', N'000', N'124')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99775', N'044', N'000', N'224', N'000', N'000', N'124')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99529', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99530', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99545', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99546', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99547', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99548', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99549', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99550', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99551', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99552', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99553', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99554', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99555', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99557', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99558', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99559', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99561', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99563', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99564', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99565', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99566', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99569', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99571', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99573', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99574', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99575', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99576', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99578', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99579', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99580', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99581', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99583', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99584', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99585', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99586', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99588', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99589', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99590', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99591', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99599', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99602', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99604', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99606', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99607', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99608', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99609', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99612', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99613', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99614', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99615', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99619', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99620', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99621', N'046', N'000', N'226', N'000', N'000', N'126')
GO
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99622', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99624', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99625', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99626', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99627', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99628', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99629', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99630', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99632', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99633', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99634', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99636', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99637', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99638', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99640', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99641', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99643', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99644', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99647', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99648', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99649', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99650', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99651', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99652', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99653', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99655', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99656', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99657', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99658', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99659', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99660', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99661', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99662', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99663', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99665', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99666', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99667', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99668', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99670', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99671', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99674', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99675', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99676', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99677', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99678', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99679', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99680', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99681', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99682', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99683', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99684', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99685', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99686', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99688', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99689', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99690', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99691', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99692', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99693', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99694', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99695', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99697', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99704', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99714', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99716', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99720', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99721', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99722', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99723', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99724', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99725', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99726', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99727', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99729', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99730', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99731', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99732', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99733', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99734', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99736', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99737', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99738', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99739', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99740', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99741', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99742', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99743', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99744', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99745', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99746', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99747', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99748', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99749', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99750', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99751', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99752', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99753', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99754', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99755', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99756', N'046', N'000', N'226', N'000', N'000', N'126')
GO
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99757', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99758', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99759', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99760', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99761', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99762', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99763', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99764', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99765', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99766', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99767', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99768', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99769', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99770', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99771', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99772', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99773', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99774', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99776', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99777', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99778', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99779', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99780', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99781', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99782', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99783', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99784', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99785', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99786', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99788', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99789', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99790', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99791', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99801', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99802', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99803', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99811', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99812', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99820', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99821', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99824', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99825', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99826', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99827', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99829', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99830', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99832', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99833', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99835', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99836', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99840', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99841', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99850', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99901', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99903', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99918', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99919', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99921', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99922', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99923', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99925', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99926', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99927', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99928', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99929', N'046', N'000', N'226', N'000', N'000', N'126')
INSERT [dbo].[UPS_ZoneCode] ([ZipCode], [Ground], [Day3Select], [Day2Air], [Day2AirAM], [NextDayAirSaver], [NextDayAir]) VALUES (N'99950', N'046', N'000', N'226', N'000', N'000', N'126')
ALTER TABLE [dbo].[CART] ADD  CONSTRAINT [DF_CART_Qty]  DEFAULT ((1)) FOR [Qty]
GO
ALTER TABLE [dbo].[CART] ADD  CONSTRAINT [DF_CART_RegDate]  DEFAULT (getdate()) FOR [RegDate]
GO
ALTER TABLE [dbo].[ClientMaster] ADD  CONSTRAINT [DF_ClientMaster_ClientNameF]  DEFAULT ('') FOR [ClientNameF]
GO
ALTER TABLE [dbo].[ClientMaster] ADD  CONSTRAINT [DF_ClientMaster_ClientNameM]  DEFAULT ('') FOR [ClientNameM]
GO
ALTER TABLE [dbo].[ClientMaster] ADD  CONSTRAINT [DF_ClientMaster_ClientNameL]  DEFAULT ('') FOR [ClientNameL]
GO
ALTER TABLE [dbo].[ClientMaster] ADD  CONSTRAINT [DF_ClientMaster_Email]  DEFAULT ('') FOR [Email]
GO
ALTER TABLE [dbo].[ClientMaster] ADD  CONSTRAINT [DF_ClientMaster_Phone]  DEFAULT ('') FOR [Phone]
GO
ALTER TABLE [dbo].[ClientMaster] ADD  CONSTRAINT [DF_ClientMaster_Street1]  DEFAULT ('') FOR [Street1]
GO
ALTER TABLE [dbo].[ClientMaster] ADD  CONSTRAINT [DF_ClientMaster_Street2]  DEFAULT ('') FOR [Street2]
GO
ALTER TABLE [dbo].[ClientMaster] ADD  CONSTRAINT [DF_ClientMaster_City]  DEFAULT ('') FOR [City]
GO
ALTER TABLE [dbo].[ClientMaster] ADD  CONSTRAINT [DF_ClientMaster_State]  DEFAULT ('') FOR [State]
GO
ALTER TABLE [dbo].[ClientMaster] ADD  CONSTRAINT [DF_ClientMaster_Zip]  DEFAULT ('') FOR [Zip]
GO
ALTER TABLE [dbo].[ClientMaster] ADD  CONSTRAINT [DF_ClientMaster_Country]  DEFAULT ('') FOR [Country]
GO
ALTER TABLE [dbo].[ClientMaster] ADD  CONSTRAINT [DF_ClientMaster_MailOPT]  DEFAULT ('Yes') FOR [MailOPT]
GO
ALTER TABLE [dbo].[ClientMaster] ADD  CONSTRAINT [DF_ClientMaster_Password]  DEFAULT ('') FOR [Password]
GO
ALTER TABLE [dbo].[ClientMaster] ADD  CONSTRAINT [DF_ClientMaster_Class]  DEFAULT ('USER') FOR [Class]
GO
ALTER TABLE [dbo].[ClientMaster] ADD  CONSTRAINT [DF_ClientMaster_RegDate]  DEFAULT (getdate()) FOR [RegDate]
GO
ALTER TABLE [dbo].[ClientMaster] ADD  CONSTRAINT [DF_ClientMaster_WholesaleLevel]  DEFAULT ('E') FOR [WholesaleLevel]
GO
ALTER TABLE [dbo].[CodeCountry] ADD  CONSTRAINT [DF_CodeCountry_CountryName]  DEFAULT ('') FOR [CountryName]
GO
ALTER TABLE [dbo].[CodeCountry] ADD  CONSTRAINT [DF_CodeCountry_RegionCode]  DEFAULT ('') FOR [RegionCode]
GO
ALTER TABLE [dbo].[CodeOrderStatus] ADD  CONSTRAINT [DF_OrderStatus_StatusCode]  DEFAULT ('') FOR [StatusCode]
GO
ALTER TABLE [dbo].[CodeOrderStatus] ADD  CONSTRAINT [DF_OrderStatus_StatusName]  DEFAULT ('') FOR [StatusName]
GO
ALTER TABLE [dbo].[CodeRegion] ADD  CONSTRAINT [DF_CodeRegion_RegionName]  DEFAULT ('') FOR [RegionName]
GO
ALTER TABLE [dbo].[Log_ClientMaster] ADD  DEFAULT ('') FOR [ClientNameF]
GO
ALTER TABLE [dbo].[Log_ClientMaster] ADD  DEFAULT ('') FOR [ClientNameM]
GO
ALTER TABLE [dbo].[Log_ClientMaster] ADD  DEFAULT ('') FOR [ClientNameL]
GO
ALTER TABLE [dbo].[Log_ClientMaster] ADD  DEFAULT ('') FOR [Email]
GO
ALTER TABLE [dbo].[Log_ClientMaster] ADD  DEFAULT ('') FOR [Phone]
GO
ALTER TABLE [dbo].[Log_ClientMaster] ADD  DEFAULT ('') FOR [Street1]
GO
ALTER TABLE [dbo].[Log_ClientMaster] ADD  DEFAULT ('') FOR [Street2]
GO
ALTER TABLE [dbo].[Log_ClientMaster] ADD  DEFAULT ('') FOR [City]
GO
ALTER TABLE [dbo].[Log_ClientMaster] ADD  DEFAULT ('') FOR [State]
GO
ALTER TABLE [dbo].[Log_ClientMaster] ADD  DEFAULT ('') FOR [Zip]
GO
ALTER TABLE [dbo].[Log_ClientMaster] ADD  DEFAULT ('') FOR [Country]
GO
ALTER TABLE [dbo].[Log_ClientMaster] ADD  DEFAULT ('Yes') FOR [MailOPT]
GO
ALTER TABLE [dbo].[Log_ClientMaster] ADD  DEFAULT ('') FOR [Password]
GO
ALTER TABLE [dbo].[Log_ClientMaster] ADD  DEFAULT ('USER') FOR [Class]
GO
ALTER TABLE [dbo].[Log_ClientMaster] ADD  DEFAULT (getdate()) FOR [RegDate]
GO
ALTER TABLE [dbo].[Log_ClientMaster] ADD  DEFAULT ('E') FOR [WholesaleLevel]
GO
ALTER TABLE [dbo].[Log_ClientMaster] ADD  CONSTRAINT [DF_Log_ClientMaster_ModifyDate]  DEFAULT (getdate()) FOR [ModifyDate]
GO
ALTER TABLE [dbo].[Log_ClientMaster] ADD  CONSTRAINT [DF_Log_ClientMaster_Modifier]  DEFAULT ('') FOR [Modifier]
GO
ALTER TABLE [dbo].[OrderDetail] ADD  CONSTRAINT [DF_OrderDetail_ColorName]  DEFAULT ('') FOR [ColorName]
GO
ALTER TABLE [dbo].[OrderDetail] ADD  CONSTRAINT [DF_OrderDetail_SizeName]  DEFAULT ('') FOR [SizeName]
GO
ALTER TABLE [dbo].[OrderDetail] ADD  CONSTRAINT [DF_OrderDetail_Qty]  DEFAULT ((0)) FOR [Qty]
GO
ALTER TABLE [dbo].[OrderDetail] ADD  CONSTRAINT [DF_OrderDetail_UnitPrice]  DEFAULT ((0)) FOR [UnitPrice]
GO
ALTER TABLE [dbo].[OrderDetail] ADD  CONSTRAINT [DF_OrderDetail_Amount]  DEFAULT ((0)) FOR [Amount]
GO
ALTER TABLE [dbo].[OrderDetail] ADD  CONSTRAINT [DF_OrderDetail_Remarks]  DEFAULT ('') FOR [Remarks]
GO
ALTER TABLE [dbo].[OrderMaster] ADD  CONSTRAINT [DF_OrderMaster_OrderDate]  DEFAULT (getdate()) FOR [OrderDate]
GO
ALTER TABLE [dbo].[OrderMaster] ADD  CONSTRAINT [DF_OrderMaster_Street1]  DEFAULT ('') FOR [Street1]
GO
ALTER TABLE [dbo].[OrderMaster] ADD  CONSTRAINT [DF_OrderMaster_Street2]  DEFAULT ('') FOR [Street2]
GO
ALTER TABLE [dbo].[OrderMaster] ADD  CONSTRAINT [DF_OrderMaster_City]  DEFAULT ('') FOR [City]
GO
ALTER TABLE [dbo].[OrderMaster] ADD  CONSTRAINT [DF_OrderMaster_State]  DEFAULT ('') FOR [State]
GO
ALTER TABLE [dbo].[OrderMaster] ADD  CONSTRAINT [DF_OrderMaster_Zip]  DEFAULT ('') FOR [Zip]
GO
ALTER TABLE [dbo].[OrderMaster] ADD  CONSTRAINT [DF_OrderMaster_Country]  DEFAULT ('') FOR [Country]
GO
ALTER TABLE [dbo].[OrderMaster] ADD  CONSTRAINT [DF_OrderMaster_CouponCode]  DEFAULT ('') FOR [CouponCode]
GO
ALTER TABLE [dbo].[OrderMaster] ADD  CONSTRAINT [DF_OrderMaster_CouponDCRate]  DEFAULT ((0)) FOR [CouponDCRate]
GO
ALTER TABLE [dbo].[OrderMaster] ADD  CONSTRAINT [DF_OrderMaster_OrderAmount]  DEFAULT ((0)) FOR [OrderAmount]
GO
ALTER TABLE [dbo].[OrderMaster] ADD  CONSTRAINT [DF_OrderMaster_TaxAmount]  DEFAULT ((0)) FOR [TaxAmount]
GO
ALTER TABLE [dbo].[OrderMaster] ADD  CONSTRAINT [DF_OrderMaster_DCAmount]  DEFAULT ((0)) FOR [DCAmount]
GO
ALTER TABLE [dbo].[OrderMaster] ADD  CONSTRAINT [DF_OrderMaster_WrappingCharge]  DEFAULT ((0)) FOR [WrappingCharge]
GO
ALTER TABLE [dbo].[OrderMaster] ADD  CONSTRAINT [DF_OrderMaster_ShippingAmount]  DEFAULT ((0)) FOR [ShippingAmount]
GO
ALTER TABLE [dbo].[OrderMaster] ADD  CONSTRAINT [DF_OrderMaster_TotalAmount]  DEFAULT ((0)) FOR [TotalAmount]
GO
ALTER TABLE [dbo].[OrderMaster] ADD  CONSTRAINT [DF_OrderMaster_PayMethod]  DEFAULT ('') FOR [PayMethod]
GO
ALTER TABLE [dbo].[OrderMaster] ADD  CONSTRAINT [DF_OrderMaster_Paystatus]  DEFAULT ('') FOR [Paystatus]
GO
ALTER TABLE [dbo].[OrderMaster] ADD  CONSTRAINT [DF_OrderMaster_ShipMethod]  DEFAULT ('') FOR [ShipMethod]
GO
ALTER TABLE [dbo].[OrderMaster] ADD  CONSTRAINT [DF_OrderMaster_OrderStatus]  DEFAULT ('10') FOR [OrderStatus]
GO
ALTER TABLE [dbo].[OrderMaster] ADD  CONSTRAINT [DF_OrderMaster_TrackingNo]  DEFAULT ('') FOR [TrackingNo]
GO
ALTER TABLE [dbo].[OrderMaster] ADD  CONSTRAINT [DF_OrderMaster_ClientComment]  DEFAULT ('') FOR [CommentFromClient]
GO
ALTER TABLE [dbo].[OrderMaster] ADD  CONSTRAINT [DF_OrderMaster_CommentToClient]  DEFAULT ('') FOR [CommentToClient]
GO
ALTER TABLE [dbo].[OrderTemp] ADD  CONSTRAINT [DF_OrderTemp_RegDate]  DEFAULT (getdate()) FOR [RegDate]
GO
ALTER TABLE [dbo].[ProductColor] ADD  CONSTRAINT [DF_ProductColor_ProductNo]  DEFAULT ('') FOR [ProductNo]
GO
ALTER TABLE [dbo].[ProductColor] ADD  CONSTRAINT [DF_ProductColor_ColorName]  DEFAULT ('') FOR [ColorName]
GO
ALTER TABLE [dbo].[ProductColor] ADD  CONSTRAINT [DF_ProductColor_ColorStock]  DEFAULT ((0)) FOR [ColorStock]
GO
ALTER TABLE [dbo].[ProductColor] ADD  CONSTRAINT [DF_ProductColor_ColorStatus]  DEFAULT ('Yes') FOR [ColorStatus]
GO
ALTER TABLE [dbo].[ProductMaster] ADD  CONSTRAINT [DF_ProductMaster_ProductNo]  DEFAULT ('') FOR [ProductNo]
GO
ALTER TABLE [dbo].[ProductMaster] ADD  CONSTRAINT [DF_ProductMaster_BrandName]  DEFAULT ('') FOR [BrandName]
GO
ALTER TABLE [dbo].[ProductMaster] ADD  CONSTRAINT [DF_ProductMaster_Category]  DEFAULT ('') FOR [Category]
GO
ALTER TABLE [dbo].[ProductMaster] ADD  CONSTRAINT [DF_ProductMaster_Sex]  DEFAULT ('Men') FOR [Gender]
GO
ALTER TABLE [dbo].[ProductMaster] ADD  CONSTRAINT [DF_ProductMaster_NewItem]  DEFAULT ('YES') FOR [NewItem]
GO
ALTER TABLE [dbo].[ProductMaster] ADD  CONSTRAINT [DF_ProductMaster_ExclusiveSales]  DEFAULT ('Ordinary') FOR [ExclusiveSales]
GO
ALTER TABLE [dbo].[ProductMaster] ADD  CONSTRAINT [DF_ProductMaster_ProductName]  DEFAULT ('') FOR [ProductName]
GO
ALTER TABLE [dbo].[ProductMaster] ADD  CONSTRAINT [DF_ProductMaster_ModelName]  DEFAULT ('') FOR [ModelName]
GO
ALTER TABLE [dbo].[ProductMaster] ADD  CONSTRAINT [DF_ProductMaster_BriefDescription]  DEFAULT ('') FOR [BriefDescription]
GO
ALTER TABLE [dbo].[ProductMaster] ADD  CONSTRAINT [DF_ProductMaster_Description]  DEFAULT ('') FOR [Description]
GO
ALTER TABLE [dbo].[ProductMaster] ADD  CONSTRAINT [DF_ProductMaster_PriceRetail]  DEFAULT ((0)) FOR [PriceRetail]
GO
ALTER TABLE [dbo].[ProductMaster] ADD  CONSTRAINT [DF_ProductMaster_PriceRetailEvent1]  DEFAULT ((0)) FOR [PriceRetailEvent1]
GO
ALTER TABLE [dbo].[ProductMaster] ADD  CONSTRAINT [DF_ProductMaster_PriceRetailEvent2]  DEFAULT ((0)) FOR [PriceRetailEvent2]
GO
ALTER TABLE [dbo].[ProductMaster] ADD  CONSTRAINT [DF_ProductMaster_PriceWholesale1]  DEFAULT ((0)) FOR [PriceWholesale1]
GO
ALTER TABLE [dbo].[ProductMaster] ADD  CONSTRAINT [DF_ProductMaster_PriceWholesale2]  DEFAULT ((0)) FOR [PriceWholesale2]
GO
ALTER TABLE [dbo].[ProductMaster] ADD  CONSTRAINT [DF_ProductMaster_PriceWholesale3]  DEFAULT ((0)) FOR [PriceWholesale3]
GO
ALTER TABLE [dbo].[ProductMaster] ADD  CONSTRAINT [DF_ProductMaster_PriceWholesale4]  DEFAULT ((0)) FOR [PriceWholesale4]
GO
ALTER TABLE [dbo].[ProductMaster] ADD  CONSTRAINT [DF_ProductMaster_PriceWholesale5]  DEFAULT ((0)) FOR [PriceWholesale5]
GO
ALTER TABLE [dbo].[ProductMaster] ADD  CONSTRAINT [DF_ProductMaster_Stock]  DEFAULT ((0)) FOR [Stock]
GO
ALTER TABLE [dbo].[ProductMaster] ADD  CONSTRAINT [DF_ProductMaster_Status]  DEFAULT ('Pending') FOR [Status]
GO
ALTER TABLE [dbo].[ProductMaster] ADD  CONSTRAINT [DF_ProductMaster_WebDisplay]  DEFAULT ('No') FOR [WebDisplay]
GO
ALTER TABLE [dbo].[ProductMaster] ADD  CONSTRAINT [DF_ProductMaster_DisplayOrder]  DEFAULT ((0)) FOR [DisplayOrder]
GO
ALTER TABLE [dbo].[ProductSize] ADD  CONSTRAINT [DF_ProductSize_ProductNo]  DEFAULT ('') FOR [ProductNo]
GO
ALTER TABLE [dbo].[ProductSize] ADD  CONSTRAINT [DF_ProductSize_SizeName]  DEFAULT ('') FOR [SizeName]
GO
ALTER TABLE [dbo].[ProductSize] ADD  CONSTRAINT [DF_ProductSize_SizeStock]  DEFAULT ((0)) FOR [SizeStock]
GO
ALTER TABLE [dbo].[ProductSize] ADD  CONSTRAINT [DF_ProductSize_SizeStatus]  DEFAULT ('Yes') FOR [SizeStatus]
GO
ALTER TABLE [dbo].[ProductSize] ADD  CONSTRAINT [DF_ProductSize_WeightLBS]  DEFAULT ((1.0)) FOR [WeightLBS]
GO
ALTER TABLE [dbo].[ProductSize] ADD  CONSTRAINT [DF_ProductSize_RegDate]  DEFAULT (getdate()) FOR [RegDate]
GO
ALTER TABLE [dbo].[ShopList] ADD  CONSTRAINT [DF_ShopList_DisplayOrder]  DEFAULT ((0)) FOR [DisplayOrder]
GO
ALTER TABLE [dbo].[ShopList] ADD  CONSTRAINT [DF_ShopList_Class]  DEFAULT ('') FOR [Class]
GO
ALTER TABLE [dbo].[ShopList] ADD  CONSTRAINT [DF_ShopList_CompanyName]  DEFAULT ('') FOR [CompanyName]
GO
ALTER TABLE [dbo].[ShopList] ADD  CONSTRAINT [DF_ShopList_AddressLine1]  DEFAULT ('') FOR [AddressLine1]
GO
ALTER TABLE [dbo].[ShopList] ADD  CONSTRAINT [DF_ShopList_SuiteNo]  DEFAULT ('') FOR [SuiteNo]
GO
ALTER TABLE [dbo].[ShopList] ADD  CONSTRAINT [DF_ShopList_AddressLine2]  DEFAULT ('') FOR [AddressLine2]
GO
ALTER TABLE [dbo].[ShopList] ADD  CONSTRAINT [DF_ShopList_Phone]  DEFAULT ('') FOR [Phone]
GO
ALTER TABLE [dbo].[ShopList] ADD  CONSTRAINT [DF_ShopList_Fax]  DEFAULT ('') FOR [Fax]
GO
ALTER TABLE [dbo].[ShopList] ADD  CONSTRAINT [DF_ShopList_Email]  DEFAULT ('') FOR [Email]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CART', @level2type=N'COLUMN',@level2name=N'CartNo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mail OPT-IN' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ClientMaster', @level2type=N'COLUMN',@level2name=N'MailOPT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'USER/ADMIN/PREWHOLESALE/WHOLESALE/SALESLAB' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ClientMaster', @level2type=N'COLUMN',@level2name=N'Class'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A/B/C/D/E   A is the highest, E is the lowest level.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ClientMaster', @level2type=N'COLUMN',@level2name=N'WholesaleLevel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'{10 / 100 / 200 / 300}' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderMaster', @level2type=N'COLUMN',@level2name=N'OrderStatus'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'{Rep / Thumb / Catalog / Enlarged ...}' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Pictures', @level2type=N'COLUMN',@level2name=N'Usage'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'{Yes / No}' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductColor', @level2type=N'COLUMN',@level2name=N'ColorStatus'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'{Pending / Active / Retire}' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductMaster', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'{Yes / No}' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductMaster', @level2type=N'COLUMN',@level2name=N'WebDisplay'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'{Yes / No}' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductSize', @level2type=N'COLUMN',@level2name=N'SizeStatus'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Area'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Area'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Area'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Area'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Area'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Area'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Area'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Area'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Area'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Area'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'@' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Area'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Area'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Area'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'Area' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Area'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Area'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Area'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Area'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'Area' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Area'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'''DOMESTIC Ground$''' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Area'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Area'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Area'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Area'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Class'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Class'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Class'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Class'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Class'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Class'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Class'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Class'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Class'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Class'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'@' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Class'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Class'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Class'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'Class' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Class'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Class'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Class'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Class'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'Class' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Class'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'''DOMESTIC Ground$''' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Class'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Class'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Class'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Class'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Weight'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Weight'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Weight'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Weight'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Weight'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Weight'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Weight'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Weight'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Weight'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Weight'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Weight'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'General Number' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Weight'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'Weight' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Weight'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Weight'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Weight'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'8' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Weight'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'Weight' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Weight'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'''DOMESTIC Ground$''' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Weight'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Weight'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'7' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Weight'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone2'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone2'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone2'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone2'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone2'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone2'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone2'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone2'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'#,#####0.00;[Red](#,#####0.00)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone2'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'Zone2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone2'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone2'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone2'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'8' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone2'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'Zone2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone2'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'''DOMESTIC Ground$''' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone2'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone2'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'7' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone2'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone3'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone3'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone3'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone3'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone3'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone3'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone3'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone3'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone3'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone3'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone3'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'#,#####0.00;[Red](#,#####0.00)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone3'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'Zone3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone3'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone3'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone3'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'8' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone3'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'Zone3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone3'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'''DOMESTIC Ground$''' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone3'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone3'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'7' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone3'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone4'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone4'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone4'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone4'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone4'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone4'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone4'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone4'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone4'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone4'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone4'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'#,#####0.00;[Red](#,#####0.00)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone4'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'Zone4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone4'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'5' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone4'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone4'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'8' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone4'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'Zone4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone4'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'''DOMESTIC Ground$''' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone4'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone4'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'7' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone4'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone5'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone5'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone5'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone5'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone5'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone5'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone5'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone5'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone5'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone5'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone5'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'#,#####0.00;[Red](#,#####0.00)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone5'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'Zone5' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone5'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'6' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone5'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone5'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'8' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone5'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'Zone5' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone5'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'''DOMESTIC Ground$''' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone5'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone5'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'7' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone5'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone6'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone6'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone6'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone6'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone6'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone6'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone6'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone6'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone6'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone6'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone6'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'#,#####0.00;[Red](#,#####0.00)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone6'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'Zone6' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone6'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'7' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone6'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone6'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'8' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone6'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'Zone6' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone6'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'''DOMESTIC Ground$''' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone6'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone6'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'7' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone6'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone7'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone7'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone7'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone7'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone7'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone7'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone7'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone7'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone7'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone7'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone7'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'#,#####0.00;[Red](#,#####0.00)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone7'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'Zone7' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone7'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'8' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone7'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone7'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'8' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone7'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'Zone7' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone7'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'''DOMESTIC Ground$''' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone7'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone7'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'7' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone7'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone8'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone8'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone8'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone8'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone8'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone8'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone8'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone8'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone8'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone8'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone8'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'#,#####0.00;[Red](#,#####0.00)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone8'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'Zone8' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone8'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'9' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone8'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone8'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'8' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone8'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'Zone8' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone8'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'''DOMESTIC Ground$''' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone8'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone8'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'7' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone8'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone44'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone44'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone44'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone44'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone44'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone44'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone44'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone44'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone44'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone44'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone44'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'#,#####0.00;[Red](#,#####0.00)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone44'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'Zone44' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone44'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone44'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone44'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'8' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone44'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'Zone44' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone44'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'''DOMESTIC Ground$''' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone44'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone44'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'7' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone44'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone45'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone45'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone45'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone45'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone45'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone45'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone45'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone45'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone45'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone45'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone45'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'#,#####0.00;[Red](#,#####0.00)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone45'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'Zone45' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone45'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'11' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone45'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone45'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'8' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone45'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'Zone45' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone45'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'''DOMESTIC Ground$''' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone45'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone45'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'7' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone45'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone46'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone46'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone46'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone46'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone46'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone46'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone46'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone46'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone46'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone46'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone46'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'#,#####0.00;[Red](#,#####0.00)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone46'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'Zone46' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone46'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'12' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone46'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone46'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'8' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone46'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'Zone46' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone46'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'''DOMESTIC Ground$''' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone46'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone46'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'7' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates', @level2type=N'COLUMN',@level2name=N'Zone46'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1073741824' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates'
GO
EXEC sys.sp_addextendedproperty @name=N'Connect', @value=N'Excel 8.0;HDR=YES;IMEX=2;ACCDB=YES;DATABASE=E:\SI_Development\Works.Text\2008_daily_rates.xls' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates'
GO
EXEC sys.sp_addextendedproperty @name=N'DateCreated', @value=N'2/4/2008 5:20:21 PM' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates'
GO
EXEC sys.sp_addextendedproperty @name=N'DisplayViewsOnSharePointSite', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates'
GO
EXEC sys.sp_addextendedproperty @name=N'FilterOnLoad', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates'
GO
EXEC sys.sp_addextendedproperty @name=N'HideNewField', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates'
GO
EXEC sys.sp_addextendedproperty @name=N'LastUpdated', @value=N'2/4/2008 5:20:21 PM' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DefaultView', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOn', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'DOMESTIC Ground' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates'
GO
EXEC sys.sp_addextendedproperty @name=N'OrderByOnLoad', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates'
GO
EXEC sys.sp_addextendedproperty @name=N'RecordCount', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTableName', @value=N'''DOMESTIC Ground$''' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates'
GO
EXEC sys.sp_addextendedproperty @name=N'TotalsRow', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates'
GO
EXEC sys.sp_addextendedproperty @name=N'Updatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_Rates'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'ZipCode'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'ZipCode'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'ZipCode'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'ZipCode'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'ZipCode'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'ZipCode'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'ZipCode'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'ZipCode'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'ZipCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'ZipCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'@' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'ZipCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'ZipCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'ZipCode'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'ZipCode' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'ZipCode'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'ZipCode'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'ZipCode'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'ZipCode'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'ZipCode' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'ZipCode'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'''900$''' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'ZipCode'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'ZipCode'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'ZipCode'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'ZipCode'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'Ground'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'Ground'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'Ground'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'Ground'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'Ground'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'Ground'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'Ground'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'Ground'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'Ground'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'Ground'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'@' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'Ground'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'Ground'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'Ground'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'Ground' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'Ground'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'Ground'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'Ground'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'Ground'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'Ground' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'Ground'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'''900$''' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'Ground'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'Ground'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'Ground'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'Ground'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'Day3Select'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'Day3Select'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'Day3Select'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'Day3Select'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'Day3Select'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'Day3Select'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'Day3Select'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'Day3Select'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'Day3Select'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'Day3Select'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'@' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'Day3Select'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'Day3Select'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'Day3Select'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'Day3Select' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'Day3Select'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'Day3Select'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'Day3Select'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'Day3Select'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'Day3Select' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'Day3Select'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'''900$''' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'Day3Select'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'Day3Select'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'Day3Select'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'Day3Select'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'Day2Air'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'Day2Air'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'Day2Air'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'Day2Air'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'Day2Air'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'Day2Air'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'Day2Air'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'Day2Air'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'Day2Air'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'Day2Air'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'@' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'Day2Air'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'Day2Air'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'Day2Air'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'Day2Air' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'Day2Air'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'Day2Air'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'Day2Air'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'Day2Air'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'Day2Air' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'Day2Air'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'''900$''' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'Day2Air'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'Day2Air'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'Day2Air'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'Day2Air'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'Day2AirAM'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'Day2AirAM'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'Day2AirAM'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'Day2AirAM'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'Day2AirAM'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'Day2AirAM'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'Day2AirAM'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'Day2AirAM'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'Day2AirAM'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'Day2AirAM'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'@' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'Day2AirAM'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'Day2AirAM'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'Day2AirAM'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'Day2AirAM' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'Day2AirAM'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'Day2AirAM'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'Day2AirAM'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'Day2AirAM'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'Day2AirAM' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'Day2AirAM'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'''900$''' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'Day2AirAM'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'Day2AirAM'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'Day2AirAM'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'Day2AirAM'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'NextDayAirSaver'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'NextDayAirSaver'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'NextDayAirSaver'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'NextDayAirSaver'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'NextDayAirSaver'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'NextDayAirSaver'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'NextDayAirSaver'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'NextDayAirSaver'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'NextDayAirSaver'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'NextDayAirSaver'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'@' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'NextDayAirSaver'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'NextDayAirSaver'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'NextDayAirSaver'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'NextDayAirSaver' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'NextDayAirSaver'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'5' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'NextDayAirSaver'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'NextDayAirSaver'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'NextDayAirSaver'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'NextDayAirSaver' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'NextDayAirSaver'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'''900$''' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'NextDayAirSaver'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'NextDayAirSaver'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'NextDayAirSaver'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'NextDayAirSaver'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'NextDayAir'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'NextDayAir'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'NextDayAir'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'NextDayAir'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'NextDayAir'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'NextDayAir'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'NextDayAir'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'NextDayAir'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'NextDayAir'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'NextDayAir'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'@' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'NextDayAir'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'NextDayAir'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'NextDayAir'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'NextDayAir' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'NextDayAir'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'6' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'NextDayAir'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'NextDayAir'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'NextDayAir'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'NextDayAir' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'NextDayAir'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'''900$''' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'NextDayAir'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'NextDayAir'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'NextDayAir'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode', @level2type=N'COLUMN',@level2name=N'NextDayAir'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1073741824' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode'
GO
EXEC sys.sp_addextendedproperty @name=N'Connect', @value=N'Excel 12.0 Xml;HDR=YES;IMEX=2;ACCDB=YES;DATABASE=E:\SI_Development\Works.Text\UPS_2008_Zone_900.xlsx' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode'
GO
EXEC sys.sp_addextendedproperty @name=N'DateCreated', @value=N'2/4/2008 6:46:02 PM' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode'
GO
EXEC sys.sp_addextendedproperty @name=N'DisplayViewsOnSharePointSite', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode'
GO
EXEC sys.sp_addextendedproperty @name=N'FilterOnLoad', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode'
GO
EXEC sys.sp_addextendedproperty @name=N'HideNewField', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode'
GO
EXEC sys.sp_addextendedproperty @name=N'LastUpdated', @value=N'2/4/2008 6:49:47 PM' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DefaultView', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOn', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'UPS_ZoneCode' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode'
GO
EXEC sys.sp_addextendedproperty @name=N'OrderByOnLoad', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode'
GO
EXEC sys.sp_addextendedproperty @name=N'RecordCount', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTableName', @value=N'''900$''' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode'
GO
EXEC sys.sp_addextendedproperty @name=N'TotalsRow', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode'
GO
EXEC sys.sp_addextendedproperty @name=N'Updatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UPS_ZoneCode'
GO
