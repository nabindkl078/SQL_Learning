select *
from CSV_datas.dbo.CovidDeaths
where continent is not null
order by 3,4

--select *
--from CSV_datas.dbo.CovidVaccinations
--order by 3,4

--Select data that we are going to be using
select location, date, total_cases, new_cases, total_deaths, population
from CSV_datas..CovidDeaths
order by 1, 2

--Looking at Total Cases vs Total Deaths

select location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as Death_Percentage 
from CSV_datas..CovidDeaths
where location like '%states%'
order by 1,2

--Total Cases VS Population
-- Shows what percentage of population got covid

select location, date, total_cases, population, (total_cases/population)*100 as Corona_Cases_Percentage
from CSV_datas..CovidDeaths
where location like '%states%'
order by 1, 2 

--select the country which has hightest number of covid infection people
select location, max(total_cases) as Total_number_of_Cases
from CSV_datas..CovidDeaths
group by location
order by 2 desc

--select the country which will show how many percentage population got infected
select location, max((total_cases/population))*100 as Infection_percentage
from CSV_datas..CovidDeaths
group by location
order by Infection_percentage desc

--calculate total number of death per poluation in percentage
select location,  max((total_deaths/population))*100 as Deaths_per_population
from CSV_datas..CovidDeaths
group by location
order by Deaths_per_population desc

--total death per population
select location, max(cast(Total_deaths as int)) as Total_DeathCount
from CSV_datas..CovidDeaths
where continent is not null
group by location
--since in the table the in location table there is a mixmax of location and continent so
order by Total_DeathCount desc

--total number of deaths in continent 
select location, max(cast(total_deaths as int)) as Total_DeathCount
from CSV_datas..CovidDeaths
where continent is  null
group by location
order by Total_DeathCount desc

--Global Numbers
select sum(new_cases) as total_cases, SUM(CAST(new_deaths AS int)) as total_deaths, (SUM(CAST(new_deaths AS int))/sum(new_cases))*100 as death_percentage
from CSV_datas..CovidDeaths
where continent is not null
order by 1, 2

select*
from CSV_datas..CovidDeaths as death
join CSV_datas..CovidVaccinations as vaccines
on death.location = vaccines.location
and death.date = vaccines.date
order by 3

--Looking at total Population vs Vaccinations 
select death.continent, death.location, death.date, death.population, vaccine.new_vaccinations,
 SUM(cast(vaccine.new_vaccinations as int)) over (partition by death.location order by death.location)
 from CSV_datas..CovidDeaths as death
 join 
 CSV_datas..CovidVaccinations as vaccine
on death.location = vaccine.location
and death.date = death.date
where death.continent is not null
order by 2, 3
--in this above program we only add the total number of new vaccination according to the location as per data.
--The seperation between the below code and this code is that the fuction inside the sum statement and partition by and order by both command given in below statement

--The above statement code and this code is different by the way that
select death.continent, death.location, death.date, death.population, vaccine.new_vaccinations,
SUM(cast(vaccine.new_vaccinations as int)) over (partition by death.location order by death.location, death.date)
from CSV_datas..CovidDeaths as death
join CSV_datas..CovidVaccinations as vaccine
on death.location = vaccine. location
and death.date = vaccine.date
order by 2, 3
--in this case the new_vaccinations are added while going from one date to another date and location's new vaccination values are also added.


--USE CTE 
with PopVsVac(Continent, Location, Date, Population,new_vaccinations, RollingPeopleVaccinated)
as
(
select death.continent, death.location, death.date, death.population, vaccine.new_vaccinations,
SUM(cast(vaccine.new_vaccinations as int)) over (partition by death.location order by death.location, death.date) as RollingPeopleVaccinated
from CSV_datas..CovidDeaths as death
join CSV_datas..CovidVaccinations as vaccine
on death.location = vaccine. location
and death.date = vaccine.date
--order by 2, 3 = this thing create error in the program while compiling, as it doesnot support order by unless top offset  or for xml is not specified
)
select *, (RollingPeopleVaccinated/Population)*100
from PopVsVac
--While using CTE function we need to remember that the components stored in select statement must be in with filename(arguments same as select statement)

--Temp table
drop table if exists #PercentPopulationVaccinated
create table #PercentPopulationVaccinated
(
Continent nvarchar(255),
Location nvarchar(255),
Date datetime,
Population numeric,
New_vaccination numeric,
RollingPeopleVaccinated numeric
)

insert into #PercentPopulationVaccinated 
select death.continent, death.location, death.date, death.population, vaccine.new_vaccinations,
SUM(cast(vaccine.new_vaccinations as int)) over (partition by death.location order by death.location, death.date) as RollingPeopleVaccinated
from CSV_datas..CovidDeaths as death
join CSV_datas..CovidVaccinations as vaccine
on death.location = vaccine. location
and death.date = vaccine.date

select *, (RollingPeopleVaccinated/Population)*100
from #PercentPopulationVaccinated 

--Create view to store data for later visualizations
create view PercentPopulationVaccinated as
select death.continent, death.location, death.date, death.population, vaccine.new_vaccinations,
SUM(cast(vaccine.new_vaccinations as int)) over (partition by death.location order by death.location, death.date) as RollingPeopleVaccinated
from CSV_datas..CovidDeaths as death
join CSV_datas..CovidVaccinations as vaccine
on death.location = vaccine. location
and death.date = vaccine.date