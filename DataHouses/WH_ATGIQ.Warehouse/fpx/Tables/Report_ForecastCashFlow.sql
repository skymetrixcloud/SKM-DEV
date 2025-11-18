CREATE TABLE [fpx].[Report_ForecastCashFlow] (

	[FlightDate] datetime2(6) NULL, 
	[Departure] varchar(8000) NULL, 
	[Destination] varchar(8000) NULL, 
	[AirlineDesignator] varchar(8000) NULL, 
	[FlightNumber] varchar(8000) NULL, 
	[Suffix] varchar(8000) NULL, 
	[AircraftType] varchar(8000) NULL, 
	[Leg] varchar(8000) NULL, 
	[LegAircraftType] varchar(8000) NULL, 
	[Frequency] float NULL, 
	[StatisticalUplift] float NULL, 
	[PriceUplift] float NULL, 
	[CostUplift] float NULL, 
	[ContractCode] varchar(8000) NULL, 
	[InvoiceFrequency] varchar(8000) NULL, 
	[PaymentTerms] float NULL, 
	[EstimatedPaymentDate] datetime2(6) NULL, 
	[CustomerICAOCode] varchar(8000) NULL, 
	[DomInt] varchar(8000) NULL
);