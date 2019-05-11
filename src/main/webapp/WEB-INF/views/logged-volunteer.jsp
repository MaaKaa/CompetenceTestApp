<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
    <title>Competence Test</title>
    <script src="<c:url value="/webjars/jquery/3.0.0/jquery.min.js"/>"></script>
    <script src="<c:url value="/webjars/bootstrap/4.3.1/js/bootstrap.min.js"/>"></script>
    <link href="<c:url value="/webjars/bootstrap/4.3.1/css/bootstrap.min.css"/>" rel="stylesheet">
</head>
<body>
<div class="container">
    <br>
    <h2>Hi ${volunteer.name}!</h2><br>

    <h2>Your competence tests:</h2>
    <h3>Invitations:</h3>
    <table class="table">
        <thead>
        <tr>
            <th scope="col">ID</th>
            <th scope="col">Name</th>
            <th scope="col">Description</th>
            <th scope="col">Organisation</th>
            <th scope="col">Actions</th>
        </tr>
        </thead>
        <c:forEach items="${competenceTestInvitations}" var="competenceTestInvitation">
            <tr>
                <td>${competenceTestInvitation.id}</td>
                <td>${competenceTestInvitation.name}</td>
                <td>${competenceTestInvitation.description}</td>
                <td>${competenceTestInvitation.organisation}</td>
                <td><a href="#">Take</a>
            </tr>
        </c:forEach>
    </table>
    <br>
    <h3>Solved:</h3>
    <table class="table">
        <thead>
        <tr>
            <th scope="col">ID</th>
            <th scope="col">Name</th>
            <th scope="col">Description</th>
            <th scope="col">Organisation</th>
            <th scope="col">Actions</th>
        </tr>
        </thead>
        <c:forEach items="${solutionsByVolunteer}" var="solutionByVolunteer">
            <tr>
                <td>${solutionsByVolunteer.competenceTest.id}</td>
                <td>${solutionsByVolunteer.competenceTest.name}</td>
                <td>${solutionsByVolunteer.competenceTest.description}</td>
                <td>${solutionsByVolunteer.competenceTest.organisation}</td>
                <td><a href="#">Take</a>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>
