select *
from CSV_datas.dbo.Sheet1

--Standardize Date format
Select SaleDateConverted, CONVERT(Date, SaleDate)
From CSV_datas.dbo.Sheet1

--Updating 
update Sheet1
SET SaleDate = CONVERT(date, SaleDate)
--This command doesnot change anything 

Alter Table sheet1
add SaleDateConverted Date;

update Sheet1
SET SaleDateConverted = CONVERT(date, SaleDate)

select PropertyAddress
from CSV_datas.dbo.Sheet1
order by ParcelID

 select *
from CSV_datas.dbo.Sheet1
order by ParcelID

--helps to populate the data and fill the null values.
select a.ParcelID, a.PropertyAddress, b.ParcelID, b.PropertyAddress, ISNULL(a.PropertyAddress,b.PropertyAddress)
from CSV_datas..Sheet1 as a
join CSV_datas..Sheet1 as b 
on a.ParcelID = b.ParcelID
and a.[UniqueID ] <> b.[UniqueID ] 
where a.PropertyAddress is null

update a
SET PropertyAddress = ISNULL(a.PropertyAddress, b.PropertyAddress)
from CSV_datas..Sheet1 as a
join CSV_datas..Sheet1 as b
on a.ParcelID = b.ParcelID
and a.[UniqueID ] <> b.[UniqueID ]
where a.PropertyAddress is null