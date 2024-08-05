--Lets check both the tables and their outputs

select * from personal_project..covid_death

select * from personal_project..covid_vaccine

--Lets look at the data that we will be using

select location, date, total_cases, new_cases, total_deaths, population
from personal_project..covid_death
order by 1,2

--Lets understand the data and the cleaning validations we need to use to get a desired output
--1) To have a calculation we need to use cast since all the numbers used in calculations are identified as integer
--2) There is some continent based data mixed under location and some categories also which are not exactly locations. We will use a where clause to filter them out.

--We will be using three major code snippets to get the output table we desire.

--This first snippet is a continent based data for negative impact of covid.

with continentstats (continent, population, all_cases, all_deaths, max_reproduction_rate, all_icu_patients, all_hosp_patients)
as
(
select continent, population, isnull(sum(new_cases),0) as all_cases, isnull(sum(new_deaths),0) as all_deaths, isnull(max(reproduction_rate),0) as max_reproduction_rate, isnull(sum(icu_patients),0) as all_icu_patients, isnull(sum(hosp_patients),0) as all_hosp_patients
from personal_project..covid_death
where continent is not null AND location not like '%income%' and location not like '%union%' and location not like '%world%'
group by continent, population
)
select *, (all_deaths/cast(population as float)) as death_rate, (all_cases/cast(population as float)) as infection_rate
from continentstats
order by all_deaths desc

--Lets look at the same data in a country based perspective.

with countrystats (location, continent, population, all_cases, all_deaths, max_reproduction_rate, all_icu_patients, all_hosp_patients)
as
(
select location, continent, population, isnull(sum(new_cases),0) as all_cases, isnull(sum(new_deaths),0) as all_deaths, isnull(max(reproduction_rate),0) as max_reproduction_rate, isnull(sum(icu_patients),0) as all_icu_patients, isnull(sum(hosp_patients),0) as all_hosp_patients
from personal_project..covid_death
where continent is not null AND location not like '%income%' and location not like '%union%' and location not like '%world%'
group by continent, location, population
)
select *, (all_deaths/cast(population as float)) as death_rate, (all_cases/cast(population as float)) as infection_rate
from countrystats
order by all_deaths desc

--Lets look at the second table and check the success metrics for treating covid

drop table if exists #covid_recovery
create table #covid_recovery
(continent varchar(255), location varchar(255), population numeric, all_tests numeric, all_vaccinations numeric, fully_vaccinated numeric)

insert into #covid_recovery
select continent, location, population, isnull(sum(new_tests),0) as all_tests, isnull(sum(new_vaccinations),0) as all_vaccinations, isnull(max(people_fully_vaccinated),0) as fully_vaccinated
from personal_project..covid_vaccine
where continent is not null AND location not like '%income%' and location not like '%union%' and location not like '%world%'
group by continent, location, population

select * from #covid_recovery 