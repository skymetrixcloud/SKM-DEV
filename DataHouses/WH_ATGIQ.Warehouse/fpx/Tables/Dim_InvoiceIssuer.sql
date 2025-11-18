CREATE TABLE [fpx].[Dim_InvoiceIssuer] (

	[INV_ISSUER_ID] decimal(10,0) NULL, 
	[InvoiceIssuerCode] varchar(8000) NULL, 
	[InvoiceIssuerName] varchar(8000) NULL, 
	[CLIENT_ID] decimal(10,0) NULL, 
	[ClientCode] varchar(8000) NULL, 
	[ClientName] varchar(8000) NULL, 
	[CO_ID] decimal(10,0) NULL, 
	[CounterpartyCode] varchar(8000) NULL, 
	[CounterpartyName] varchar(8000) NULL
);