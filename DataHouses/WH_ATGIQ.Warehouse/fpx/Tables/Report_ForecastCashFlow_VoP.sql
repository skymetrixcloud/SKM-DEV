CREATE TABLE [fpx].[Report_ForecastCashFlow_VoP] (

	[Month] datetime2(6) NULL, 
	[SupplyChain] varchar(8000) NULL, 
	[SourceStorage] varchar(8000) NULL, 
	[FuelOwner] varchar(8000) NULL, 
	[Supplier] varchar(8000) NULL, 
	[PRContract] varchar(8000) NULL, 
	[TRContract] varchar(8000) NULL, 
	[Location] varchar(8000) NULL, 
	[Quantity] float NULL, 
	[Price] float NULL, 
	[Amount] float NULL, 
	[InvoiceFreq] varchar(8000) NULL, 
	[PaymentTerms] float NULL, 
	[EstimatedPaymentDate] datetime2(6) NULL
);