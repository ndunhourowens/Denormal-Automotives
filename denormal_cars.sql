SELECT DISTINCT make_title FROM car_models;
SELECT DISTINCT model_title FROM car_models WHERE make_code = 'VOLKS';
SELECT make_code, model_code, model_title, year FROM car_models WHERE make_code = 'LAM';
SELECT * FROM car_models WHERE year > 2009 AND year < 2016;