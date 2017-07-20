package com.techelevator.model;

import java.util.ArrayList;
import java.util.List;

public class Forecast {
	
	private long high;
	private long low;
	private long day;
	private String forecast;
	private String parkCode;
	
	
	public long getHigh() {
		return high;
	}
	public void setHigh(long high) {
		this.high = high;
	}
	public long getLow() {
		return low;
	}
	public void setLow(long low) {
		this.low = low;
	}
	public long getDay() {
		return day;
	}
	public void setDay(long day) {
		this.day = day;
	}
	public String getForecast() {
		return forecast;
	}
	public void setForecast(String forecast) {
		this.forecast = forecast;
	}
	public String getParkCode() {
		return parkCode;
	}
	public void setParkCode(String parkCode) {
		this.parkCode = parkCode;
	}
	
	public List<String> getAdvisories() {
		List<String> advisories = new ArrayList<>();
		if(forecast.equals("snow")) {
			advisories.add("Be sure to pack your snowshoes.");
		}
		if(forecast.equalsIgnoreCase("sunny")) {
			advisories.add("Be sure to pack sunblock.");
		}
		if(forecast.equals("rain")) {
			advisories.add("Bring rain gear and waterproof shoes.");
		}
		if(forecast.equals("thunderstorms")) {
			advisories.add("Seek shelter and avoid hiking on exposed ridges.");
		}
		if(high>75) {
			advisories.add("Bring an extra gallon of water.");
		}
		if(low<20) {
			advisories.add("Dress warm to avoid exposure to frigid temperatures.");
		}
		if(high-low>20) {
			advisories.add("Be sure to wear breathable layers.");
		}
		return advisories;
	}
	
	

}






