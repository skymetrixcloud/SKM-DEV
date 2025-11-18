CREATE  PROCEDURE [fpx].[usp_EnergyQuotPricesUS]
AS
BEGIN
    SET NOCOUNT ON;

    IF OBJECT_ID('[fpx].[Report_EnergyQuotPricesUS]', 'U') IS NULL
    BEGIN
        SELECT TOP 100
              QuotationId
            , PeriodFrom
            , PeriodTo
            , QuotationValue
        INTO [fpx].[Report_EnergyQuotPricesUS]
        FROM [LH_ATGIQ].[fpx_raw].[V_ANLF_EnergyQuotPricesUS];
    END
    ELSE
    BEGIN
        TRUNCATE TABLE [fpx].[Report_EnergyQuotPricesUS];

        INSERT INTO [fpx].[Report_EnergyQuotPricesUS]
        SELECT TOP 100
              QuotationId
            , PeriodFrom
            , PeriodTo
            , QuotationValue
        FROM [LH_ATGIQ].[fpx_raw].[V_ANLF_EnergyQuotPricesUS];
    END
END;