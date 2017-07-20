<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/shared/header.jsp" />




<table>
	<c:forEach var="park" items="${parks}">
		<c:set var="parkCode" value="${park.code.toLowerCase()}" />
		<c:url var="parkImg" value="img/parks/${parkCode}.jpg" />
		<c:url var="parkDetailURL" value="/parkDetail">
			<c:param name="chosenPark" value="${park.code}" />
		</c:url>
		<tr>
			<td id="img"><a href="${parkDetailURL}"> <img
					id="landingImg" src="${parkImg}" /></a></td>
			<td id="description"><span class="parkName"><c:out
						value="${park.name}" /><br></span> State: <c:out
					value="${park.state}" /> <span id="parkText" class="wordWrap"><c:out
						value="${park.description}" /><br></span></td>
		</tr>
	</c:forEach>
</table>

