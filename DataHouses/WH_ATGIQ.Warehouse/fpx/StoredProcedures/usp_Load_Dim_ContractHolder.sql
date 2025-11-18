CREATE           PROCEDURE [fpx].[usp_Load_Dim_ContractHolder]
AS
BEGIN
 

    IF OBJECT_ID('[fpx].[Dim_ContractHolder]', 'U') IS NULL
    BEGIN
        SELECT
          [ClientCode],
			[ClientName],
			[ContractHolderCode],
			[ContractHolderName],
			[CO_GRP_ID],
			[GroupCode],
			[GroupName],
			[CLIENT_ID],
			[CO_ID]
        INTO [fpx].[Dim_ContractHolder]
        FROM [LH_ATGIQ].[fpx_raw].[V_ANLD_ContractHolder];
    END
    ELSE
    BEGIN
        TRUNCATE TABLE [fpx].[Dim_ContractHolder];

        INSERT INTO [fpx].[Dim_ContractHolder] (
     		[ClientCode],
			[ClientName],
			[ContractHolderCode],
			[ContractHolderName],
			[CO_GRP_ID],
			[GroupCode],
			[GroupName],
			[CLIENT_ID],
			[CO_ID]
        )
        SELECT
            [ClientCode],
			[ClientName],
			[ContractHolderCode],
			[ContractHolderName],
			[CO_GRP_ID],
			[GroupCode],
			[GroupName],
			[CLIENT_ID],
			[CO_ID]
        FROM [LH_ATGIQ].[fpx_raw].[V_ANLD_ContractHolder];
    END
END