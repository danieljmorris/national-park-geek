package com.techelevator.model;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;


@Component
public class JdbcParkDao implements ParkDao {

	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	public JdbcParkDao(DataSource datasource) {
	this.jdbcTemplate = new JdbcTemplate(datasource);
	}
	
	@Override
	public List<Park> getAllParks() {
		List<Park> allParks = new ArrayList<>();
		String sqlSelectAllParks = "SELECT * from park";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectAllParks);
		while(results.next()) {
			Park mapParkToList = mapRowToPark(results);
			allParks.add(mapParkToList);
		}
		return allParks;
	}
	
	@Override
	public Park getSelectedParkInfo(String code) {
		Park selectedPark = null;
		String sqlSelectParkInfo = "SELECT * FROM park WHERE parkCode = ?";
		SqlRowSet parkInfo = jdbcTemplate.queryForRowSet(sqlSelectParkInfo, code);
		if(parkInfo.next()) {
			selectedPark = mapRowToPark(parkInfo);
		}
		return selectedPark;
	}

	private Park mapRowToPark(SqlRowSet results) {
		Park thePark;
		thePark = new Park();
		thePark.setCode(results.getString("parkCode"));
		thePark.setName(results.getString("parkName"));
		thePark.setState(results.getString("state"));
		thePark.setAcreage(results.getLong("acreage"));
		thePark.setElevation(results.getLong("elevationInFeet"));
		thePark.setMilesOfTrail(results.getFloat("milesOfTrail"));
		thePark.setNumOfCampSites(results.getLong("numberOfCampsites"));
		thePark.setClimate(results.getString("climate"));
		thePark.setYearFounded(results.getString("yearFounded"));
		thePark.setAnnualVisitorCount(results.getLong("annualVisitorCount"));
		thePark.setQuote(results.getString("inspirationalQuote"));
		thePark.setQuoteSource(results.getString("inspirationalQuoteSource"));
		thePark.setDescription(results.getString("parkDescription"));
		thePark.setEntryFee(results.getLong("entryFee"));
		thePark.setNumOfAnimalSpecies(results.getInt("numberOfAnimalSpecies"));
		return thePark;
	}
}
