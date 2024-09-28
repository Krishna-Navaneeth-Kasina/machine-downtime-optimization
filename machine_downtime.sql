CREATE DATABASE machine_data;  -- creating a data base
USE machine_data;    -- using that data base

-- dataset was imported into sql workbench and created a table for data 

SELECT * FROM machine_downtime;     --  fetches all rows and columns of data stored 



-- EXPLORATORY DATA ANALYSIS

-- find MEAN 
SELECT																		
    AVG(`Hydraulic_Pressure(bar)`) AS Mean_Hydraulic_Pressure,
    AVG(`Coolant_Pressure`) AS Mean_Coolant_Pressure,
    AVG(`Air_System_Pressure(bar)`) AS Mean_Air_System_Pressure,
    AVG(`Coolant_Temperature`) AS Mean_Coolant_Temperature,
    AVG(`Hydraulic_Oil_Temperature(Â°C)`) AS Mean_Hydraulic_Oil_Temperature,
    AVG(`Spindle_Bearing_Temperature(Â°C)`) AS Mean_Spindle_Bearing_Temperature,
    AVG(`Spindle_Vibration(Âµm)`) AS Mean_Spindle_Vibration,
    AVG(`Tool_Vibration(Âµm)`) AS Mean_Tool_Vibration,
    AVG(`Spindle_Speed(RPM)`) AS Mean_Spindle_Speed,
    AVG(`Voltage(volts)`) AS Mean_Voltage,
    AVG(`Torque(Nm)`) AS Mean_Torque,
    AVG(`Cutting`) AS Mean_Cutting
FROM  machine_downtime;



-- find MEDIAN
 WITH CTE AS (SELECT
        `Hydraulic_Pressure(bar)`,
        `Coolant_Pressure`,
        `Air_System_Pressure(bar)`,
       `Coolant_Temperature`,
        `Hydraulic_Oil_Temperature(Â°C)`,
        `Spindle_Bearing_Temperature(Â°C)`,
        `Spindle_Vibration(Âµm)`,
        `Tool_Vibration(Âµm)`,
        `Spindle_Speed(RPM)`,
        `Voltage(volts)`,
        `Torque(Nm)`,
       `Cutting`,
        ROW_NUMBER() OVER (ORDER BY `Hydraulic_Pressure(bar)`) AS RowNum,
        COUNT(*) OVER () AS TotalCount
    FROM machine_downtime
    )
SELECT
    AVG(`Hydraulic_Pressure(bar)`) AS Median_Hydraulic_Pressure,
    AVG(`Coolant_Pressure`) AS Median_Coolant_Pressure,
    AVG(`Air_System_Pressure(bar)`) AS Median_Air_System_Pressure,
    AVG(`Coolant_Temperature`) AS Median_Coolant_Temperature,
    AVG(`Hydraulic_Oil_Temperature(Â°C)`) AS Median_Hydraulic_Oil_Temperature,
    AVG(`Spindle_Bearing_Temperature(Â°C)`) AS Median_Spindle_Bearing_Temperature,
    AVG(`Spindle_Vibration(Âµm)`) AS Median_Spindle_Vibration,
    AVG(`Tool_Vibration(Âµm)`) AS Median_Tool_Vibration,
    AVG(`Spindle_Speed(RPM)`) AS Median_Spindle_Speed,
    AVG(`Voltage(volts)`) AS Median_Voltage,
    AVG(`Torque(Nm)`) AS Median_Torque,
    AVG(`Cutting`) AS Median_Cutting
FROM CTE
WHERE RowNum IN ((TotalCount + 1) / 2, (TotalCount + 2) / 2);


-- find MODE
SELECT 
    (SELECT `Hydraulic_Pressure(bar)`
    FROM machine_downtime
    GROUP BY `Hydraulic_Pressure(bar)`
    ORDER BY COUNT(*) DESC
    LIMIT 1) AS mode_hydraulic_pressure,
    
    (SELECT `Coolant_Pressure`
    FROM machine_downtime
    GROUP BY `Coolant_Pressure`
    ORDER BY COUNT(*) DESC
    LIMIT 1) AS mode_Coolant_Pressure,
    
    (SELECT `Air_System_Pressure(bar)` 
    FROM machine_downtime
    GROUP BY `Air_System_Pressure(bar)`
    ORDER BY COUNT(*) DESC
    LIMIT 1) AS mode_Air_System_Pressure,
    
    (SELECT `Coolant_Temperature` 
    FROM machine_downtime
    GROUP BY `Coolant_Temperature`
    ORDER BY COUNT(*) DESC
    LIMIT 1) AS mode_Coolant_Temperature,
    
    (SELECT `Hydraulic_Oil_Temperature(Â°C)` 
    FROM machine_downtime
    GROUP BY `Hydraulic_Oil_Temperature(Â°C)`
    ORDER BY COUNT(*) DESC
    LIMIT 1) AS mode_Hydraulic_Oil_Temperature,
    
    (SELECT `Spindle_Bearing_Temperature(Â°C)` 
    FROM machine_downtime
    GROUP BY `Spindle_Bearing_Temperature(Â°C)`
    ORDER BY COUNT(*) DESC
    LIMIT 1) AS mode_Spindle_Bearing_Temperature,
    
    (SELECT `Spindle_Vibration(Âµm)` 
    FROM machine_downtime
    GROUP BY `Spindle_Vibration(Âµm)`
    ORDER BY COUNT(*) DESC
    LIMIT 1) AS mode_Spindle_Vibration,
    
    (SELECT `Tool_Vibration(Âµm)` 
    FROM machine_downtime
    GROUP BY `Tool_Vibration(Âµm)`
    ORDER BY COUNT(*) DESC
    LIMIT 1) AS mode_Tool_Vibration,
    
    (SELECT `Spindle_Speed(RPM)` 
    FROM machine_downtime
    GROUP BY `Spindle_Speed(RPM)`
    ORDER BY COUNT(*) DESC
    LIMIT 1) AS mode_Spindle_Speed,
    
    (SELECT `Voltage(volts)` 
    FROM machine_downtime
    GROUP BY `Voltage(volts)`
    ORDER BY COUNT(*) DESC
    LIMIT 1) AS mode_Voltage,
    
    (SELECT `Torque(Nm)` 
    FROM machine_downtime
    GROUP BY `Torque(Nm)`
    ORDER BY COUNT(*) DESC
    LIMIT 1) AS mode_Torque,
    
    (SELECT `Cutting` 
    FROM machine_downtime
    GROUP BY `Cutting`
    ORDER BY COUNT(*) DESC
    LIMIT 1) AS mode_Cutting
LIMIT 1;



-- finding RANGE
SELECT 
    MAX(`Hydraulic_Pressure(bar)`) - MIN(`Hydraulic_Pressure(bar)`) AS range_hydraulic_pressure,
    MAX(`Coolant_Pressure`) - MIN(`Coolant_Pressure`) AS range_coolant_pressure,
    MAX( `Air_System_Pressure(bar)` ) - MIN( `Air_System_Pressure(bar)`) AS range_air_system_pressure,
     MAX(`Coolant_Temperature` ) - MIN(`Coolant_Temperature` ) AS range_coolant_temperature,
    MAX(`Hydraulic_Oil_Temperature(Â°C)`) - MIN(`Hydraulic_Oil_Temperature(Â°C)`) AS range_hydraulic_oil_temperature,
    MAX(`Spindle_Bearing_Temperature(Â°C)`) - MIN(`Spindle_Bearing_Temperature(Â°C)`) AS range_Spindle_Bearing_Temperature,
    MAX(`Spindle_Vibration(Âµm)`) - MIN(`Spindle_Vibration(Âµm)`) AS range_spindle_vibration,
    MAX(`Tool_Vibration(Âµm)` ) - MIN(`Tool_Vibration(Âµm)` ) AS range_tool_vibration,
    MAX(`Spindle_Speed(RPM)` ) - MIN(`Spindle_Speed(RPM)` ) AS range_spindle_speed,
    MAX(`Voltage(volts)`) - MIN(`Voltage(volts)`) AS range_voltage,
    MAX(`Torque(Nm)` ) - MIN(`Torque(Nm)` ) AS range_torque,
    MAX(`Cutting`) - MIN(`Cutting`) AS range_cutting
FROM machine_downtime;



-- find VARIANCE
SELECT 
	VARIANCE(`Hydraulic_Pressure(bar)`) AS variance_Hydraulic_Pressure,
    VARIANCE(`Coolant_Pressure`) AS variance_Coolant_Pressure,
    VARIANCE(`Air_System_Pressure(bar)`) AS variance_Air_System_Pressure,
    VARIANCE(`Coolant_Temperature`) AS variance_Coolant_Temperature,
    VARIANCE(`Hydraulic_Oil_Temperature(Â°C)`) AS variance_Hydraulic_Oil_Temperature,
    VARIANCE(`Spindle_Bearing_Temperature(Â°C)`) AS variance_Spindle_Bearing_Temperature,
    VARIANCE(`Spindle_Vibration(Âµm)`) AS variance_Spindle_Vibration,
    VARIANCE(`Tool_Vibration(Âµm)`) AS variance_Tool_Vibration,
    VARIANCE(`Spindle_Speed(RPM)`) AS variance_Spindle_Speed,
    VARIANCE(`Voltage(volts)`) AS variance_Voltage,
    VARIANCE(`Torque(Nm)`) AS variance_Torque,
    VARIANCE(`Cutting`) AS variance_Cutting
FROM machine_downtime;



-- find STANDARD DEVIATION
SELECT 
	STDDEV(`Hydraulic_Pressure(bar)`) AS stddev_Hydraulic_Pressure,
    STDDEV(`Coolant_Pressure`) AS stddev_Coolant_Pressure,
    STDDEV(`Air_System_Pressure(bar)`) AS stddev_Air_System_Pressure,
    STDDEV(`Coolant_Temperature`) AS stddev_Coolant_Temperature,
    STDDEV(`Hydraulic_Oil_Temperature(Â°C)`) AS stddev_Hydraulic_Oil_Temperature,
    STDDEV(`Spindle_Bearing_Temperature(Â°C)`) AS stddev_Spindle_Bearing_Temperature,
    STDDEV(`Spindle_Vibration(Âµm)`) AS stddev_Spindle_Vibration,
    STDDEV(`Tool_Vibration(Âµm)`) AS stddev_Tool_Vibration,
    STDDEV(`Spindle_Speed(RPM)`) AS stddev_Spindle_Speed,
    STDDEV(`Voltage(volts)`) AS stddev_Voltage,
    STDDEV(`Torque(Nm)`) AS stddev_Torque,
    STDDEV(`Cutting`) AS stddev_Cutting
FROM machine_downtime;




-- DATA PREPROCESSING

-- Remove rows with missing values

DELETE FROM machine_downtime 
WHERE (`Hydraulic_Pressure(bar)` IS NULL 
       OR `Coolant_Pressure` IS NULL 
       OR `Air_System_Pressure(bar)` IS NULL 
       OR `Coolant_Temperature` IS NULL 
       OR `Hydraulic_Oil_Temperature(Â°C)` IS NULL 
       OR `Spindle_Bearing_Temperature(Â°C)` IS NULL  
       OR `Spindle_Vibration(Âµm)` IS NULL 
       OR `Tool_Vibration(Âµm)` IS NULL 
       OR `Spindle_Speed(RPM)` IS NULL 
       OR `Voltage(volts)` IS NULL 
       OR `Torque(Nm)` IS NULL 
       OR `Cutting` IS NULL)
LIMIT 1000; 


SELECT * FROM machine_downtime;    -- fetches all rows and columns of data stored 


SET SQL_SAFE_UPDATES = 0;     -- setting safe mode temporarily


-- Normalize all  columns 
UPDATE machine_downtime
SET `Hydraulic_Pressure(bar)` = (`Hydraulic_Pressure(bar)` - (SELECT MIN(`Hydraulic_Pressure(bar)`) FROM (SELECT * FROM machine_downtime) AS t)) /
                               ((SELECT MAX(`Hydraulic_Pressure(bar)`) FROM (SELECT * FROM machine_downtime) AS t) - (SELECT MIN(`Hydraulic_Pressure(bar)`) FROM (SELECT * FROM machine_downtime) AS t));

UPDATE machine_downtime
SET `Coolant_Pressure` = (`Coolant_Pressure` - (SELECT MIN(`Coolant_Pressure`) FROM (SELECT * FROM machine_downtime) AS t)) /
                             ((SELECT MAX(`Coolant_Pressure`) FROM (SELECT * FROM machine_downtime) AS t) - (SELECT MIN(`Coolant_Pressure`) FROM (SELECT * FROM machine_downtime) AS t));
UPDATE machine_downtime
SET `Air_System_Pressure(bar)` = (`Air_System_Pressure(bar)` - (SELECT MIN(`Air_System_Pressure(bar)`) FROM (SELECT * FROM machine_downtime) AS t)) /
                                ((SELECT MAX(`Air_System_Pressure(bar)`) FROM (SELECT * FROM machine_downtime) AS t) - (SELECT MIN(`Air_System_Pressure(bar)`) FROM (SELECT * FROM machine_downtime) AS t));

UPDATE machine_downtime
SET `Coolant_Temperature` = (`Coolant_Temperature` - (SELECT MIN(`Coolant_Temperature`) FROM (SELECT * FROM machine_downtime) AS t)) /
                          ((SELECT MAX(`Coolant_Temperature`) FROM (SELECT * FROM machine_downtime) AS t) - (SELECT MIN(`Coolant_Temperature`) FROM (SELECT * FROM machine_downtime) AS t));

UPDATE machine_downtime
SET `Hydraulic_Oil_Temperature(Â°C)` = (`Hydraulic_Oil_Temperature(Â°C)` - (SELECT MIN(`Hydraulic_Oil_Temperature(Â°C)`) FROM (SELECT * FROM machine_downtime) AS t)) /
                                     ((SELECT MAX(`Hydraulic_Oil_Temperature(Â°C)`) FROM (SELECT * FROM machine_downtime) AS t) - (SELECT MIN(`Hydraulic_Oil_Temperature(Â°C)`) FROM (SELECT * FROM machine_downtime) AS t));

UPDATE machine_downtime
SET `Spindle_Bearing_Temperature(Â°C)` = (`Spindle_Bearing_Temperature(Â°C)` - (SELECT MIN(`Spindle_Bearing_Temperature(Â°C)`) FROM (SELECT * FROM machine_downtime) AS t)) /
                                        ((SELECT MAX(`Spindle_Bearing_Temperature(Â°C)`) FROM (SELECT * FROM machine_downtime) AS t) - (SELECT MIN(`Spindle_Bearing_Temperature(Â°C)`) FROM (SELECT * FROM machine_downtime) AS t));

UPDATE machine_downtime
SET `Spindle_Vibration(Âµm)` = (`Spindle_Vibration(Âµm)` - (SELECT MIN(`Spindle_Vibration(Âµm)`) FROM (SELECT * FROM machine_downtime) AS t)) /
                              ((SELECT MAX(`Spindle_Vibration(Âµm)`) FROM (SELECT * FROM machine_downtime) AS t) - (SELECT MIN(`Spindle_Vibration(Âµm)`) FROM (SELECT * FROM machine_downtime) AS t));

UPDATE machine_downtime
SET `Tool_Vibration(Âµm)` = (`Tool_Vibration(Âµm)` - (SELECT MIN(`Tool_Vibration(Âµm)`) FROM (SELECT * FROM machine_downtime) AS t)) /
                           ((SELECT MAX(`Tool_Vibration(Âµm)`) FROM (SELECT * FROM machine_downtime) AS t) - (SELECT MIN(`Tool_Vibration(Âµm)`) FROM (SELECT * FROM machine_downtime) AS t));

UPDATE machine_downtime
SET `Spindle_Speed(RPM)` = (`Spindle_Speed(RPM)` - (SELECT MIN(`Spindle_Speed(RPM)`) FROM (SELECT * FROM machine_downtime) AS t)) /
                          ((SELECT MAX(`Spindle_Speed(RPM)`) FROM (SELECT * FROM machine_downtime) AS t) - (SELECT MIN(`Spindle_Speed(RPM)`) FROM (SELECT * FROM machine_downtime) AS t));

UPDATE machine_downtime
SET `Voltage(volts)` = (`Voltage(volts)` - (SELECT MIN(`Voltage(volts)`) FROM (SELECT * FROM machine_downtime) AS t)) /
                      ((SELECT MAX(`Voltage(volts)`) FROM (SELECT * FROM machine_downtime) AS t) - (SELECT MIN(`Voltage(volts)`) FROM (SELECT * FROM machine_downtime) AS t));

UPDATE machine_downtime
SET `Torque(Nm)` = (`Torque(Nm)` - (SELECT MIN(`Torque(Nm)`) FROM (SELECT * FROM machine_downtime) AS t)) /
                  ((SELECT MAX(`Torque(Nm)`) FROM (SELECT * FROM machine_downtime) AS t) - (SELECT MIN(`Torque(Nm)`) FROM (SELECT * FROM machine_downtime) AS t));

UPDATE machine_downtime
SET `Cutting` = (`Cutting` - (SELECT MIN(`Cutting`) FROM (SELECT * FROM machine_downtime) AS t)) /
                   ((SELECT MAX(`Cutting`) FROM (SELECT * FROM machine_downtime) AS t) - (SELECT MIN(`Cutting`) FROM (SELECT * FROM machine_downtime) AS t));



-- Convert Date Strings to Date Types
UPDATE machine_downtime
SET Date = STR_TO_DATE(Date, '%d-%m-%Y');

