<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Registration form</title>
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

        <div class="row">

            <div class="col-sm-4">
                <div class="card mt-4">
                    <div class="card-body">
                        <h5>Create a free account and find out, what volunteers learn in your organisation!</h5>
                        <br>
                        <p>Are you a volunteer? Ask your organisation to send you an invitation to the Competence Test!</p>
                        <p>Getting stuck? Let us know how we can help: <a href="mailto:hi@competencetest.com">hi@competencetest.com</a></p>
                    </div>
                </div>
            </div>

            <div class="col-sm-8">
                <div class="card mt-4">
                    <div class="card-body">
                        <h3 style="color:#1bb1dc;">Register</h3>

                        <form:form method="post" modelAttribute="organisation">

                            <h5>Account information</h5>

                            <div class="form-group">
                                <label>Email:</label>
                                <form:input path="email" class="form-control" placeholder="example@example.com" required="true" />
                                <form:errors path="email" cssClass="text-danger" />

                                <c:if test="${error != false}">
                                    <a element="div" cssClass="text-danger" style="color:red">${errorMsg}</a>
                                </c:if>
                            </div>

                            <div class="form-group">
                                <label>Password:</label>
                                <form:password path="password" class="form-control" required="true" />
                                <form:errors path="password" cssClass="text-danger" />
                            </div>

                            <h5>About your organisation</h5>

                            <div class="form-group">
                                <label>Name:</label>
                                <form:input path="name" class="form-control" required="true" />
                                <form:errors path="name" cssClass="text-danger" />
                            </div>

                            <div class="form-group">
                                <label>Description:</label>
                                <form:textarea path="description" cols="60" rows="3" class="form-control" required="true" />
                                <form:errors path="description" cssClass="text-danger" />
                            </div>



                            <h5>Contact info</h5>

                            <div class="form-group">
                                <label>Website:</label>
                                <form:input path="website" class="form-control" placeholder="https://example.com" aria-describedby="websiteHelp" required="true" />
                                <!-- <small id="websiteHelp" class="form-text text-muted">Must start with "http://" or "https://".</small> -->
                                <form:errors path="website" cssClass="text-danger" />
                            </div>

                            <div class="form-group">
                                <label>City:</label>
                                <form:input path="city" class="form-control" required="true" />
                                <form:errors path="city" cssClass="text-danger" />
                            </div>

                            <div class="form-group">
                                <label>Country:</label>
                                <form:input path="country" class="form-control"/>
                                <form:errors path="country" cssClass="text-danger" />
                            </div>

                            <input type="submit" value="Register" class="btn btn-save"><br>
                        </form:form>

                        <a href="<c:url value="login"/>">Already have an account? Login!</a><br>
                    </div>
                 </div>
            </div>

        </div>
    </div>

        <br>
        <br>

    <%@ include file="footer.jspf" %>

</body>
</html>