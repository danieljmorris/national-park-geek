<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/shared/header.jsp" />


<img id="parkInfoImg" src="img/parks/${param.chosenPark.toLowerCase()}.jpg">

<c:set var="park" value="${parkInfo}"/>

<p class=parkName><c:out value="${park.name}"/></p>

<div id="parkQuote">
"<c:out value="${park.quote}"/>"<br>
<span id="quoteSource">- <c:out value="${park.quoteSource}"/></span>
</div>

<p>Description:</p>
<p><span class="wordWrap"><c:out value="${park.description}"/></span></p>

<table id="parkDescription">
	<tr>
		<td>Park Location: <c:out value="${park.state}" /></td>
		<td>Park Size: <c:out value="${park.acreage}" /></td>
	</tr>
	<tr>
		<td>Park Elevation: <c:out value="${park.elevation}" /></td>
		<td>Mile of Trails: <c:out value="${park.milesOfTrail}" /></td>
	</tr>
	<tr>
		<td>Number of Camp Sites: <c:out value="${park.numOfCampSites}" /></td>
		<td>Park Climate: <c:out value="${park.climate}" /></td>
	</tr>
	<tr>
		<td>Year Founded: <c:out value="${park.yearFounded}" /></td>
		<td>Annual Visitors: <c:out value="${park.annualVisitorCount}" /></td>
	</tr>
	<tr>
		<td>Entry Fee: <c:out value="$${park.entryFee}" /></td>
		<td>Number of Animal Species: <c:out
				value="${park.numOfAnimalSpecies}" /></td>
</table>
<br><br>
<c:set var="forecast" value="${parkForecast}" />

<label id="forecast" for="unit">Fahrenheit/Celsius</label>
<c:url var="formAction" value="/parkDetail" />
<form action="${formAction}" method="POST">
	<!-- Select the right option based on the model map -->
	<select name="unit">
		<option value="celsius">Celsius
		<option value="fahrenheit">Fahrenheit
	</select> <input type="hidden" name="parkCode" value="${param.chosenPark}">
	<input id="forecast" type="submit" value="Submit">
</form>
<%-- <c:if test="${ }param.unit" --%>

<table>
<tr>
<td id="today">Today</td>
</tr>

<tr>
<c:forEach var="day" items="${forecast }">
  <td><img id="weatherImg${day.day}" src="img/weather/${day.forecast }.png"></td>
 </c:forEach>
</tr>

<tr>
<c:forEach var="day" items="${forecast }">
<c:choose>
  <c:when test="${isFahrenheit}">
		<td>Low: <c:out value="${day.low } F"/></td>
	</c:when>
	<c:otherwise>
	 <!-- TODO: Math this -->
    <td>Low: <c:out value="${Math.round((day.low -32)/1.8)} C"/></td>
	</c:otherwise>
</c:choose>
</c:forEach>
</tr>

<tr>
<c:forEach var="day" items="${forecast }">
<c:choose>
  <c:when test="${isFahrenheit}">
    <td>High: <c:out value="${day.high } F"/></td>
  </c:when>
  <c:otherwise>
   <!-- TODO: Math this -->
    <td>High: <c:out value="${Math.round((day.high-32)/1.8) } C"/></td>
  </c:otherwise>
</c:choose>
</c:forEach>
</tr>

</table>

<p id="advisory">
<c:forEach var="day" items="${forecast }">
<c:if test="${day.day==1 }">
    <c:forEach var="advisory" items="${day.advisories }">
     <c:out value="${advisory }"/><br>
    </c:forEach>
  </c:if>
</c:forEach> 
</p>















