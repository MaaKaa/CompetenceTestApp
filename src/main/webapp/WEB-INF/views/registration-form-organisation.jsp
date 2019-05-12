<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<html>
<head>
    <title>Registration form: Organisation</title>
    <script src="<c:url value="/webjars/jquery/3.0.0/jquery.min.js"/>"></script>
    <script src="<c:url value="/webjars/bootstrap/4.3.1/js/bootstrap.min.js"/>"></script>
    <link href="<c:url value="/webjars/bootstrap/4.3.1/css/bootstrap.min.css"/>" rel="stylesheet">
</head>
<body>
<%@ include file="header.jspf" %>
<div class="container">
    <br>
    <br>
    <br>

    <div class="card mt-4">

        <div class="card-header">
            Register
        </div>

        <div class="card-body">
        <form:form method="post" modelAttribute="organisation">

            <div class="form-group col-md-4">
            <label>Name:</label>
            <form:input path="name" class="form-control"/><br>
            <form:errors path="name" cssClass="text-danger" /><br>
            </div>
            <div class="form-group col-md-4">
                <label>Email:</label>
            <form:input path="email" class="form-control"/><br>
            <form:errors path="email" cssClass="text-danger" /><br>
            </div>

            <div class="form-group col-md-4">
                <label>Pasword:</label>
            <form:password path="password" class="form-control"/><br>
            <form:errors path="password" cssClass="text-danger" /><br>
            </div>

            <div class="form-group col-md-4">
                <label>Description:</label>
            <form:textarea path="description" cols="60" rows="3" class="form-control" /><br>
            <form:errors path="description" cssClass="text-danger" /><br>
            </div>

                <div class="form-group col-md-4">
                    <label>Fields of activity:</label><br>
            <form:checkboxes path="fieldsOfActivity" items="${fieldsOfActivity}" itemLabel="name" itemValue="id"/><br>
            <form:errors path="fieldsOfActivity" cssClass="text-danger" /><br>
                </div>

            <div class="form-group col-md-4">
            <label>City:</label>
            <form:input path="city" class="form-control"/><br>
            <form:errors path="city" cssClass="text-danger" /><br>
            </div>

            <div class="form-group col-md-4">
            <label>Country:</label>
            </div>

            <div class="form-group col-md-4">
            <label>Website:</label>
            <form:input path="website" class="form-control"/><br>
            <form:errors path="website" cssClass="text-danger" /><br>
            </div>

            <input type="submit" value="Register"><br>
        </form:form>

        <a href="<c:url value="login"/>">Already have an account? Login!</a><br>
        </div>
</div>
</body>
</html>
