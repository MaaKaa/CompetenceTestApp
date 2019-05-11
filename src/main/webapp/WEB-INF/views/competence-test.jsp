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

