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
    <link href="<c:url value="/resources/css/main.css"/>" rel="stylesheet">
</head>
<body>
    <%@ include file="header.jspf" %>
    <div class="container">
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <a href="<c:url value="/org/logged/${organisation.id}"/>">Back to Organisation's Dashboard</a><br>
        <br>

        <h2 style="color:#1bb1dc;">${competenceTest.name}</h2><br>

        <p>Description: ${competenceTest.description}</p><br>

        <h2>Invite volunteers!</h2><br>

        <form:form method="post" modelAttribute="volunteer">
            <form:input type="hidden" path="id" name="id"/>
            <form:input type="hidden" path="competenceTestInvitations" name="competenceTestInvitations" value="${competenceTest.id}"/>

            <div class="form-group col-md-4">
                <label>Name:</label>
                <form:input path="name" class="form-control"/>
                <form:errors path="name" cssClass="text-danger"/>
            </div>

            <div class="form-group col-md-4">
                <label>E-mail:</label>
                <form:input path="email" class="form-control"/>
                <form:errors path="email" cssClass="text-danger"/>
            </div>

            <div class="form-group col-md-4">
                <input type="submit" value="Save" class="btn btn-save">
            </div>
        </form:form>

        <h2>Invited Volunteers:</h2><br>

        <table class="table table-hover">
            <thead>
            <tr>
                <th scope="col">ID</th>
                <th scope="col">Name</th>
                <th scope="col">E-mail</th>
            </tr>
            </thead>

            <tbody>
            <c:forEach items="${competenceTest.invitedVolunteers}" var="invitedVolunteer">
                <tr>
                    <td>${invitedVolunteer.id}</td>
                    <td>${invitedVolunteer.name}</td>
                    <td>${invitedVolunteer.email}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>


        <h2>Test's statistics:</h2><br>
    </div>
</body>
</html>

