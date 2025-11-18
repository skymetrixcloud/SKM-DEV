CREATE TABLE [fpx].[Report_EnergyTimeseries] (

	[TimeseriesId] float NULL, 
	[TimeseriesName] varchar(8000) NULL, 
	[Commodity] varchar(8000) NULL, 
	[FinancialSource] varchar(8000) NULL, 
	[OriginalCurrency] varchar(8000) NULL, 
	[OriginalUnit] varchar(8000) NULL, 
	[Sys_ItemDate] datetime2(6) NULL, 
	[Sys_ItemValue] float NULL, 
	[Sys_IsSubstituted] varchar(8000) NULL, 
	[MonthYearItemDate] varchar(21) NULL
);