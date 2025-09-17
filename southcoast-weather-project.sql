/** Weather SQL Project - South Coast Cities **/

/** Create table for cities and their primary weather type **/
CREATE TABLE cities (
    city_id INTEGER PRIMARY KEY AUTOINCREMENT,
    city_name TEXT,
    main_weather TEXT
);

/** Insert sample data for cities **/
INSERT INTO cities (city_name, main_weather) VALUES ("Southampton", "Rainy");
INSERT INTO cities (city_name, main_weather) VALUES ("Portsmouth", "Sunny");
INSERT INTO cities (city_name, main_weather) VALUES ("Bournemouth", "Cloudy");
INSERT INTO cities (city_name, main_weather) VALUES ("Winchester", "Sunny");
INSERT INTO cities (city_name, main_weather) VALUES ("Brighton", "Windy");

/** Create table for average temperature in Celsius **/
CREATE TABLE temperature (
    temp_id INTEGER PRIMARY KEY AUTOINCREMENT,
    city_name TEXT,
    avg_temp INTEGER
);

/** Insert sample temperature data **/
INSERT INTO temperature (city_name, avg_temp) VALUES ("Southampton", 16);
INSERT INTO temperature (city_name, avg_temp) VALUES ("Portsmouth", 18);
INSERT INTO temperature (city_name, avg_temp) VALUES ("Bournemouth", 17);
INSERT INTO temperature (city_name, avg_temp) VALUES ("Winchester", 15);
INSERT INTO temperature (city_name, avg_temp) VALUES ("Brighton", 14);

/** Create table for average annual rainfall in mm **/
CREATE TABLE rainfall (
    rain_id INTEGER PRIMARY KEY AUTOINCREMENT,
    city_name TEXT,
    avg_rainfall INTEGER
);

/** Insert sample rainfall data **/
INSERT INTO rainfall (city_name, avg_rainfall) VALUES ("Southampton", 700);
INSERT INTO rainfall (city_name, avg_rainfall) VALUES ("Portsmouth", 600);
INSERT INTO rainfall (city_name, avg_rainfall) VALUES ("Bournemouth", 800);
INSERT INTO rainfall (city_name, avg_rainfall) VALUES ("Winchester", 650);
INSERT INTO rainfall (city_name, avg_rainfall) VALUES ("Brighton", 550);

/** View individual tables **/
SELECT * FROM cities;
SELECT * FROM temperature;
SELECT * FROM rainfall;

/** Use LEFT JOINs to combine all weather data into a single table **/
SELECT 
    cities.city_name AS "City",
    COALESCE(cities.main_weather, "N/A") AS "Primary Weather",
    COALESCE(temperature.avg_temp, "N/A") AS "Average Temperature (°C)",
    COALESCE(rainfall.avg_rainfall, "N/A") AS "Average Rainfall (mm)"
FROM cities
LEFT JOIN temperature ON cities.city_name = temperature.city_name
LEFT JOIN rainfall ON cities.city_name = rainfall.city_name;

/** Example: only sunny cities with their temperature **/
SELECT 
    cities.city_name AS "Sunny City",
    COALESCE(temperature.avg_temp, "N/A") AS "Average Temperature (°C)"
FROM cities
INNER JOIN temperature ON cities.city_name = temperature.city_name
WHERE cities.main_weather = "Sunny";