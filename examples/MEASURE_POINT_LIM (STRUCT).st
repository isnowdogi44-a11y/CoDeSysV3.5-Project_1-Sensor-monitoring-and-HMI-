TYPE MEASURE_POINT_LIM :
STRUCT
	//Нижняя предел температур
	rLowAlarmValur: REAL := 10.0;
	//Верхний прдел температур
	rHightAlarmValue: REAL := 30.0;
	//Экземпляр счётчика ошибок
	fbAlarmCounter: CTU;
END_STRUCT
END_TYPE
