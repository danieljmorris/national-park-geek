<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/shared/header.jsp" />

<h1>Survey Results</h1>

<table>
<tr>
<th>
</th>
<th>
<c:out value="Park Name"/>
</th>
<th>
<c:out value="Number of Votes"/>
</th>
</tr>
<c:forEach var="survey" items="${results}">
<tr>
<td>
<img class="surveyResults" src="img/parks/${survey.parkCode.toLowerCase() }.jpg"/>
</td>
<td>
<c:out value="${survey.parkName }"/>
</td>
<td>
<c:out value="${survey.count}"/>
</td>
</tr>
</c:forEach>
</table>