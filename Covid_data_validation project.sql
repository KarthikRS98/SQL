--total cases vs total deaths
select location,date,total_cases,total_deaths
from Covid_project..Covid_deaths$ order by 1,2;

--death%

select location,date,convert(int,total_cases),convert(int,total_deaths),(convert(int,total_deaths))/(convert(int,total_cases))*100 
as "death%" from Covid_project..Covid_deaths$ order by 1,2;

--total cases vs population(% of people got infected)

select location,date,convert(int,total_cases),population,convert(int,total_cases)/population*100 
as"% of people infected" from Covid_project..Covid_deaths$ order by 1,2;

--country wise highest infection rate compared to population

select location,population,max(total_cases) as "highest cases",((max(total_cases))/population)*100 as "%population infection" 
from Covid_project..Covid_deaths$ 
group by location,population order by [%population infection] desc;

--countries with death count

select location ,max(convert(int,total_deaths)) as "total death count" 
from Covid_project..Covid_deaths$
where continent is not null
group by location order by "total death count" desc;

--continents with death count

select continent,max(convert(int,total_deaths)) as "total deaths" 
from Covid_project..Covid_deaths$
where continent is not null
group by continent order by "total deaths" desc;

--global numbers

select date,sum(convert(int,new_cases)) as "cases",sum(convert(int,new_deaths)) as "deaths" 
from Covid_project..Covid_deaths$ group by date;
select sum(convert(bigint,new_cases)) as total_cases ,
sum(convert(bigint,new_deaths)) as Total_deaths 
from Covid_project..Covid_deaths$
where continent is not null;

--total population vs vaccination

select de.continent,de.location,de.date,de.population,va.new_vaccinations 
from Covid_project..Covid_deaths$ de join Covid_project..Covid_vaccinations$ va
on de.location=va.location and de.date=va.date
where de.continent is not null
order by 1,2,3;

--rolling sum of new vaccination

select de.continent,de.location,de.date,de.population,va.new_vaccinations ,
sum(convert(bigint,va.new_vaccinations))
over (partition by de.location order by de.location,de.date) as "rolling vaccination avg"
from Covid_project..Covid_deaths$ de join Covid_project..Covid_vaccinations$ va
on de.location=va.location and de.date=va.date
where de.continent is not null
order by 1,2,3;

--using Common table expression(CTE)

with populationVSvaccination (continent,location,date,population,new_vaccinations,"rolling vaccination ")
as
(select de.continent,de.location,de.date,de.population,va.new_vaccinations ,
sum(convert(bigint,va.new_vaccinations)) 
over (partition by de.location order by de.location,de.date) as "rolling vaccination sum"
from Covid_project..Covid_deaths$ de join Covid_project..Covid_vaccinations$ va
on de.location=va.location and de.date=va.date
where de.continent is not null

)
select *,([rolling vaccination ]/population)*100 as "rolling vaccination %" from populationVSvaccination;

--creating view to store data for later vizualization

create view "%population_vaccinated" as
select de.continent,de.location,de.date,de.population,va.new_vaccinations ,
sum(convert(bigint,va.new_vaccinations)) 
over (partition by de.location order by de.location,de.date) as "rolling vaccination avg"
from Covid_project..Covid_deaths$ de join Covid_project..Covid_vaccinations$ va
on de.location=va.location and de.date=va.date
where de.continent is not null;

select de.continent,de.location,de.date,de.population,va.new_vaccinations ,
sum(convert(bigint,va.new_vaccinations)) 
over (partition by de.location order by de.location,de.date) as "rolling vaccination avg"
from Covid_project..Covid_deaths$ de join Covid_project..Covid_vaccinations$ va
on de.location=va.location and de.date=va.date
where de.continent is not null;

select continent,location,date,new_cases from Covid_project..Covid_deaths$;