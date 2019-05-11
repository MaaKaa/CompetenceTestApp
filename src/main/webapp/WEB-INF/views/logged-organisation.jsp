<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
    <title>Organisation</title>
    <script src="<c:url value="/webjars/jquery/3.0.0/jquery.min.js"/>"></script>
    <script src="<c:url value="/webjars/bootstrap/4.3.1/js/bootstrap.min.js"/>"></script>
    <link href="<c:url value="/webjars/bootstrap/4.3.1/css/bootstrap.min.css"/>" rel="stylesheet">
</head>
<body>
<div class="container">
    <br>
    <h2>Hi ${organisation.name}!</h2><br>

    <h2>Create Competence Test</h2><br>
    <p>Find out what did volunteers learn thanks to your project!</p><br>

    <form:form method="post" modelAttribute="competenceTest">
        <form:input type="hidden" name="id" path="id"/>
        <form:input type="hidden" name="${organisation.id}" path="organisation.id"/>

        <b>Name:</b>
        <form:input path="name"/>
        <form:errors path="name" cssClass="text-danger"/><br>

        <b>Description:</b>
        <form:textarea path="description"/>
        <form:errors path="description" cssClass="text-danger"/><br>

        <br>
        <input type="submit" value="Save"><br>
    </form:form>

    <br>
    <h3>Your Competence Tests:</h3>
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
        <c:forEach items="${competenceTestsByOrg}" var="competenceTestByOrg">
            <tr>
                <td>${competenceTestByOrg.id}</td>
                <td>${competenceTestByOrg.name}</td>
                <td>${competenceTestByOrg.description}</td>
                <td>${competenceTestByOrg.organisation}</td>
                <td><a href="/org/logged/${organisation.id}/competence-test/${competenceTestByOrg.id}">View</a>
            </tr>
        </c:forEach>
    </table>

    <br>
    <h2>Overall statistics:</h2><br>
</div>
</body>
</html>
