package com.techelevator.model;

import java.util.List;

public interface ForecastDao {
	
	List<Forecast> getForecastByPark(String code);
	
}
