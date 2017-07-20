package com.techelevator.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

@Component
public class JdbcSurveyDao implements SurveyDao {

	private JdbcTemplate jdbcTemplate;

	@Autowired
	public JdbcSurveyDao(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	@Override
	public void saveSurvey(Survey survey) {
		Long surveyId = getNextId();
		String sqlSaveSurvey = "INSERT INTO survey_result(surveyid, parkcode, emailaddress, state, activitylevel) VALUES (?, ?, ?, ?, ?)";
		survey.setId(surveyId);
		jdbcTemplate.update(sqlSaveSurvey, surveyId, survey.getParkCode(), survey.getEmailAddress(), survey.getState(),
				survey.getActivityLevel());

	}

	@Override
	public List<SurveyResult> getSurveyResults() {
		List<SurveyResult> surveyResults = new ArrayList<>();
		String sqlSelectSurveyResults = "SELECT parkcode, count(parkcode) FROM survey_result GROUP BY survey_result.parkcode ORDER BY count DESC LIMIT 5";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectSurveyResults);
		Map<String, String> parkName = new HashMap<String, String>();

		parkName.put("cvnp", "Cuyahoga Valley National Park");
		parkName.put("enp", "Everglades National Park");
		parkName.put("gcnp", "Grand Canyon National Park");
		parkName.put("gnp", "Glacier National Park");
		parkName.put("gsmnp", "Great Smoky Mountains National Park");
		parkName.put("gtnp", "Grand Teton National Park");
		parkName.put("mrnp", "Mount Rainier National Park");
		parkName.put("rmnp", "Rocky Mountain National Park");
		parkName.put("ynp", "Yellowstone National Park");
		parkName.put("ynp2", "Yosemite National Park");
		
		while (results.next()) {
			SurveyResult surveyResult = new SurveyResult();
			surveyResult.setParkCode(results.getString("parkcode"));
			surveyResult.setParkName(parkName.get(results.getString("parkcode")));
			surveyResult.setCount(results.getLong("count"));
			surveyResults.add(surveyResult);
		}
		return surveyResults;
	}

	private Long getNextId() {
		String sqlSelectNextId = "SELECT NEXTVAL('seq_surveyid')";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectNextId);
		Long id = null;
		if (results.next()) {
			id = results.getLong(1);
		} else {
			throw new RuntimeException("Something strange happened, unable to select next forum post id from sequence");
		}
		return id;
	}

}
