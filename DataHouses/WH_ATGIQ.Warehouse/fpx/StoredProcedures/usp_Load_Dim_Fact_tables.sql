CREATE             PROCEDURE [fpx].[usp_Load_Dim_Fact_tables]
AS
BEGIN
 /*****Load Dim tables*******/
EXECUTE [WH_ATGIQ].[fpx].[usp_Load_Dim_Airline]
EXECUTE [WH_ATGIQ].[fpx].[usp_Load_Dim_Calendar]
EXECUTE [WH_ATGIQ].[fpx].[usp_Load_Dim_Customer]
EXECUTE [WH_ATGIQ].[fpx].[usp_Load_Dim_CustomerAccess]
EXECUTE [WH_ATGIQ].[fpx].[usp_Load_Dim_Geography]
EXECUTE [WH_ATGIQ].[fpx].[usp_Load_Dim_Supplier]
EXECUTE [WH_ATGIQ].[fpx].[usp_Load_Dim_ContractHolder]
/*****Load Fact tables*******/

EXECUTE [WH_ATGIQ].[fpx].[usp_Load_Fact_ActualFlights]
EXECUTE [WH_ATGIQ].[fpx].[usp_Load_Fact_FuelMessage]
EXECUTE [WH_ATGIQ].[fpx].[usp_Load_Fact_SupplierVolumes]
EXECUTE [WH_ATGIQ].[fpx].[usp_Load_Fact_ForecastFlights]
END