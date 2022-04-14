Create database Tap_Az

use Tap_Az

Create table Settings(
	ID int primary key identity,
	Logo nvarchar(150) not null,
	Location nvarchar(100),
	Email nvarchar(100) unique,
	Phone nvarchar(100) not null,
	Phone2 nvarchar(100),
	IgUrl nvarchar(100),
	FbUrl nvarchar(100)
)

Create table Advertisement(
	ID int primary key identity,
	Image nvarchar(150) not null,
	Url nvarchar(100) not null
)


Create table Categories(
   ID int primary key identity,
   Name nvarchar(30) not null unique
)

Create table SubCategories(
	ID int primary key identity,
	Name nvarchar(50) not null,
	Category_id int constraint FK_CATE foreign key references Categories(ID)
)


Create table Brands(
	ID int primary key identity,
	Name nvarchar(50) not null,
	SubCategory_ID int constraint FK_SUBCATE foreign key references SubCategories(ID)
)

Create table Colors(
	ID int primary key identity,
	Name nvarchar(30) not null,
)

Create table GasTypes(
	ID int primary key identity,
	Name nvarchar(30) not null,
)

Create table Models(
	ID int primary key identity,
	Name nvarchar(30) not null,
	Engine smallint not null,
	Release smalldatetime not null,
	Km int not null,
	Brand_ID int constraint FK_BRAND foreign key references Brands(ID),
	Color_ID int constraint FK_COLOR foreign key references Colors(ID),
	GasType_ID int constraint FK_GASTYPE foreign key references GasTypes(ID)
)
Create table Cities(
	ID int primary key identity,
	Name nvarchar(50) not null
)

Create table Announcements(
	ID int primary key identity,
	Price decimal(8,2) not null,
	Article nvarchar(700) not null,
	City_ID int constraint FK_CITY_AN foreign key references Cities(ID),
	SubCategory_ID int constraint FK_SubCotegry_AN foreign key references SubCategories(ID),
	Brand_ID int constraint FK_Brand_AN foreign key references Brands(ID),
	Model_ID int constraint FK_Model_AN foreign key references Models(ID),
	Gas_ID int constraint FK_GasType_AN foreign key references GasTypes(ID),
	Color_ID int constraint FK_COLOR_AN foreign key references Colors(ID)
)

Create table Images(
	ID int primary key identity,
	Name nvarchar(100) not null,
	Announcement_ID int constraint FK_AnnounCement foreign key references Announcements(ID)
)