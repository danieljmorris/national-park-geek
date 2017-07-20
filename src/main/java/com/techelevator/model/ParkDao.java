package com.techelevator.model;

import java.util.List;

public interface ParkDao {

	List<Park> getAllParks();
	Park getSelectedParkInfo(String code);
	
}
