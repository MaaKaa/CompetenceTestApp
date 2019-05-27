<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
    <title>Volunteer's Dashboard</title>
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
        <div class="container">
            <h3><header style="color:#1bb1dc;">Hello ${volunteer.name}!</header></h3><br>
            <h2>Your competence tests:</h2>
        </div>


        <section id="your-competenceTests-2" >
            <div class="container">
                <h3>All Invitations:</h3>
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
                    <c:forEach items="${volunteer.competenceTests}" var="competenceTest">
                        <tr>
                            <td>${competenceTest.id}</td>
                            <td>${competenceTest.name}</td>
                            <td>${competenceTest.description}</td>
                            <td>${competenceTest.organisation}</td>
                            <td><a href="/vol/logged/competenceTest/${competenceTest.id}">Take the test!</a>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <br>
            </div>
        </section>

        <section id="your-competenceTests" >
            <div class="container">
                <h3>Not solved:</h3>
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
                    <c:forEach items="${competenceTestsWithoutSolutions}" var="testWithoutSolution">
                        <tr>
                            <td>${testWithoutSolution.id}</td>
                            <td>${testWithoutSolution.name}</td>
                            <td>${testWithoutSolution.description}</td>
                            <td>${testWithoutSolution.organisation}</td>
                            <td><a href="/vol/logged/competenceTest/${testWithoutSolution.id}">Take the test!</a>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <br>
            </div>
        </section>

        <section id="your-solved-tests">
            <div class="container">
                <h3>Solved:</h3>
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
                    <c:forEach items="${volunteer.solutions}" var="solutionByVolunteer">
                        <tr>
                            <td>${solutionByVolunteer.competenceTest.id}</td>
                            <td>${solutionByVolunteer.competenceTest.name}</td>
                            <td>${solutionByVolunteer.competenceTest.description}</td>
                            <td>${solutionByVolunteer.competenceTest.organisation}</td>
                            <td><a href="/vol/logged/competenceTest/${solutionByVolunteer.competenceTest.id}/results">View results</a>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </section>
    </div>

    <br>
    <br>
    <%@ include file="footer.jspf" %>

</body>
</html>
