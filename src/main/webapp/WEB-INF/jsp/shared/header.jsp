<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>

<html>
<head>
    <title>National Park Geek</title>
    <link rel="stylesheet" href="css/npgeek.css" />
</head>
<body>
<header>
<c:url var="npgeekLogo" value="/img/logo.png"/>
<c:url var="homeURL" value="/"/>
<a href="${homeURL}"><img id="headerImg" src="${npgeekLogo}"/></a>
<c:url var="home" value="/"/>
<c:url var="survey" value="/surveyInput"/>
    <nav>
    		<ul>
            <li><a href="${home}">Home</a></li>
            <li><a href="${survey}">Survey</a></li>       
        </ul>
    </nav>
</header>
