CREATE TABLE [fpx].[Report_EnergyQuotation] (

	[QuotationId] float NULL, 
	[QuotationName] varchar(8000) NULL, 
	[TimeseriesName] varchar(8000) NULL, 
	[AverageMethod] varchar(8000) NULL, 
	[Commodity] varchar(8000) NULL, 
	[FinancialSource] varchar(8000) NULL, 
	[OriginalCurrency] varchar(8000) NULL, 
	[OriginalUnit] varchar(8000) NULL, 
	[PeriodFrom] datetime2(6) NULL, 
	[PeriodTo] datetime2(6) NULL, 
	[QuotationValue] float NULL, 
	[MonthYearFrom] varchar(21) NULL, 
	[MonthYearTo] varchar(21) NULL, 
	[WeekYearFrom] varchar(7) NULL
);