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
    <link href="<c:url value="/resources/css/main.css"/>" rel="stylesheet">
</head>
<body>
<%@ include file="header.jspf" %>

    <div class="container section-bg">
        <br>
        <br>
        <br>
        <br>
        <div class="card mt-4">

            <div class="card-body">

                <header class="section-header">
                    <br>
                    <h3>Register</h3>
                </header>

            <form:form method="post" modelAttribute="organisation">

                <h3>Account information</h3>
                <div class="form-group col-md-4">
                    <label>Email:</label>
                <form:input path="email" class="form-control" placeholder="example@example.com" />
                <form:errors path="email" cssClass="text-danger" />
                </div>

                <div class="form-group col-md-4">
                    <label>Pasword:</label>
                <form:password path="password" class="form-control"/>
                <form:errors path="password" cssClass="text-danger" />
                </div>

                <div class="form-group col-md-4">
                    <label>Re-type Pasword:</label>

                </div>

                <h3>About your organisation</h3>
                <div class="form-group col-md-4">
                    <label>Organisation's Name:</label>
                    <form:input path="name" class="form-control"/>
                    <form:errors path="name" cssClass="text-danger" />
                </div>

                <div class="form-group col-md-4">
                    <label>Website:</label>
                    <form:input path="website" class="form-control" placeholder="https://example.com" aria-describedby="websiteHelp"/>
                    <small id="websiteHelp" class="form-text text-muted">Must start with "http://" or "https://".</small>
                    <form:errors path="website" cssClass="text-danger" />
                </div>

                <div class="form-group col-md-4">
                    <label>Description:</label>
                    <form:textarea path="description" cols="60" rows="3" class="form-control" />
                    <form:errors path="description" cssClass="text-danger" />
                </div>

                <div class="form-group col-md-4">
                    <label>Fields of activity:</label><br>
                    <div class="form-check">
                    <form:checkboxes path="fieldsOfActivity" items="${fieldsOfActivity}" itemLabel="name" itemValue="id"/>
                    <form:errors path="fieldsOfActivity" cssClass="text-danger" />
                    </div>
                </div>

                <h3>Contact information</h3>
                <div class="form-group col-md-4">
                <label>City:</label>
                <form:input path="city" class="form-control"/>
                <form:errors path="city" cssClass="text-danger" />
                </div>

                <div class="form-group col-md-4">
                <label>Country:</label>
                    <form:input path="country" class="form-control"/>
                    <form:errors path="country" cssClass="text-danger" />
                </div>

                <input type="submit" value="Register" class="btn btn-primary"><br>
            </form:form>

            <a href="<c:url value="login"/>">Already have an account? Login!</a><br>
            </div>
    </div>
</body>
</html>
