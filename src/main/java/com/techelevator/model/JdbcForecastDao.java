package com.techelevator.model;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

@Component
public class JdbcForecastDao implements ForecastDao	{
	
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	public JdbcForecastDao(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	@Override
	public List<Forecast> getForecastByPark(String code) {
		List<Forecast> fiveDayForecast = new ArrayList<>();
		String sqlSelectForecastInfo = "SELECT * FROM weather WHERE parkCode= ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectForecastInfo, code);
		while(results.next()){
			Forecast mapForecastToList = mapRowToForecast(results);
			fiveDayForecast.add(mapForecastToList);
		}
		return fiveDayForecast;
	}

	private Forecast mapRowToForecast(SqlRowSet results) {
		Forecast theForecast;
		theForecast = new Forecast();
		theForecast.setParkCode(results.getString("parkCode"));
		theForecast.setDay(results.getLong("fiveDayForecastValue"));
		theForecast.setLow(results.getLong("low"));
		theForecast.setHigh(results.getLong("high"));
		theForecast.setForecast(results.getString("forecast"));
		return theForecast;
	}
	
}
