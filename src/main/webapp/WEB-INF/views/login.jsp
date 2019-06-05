<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<head>
    <title>Log in form</title>
    <link href="<c:url value="/webjars/bootstrap/4.3.1/css/bootstrap.min.css"/>" rel="stylesheet">
    <script src="<c:url value="/webjars/bootstrap/4.3.1/js/bootstrap.min.js"/>"></script>
    <link href="<c:url value="/resources/css/main.css"/>" rel="stylesheet">
    <script src="<c:url value="/webjars/jquery/3.0.0/jquery.min.js"/>"></script>

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,500,600,700,700i|Montserrat:300,400,500,600,700" rel="stylesheet">

    <!-- Libraries CSS Files -->
    <link href="/resources/lib/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="/resources/lib/ionicons/css/ionicons.min.css" rel="stylesheet">
    <link href="/resources/lib/animate/animate.min.css" rel="stylesheet">
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

        <div class="row align-items-center">

            <div class="col-sm-3">

            </div>

            <div class="col-sm-6">

                <c:if test="${success != false}">
                    <a element="div" cssClass="text-danger text-center" style="color:red">${successMsg}</a>
                </c:if>
                <br>
                <br>

                <div class="card">
                    <div class="card-body">

                        <h3 style="color:#1bb1dc;" class="text-center">Log in </h3>

                        <form method="post" >

                            <div class="form-group">
                                <label>Email:</label>
                                <input type="text" class="form-control" name="email" id="email"/><br>
                            </div>

                            <div class="form-group">
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
            </div>

            <div class="col-sm-3">

            </div>

        </div>
    </div>
    <br>
    <br>
    <%@ include file="footer.jspf" %>

</body>
</html>
