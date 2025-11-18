CREATE TABLE [fpx].[Fact_SupplierVolumes] (

	[ContractID] decimal(10,0) NULL, 
	[ContractCode] varchar(8000) NULL, 
	[LOC_ID] decimal(10,0) NULL, 
	[LOC_CD] varchar(8000) NULL, 
	[ContractType] varchar(8000) NULL, 
	[HLDR_CO_ID] decimal(10,0) NULL, 
	[OrderedVolume] float NULL, 
	[ActualVolume] float NULL, 
	[PeriodIndicator] float NULL, 
	[CO_GRP_CD] varchar(8000) NULL, 
	[CUST_CO_ID] decimal(10,0) NULL, 
	[CUST_CO_CD] varchar(8000) NULL, 
	[Month] datetime2(6) NULL, 
	[InitialVolume] float NULL, 
	[AdjustedVolume] float NULL, 
	[HLDR_CO_CD] varchar(8000) NULL, 
	[CNTPRTY_CO_ID] decimal(10,0) NULL, 
	[CP_CO_CD] varchar(8000) NULL, 
	[ContractValidFrom] datetime2(6) NULL, 
	[ContractValidTo] datetime2(6) NULL, 
	[CO_GRP_ID] decimal(10,0) NULL
);