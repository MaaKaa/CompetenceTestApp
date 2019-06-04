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

    <!-- Chart.js -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,500,600,700,700i|Montserrat:300,400,500,600,700" rel="stylesheet">

    <!-- Libraries CSS Files -->
    <link href="/resources/css/lib/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="/resources/css/lib/ionicons/css/ionicons.min.css" rel="stylesheet">
    <link href="/resources/css/lib/animate/animate.min.css" rel="stylesheet">
</head>
<body>
    <%@ include file="header.jspf" %>

        <br>
        <br>
        <br>
        <br>
        <br>
        <div class="container">
            <h3 style="color:#535074;">Hello ${volunteer.name}!</h3>
            <p style="color: #535074">Welcome to your dashboard. You can manage your competence tests here.</p>

            <section id="your-competence-tests" class="section-bg">
                <div class="container">
                    <br>
                    <br>
                    <h2 class="text-center">Your competence tests:</h2>

                    <br>

                    <!--
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

                    <br> -->

                    <h3 class="text-center">Not completed:</h3>
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

                    <h3 class="text-center">Completed:</h3>
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

                <br>
                <br>
            </section>

            <hr>

            <section id="your-results" class="section-bg">
                <div class="container">
                    <br>
                    <br>
                    <h2 class="text-center">Your results:</h2>
                    <p class="text-center">Here you can see the overall statistics for all the competence tests you completed.<br>
                        If you want to see stats for a particular competence test, click "View results" in the table above.</p><br>
                </div>
            </section>


    </div>

    <br>
    <br>
    <%@ include file="footer.jspf" %>

</body>
</html>
