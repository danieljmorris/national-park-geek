package com.techelevator.model;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotBlank;

public class Survey {

	private long id;
	private long count;

	@NotBlank(message = "Park choice is required")
	private String parkCode;
	@NotBlank(message = "Email address is required")
	@Email(message = "Email must be a valid email address")
	private String emailAddress;
	@NotBlank(message = "State is required")
	private String state;
	@NotBlank(message = "Activity is required")
	private String activityLevel;

	public long getId() {
		return id;
	}

	public void setId(Long surveyId) {
		this.id = surveyId;
	}

	public long getCount() {
		return count;
	}

	public void setCount(Long count) {
		this.count = count;
	}

	public String getParkCode() {
		return parkCode;
	}

	public void setParkCode(String parkCode) {
		this.parkCode = parkCode;
	}

	public String getEmailAddress() {
		return emailAddress;
	}

	public void setEmailAddress(String emailAddress) {
		this.emailAddress = emailAddress;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getActivityLevel() {
		return activityLevel;
	}

	public void setActivityLevel(String activityLevel) {
		this.activityLevel = activityLevel;
	}
}
