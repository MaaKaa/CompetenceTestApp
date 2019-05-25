<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
    <title>Competence Test Results</title>
    <script src="<c:url value="/webjars/jquery/3.0.0/jquery.min.js"/>"></script>
    <script src="<c:url value="/webjars/bootstrap/4.3.1/js/bootstrap.min.js"/>"></script>
    <link href="<c:url value="/webjars/bootstrap/4.3.1/css/bootstrap.min.css"/>" rel="stylesheet">
    <link href="<c:url value="/resources/css/main.css"/>" rel="stylesheet">
</head>
<body>
    <%@ include file="header.jspf" %>

    <br>
    <br>
    <br>
    <br>
    <br>
    <br>

    <div class="container">

        <a href="<c:url value="/vol/logged/${volunteer.id}"/>">Back to Volunteer's Dashboard</a><br>

        <h3><p style="color:#1bb1dc;">Competence Test: "${solutionByCompetenceTestIdAndVolunteerId.competenceTest.name}" Results</p></h3>

        Volunteer's name: ${volunteer.name} <br>

        <h3>General result: ${solutionByCompetenceTestIdAndVolunteerId.resultRoleAndAutonomy}</h3><br>

        <table class="table">
            <thead>
            <tr>
                <th scope="col">Name</th>
                <th scope="col">Result</th>
                <th scope="col">Description</th>
            </tr>
            </thead>
            <tr>
                <td>Communication</td>
                <td>${solutionByCompetenceTestIdAndVolunteerId.communicationResult}</td>
                <td>Lorem ipsum dolor sit amet.</td>
            </tr>
            <tr>
                <td>Flexibility</td>
                <td>${solutionByCompetenceTestIdAndVolunteerId.flexibilityResult}</td>
                <td>Lorem ipsum dolor sit amet.</td>
            </tr>
            <tr>
                <td>Teamwork</td>
                <td>${solutionByCompetenceTestIdAndVolunteerId.teamWorkResult}</td>
                <td>Lorem ipsum dolor sit amet.</td>
            </tr>
        </table>
    </div>

    <br>
    <br>
    <%@ include file="footer.jspf" %>

</body>
</html>