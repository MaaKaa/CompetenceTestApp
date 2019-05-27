<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
    <title>Organisation's Dashboard</title>
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
        <br>
        <br>
        <br>
        <div class="container">
            <h3><header style="color:#1bb1dc;">Hello ${organisation.name}!</header></h3><br>
        </div>

        <section id="create-competence-test" class="section-bg" >
            <div class="container">
                <br>
                <h3>Create Competence Test</h3>
                <p>Find out what did volunteers learnt thanks to your project!</p>

                <div class="card">

                    <div class="card-body">
                        <form:form method="post" modelAttribute="competenceTest">
                            <form:input type="hidden" name="id" path="id"/>
                            <form:input type="hidden" name="${organisation.id}" path="organisation.id"/>


                            <div class="form-group col-md-12">
                                <label>Project Name:</label>
                                <form:input path="name" class="form-control" placeholder="e.g. Charity Run, Cooking workshops, Office works"/>
                                <form:errors path="name" cssClass="text-danger" />
                            </div>

                            <div class="form-group col-md-12">
                                <label>Project Description:</label>
                                <form:textarea path="description" class="form-control" placeholder="Short description that will remind volunteers what this project was about."/>
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
                        <th scope="col">Link</th>
                        <th scope="col">Organisation</th>
                        <th scope="col">Actions</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${organisation.competenceTests}" var="competenceTest">
                        <tr>
                            <td>${competenceTest.id}</td>
                            <td>${competenceTest.name}</td>
                            <td>${competenceTest.description}</td>
                            <td>${competenceTest.link}</td>
                            <td>${competenceTest.organisation}</td>
                            <td><a href="/org/logged/competence-test/${competenceTest.id}">View | Invite volunteers</a>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </section>

        <section id="overall-stats" class="section-bg">
            <div class="container">
                <br>
                <h3>Overall statistics:</h3>

                <p>Number of volunteers who completed all your tests: </p><br>
                <h5>Role and Autonomy result:</h5>
                <p>General:</p>
                <p>Accomplished:</p>
                <p>Expert:</p>

                <h5>Communication</h5>
                <p>Partial:</p>
                <p>Plain:</p>
                <p>Excellent:</p>

                <h5>Flexibility</h5>
                <p>Partial:</p>
                <p>Plain:</p>
                <p>Excellent:</p>

                <h5>Teamwork</h5>
                <p>Partial:</p>
                <p>Plain:</p>
                <p>Excellent:</p>

            </div>
        </section>

    <br>
    <br>
    <%@ include file="footer.jspf" %>

</body>
</html>
