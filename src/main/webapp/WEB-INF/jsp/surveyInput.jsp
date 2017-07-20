<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:import url="/WEB-INF/jsp/shared/header.jsp" />
<c:url var="formAction" value="surveyInput" />
<form:form action="${formAction}" method="POST" modelAttribute="survey">
	<table>
		<tr>
			<td><label for="parkCode">Favorite national park:</label><br>
			</td>
			<td><form:select path="parkCode">
					<option value="cvnp">Cuyahoga Valley National Park</option>
					<option value="enp">Everglades National Park</option>
					<option value="gcnp">Grand Canyon National Park</option>
					<option value="gnp">Glacier National Park</option>
					<option value="gsmnp">Great Smoky Mountains National Park</option>
					<option value="gtnp">Grand Teton National Park</option>
					<option value="mrnp">Mount Rainier National Park</option>
					<option value="rmnp">Rocky Mountain National Park</option>
					<option value="ynp">Yellowstone National Park</option>
					<option value="ynp2">Yosemite National Park</option>
				</form:select> <form:errors path="parkCode" cssClass="error" /></td>
		</tr>
		<tr>
			<td><label for="emailAddress">Your e-mail:</label><br></td>
			<td><form:input type="text" path="emailAddress" />
				<form:errors path="emailAddress" cssClass="error" /></td>
		</tr>
		<tr>
			<td><label for="state">State of residence:</label><br></td>
			<td><form:select path="state" id="state">
					<option value="AL">Alabama</option>
					<option value="AK">Alaska</option>
					<option value="AZ">Arizona</option>
					<option value="AR">Arkansas</option>
					<option value="CA">California</option>
					<option value="CO">Colorado</option>
					<option value="CT">Connecticut</option>
					<option value="DE">Delaware</option>
					<option value="DC">District Of Columbia</option>
					<option value="FL">Florida</option>
					<option value="GA">Georgia</option>
					<option value="HI">Hawaii</option>
					<option value="ID">Idaho</option>
					<option value="IL">Illinois</option>
					<option value="IN">Indiana</option>
					<option value="IA">Iowa</option>
					<option value="KS">Kansas</option>
					<option value="KY">Kentucky</option>
					<option value="LA">Louisiana</option>
					<option value="ME">Maine</option>
					<option value="MD">Maryland</option>
					<option value="MA">Massachusetts</option>
					<option value="MI">Michigan</option>
					<option value="MN">Minnesota</option>
					<option value="MS">Mississippi</option>
					<option value="MO">Missouri</option>
					<option value="MT">Montana</option>
					<option value="NE">Nebraska</option>
					<option value="NV">Nevada</option>
					<option value="NH">New Hampshire</option>
					<option value="NJ">New Jersey</option>
					<option value="NM">New Mexico</option>
					<option value="NY">New York</option>
					<option value="NC">North Carolina</option>
					<option value="ND">North Dakota</option>
					<option value="OH">Ohio</option>
					<option value="OK">Oklahoma</option>
					<option value="OR">Oregon</option>
					<option value="PA">Pennsylvania</option>
					<option value="RI">Rhode Island</option>
					<option value="SC">South Carolina</option>
					<option value="SD">South Dakota</option>
					<option value="TN">Tennessee</option>
					<option value="TX">Texas</option>
					<option value="UT">Utah</option>
					<option value="VT">Vermont</option>
					<option value="VA">Virginia</option>
					<option value="WA">Washington</option>
					<option value="WV">West Virginia</option>
					<option value="WI">Wisconsin</option>
					<option value="WY">Wyoming</option>
				</form:select><br> <form:errors path="state" cssClass="error" /></td>
		</tr>
		<tr>
			<td><label for="activityLevel">Activity level:</label><br>
			</td>
			<td><form:radiobutton path="activityLevel" value="inactive" />Inactive
				<form:radiobutton path="activityLevel" value="sedentary" />Sedentary
				<form:radiobutton path="activityLevel" value="active" />Active <form:radiobutton
					path="activityLevel" value="extremelyActive" />Extremely Active <form:errors
					path="activityLevel" cssClass="error" /></td>			
		</tr>
		<tr>
		<td>
		</td>
		<td><input id="submit" type="submit" value="Submit Survey"></td>
		</tr>
	</table>
	
</form:form>

