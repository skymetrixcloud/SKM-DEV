CREATE  PROCEDURE [fpx].[usp_EnergyQuotPricesEU]
AS
BEGIN
    SET NOCOUNT ON;

    IF OBJECT_ID('[fpx].[Report_EnergyQuotPricesEU]', 'U') IS NULL
    BEGIN
        SELECT TOP 100
              QuotationId
            , PeriodFrom
            , PeriodTo
            , QuotationValue
        INTO [fpx].[Report_EnergyQuotPricesEU]
        FROM [LH_ATGIQ].[fpx_raw].[V_ANLF_EnergyQuotPricesEU];
    END
    ELSE
    BEGIN
        TRUNCATE TABLE [fpx].[Report_EnergyQuotPricesEU];

        INSERT INTO [fpx].[Report_EnergyQuotPricesEU]
        SELECT TOP 100
              QuotationId
            , PeriodFrom
            , PeriodTo
            , QuotationValue
        FROM [LH_ATGIQ].[fpx_raw].[V_ANLF_EnergyQuotPricesEU];
    END
END;