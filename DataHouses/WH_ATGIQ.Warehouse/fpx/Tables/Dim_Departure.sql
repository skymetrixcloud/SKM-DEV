CREATE TABLE [fpx].[Dim_Departure] (

	[LOC_ID] decimal(10,0) NULL, 
	[LocationCode] varchar(8000) NULL, 
	[LocationName] varchar(8000) NULL, 
	[LocationIATACode] varchar(8000) NULL, 
	[LocationICAOCode] varchar(8000) NULL, 
	[IsAirport] varchar(8000) NULL, 
	[IsMonopolistic] varchar(8000) NULL, 
	[CNTRY_ID] decimal(10,0) NULL, 
	[CountryName] varchar(8000) NULL, 
	[CountryISOCode] varchar(8000) NULL, 
	[Continent] varchar(8000) NULL, 
	[StateCode] varchar(8000) NULL, 
	[StateName] varchar(8000) NULL
);