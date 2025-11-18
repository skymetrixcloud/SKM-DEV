CREATE     PROC [fpx].[usp_main_fpx]
AS
BEGIN
    SET NOCOUNT ON;
--excluding AFA_Join as it takes a long time to finish; to be revisited with better query str
    BEGIN TRY
        EXEC [WH_ATGIQ].[fpx].[usp_payment_vs_due];
        EXEC [WH_ATGIQ].[fpx].[usp_emissions];
        EXEC [WH_ATGIQ].[fpx].[usp_billbackunbilled];
        EXEC [WH_ATGIQ].[fpx].[usp_billback];
        EXEC [WH_ATGIQ].[fpx].[usp_EnergyQuotation];
--exec [WH_ATGIQ].[fpx].[usp_EnergyQuotPricesEU];
--exec [WH_ATGIQ].[fpx].[usp_EnergyQuotPricesUS];        
      --  EXEC [WH_ATGIQ].[fpx].[usp_AFA_join];
        EXEC [WH_ATGIQ].[fpx].[usp_load_forecast_reports];
        EXEC [WH_ATGIQ].[fpx].[usp_EnergyTimeseries];
        EXEC [WH_ATGIQ].[fpx].[usp_Uplift_Consumption_Tankering];
        EXEC [WH_ATGIQ].[fpx].[usp_actual_uplift];
        EXEC [WH_ATGIQ].[fpx].[usp_actual_flights];
        EXEC [WH_ATGIQ].[fpx].[usp_supplier_volumes];
        EXEC [WH_ATGIQ].[fpx].[usp_Abs_Invoice_Discrepancy_Abs];
        EXEC [WH_ATGIQ].[fpx].[usp_Pos_Invoice_Discrepancy];
    END TRY
    BEGIN CATCH
        DECLARE @Err NVARCHAR(4000) = ERROR_MESSAGE();
        DECLARE @Proc NVARCHAR(128) = ERROR_PROCEDURE();

        PRINT 'Error occurred in procedure: ' + ISNULL(@Proc, 'Unknown');
        PRINT 'Error message: ' + @Err;

        THROW; -- rethrow to see full error
    END CATCH
END