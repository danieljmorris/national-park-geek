package com.techelevator.model;

import java.util.List;

public interface SurveyDao {
	
	void saveSurvey(Survey survey);
	
	List<SurveyResult> getSurveyResults();

}
