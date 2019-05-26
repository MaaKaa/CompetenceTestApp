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

    <div class="container section-bg">
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>

        <div class="card mt-4">

            <div class="card-body">

                    <h3>Log in</h3>

                <form method="post" >

                    <div class="form-group col-md-4">
                        <label>Email:</label>
                        <input type="text" class="form-control" name="email" id="email"/><br>
                    </div>

                    <div class="form-group col-md-4">
                        <label>Password:</label>
                        <input type="password" class="form-control" name="password" id="password"/><br>
                    </div>

                    <c:if test="${isLogged == false}">
                        <div class="error">Login failed</div><br><br>
                    </c:if>

                    <input type="submit" value="Login" class="btn btn-save"><br>

                </form>

                <a href="<c:url value="register"/>">Don't have an account yet? Register here!</a><br>
            </div>
        </div>

    <br>
    <br>
    <%@ include file="footer.jspf" %>

</body>
</html>
