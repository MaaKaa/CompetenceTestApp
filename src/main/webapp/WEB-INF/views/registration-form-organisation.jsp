<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<html>
<head>
    <title>Registration form: Organisation</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>
<div class="container">
    <h2>Register</h2>
    <form:form method="post" modelAttribute="organisation">

        Name:
        <form:input path="name"/><br>
        <form:errors path="name" cssClass="text-danger" /><br>

        Email:
        <form:input path="email"/><br>
        <form:errors path="email" cssClass="text-danger" /><br>

        Password:
        <form:password path="password"/><br>
        <form:errors path="password" cssClass="text-danger" /><br>

        Description:
        <form:textarea path="description"/><br>
        <form:errors path="description" cssClass="text-danger" /><br>

        Field of activity:

        City:

        Country:

        Website:
        <form:input path="website"/><br>
        <form:errors path="website" cssClass="text-danger" /><br>

        <input type="submit" value="Register"><br>
    </form:form>

    <a href="<c:url value="login"/>">Already have an account? Login!</a><br>
</div>
</body>
</html>
