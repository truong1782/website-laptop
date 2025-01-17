USE [master]
GO
/****** Object:  Database [DBLAPTOP]    Script Date: 27/07/2021 5:47:12 PM ******/
CREATE DATABASE [DBLAPTOP]
GO
USE [DBLAPTOP]
GO
/****** Object:  Table [dbo].[Blog]    Script Date: 27/07/2021 5:47:12 PM ******/
CREATE TABLE [dbo].[Blog](
	[IDBlog] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NULL,
	[Content] [nvarchar](max) NULL,
	[DateCreate] [datetime] NULL,
	[IDTopic] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[image] [ntext] NULL,
 CONSTRAINT [PK_Blog] PRIMARY KEY CLUSTERED 
(
	[IDBlog] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Brand]    Script Date: 27/07/2021 5:47:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brand](
	[brandID] [int] IDENTITY(1,1) NOT NULL,
	[brandName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK__Brand__06B772B980090CAB] PRIMARY KEY CLUSTERED 
(
	[brandID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 27/07/2021 5:47:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[categoryID] [int] IDENTITY(1,1) NOT NULL,
	[categoryName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK__Category__23CAF1F843DF9592] PRIMARY KEY CLUSTERED 
(
	[categoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contact]    Script Date: 27/07/2021 5:47:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact](
	[contactID] [int] IDENTITY(1,1) NOT NULL,
	[fullName] [nvarchar](255) NOT NULL,
	[email] [nvarchar](255) NOT NULL,
	[title] [nvarchar](50) NOT NULL,
	[detail] [ntext] NOT NULL,
	[dateCreate] [datetime] NOT NULL,
	[status] [bit] NOT NULL,
	[phone] [nchar](12) NOT NULL,
 CONSTRAINT [PK__Contact__7121FD1519254272] PRIMARY KEY CLUSTERED 
(
	[contactID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Discount]    Script Date: 27/07/2021 5:47:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Discount](
	[discountID] [int] IDENTITY(1,1) NOT NULL,
	[discountCode] [nchar](30) NOT NULL,
	[value] [int] NOT NULL,
	[conditionMoney] [int] NOT NULL,
	[note] [ntext] NULL,
	[startDate] [datetime] NOT NULL,
	[endDate] [datetime] NOT NULL,
	[image] [ntext] NULL,
 CONSTRAINT [PK__Discount__D2130A06D0203851] PRIMARY KEY CLUSTERED 
(
	[discountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 27/07/2021 5:47:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[orderID] [int] IDENTITY(1,1) NOT NULL,
	[userID] [int] NOT NULL,
	[reduceMoney] [int] NULL,
	[totalMoney] [int] NOT NULL,
	[dateCreate] [datetime] NOT NULL,
	[dateArrive] [datetime] NOT NULL,
	[status] [bit] NOT NULL,
 CONSTRAINT [PK__Order__0809337D7AB64A78] PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 27/07/2021 5:47:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[orderID] [int] NOT NULL,
	[productID] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[amountMoney] [int] NOT NULL,
 CONSTRAINT [PK__OrderDet__BAD83E695BC0FFD2] PRIMARY KEY CLUSTERED 
(
	[orderID] ASC,
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 27/07/2021 5:47:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[productID] [int] IDENTITY(1,1) NOT NULL,
	[categoryID] [int] NOT NULL,
	[brandID] [int] NOT NULL,
	[productName] [nvarchar](max) NOT NULL,
	[productPrice] [int] NOT NULL,
	[productDetail] [ntext] NOT NULL,
	[image] [nchar](255) NULL,
	[dateCreate] [datetime] NOT NULL,
	[amount] [int] NOT NULL,
 CONSTRAINT [PK__Product__2D10D14A4880F9DB] PRIMARY KEY CLUSTERED 
(
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 27/07/2021 5:47:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[roleID] [int] IDENTITY(1,1) NOT NULL,
	[roleName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK__Role__CD98460A3641BB5D] PRIMARY KEY CLUSTERED 
(
	[roleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Topic]    Script Date: 27/07/2021 5:47:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Topic](
	[IDTopic] [int] IDENTITY(1,1) NOT NULL,
	[NameTopic] [nvarchar](100) NULL,
 CONSTRAINT [PK_Topic] PRIMARY KEY CLUSTERED 
(
	[IDTopic] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 27/07/2021 5:47:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[userID] [int] IDENTITY(1,1) NOT NULL,
	[roleID] [int] NOT NULL,
	[fullName] [nvarchar](100) NOT NULL,
	[userName] [nchar](55) NULL,
	[password] [nchar](55) NULL,
	[email] [nchar](55) NULL,
	[phoneNumber] [nchar](12) NULL,
	[address] [nvarchar](255) NULL,
	[image] [nvarchar](max) NULL,
	[gender] [bit] NOT NULL,
	[dateOfBirth] [date] NOT NULL,
	[idSocial] [nvarchar](255) NULL,
 CONSTRAINT [PK__User__CB9A1CDF2E7C40A2] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Blog] ON 
GO
INSERT [dbo].[Blog] ([IDBlog], [Title], [Content], [DateCreate], [IDTopic], [UserID], [image]) VALUES (8, N'Đánh giá Laptop Dell Latitude E7390', N'<p><em>Để mang đến hiệu quả kinh doanh th&ocirc;ng minh bạn kh&ocirc;ng thể bỏ qua laptop&nbsp;<strong>Dell Latitude 7390</strong>&nbsp;&ndash; Chiếc m&aacute;y nổi bật nhất trong d&ograve;ng Dell Latitude 7000 series với CPU Kaby Lake Refresh v&agrave; Dell rất đầy tư khi trang bị cho Dell Latitude E7390 một khe cắm thẻ th&ocirc;ng minh cũng như c&aacute;c t&iacute;nh năng bảo mật n&acirc;ng cao. Ngo&agrave;i ra việc Dell Latitude E7390 c&ograve;n sở hữu thời lượng pin d&agrave;i, m&agrave;n h&igrave;nh full HD, kết nối v&agrave; thiết bị đầu v&agrave;o đều đ&aacute;p ứng nhu cầu của d&acirc;n kinh doanh chuy&ecirc;n nghiệp.</em></p>

<p><img src="https://tinphatlaptop.com/upload_images/images/2021/07/19/Dell%20Latitude%20E7390%201.jpg" /></p>

<p>Dell Latitude E7390 l&agrave; m&aacute;y t&iacute;nh x&aacute;ch tay d&agrave;nh cho doanh nh&acirc;n di động ở tầm gi&aacute; trung với định dạng 14 inch, cũng l&agrave; người kế nhiệm của &nbsp;Dell Latitude 13 7380, với bộ vi xử l&yacute; Intel Core i5-8350U l&otilde;i &nbsp;tứ đi k&egrave;m với 8 GB RAM. Đồ họa GPU bộ xử l&yacute; Intel HD Graphics 620 v&agrave; giải ph&aacute;p lưu trữ l&agrave; SSD 256 GB&nbsp;</p>

<p><strong>Dell Latitude E7390</strong>&nbsp;ghi điểm với g&oacute;i bảo mật ho&agrave;n chỉnh gi&uacute;p tạo sự kh&aacute;c biệt với phần lớn c&aacute;c m&aacute;y t&iacute;nh x&aacute;ch tay d&agrave;nh cho doanh nghiệp bằng khe cắm thẻ th&ocirc;ng minh v&agrave; được ho&agrave;n thiện bởi Windows 10 Pro. Với trọng lượng nặng 1,3 kg v&agrave; m&agrave;n h&igrave;nh IPS Full HD c&oacute; độ ph&acirc;n giải 1920x1080 pixel.&nbsp;</p>

<h2><img alt="Thiết kế Dell Latitude E7390 đơn giản" src="https://tinphatlaptop.com/upload_images/images/2021/07/19/Dell%20Latitude%20E7390%206.jpg" /><br />
&nbsp;</h2>

<h2><strong>Thiết kế&nbsp;Dell Latitude E7390 đơn giản, chắc chắn v&agrave; bề mặt chống trượt</strong></h2>

<p>Lớp vỏ của&nbsp;<strong>Dell Latitude E7390</strong>&nbsp;được thiết kế gần như l&agrave; m&agrave;u đen mờ c&oacute; hướng thon về nắp mở, nổi bật sự đơn giản thanh lịch. Ngo&agrave;i logo Dell, đường line sọc tương phản m&agrave;u sắc ở cạnh dưới của mặt sau, n&uacute;t Bật / Tắt ở bản lề. Bề mặt phủ lớp cao su mỏng chống trượt ở đế v&agrave; mặt sau của nắp. Khi cầm l&acirc;u trong thời gian d&agrave;i m&aacute;y vẫn để lại dấu v&acirc;n tay mờ.<br />
D&ugrave; m&aacute;y chịu t&aacute;c động va chạm nhưng với chất liệu cao cấp hợp kim magie được trang bị cho&nbsp;<strong>Dell Latitude E7390</strong>&nbsp;vẫn đảm bảo độ bền bỉ, m&aacute;y c&oacute; thể được mở đến hơn 180 &deg; v&agrave; khi mở 1 g&oacute;c 135 &deg; mặt sau được n&acirc;ng l&ecirc;n bởi nắp m&aacute;y gi&uacute;p m&aacute;y chống trượt.&nbsp;<br />
So với người tiền nhiệm, Latitude 13 7380, trọng lượng v&agrave; k&iacute;ch thước của Dell Latitude E7390 gần như được tối ưu về độ mỏng.</p>

<p><img alt="Bảo mật hơn với thẻ thông minh Dell Latitude E7390" src="https://tinphatlaptop.com/upload_images/images/2021/07/19/Dell%20Latitude%20E7390%202.jpg" /></p>

<p>&nbsp;</p>

<h2><strong>Bảo mật hơn với thẻ th&ocirc;ng minh&nbsp;Dell Latitude E7390</strong></h2>

<p><strong>Dell Latitude E7390</strong>&nbsp;được ph&acirc;n biệt bởi thiết bị kết nối vững chắc hai cổng kết nối USB 3.1 Gen1, c&ograve;n c&oacute; một kết nối USB Type-C với DisplayPort, Ethernet, một khe cắm d&agrave;nh cho Thẻ microSD v&agrave; khay micro-SIM cho m&ocirc;-đun WLAN t&ugrave;y chọn.&nbsp;<br />
Đầu đọc thẻ SD<br />
Kh&ocirc;ng giống như đầu đọc thẻ của người tiền nhiệm, đầu đọc thẻ của Dell Latitude E7390 mới được kết nối qua PCIe v&agrave; kết nối USB-3.0 do đ&oacute; cho thấy tốc độ truyền rất tốt.&nbsp;<br />
Dell sử dụng m&ocirc;-đun WLAN Intel Wireless AC-8265. M&ocirc;-đun t&iacute;ch hợp Bluetooth 4.2 v&agrave; đạt được tốc độ tổng dữ liệu tối đa l&agrave; 867 MBit / s, nhờ MIMO 2x2 ở băng tần 5 GHz. Bảo vệ<br />
Khả năng bảo mật ho&agrave;n chỉnh từ TPM 2.0 cho đến cảm biến v&acirc;n tay, thẻ th&ocirc;ng minh v&agrave; m&atilde; h&oacute;a ổ cứng Bitlocker th&ocirc;ng qua Windows 10 Pro, mọi thứ m&agrave; người d&ugrave;ng doanh nghiệp di động c&oacute; thể mong muốn đều được sở hữu.&nbsp;</p>

<p>&nbsp;</p>

<h2><strong>B&agrave;n ph&iacute;m Dell Latitude E7390 chất lượng cao v&agrave; độc đ&aacute;o</strong></h2>

<p>Với Dell Latitude E7390, Dell đ&atilde; th&agrave;nh c&ocirc;ng trong việc cải thiện khả năng trải nghiệm b&agrave;n ph&iacute;m với bề mặt 2 cm ph&ugrave; hợp với b&agrave;n ph&iacute;m ti&ecirc;u chuẩn, khoảng c&aacute;ch ph&iacute;m bạn sẽ mất thời gian đầu l&agrave;m quen v&agrave; để tăng tốc độ g&otilde; ph&iacute;m. Ph&iacute;m Escape cũng đ&oacute;ng vai tr&ograve; l&agrave; ph&iacute;m Fn-Lock v&agrave; do đ&oacute; c&oacute; thể sử dụng đ&egrave;n LED khi thiếu s&aacute;ng.<br />
C&aacute;c ph&iacute;m được d&aacute;n nh&atilde;n c&ocirc;ng th&aacute;i học c&oacute; h&igrave;nh dạng hơi l&otilde;m, nhưng tất cả c&aacute;c ph&iacute;m kh&aacute;c đều kh&aacute; phẳng. Với điểm nhấn dễ nhận thấy v&agrave; h&agrave;nh tr&igrave;nh ngắn, c&aacute;c ph&iacute;mđược đệm nhẹ, mang đến trải nghiệm đ&aacute;nh m&aacute;y thỏa m&atilde;n v&agrave; cảm gi&aacute;c x&uacute;c gi&aacute;c chất lượng cao, b&agrave;n ph&iacute;m n&agrave;y kh&ocirc;ng thua k&eacute;m g&igrave; b&agrave;n ph&iacute;m ThinkPad loại tốt.&nbsp;</p>

<p><img alt="Bàn phím Dell Latitude E7390 chất lượng cao và độc đáo" src="https://tinphatlaptop.com/upload_images/images/2021/07/19/Dell%20Latitude%20E7390%203.jpg" /></p>

<p><br />
<strong>B&agrave;n di chuột</strong><br />
B&agrave;n di chuột lớn với c&aacute;c ph&iacute;m được t&aacute;ch biệt. Bề mặt được l&agrave;m nh&aacute;m ở mức độ tối thiểu, đảm bảo ng&oacute;n tay ẩm dễ d&agrave;ng trượt. Con trỏ chuột c&oacute; thể được di chuyển với độ ch&iacute;nh x&aacute;c v&agrave; c&aacute;c chuyển động nhanh kh&ocirc;ng tạo ra độ trễ.&nbsp;</p>

<h2><strong>M&agrave;n h&igrave;nh Dell Latitude E7390</strong>&nbsp;<strong>độ tương phản cao v&agrave; kh&ocirc;ng c&oacute; PWM / CABC</strong></h2>

<p>Dell đang sử dụng tấm nền IPS với độ ph&acirc;n giải Full HD, 165 PPI, cho h&igrave;nh ảnh sắc n&eacute;t. Ph&acirc;n bố độ s&aacute;ng l&ecirc;n đến 92% cho m&agrave;u sắc s&aacute;ng hơn v&agrave; m&agrave;u đen kh&ocirc;ng qu&aacute; bị tối v&agrave; biến đổi. Độ tương phản tuyệt vời tỷ lệ 1316: 1 mang đến độ ch&iacute;nh x&aacute;c m&agrave;u sắc cao kh&ocirc;ng cần căn chỉnh m&agrave;u. Độ phủ kh&ocirc;ng gian m&agrave;u ti&ecirc;u chuẩn sRGB 90,6%. Cảm ứng nhanh nhạy kh&ocirc;ng xảy ra t&igrave;nh trạng giật lag, ph&ugrave; hợp khi lướt web v&agrave; đọc b&aacute;o.</p>

<p><img alt="Màn hình Dell Latitude E7390 độ tương phản cao " src="https://tinphatlaptop.com/upload_images/images/2021/07/19/Dell%20Latitude%20E7390%204.jpg" /></p>

<h2><strong>Hiệu suất&nbsp;Dell Latitude E7390&nbsp;bốn l&otilde;i SSD</strong></h2>

<p><strong>Bộ xử l&yacute;</strong><br />
<strong>Dell Latitude E7390</strong>&nbsp;được trang bị chip Intel Core i5-8350U l&otilde;i tứ với TDP 15 watt, thế hệ Kaby Lake Refresh mang đến tốc độ xung nhịp cơ bản 1,7 GHz, c&oacute; thể tăng l&ecirc;n đến 3,6 GHz th&ocirc;ng qua Turbo. Ngo&agrave;i GPU Intel UHD Graphics 620, bộ vi xử l&yacute; n&agrave;y cũng t&iacute;ch hợp bộ điều khiển lưu trữ DDR4 v&agrave; xử l&yacute; m&atilde; h&oacute;a v&agrave; giải m&atilde; t&agrave;i liệu video H.265 trong phần cứng. Theo Intel, hiệu suất sẽ tăng khoảng 40% so với c&aacute;c chip Kaby Lake thế hệ đầu ti&ecirc;n. Chip i5-8350U l&agrave;m chủ c&ocirc;ng nghệ vPro của Intel.&nbsp;</p>

<p><img alt="Hiệu suất Dell Latitude E7390 bốn lõi SSD" src="https://tinphatlaptop.com/upload_images/images/2021/07/19/Dell%20Latitude%20E7390%205.jpg" /></p>

<p>C&aacute;c t&aacute;c vụ văn ph&ograve;ng th&ocirc;ng thường đều được giải quyết nhanh ch&oacute;ng, n&acirc;ng cao khả năng tiết kiệm, thiết kế để chạy c&aacute;c l&otilde;i song song, xử l&yacute; tốt phần mềm chỉnh sửa video Adobe Premiere Pro. Khi tất cả bốn l&otilde;i được sử dụng đầy đủ, bộ xử l&yacute; nhanh ch&oacute;ng đạt đến giới hạn TDP, đ&acirc;y l&agrave; điểm đặc trưng cho c&aacute;c l&otilde;i tứ ULV mới.&nbsp;</p>

<p><strong>Giải ph&aacute;p lưu trữ</strong><br />
Dell Latitude E7390 sử dụng SSD Hynix M.2 với dung lượng 256 GB được kết nối qua SATA III. Theo AS SSD, hiệu suất ho&agrave;n to&agrave;n điển h&igrave;nh đối với đầu nối cũ. Giới hạn SATA-III gần 500 MB / s đạt được khi đọc tuần tự v&agrave; hiệu suất khi đọc c&aacute;c khối 4K ph&acirc;n t&aacute;n, nhỏ, điều quan trọng trong qu&aacute; tr&igrave;nh khởi động chương tr&igrave;nh v&agrave; hệ điều h&agrave;nh.&nbsp;<br />
<strong>Card đồ họa</strong><br />
Intel UHD Graphics 620 cho tốc độ tối đa l&agrave; 1100 MHz, card đồ họa HD của Intel được hưởng lợi từ RAM k&ecirc;nh đ&ocirc;i nhanh hơn ph&ugrave; hợp chỉnh sửa ảnh2D. GPU kh&ocirc;ng ph&ugrave; hợp với c&aacute;c tr&ograve; chơi 3D hiện tại m&agrave; chỉ chơi c&aacute;c d&ograve;ng game cơ bản.</p>

<p><img alt="Tuổi thọ pin Dell Latitude E7390 tốt" src="https://tinphatlaptop.com/upload_images/images/2021/07/19/Dell%20Latitude%20E7390%207.jpg" /></p>

<p><strong>Mic v&agrave; loa</strong><br />
Dell Latitude E7390 dễ d&agrave;ng vượt qua b&agrave;i kiểm tra &acirc;m nhạc với trạng th&aacute;i ph&acirc;n phối &acirc;m nhạc ở mức kh&aacute;, hệ thống &acirc;m thanh xử l&yacute; tốt c&aacute;c &acirc;m thanh tho&aacute;ng,&nbsp;</p>

<h2><strong>Tuổi thọ pin&nbsp;Dell Latitude E7390 tốt</strong></h2>

<p>R&otilde; r&agrave;ng l&agrave; Core i5-8350U với bốn l&otilde;i vật l&yacute; của n&oacute; sử dụng nhiều điện năng hơn so với l&otilde;i k&eacute;p Kaby Lake của c&aacute;c đối thủ cạnh tranh. Tuy nhi&ecirc;n với khả năng tiết kiệm điện năng đ&aacute;ng kể&nbsp;<br />
Trong b&agrave;i kiểm tra kh&ocirc;ng tải, Dell Latitude E7390 đạt được kết quả k&eacute;o d&agrave;i gần 28 giờ khi đ&oacute;ng m&aacute;y, khi chạy c&aacute;c phần mềm, Dell Latitude E7390 c&ograve;n thời gian sử 10 giờ như trong phi&ecirc;n bản tiền nhiệm.</p>

<p><strong><em>Nhận định</em></strong><br />
<strong>Dell Latitude E7390&nbsp;</strong>với ưu điểm trong thiết kế khi n&acirc;ng g&oacute;c m&aacute;y mở 135 độ. Vỏ m&aacute;y được thiết kế đơn giản mang lại sự thanh lịch cao cấp, thiết bị đầu v&agrave;o tốt, khả năng bảo mật ho&agrave;n chỉnh, kết nối hợp l&yacute;, m&agrave;n h&igrave;nh c&oacute; độ tương phản cao, Windows 10 Pro, Dell Latitude E7390 xứng đ&aacute;ng với danh xưng laptop mang lại trải nghiệm kinh doanh th&ocirc;ng minh.</p>
', CAST(N'2021-07-26T09:49:06.460' AS DateTime), 2, 2, N'~/images/blog/Ca-Phe-Sua-Đa.jpg')
GO
SET IDENTITY_INSERT [dbo].[Blog] OFF
GO
SET IDENTITY_INSERT [dbo].[Brand] ON 
GO
INSERT [dbo].[Brand] ([brandID], [brandName]) VALUES (1, N'DELL')
GO
INSERT [dbo].[Brand] ([brandID], [brandName]) VALUES (2, N'Asus')
GO
INSERT [dbo].[Brand] ([brandID], [brandName]) VALUES (3, N'MacBook')
GO
INSERT [dbo].[Brand] ([brandID], [brandName]) VALUES (4, N'HP')
GO
INSERT [dbo].[Brand] ([brandID], [brandName]) VALUES (5, N'MSI')
GO
SET IDENTITY_INSERT [dbo].[Brand] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 
GO
INSERT [dbo].[Category] ([categoryID], [categoryName]) VALUES (1, N'Laptop gaming')
GO
INSERT [dbo].[Category] ([categoryID], [categoryName]) VALUES (2, N'Laptop văn phòng')
GO
INSERT [dbo].[Category] ([categoryID], [categoryName]) VALUES (5, N'Laptop đồ họa')
GO
INSERT [dbo].[Category] ([categoryID], [categoryName]) VALUES (6, N'Laptop mỏng nhẹ')
GO
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Contact] ON 
GO
INSERT [dbo].[Contact] ([contactID], [fullName], [email], [title], [detail], [dateCreate], [status], [phone]) VALUES (2, N'Nguyen Quang Truong', N'quangtruong.tdr012@gmail.com', N'support', N'adfadf', CAST(N'2021-07-02T21:27:40.727' AS DateTime), 1, N'0778955931  ')
GO
INSERT [dbo].[Contact] ([contactID], [fullName], [email], [title], [detail], [dateCreate], [status], [phone]) VALUES (7, N'Nguyen Quang Truong', N'quangtruong.tdr012@gmail.com', N'Laptop đẹp thế', N'Laptop của shop đẹp thế nhờ', CAST(N'2021-07-07T22:20:49.283' AS DateTime), 1, N'0778955931  ')
GO
INSERT [dbo].[Contact] ([contactID], [fullName], [email], [title], [detail], [dateCreate], [status], [phone]) VALUES (8, N'Nguyen Quang Truong', N'quangtruong.tdr012@gmail.com', N'hello', N'helooooo', CAST(N'2021-07-10T20:43:00.737' AS DateTime), 1, N'0778955931  ')
GO
SET IDENTITY_INSERT [dbo].[Contact] OFF
GO
SET IDENTITY_INSERT [dbo].[Discount] ON 
GO
INSERT [dbo].[Discount] ([discountID], [discountCode], [value], [conditionMoney], [note], [startDate], [endDate], [image]) VALUES (11, N'GIAM20TR                      ', 20000000, 50000000, N'Đơn hàng từ 20000000 đ', CAST(N'2021-07-07T20:23:00.000' AS DateTime), CAST(N'2021-07-30T20:23:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Discount] ([discountID], [discountCode], [value], [conditionMoney], [note], [startDate], [endDate], [image]) VALUES (12, N'GIAM5TR                       ', 5000000, 20000000, N'giảm 5tr cho đơn hàng trên 20tr', CAST(N'2021-07-24T21:48:00.000' AS DateTime), CAST(N'2021-07-31T21:48:00.000' AS DateTime), NULL)
GO
SET IDENTITY_INSERT [dbo].[Discount] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 
GO
INSERT [dbo].[Order] ([orderID], [userID], [reduceMoney], [totalMoney], [dateCreate], [dateArrive], [status]) VALUES (40, 62, 0, 10000, CAST(N'2021-07-26T18:42:37.760' AS DateTime), CAST(N'2021-08-05T18:42:37.760' AS DateTime), 0)
GO
INSERT [dbo].[Order] ([orderID], [userID], [reduceMoney], [totalMoney], [dateCreate], [dateArrive], [status]) VALUES (41, 62, 0, 10000, CAST(N'2021-07-26T19:01:37.037' AS DateTime), CAST(N'2021-08-05T19:01:37.037' AS DateTime), 0)
GO
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
INSERT [dbo].[OrderDetail] ([orderID], [productID], [quantity], [amountMoney]) VALUES (40, 2, 1, 10000)
GO
INSERT [dbo].[OrderDetail] ([orderID], [productID], [quantity], [amountMoney]) VALUES (41, 1, 1, 10000)
GO
SET IDENTITY_INSERT [dbo].[Product] ON 
GO
INSERT [dbo].[Product] ([productID], [categoryID], [brandID], [productName], [productPrice], [productDetail], [image], [dateCreate], [amount]) VALUES (1, 1, 1, N'Laptop ASUS ROG Strix Scar 15 G533QR-HQ098T ( 15.6" Quad HD (2K)/AMD Ryzen 9 5900HX/16GB/1TB SSD/NVIDIA GeForce RTX 3070/Windows 10 Home 64-bit/2.3kg)', 10000, N'<p>- CPU: AMD Ryzen 9 5900HX<br />
- M&agrave;n h&igrave;nh: 15.6&quot; IPS (2560 x 1440)<br />
- RAM: 1 x 16GB DDR4 3200MHz<br />
- Đồ họa: NVIDIA GeForce RTX 3070 8GB GDDR6 / AMD Radeon Graphics<br />
- Lưu trữ: 1TB SSD M.2 NVMe /<br />
- Hệ điề</p>
', N'~/images/sanpham/laptop44.jpg                                                                                                                                                                                                                                  ', CAST(N'2021-07-26T18:07:42.707' AS DateTime), 100)
GO
INSERT [dbo].[Product] ([productID], [categoryID], [brandID], [productName], [productPrice], [productDetail], [image], [dateCreate], [amount]) VALUES (2, 1, 2, N'Laptop ASUS G533QM-HF089T 90NR0541-M01890 ( 15.6" Full HD/AMD Ryzen 9 5900HX/16GB/1TB SSD/NVIDIA GeForce RTX 3060/Windows 10 Home 64-bit/2.3kg)', 10000, N'<p>- CPU: AMD Ryzen 9 5900HX - M&agrave;n h&igrave;nh: 15.6&quot; IPS (1920 x 1080) - RAM: 2 x 8GB DDR4 - Đồ họa: NVIDIA GeForce RTX 3060 6GB GDDR6 / AMD Radeon Graphics - Lưu trữ: 1TB SSD M.2 NVMe / - Hệ điều h&agrave;nh: W</p>
', N'~/images/sanpham/asus3.jpg                                                                                                                                                                                                                                     ', CAST(N'2021-07-26T18:07:51.313' AS DateTime), 50)
GO
INSERT [dbo].[Product] ([productID], [categoryID], [brandID], [productName], [productPrice], [productDetail], [image], [dateCreate], [amount]) VALUES (3, 1, 1, N'Laptop Dell G5 15 5500 5500-70228123 ( 15.6" Full HD/Intel Core i7-10750H/16GB/512GB SSD/NVIDIA GeForce RTX 2060/Windows 10 Home 64-bit/2.6kg)', 32990000, N'- CPU: Intel Core i7-10750H
- Màn hình: 15.6" WVA (1920 x 1080)
- RAM: 2 x 8GB DDR4 2933MHz
- Đồ họa: NVIDIA GeForce RTX 2060Intel UHD Graphics
- Lưu trữ: 512GB SSD M.2 NVMe /
- Hệ điều hành: Win', N'~/images/sanpham/laptopdell.jpg                                                                                                                                                                                                                                ', CAST(N'2021-07-04T13:38:39.520' AS DateTime), 100)
GO
INSERT [dbo].[Product] ([productID], [categoryID], [brandID], [productName], [productPrice], [productDetail], [image], [dateCreate], [amount]) VALUES (4, 1, 1, N'Laptop Dell G5 15 5500 5500-70228123 ( 15.6" Full HD/Intel Core i7-10750H/16GB/512GB SSD/NVIDIA GeForce RTX 2060/Windows 10 Home 64-bit/2.6kg)', 32990000, N'- CPU: Intel Core i7-10750H
- Màn hình: 15.6" WVA (1920 x 1080)
- RAM: 2 x 8GB DDR4 2933MHz
- Đồ họa: NVIDIA GeForce RTX 2060Intel UHD Graphics
- Lưu trữ: 512GB SSD M.2 NVMe /
- Hệ điều hành: Win', N'~/images/sanpham/dell_xps.png                                                                                                                                                                                                                                  ', CAST(N'2021-07-04T13:39:24.233' AS DateTime), 200)
GO
INSERT [dbo].[Product] ([productID], [categoryID], [brandID], [productName], [productPrice], [productDetail], [image], [dateCreate], [amount]) VALUES (5, 2, 2, N'Laptop Asus Pro P1440FA-FA0609T (i3-8145U) (Xám)', 8883000, N'- Hàng đã qua bảo hành
- Sản phẩm có trầy xước
- Đầy đủ phụ kiện - Vỏ hộp nguyên vẹn
- SN: ***K6NXCV126846267
- Bảo hành đến: 28/03/2022
- Sản phẩm đang có tại: Showroom Phong Vũ Cần Thơ', N'~/images/sanpham/asus2.jpg                                                                                                                                                                                                                                     ', CAST(N'2021-07-04T13:41:19.963' AS DateTime), 111)
GO
INSERT [dbo].[Product] ([productID], [categoryID], [brandID], [productName], [productPrice], [productDetail], [image], [dateCreate], [amount]) VALUES (6, 2, 4, N'Laptop HP ProBook 430 G8 2H0N7PA ( 13.3" Full HD/Intel Core i5-1135G7/4GB/512GB SSD/Windows 10 Home SL 64-bit/1.2kg)', 20490000, N'- CPU: Intel Core i5-1135G7
- Màn hình: 13.3" (1920 x 1080)
- RAM: 1 x 4GB DDR4 3200MHz
- Đồ họa: Intel Iris Xe Graphics
- Lưu trữ: 512GB SSD M.2 NVMe /
- Hệ điều hành: Windows 10 Home SL 64-bit
', N'~/images/sanpham/hp3.jpg                                                                                                                                                                                                                                       ', CAST(N'2021-07-04T13:42:19.167' AS DateTime), 222)
GO
INSERT [dbo].[Product] ([productID], [categoryID], [brandID], [productName], [productPrice], [productDetail], [image], [dateCreate], [amount]) VALUES (7, 2, 4, N'Laptop HP ProBook 430 G8 2H0N7PA ( 13.3" Full HD/Intel Core i5-1135G7/4GB/512GB SSD/Windows 10 Home SL 64-bit/1.2kg)', 20490000, N'- CPU: Intel Core i5-1135G7
- Màn hình: 13.3" (1920 x 1080)
- RAM: 1 x 4GB DDR4 3200MHz
- Đồ họa: Intel Iris Xe Graphics
- Lưu trữ: 512GB SSD M.2 NVMe /
- Hệ điều hành: Windows 10 Home SL 64-bit
', N'~/images/sanpham/hp1.jpg                                                                                                                                                                                                                                       ', CAST(N'2021-07-04T13:49:44.693' AS DateTime), 222)
GO
INSERT [dbo].[Product] ([productID], [categoryID], [brandID], [productName], [productPrice], [productDetail], [image], [dateCreate], [amount]) VALUES (8, 2, 4, N'Laptop HP EliteBook 745 G5-5ZU71PA (14" FHD/R7-2700U/8GB/512GB SSD/Radeon Vega 10/Win10/1.6 kg)', 30690000, N'- CPU: AMD Ryzen 7 2700U ( 2.2 GHz - 3.8 GHz / 4MB / 4 nhân, 8 luồng )
- Màn hình: 14" IPS ( 1920 x 1080 ) , không cảm ứng
- RAM: 1 x 8GB DDR4 2400MHz
- Đồ họa: AMD Radeon Vega 10 Graphics
- Lư', N'~/images/sanpham/hp1.jpg                                                                                                                                                                                                                                       ', CAST(N'2021-07-04T13:48:30.243' AS DateTime), 999)
GO
INSERT [dbo].[Product] ([productID], [categoryID], [brandID], [productName], [productPrice], [productDetail], [image], [dateCreate], [amount]) VALUES (9, 1, 5, N'Laptop MSI', 60000000, N'dfafad', N'~/images/sanpham/msi4.jpg                                                                                                                                                                                                                                      ', CAST(N'2021-07-11T22:10:05.433' AS DateTime), 133)
GO
INSERT [dbo].[Product] ([productID], [categoryID], [brandID], [productName], [productPrice], [productDetail], [image], [dateCreate], [amount]) VALUES (10, 1, 2, N'Laptop Asus ed', 60000000, N'adadfadf', N'~/images/sanpham/msi2.jpg                                                                                                                                                                                                                                      ', CAST(N'2021-07-11T22:12:31.167' AS DateTime), 1331)
GO
INSERT [dbo].[Product] ([productID], [categoryID], [brandID], [productName], [productPrice], [productDetail], [image], [dateCreate], [amount]) VALUES (11, 1, 1, N'Laptop ASUS ROG Strix Scar 15 G533QR-HQ098T ( 15.6" Quad HD (2K)/AMD Ryzen 9 5900HX/16GB/1TB SSD/NVIDIA GeForce RTX 3070/Windows 10 Home 64-bit/2.3kg)', 20000000, N'222', N'~/images/sanpham/laptopasusqqqqqqq.jpg                                                                                                                                                                                                                         ', CAST(N'2021-07-12T23:26:31.040' AS DateTime), 222)
GO
INSERT [dbo].[Product] ([productID], [categoryID], [brandID], [productName], [productPrice], [productDetail], [image], [dateCreate], [amount]) VALUES (12, 1, 2, N'Laptop ASUS ROG Strix Scar 15 G533QR-HQ098T ( 15.6" Quad HD (2K)/AMD Ryzen 9 5900HX/16GB/1TB SSD/NVIDIA GeForce RTX 3070/Windows 10 Home 64-bit/2.3kg)', 20000000, N'<p>- CPU: Intel Core i7-8750H ( 2.2 GHz - 4.1 GHz / 9MB / 6 nh&acirc;n, 12 lu&ocirc;̀ng )<br />
- M&agrave;n h&igrave;nh: 15.6&quot; IPS ( 1920 x 1080 ) , kh&ocirc;ng cảm ứng<br />
- RAM: 1 x 8GB DDR4 2666MHz<br />
- Đồ họa: Intel UHD Graphics 630 / NVIDIA GeForce GTX 1060 6GB GDDR5<br />
- Lưu trữ: 256GB SSD M.2 NVMe<br />
- Hệ điều h&agrave;nh: Windows 10 Home SL 64-bit<br />
- Pin: 4 cell 66 Wh Pin liền , khối lượng: 2.4 kg</p>
', N'~/images/sanpham/asus4.jpg                                                                                                                                                                                                                                     ', CAST(N'2021-07-13T23:05:59.553' AS DateTime), 222)
GO
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 
GO
INSERT [dbo].[Role] ([roleID], [roleName]) VALUES (1, N'Khách hàng                    ')
GO
INSERT [dbo].[Role] ([roleID], [roleName]) VALUES (2, N'Admin                         ')
GO
INSERT [dbo].[Role] ([roleID], [roleName]) VALUES (3, N'Nhân viên                     ')
GO
INSERT [dbo].[Role] ([roleID], [roleName]) VALUES (4, N'Quản lý')
GO
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[Topic] ON 
GO
INSERT [dbo].[Topic] ([IDTopic], [NameTopic]) VALUES (1, N'Công nghệ ')
GO
INSERT [dbo].[Topic] ([IDTopic], [NameTopic]) VALUES (2, N'Đời sống')
GO
SET IDENTITY_INSERT [dbo].[Topic] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 
GO
INSERT [dbo].[User] ([userID], [roleID], [fullName], [userName], [password], [email], [phoneNumber], [address], [image], [gender], [dateOfBirth], [idSocial]) VALUES (2, 2, N'admin', N'admin                                                  ', N'e6159adc6a89617ed25fcae030b70693                       ', N'quangtruong.tdr012@gmail.com                           ', N'0778955931  ', N'117A, Nguyễn Duy Trinh', N'~/images/user/customer/default-employee.jpg                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           ', 1, CAST(N'2000-08-17' AS Date), NULL)
GO
INSERT [dbo].[User] ([userID], [roleID], [fullName], [userName], [password], [email], [phoneNumber], [address], [image], [gender], [dateOfBirth], [idSocial]) VALUES (55, 1, N'Nguyễn Quang Trường', N'truong1782                                             ', N'202cb962ac59075b964b07152d234b70                       ', N'quangtruong.tdr012@gmail.com                           ', N'0778955931  ', N'117a, Nguyễn Duy Trinh', N'~/images/user/customer/CODERED_B1_portrait_photography-P4b_438x447.jpg.img.jpg                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        ', 1, CAST(N'2000-08-17' AS Date), NULL)
GO
INSERT [dbo].[User] ([userID], [roleID], [fullName], [userName], [password], [email], [phoneNumber], [address], [image], [gender], [dateOfBirth], [idSocial]) VALUES (59, 3, N'Nguyen Quang Truong', N'truong                                                 ', N'202cb962ac59075b964b07152d234b70                       ', N'quangtruong.tdr012@gmail.com                           ', N'0778955931  ', N'117a,nguyen duy trinh,p.Binh trung tay, quan 2,tp.ho chi minh', N'~/images/user/employee/CODERED_B1_portrait_photography-P4b_438x447.jpg.img.jpg', 1, CAST(N'2000-08-17' AS Date), NULL)
GO
INSERT [dbo].[User] ([userID], [roleID], [fullName], [userName], [password], [email], [phoneNumber], [address], [image], [gender], [dateOfBirth], [idSocial]) VALUES (62, 1, N'Trường Nguyễn', N'quangtruong.tdr017@gmail.com                           ', NULL, N'quangtruong.tdr017@gmail.com                           ', N'            ', N'', N'https://platform-lookaside.fbsbx.com/platform/profilepic/?asid=1746232345569083&height=50&width=50&ext=1629816384&hash=AeRx1ytHmYXqABK7_fA', 1, CAST(N'0001-01-26' AS Date), N'1746232345569083')
GO
INSERT [dbo].[User] ([userID], [roleID], [fullName], [userName], [password], [email], [phoneNumber], [address], [image], [gender], [dateOfBirth], [idSocial]) VALUES (63, 1, N'Nguyen Truong', N'thtlaptopstore@gmail.com                               ', NULL, N'thtlaptopstore@gmail.com                               ', NULL, NULL, N'https://scontent-sin6-2.xx.fbcdn.net/v/t1.30497-1/cp0/c15.0.50.50a/p50x50/84628273_176159830277856_972693363922829312_n.jpg?_nc_cat=1&ccb=1-3&_nc_sid=12b3be&_nc_ohc=rxFuztvN2q0AX9hQgkE&_nc_ht=scontent-sin6-2.xx&oh=00fef4595ec909956d7ebfc5af46574a&oe=61247538', 1, CAST(N'0001-01-01' AS Date), N'115119694182544')
GO
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Blog]  WITH CHECK ADD  CONSTRAINT [FK_Blog_Topic] FOREIGN KEY([IDTopic])
REFERENCES [dbo].[Topic] ([IDTopic])
GO
ALTER TABLE [dbo].[Blog] CHECK CONSTRAINT [FK_Blog_Topic]
GO
ALTER TABLE [dbo].[Blog]  WITH CHECK ADD  CONSTRAINT [FK_Blog_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([userID])
GO
ALTER TABLE [dbo].[Blog] CHECK CONSTRAINT [FK_Blog_User]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK__Order__userID__49C3F6B7] FOREIGN KEY([userID])
REFERENCES [dbo].[User] ([userID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK__Order__userID__49C3F6B7]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK__OrderDeta__order__4BAC3F29] FOREIGN KEY([orderID])
REFERENCES [dbo].[Order] ([orderID])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK__OrderDeta__order__4BAC3F29]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK__OrderDeta__produ__46E78A0C] FOREIGN KEY([productID])
REFERENCES [dbo].[Product] ([productID])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK__OrderDeta__produ__46E78A0C]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK__Product__brandID__48CFD27E] FOREIGN KEY([brandID])
REFERENCES [dbo].[Brand] ([brandID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK__Product__brandID__48CFD27E]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK__Product__categor__47DBAE45] FOREIGN KEY([categoryID])
REFERENCES [dbo].[Category] ([categoryID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK__Product__categor__47DBAE45]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK__User__roleID__4CA06362] FOREIGN KEY([roleID])
REFERENCES [dbo].[Role] ([roleID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK__User__roleID__4CA06362]
GO
USE [master]
GO
ALTER DATABASE [DBLAPTOP] SET  READ_WRITE 
GO
