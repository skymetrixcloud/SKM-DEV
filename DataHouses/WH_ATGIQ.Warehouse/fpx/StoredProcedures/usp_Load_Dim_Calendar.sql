CREATE                 PROCEDURE [fpx].[usp_Load_Dim_Calendar]
AS
BEGIN
 

    IF OBJECT_ID('[fpx].[Dim_Calendar]', 'U') IS NULL
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
            CAST([YR] AS VARCHAR(4)) + RIGHT('0' + CAST([MTH] AS VARCHAR(2)), 2) AS MTHYR,
			DATEPART(WEEK, [Date]) AS WeekOfYear
        INTO [fpx].[Dim_Calendar]
        FROM [LH_ATGIQ].[fpx_raw].[V_ANLD_Calendar];
    END
    ELSE
    BEGIN
        TRUNCATE TABLE [fpx].[Dim_Calendar];

        INSERT INTO [fpx].[Dim_Calendar] (
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
			[MTHYR],
			[WeekOfYear]
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
            CAST([YR] AS VARCHAR(4)) + RIGHT('0' + CAST([MTH] AS VARCHAR(2)), 2) AS MTHYR,
			DATEPART(WEEK, [Date]) AS WeekOfYear
        FROM [LH_ATGIQ].[fpx_raw].[V_ANLD_Calendar];
    END


	
    IF OBJECT_ID('[fpx].[Dim_Calendar_FligtDate]', 'U') IS NULL
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
            CAST([YR] AS VARCHAR(4)) + RIGHT('0' + CAST([MTH] AS VARCHAR(2)), 2) AS MTHYR,
			DATEPART(WEEK, [Date]) AS WeekOfYear
        INTO [fpx].[Dim_Calendar_FligtDate]
        FROM [LH_ATGIQ].[fpx_raw].[V_ANLD_Calendar];
    END
    ELSE
    BEGIN
        TRUNCATE TABLE [fpx].[Dim_Calendar_FligtDate];

        INSERT INTO [fpx].[Dim_Calendar_FligtDate] (
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
			[MTHYR],
			[WeekOfYear]
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
            CAST([YR] AS VARCHAR(4)) + RIGHT('0' + CAST([MTH] AS VARCHAR(2)), 2) AS MTHYR,
			DATEPART(WEEK, [Date]) AS WeekOfYear
        FROM [LH_ATGIQ].[fpx_raw].[V_ANLD_Calendar];
    END

	
    IF OBJECT_ID('[fpx].[Dim_Calendar_DepartureDate]', 'U') IS NULL
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
            CAST([YR] AS VARCHAR(4)) + RIGHT('0' + CAST([MTH] AS VARCHAR(2)), 2) AS MTHYR,
			DATEPART(WEEK, [Date]) AS WeekOfYear
        INTO [fpx].[Dim_Calendar_DepartureDate]
        FROM [LH_ATGIQ].[fpx_raw].[V_ANLD_Calendar];
    END
    ELSE
    BEGIN
        TRUNCATE TABLE [fpx].[Dim_Calendar_DepartureDate];

        INSERT INTO [fpx].[Dim_Calendar_DepartureDate] (
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
			[MTHYR],
			[WeekOfYear]
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
            CAST([YR] AS VARCHAR(4)) + RIGHT('0' + CAST([MTH] AS VARCHAR(2)), 2) AS MTHYR,
			DATEPART(WEEK, [Date]) AS WeekOfYear
        FROM [LH_ATGIQ].[fpx_raw].[V_ANLD_Calendar];
    END
END