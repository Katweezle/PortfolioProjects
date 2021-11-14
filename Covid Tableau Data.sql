/*

Queriers used for Tableau Data Visualisation

*/


-- 1.
-- View of total cases, total deaths and the percentage of cases resulting in death Globally

Select SUM(new_cases) as Total_Cases, SUM(cast(new_deaths as int)) as Total_Deaths, SUM(cast(new_deaths as int))/SUM(new_cases)*100 as Death_Percentage
From PortfolioProject.dbo.CovidDeaths
where continent is not null
Order By 1,2


-- 2.
-- Total Deaths per continent

Select location, SUM(cast(new_deaths as int)) as TotalDeathCount
From PortfolioProject..CovidDeaths
Where continent is null 
and location not in ('World', 'European Union', 'International')
Group by location
order by TotalDeathCount desc


-- 3.
-- Countries and their infection rates per population

Select Location, Population, MAX(total_cases) as HighestInfectionCount, Max(total_cases/population)*100 as PercentPopulationInfected
FROM PortfolioProject.dbo.CovidDeaths
Group By location, population
Order by PercentPopulationInfected DESC


-- 4.
-- 

Select location, population, date, MAX(total_cases) as HighestInfectionCount,  Max(total_cases/population)*100 as PercentPopulationInfected
FROM PortfolioProject.dbo.CovidDeaths
Group By location, population, date
Order by PercentPopulationInfected