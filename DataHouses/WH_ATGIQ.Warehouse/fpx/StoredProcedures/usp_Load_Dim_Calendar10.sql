CREATE  PROCEDURE [fpx].[usp_Load_Dim_Calendar10]
AS
BEGIN
 

    IF OBJECT_ID('[fpx].[Dim_Calendar10]', 'U') IS NULL
    BEGIN
        SELECT
           [Date],
			[CRT_DT],
			[DOW],
			[YR],
			[QT],
			[MTH],
			[SAME_Q2D],
			[ANY_M2D],
			[SAME_M2D],
			[Y2D],
			[Q2D],
			[M2D],
			[W2D],
			[ANY_Y2D],
			[ANY_Q2D],
            CONCAT([MTH], '-', [YR]) AS MTH_YR,
            CAST([YR] AS VARCHAR(4)) + RIGHT('0' + CAST([MTH] AS VARCHAR(2)), 2) AS MTHYR
			
        INTO [fpx].[Dim_Calendar10]
        FROM [LH_ATGIQ].[fpx_raw].[V_ANLD_Calendar10];
    END
    ELSE
    BEGIN
        TRUNCATE TABLE [fpx].[Dim_Calendar10];

        INSERT INTO [fpx].[Dim_Calendar10] (
           [Date],
			[CRT_DT],
			[DOW],
			[YR],
			[QT],
			[MTH],
			[SAME_Q2D],
			[ANY_M2D],
			[SAME_M2D],
			[Y2D],
			[Q2D],
			[M2D],
			[W2D],
			[ANY_Y2D],
			[ANY_Q2D],
			[MTH_YR],
			[MTHYR]
        )
        SELECT
            [Date],
			[CRT_DT],
			[DOW],
			[YR],
			[QT],
			[MTH],
			[SAME_Q2D],
			[ANY_M2D],
			[SAME_M2D],
			[Y2D],
			[Q2D],
			[M2D],
			[W2D],
			[ANY_Y2D],
			[ANY_Q2D],
            CONCAT([MTH], '-', [YR]) AS MTH_YR,
            CAST([YR] AS VARCHAR(4)) + RIGHT('0' + CAST([MTH] AS VARCHAR(2)), 2) AS MTHYR
        FROM [LH_ATGIQ].[fpx_raw].[V_ANLD_Calendar10];
    END
	
    IF OBJECT_ID('[fpx].[Dim_Calendar10_DeliveryFrom]', 'U') IS NULL
    BEGIN
        SELECT
           [Date],
			[CRT_DT],
			[DOW],
			[YR],
			[QT],
			[MTH],
			[SAME_Q2D],
			[ANY_M2D],
			[SAME_M2D],
			[Y2D],
			[Q2D],
			[M2D],
			[W2D],
			[ANY_Y2D],
			[ANY_Q2D],
            CONCAT([MTH], '-', [YR]) AS MTH_YR,
            CAST([YR] AS VARCHAR(4)) + RIGHT('0' + CAST([MTH] AS VARCHAR(2)), 2) AS MTHYR
			
        INTO [fpx].[Dim_Calendar10_DeliveryFrom]
        FROM [LH_ATGIQ].[fpx_raw].[V_ANLD_Calendar10];
    END
    ELSE
    BEGIN
        TRUNCATE TABLE [fpx].[Dim_Calendar10_DeliveryFrom];

        INSERT INTO [fpx].[Dim_Calendar10_DeliveryFrom] (
           [Date],
			[CRT_DT],
			[DOW],
			[YR],
			[QT],
			[MTH],
			[SAME_Q2D],
			[ANY_M2D],
			[SAME_M2D],
			[Y2D],
			[Q2D],
			[M2D],
			[W2D],
			[ANY_Y2D],
			[ANY_Q2D],
			[MTH_YR],
			[MTHYR]
        )
        SELECT
            [Date],
			[CRT_DT],
			[DOW],
			[YR],
			[QT],
			[MTH],
			[SAME_Q2D],
			[ANY_M2D],
			[SAME_M2D],
			[Y2D],
			[Q2D],
			[M2D],
			[W2D],
			[ANY_Y2D],
			[ANY_Q2D],
            CONCAT([MTH], '-', [YR]) AS MTH_YR,
            CAST([YR] AS VARCHAR(4)) + RIGHT('0' + CAST([MTH] AS VARCHAR(2)), 2) AS MTHYR
        FROM [LH_ATGIQ].[fpx_raw].[V_ANLD_Calendar10];
    END

	
    IF OBJECT_ID('[fpx].[Dim_Calendar10_DeliveryTo]', 'U') IS NULL
    BEGIN
        SELECT
           [Date],
			[CRT_DT],
			[DOW],
			[YR],
			[QT],
			[MTH],
			[SAME_Q2D],
			[ANY_M2D],
			[SAME_M2D],
			[Y2D],
			[Q2D],
			[M2D],
			[W2D],
			[ANY_Y2D],
			[ANY_Q2D],
            CONCAT([MTH], '-', [YR]) AS MTH_YR,
            CAST([YR] AS VARCHAR(4)) + RIGHT('0' + CAST([MTH] AS VARCHAR(2)), 2) AS MTHYR
			
        INTO [fpx].[Dim_Calendar10_DeliveryTo]
        FROM [LH_ATGIQ].[fpx_raw].[V_ANLD_Calendar10];
    END
    ELSE
    BEGIN
        TRUNCATE TABLE [fpx].[Dim_Calendar10_DeliveryTo];

        INSERT INTO [fpx].[Dim_Calendar10_DeliveryTo] (
           [Date],
			[CRT_DT],
			[DOW],
			[YR],
			[QT],
			[MTH],
			[SAME_Q2D],
			[ANY_M2D],
			[SAME_M2D],
			[Y2D],
			[Q2D],
			[M2D],
			[W2D],
			[ANY_Y2D],
			[ANY_Q2D],
			[MTH_YR],
			[MTHYR]
        )
        SELECT
            [Date],
			[CRT_DT],
			[DOW],
			[YR],
			[QT],
			[MTH],
			[SAME_Q2D],
			[ANY_M2D],
			[SAME_M2D],
			[Y2D],
			[Q2D],
			[M2D],
			[W2D],
			[ANY_Y2D],
			[ANY_Q2D],
            CONCAT([MTH], '-', [YR]) AS MTH_YR,
            CAST([YR] AS VARCHAR(4)) + RIGHT('0' + CAST([MTH] AS VARCHAR(2)), 2) AS MTHYR
        FROM [LH_ATGIQ].[fpx_raw].[V_ANLD_Calendar10];
    END
END