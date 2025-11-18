CREATE         PROCEDURE [fpx].[usp_Load_Fact_SupplierVolumes]
AS
BEGIN
 

    IF OBJECT_ID('[fpx].[Fact_SupplierVolumes]', 'U') IS NULL
    BEGIN
        SELECT
          [ContractID],
			[ContractCode],
			[LOC_ID],
			[LOC_CD],
			[ContractType],
			[HLDR_CO_ID],
			[OrderedVolume],
			[ActualVolume],
			[PeriodIndicator],
			[CO_GRP_CD],
			[CUST_CO_ID],
			[CUST_CO_CD],
			[Month],
			[InitialVolume],
			[AdjustedVolume],
			[HLDR_CO_CD],
			[CNTPRTY_CO_ID],
			[CP_CO_CD],
			[ContractValidFrom],
			[ContractValidTo],
			[CO_GRP_ID]
        INTO [fpx_raw].[Fact_SupplierVolumes]
        FROM [LH_ATGIQ].[fpx_raw].[V_ANLF_SupplierVolumes];
    END
    ELSE
    BEGIN
        TRUNCATE TABLE [fpx].[Fact_SupplierVolumes];

        INSERT INTO [fpx].[Fact_SupplierVolumes] (
          [ContractID],
			[ContractCode],
			[LOC_ID],
			[LOC_CD],
			[ContractType],
			[HLDR_CO_ID],
			[OrderedVolume],
			[ActualVolume],
			[PeriodIndicator],
			[CO_GRP_CD],
			[CUST_CO_ID],
			[CUST_CO_CD],
			[Month],
			[InitialVolume],
			[AdjustedVolume],
			[HLDR_CO_CD],
			[CNTPRTY_CO_ID],
			[CP_CO_CD],
			[ContractValidFrom],
			[ContractValidTo],
			[CO_GRP_ID]
        )
        SELECT
            [ContractID],
			[ContractCode],
			[LOC_ID],
			[LOC_CD],
			[ContractType],
			[HLDR_CO_ID],
			[OrderedVolume],
			[ActualVolume],
			[PeriodIndicator],
			[CO_GRP_CD],
			[CUST_CO_ID],
			[CUST_CO_CD],
			[Month],
			[InitialVolume],
			[AdjustedVolume],
			[HLDR_CO_CD],
			[CNTPRTY_CO_ID],
			[CP_CO_CD],
			[ContractValidFrom],
			[ContractValidTo],
			[CO_GRP_ID]
        FROM [LH_ATGIQ].[fpx_raw].[V_ANLF_SupplierVolumes];
    END
END