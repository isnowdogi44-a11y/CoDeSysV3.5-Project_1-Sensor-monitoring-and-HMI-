FUNCTION_BLOCK StatusChange
VAR_INPUT
	eStatus: Mx210Assistant.ANALOG_SENSOR_ERRORS;
END_VAR
VAR_OUTPUT
	Q: BOOL;
END_VAR
VAR
	ePrevStatus:	Mx210Assistant.ANALOG_SENSOR_ERRORS;
END_VAR



//Область кода
IF eStatus <> ePrevStatus THEN
	Q := TRUE;
	ePrevStatus := eStatus;
ELSE
	Q := FALSE;
END_IF

