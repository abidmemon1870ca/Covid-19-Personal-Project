Hi, this is my personal project for data analysis on covid-19. Some steps of this project might feel extended but they are as it is since I am using the free version of softwares available and they come with their own restrictions.

The softwares used for this analysis are:
1) Microsoft SQL Server Management Studio (SSMS)
2) Microsoft Excel
3) Tableau Public (Desktop)

First we get the data needed for this analysis. The data is publicly available covid-19 data.
The source of the data is: https://ourworldindata.org/covid-deaths

The steps used in this data analysis are as follows:

1) After downloading the data we save the data file again as a .csv file.
2) Lets create a database in SSMS.
3) This file is then uploaded as tables on SSMS as a flat file while choosing the correct data type.
4) For the SQL Analysis and Code in this step, refer to the .sql file uploaded in the repository.
5) After using the SQL snippets we copy the data with headers and paste it into a microsoft excel sheet.
6) The .xlsx sheet is used for more calulations and creating pivot tables. The data is starting to make sense at this point.
7) This data is then copied and pasted into a seperate file on the same sheet for use in Tableau.
8) Lets upload these files in Tableau and create visualizations. You can refer to the .twb file uploaded in this repository.
9) You can also view these dashboards on my Tableau Public Profile: https://public.tableau.com/app/profile/mohamed.abid.memon/vizzes

The visualizations cover a global, continent-based and country-based dashboards for the impact of covid-19 based on the data reported by countries. Some data points are missing since those were not made publicly available by the respective countries.
