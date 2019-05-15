<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
    <title>Organisation</title>
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
        <div class="container">
            <header style="color:#1bb1dc;">Hi ${organisation.name}!</header><br>
        </div>

        <section id="create-competence-test" class="section-bg" >
            <div class="container">

                <h3>Create Competence Test</h3>
                <p>Find out what did volunteers learn thanks to your project!</p><br>

                <div class="card">

                    <div class="card-body">
                        <form:form method="post" modelAttribute="competenceTest">
                            <form:input type="hidden" name="id" path="id"/>
                            <form:input type="hidden" name="${organisation.id}" path="organisation.id"/>


                            <div class="form-group col-md-6">
                                <label>Project Name:</label>
                                <form:input path="name" class="form-control"/>
                                <form:errors path="name" cssClass="text-danger" />
                            </div>

                            <div class="form-group col-md-6">
                                <label>Project Description:</label>
                                <form:textarea path="description" class="form-control"/>
                                <form:errors path="description" cssClass="text-danger"/>
                            </div>
                            <input type="submit" value="Save" class="btn btn-save">
                        </form:form>
                    </div>
                </div>
            </div>
        </section>

        <br>

        <section id="your-competence-tests">
            <div class="container">

                <h3>Your Competence Tests:</h3>

                <table class="table table-hover">
                    <thead>
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col">Name</th>
                        <th scope="col">Description</th>
                        <th scope="col">Organisation</th>
                        <th scope="col">Actions</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${competenceTestsByOrg}" var="competenceTestByOrg">
                        <tr>
                            <td>${competenceTestByOrg.id}</td>
                            <td>${competenceTestByOrg.name}</td>
                            <td>${competenceTestByOrg.description}</td>
                            <td>${competenceTestByOrg.organisation}</td>
                            <td><a href="/org/logged/${organisation.id}/competence-test/${competenceTestByOrg.id}">View</a>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </section>

        <br>

        <section id="overall-stats" class="section-bg">
            <div class="container">

                <h3>Overall statistics:</h3>

            </div>
        </section>

    </div>

</body>
</html>
