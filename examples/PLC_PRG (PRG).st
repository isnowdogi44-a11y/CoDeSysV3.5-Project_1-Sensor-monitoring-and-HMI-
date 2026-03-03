PROGRAM PLC_PRG
VAR
	astMeasurePoints: ARRAY [1..c_iMeasureCount] OF MEASURE_POINT;
	i: INT;
	xInit: BOOL := FALSE;
	iCurrentFrameIndex: INT := 1;
	xEnableArchive: BOOL := TRUE;
END_VAR
VAR RETAIN
	astMeasurePointsLimit: ARRAY [1..c_iMeasureCount] OF MEASURE_POINT_LIM;
END_VAR
VAR CONSTANT
	c_iMeasureCount: INT := 8;
	c_iAlarmDelay: TIME := T#5S;
END_VAR



//Область кода

//Инициализация наименования точек измерения температуры
IF NOT(xInit) THEN
   astMeasurePoints[1].wsPointName := "Точка измерения 1";
   astMeasurePoints[2].wsPointName := "Точка измерения 2";
   astMeasurePoints[3].wsPointName := "Точка измерения 3";
   astMeasurePoints[4].wsPointName := "Точка измерения 4";
   astMeasurePoints[5].wsPointName := "Точка измерения 5";
   astMeasurePoints[6].wsPointName := "Точка измерения 6"; 
   astMeasurePoints[7].wsPointName := "Точка измерения 7";
   astMeasurePoints[8].wsPointName := "Точка измерения 8";
   xInit := TRUE;
END_IF

//Цикл обработки значений массива температур
FOR i := 1 TO c_iMeasureCount DO
	astMeasurePoints[i].xOutOfLimits := IsValueOutOfLimit(astMeasurePoints[i].rValue, astMeasurePointsLimit[i].rLowAlarmValur, astMeasurePointsLimit[i].rHightAlarmValue);
	astMeasurePoints[i].fbAlarmDelay
	(
		IN := astMeasurePoints[i].xOutOfLimits OR astMeasurePoints[i].eStatus <> Mx210Assistant.ANALOG_SENSOR_ERRORS.NO_ERROR,
		PT := c_iAlarmDelay,
		Q => astMeasurePoints[i].xAlarm
	);
	
	 astMeasurePointsLimit[i].fbAlarmCounter(CU := astMeasurePoints[i].xAlarm);
	 
	 astMeasurePoints[i].fdStatusChange(eStatus := astMeasurePoints[i].eStatus);
	 IF astMeasurePoints[i].fdStatusChange.Q THEN
		 astMeasurePoints[i].wsString := Mx210Assistant.ANALOG_SENSOR_ERROR_TO_WSTRING(astMeasurePoints[i].eStatus);
	 END_IF
	 
END_FOR