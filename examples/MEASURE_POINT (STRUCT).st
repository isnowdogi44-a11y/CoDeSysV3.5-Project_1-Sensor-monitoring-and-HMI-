//Структура опреативных параметров одной точки измерения температуры
TYPE MEASURE_POINT :
STRUCT
	//Название точки измерения
	wsPointName: WSTRING(20);
	//Текущее значение температуры
	rValue: REAL;
	//Код ошибки аналогового входа
	eStatus: Mx210Assistant.ANALOG_SENSOR_ERRORS;
	//Текстовое описание ошибки
	wsString: WSTRING;
	//Признак выхода значения за допустимые границы
	xOutOfLimits: BOOL;
	//Сигнал ошибки 
	xAlarm: BOOL;
	//Экземпляр таймера, используемый для задержки генерации ошибки
	//Позволяет отфильтровать кртковременный выход значения за допустимую границу
	fbAlarmDelay: TON;
	//Экземпляр блока детектирования изменения кода ошибки
	fdStatusChange: StatusChange;
END_STRUCT
END_TYPE
