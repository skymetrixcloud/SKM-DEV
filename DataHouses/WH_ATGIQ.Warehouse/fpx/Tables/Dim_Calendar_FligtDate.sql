CREATE TABLE [fpx].[Dim_Calendar_FligtDate] (

	[Date] datetime2(6) NULL, 
	[CRT_DT] datetime2(6) NULL, 
	[DOW] float NULL, 
	[YR] float NULL, 
	[QT] float NULL, 
	[MTH] float NULL, 
	[SAME_Q2D] float NULL, 
	[ANY_M2D] float NULL, 
	[SAME_M2D] float NULL, 
	[Y2D] float NULL, 
	[Q2D] float NULL, 
	[M2D] float NULL, 
	[W2D] float NULL, 
	[ANY_Y2D] float NULL, 
	[ANY_Q2D] float NULL, 
	[MTHYR] varchar(7) NULL, 
	[WeekOfYear] int NULL
);