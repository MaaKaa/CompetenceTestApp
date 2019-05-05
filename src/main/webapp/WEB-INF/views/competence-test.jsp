<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
    <title>Competence Test</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>
<div class="container">
    <a href="<c:url value="/org/logged/${organisation.id}"/>">Back to Organisation's Dashboard</a><br>
    <br>
    <h2>${competenceTest.name}</h2><br>

    <p>Description: ${competenceTest.description}</p><br>

    <h2>Invite volunteers!</h2><br>

    <form:form method="post" modelAttribute="volunteer">
        <form:input type="hidden" name="id" path="id"/>
        <form:input type="hidden" name="${competenceTest}" path="competenceTestInvitations"/>

        <b>Name:</b>
        <form:input path="name"/>
        <form:errors path="name" cssClass="text-danger"/><br>

        <b>E-mail:</b>
        <form:input path="email"/>
        <form:errors path="email" cssClass="text-danger"/><br>

        <br>
        <input type="submit" value="Save"><br>
    </form:form>

    <h2>Invited Volunteers:</h2><br>


    <h2>Test's statistics:</h2><br>
</div>
</body>
</html>

