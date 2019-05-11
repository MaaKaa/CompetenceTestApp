<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<head>
    <title>Log in</title>
    <script src="<c:url value="/webjars/jquery/3.0.0/jquery.min.js"/>"></script>
    <script src="<c:url value="/webjars/bootstrap/4.3.1/js/bootstrap.min.js"/>"></script>
    <link href="<c:url value="/webjars/bootstrap/4.3.1/css/bootstrap.min.css"/>" rel="stylesheet">
</head>
<body>
<div class="container">
    <h2>Login</h2>
    <form:form method="post" modelAttribute="organisation">

        Email:
        <form:input path="email"/><br>
        <form:errors path="email" cssClass="text-danger"/><br>

        Password:
        <form:password path="password"/><br>
        <form:errors path="password" cssClass="text-danger"/><br>

        <input type="submit" value="Log in"><br>
    </form:form>

    <a href="<c:url value="register"/>">Don't have an account yet? Register here!</a><br>
</div>
</body>
</html>
