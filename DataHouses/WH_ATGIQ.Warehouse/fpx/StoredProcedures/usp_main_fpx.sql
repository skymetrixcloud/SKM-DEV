CREATE                                       PROC [fpx].[usp_main_fpx]
AS
BEGIN
exec [WH_ATGIQ].[fpx].[usp_payment_vs_due];
exec [WH_ATGIQ].[fpx].[usp_emissions];
exec [WH_ATGIQ].[fpx].[usp_billbackunbilled];
exec [WH_ATGIQ].[fpx].[usp_billback]
EXEC [WH_ATGIQ].[fpx].[usp_EnergyQuotation]
--exec [WH_ATGIQ].[fpx].[usp_EnergyQuotPricesEU]
--exec [WH_ATGIQ].[fpx].[usp_EnergyQuotPricesUS]
exec [WH_ATGIQ].[fpx].[usp_AFA_join]
exec [WH_ATGIQ].[fpx].[usp_load_forecast_reports]
exec [WH_ATGIQ].[fpx].[usp_EnergyTimeseries]
exec [WH_ATGIQ].[fpx].[usp_Uplift_Consumption_Tankering]
exec [WH_ATGIQ].[fpx].[usp_actual_uplift]
exec [WH_ATGIQ].[fpx].[usp_actual_flights]
exec [WH_ATGIQ].[fpx].[usp_supplier_volumes]
END