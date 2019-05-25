<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<head>
    <title>Log in</title>
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
    <div class="container">
        <h2>Login</h2>
        <form method="post" >

            Email:
            <input type="text" name="email" id="email"/><br>

            Password:
            <input type="password" name="password" id="password"/><br>

            <c:if test="${isLogged == false}">
                <div class="error">Login failed</div><br><br>
            </c:if>

            <input type="submit" value="Login" class="btn btn-save"><br>

        </form>

        <a href="<c:url value="register"/>">Don't have an account yet? Register here!</a><br>
    </div>

    <br>
    <br>
    <%@ include file="footer.jspf" %>

</body>
</html>
