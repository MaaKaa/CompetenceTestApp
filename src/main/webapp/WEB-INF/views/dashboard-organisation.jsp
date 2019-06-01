<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
    <title>Organisation's Dashboard</title>
    <script src="<c:url value="/webjars/jquery/3.0.0/jquery.min.js"/>"></script>
    <script src="<c:url value="/webjars/bootstrap/4.3.1/js/bootstrap.min.js"/>"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
    <link href="<c:url value="/webjars/bootstrap/4.3.1/css/bootstrap.min.css"/>" rel="stylesheet">
    <link href="<c:url value="/resources/css/main.css"/>" rel="stylesheet">

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
                            <td><a href="/org/logged/competence-test/${competenceTest.id}">Manage | Invite volunteers</a>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </section>

        <section id="overall-stats" class="section-bg">
            <div class="container">
                <h3>Tests' statistics:</h3>

                <div class="row">
                    <div class="col-sm">
                        <div class="card-body">
                            <h5 align="center">Volunteers:</h5>
                            <canvas id="volunteersChart"></canvas>
                            </p><c:set var="noOfCompleted" value="${competenceTest.solutions}"/><!-- Do poprawy -->
                        </div>
                    </div>

                    <div class="col-sm">
                        <div class="card-body">
                            <h5 align="center">Role and Autonomy results:</h5><br>
                            <canvas id="roleAndAutonomyChart"></canvas>
                            <!-- <p>General: ${statsRoleAndAutonomyGeneralFromAllTests}</p>
                            <p>Accomplished: ${statsRoleAndAutonomyAccomplishedFromAllTests}</p>
                            <p>Expert: ${statsRoleAndAutonomyExpertFromAllTests}</p> -->
                        </div>
                    </div>

                </div>

                <div class="row">
                    <div class="col-sm">
                        <div class="card-body">
                            <h5 align="center">Communication results</h5>
                            <canvas id="communicationChart"></canvas>
                            <!-- <p>Partial: ${statsCommunicationPartialFromAllTests}</p>
                            <p>Plain: ${statsCommunicationPlainFromAllTests}</p>
                            <p>Excellent: ${statsCommunicationExcellentFromAllTests}</p> -->
                        </div>
                    </div>

                    <div class="col-sm">
                        <div class="card-body">
                            <h5 align="center">Flexibility results</h5>
                            <canvas id="flexibilityChart"></canvas>
                            <!-- <p>Partial: ${statsFlexibilityPartialFromAllTests}</p>
                            <p>Plain: ${statsFlexibilityPlainFromAllTests}</p>
                            <p>Excellent: ${statsFlexibilityExcellentFromAllTests}</p> -->
                        </div>
                    </div>

                    <div class="col-sm">
                        <div class="card-body">
                            <h5 align="center">Teamwork results</h5>
                            <canvas id="teamworkChart"></canvas>
                            <!-- <p>Partial: ${statsTeamworkPartialFromAllTests}</p>
                            <p>Plain: ${statsTeamworkPlainFromAllTests}</p>
                            <p>Excellent: ${statsTeamworkExcellentFromAllTests}</p> -->
                        </div>
                    </div>

                </div>

                <h5>Description:</h5>
                <p>You invited [numer] of volunteers. ${fn:length(noOfCompleted)} of them completed the test. </p>
                <p>This chart shows the main result of the Competence Test. [opis]</p>
            </div>
        </section>


    <script>
        var ctx = document.getElementById('volunteersChart').getContext('2d');
        var chart = new Chart(ctx, {
            type: 'pie',
            data: {
                labels: ['No. of invited volunteers', 'No. of tests completed'],
                datasets: [{
                    label: 'Volunteers',
                    backgroundColor: ['#413e66', '#1bb1dc'],
                    borderColor: ['#413e66', '#1bb1dc'],
                    data: [30, 15]
                }]
            },
            options: {
                legend: {
                    position: 'right',
                }
            }
        });

        var ctx = document.getElementById('roleAndAutonomyChart').getContext('2d');
        var chart = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: ['General', 'Accomplished', 'Expert'],
                datasets: [{
                    backgroundColor: ['#413e66', '#1bb1dc', '#065e77'],
                    borderColor: ['#413e66', '#1bb1dc', '#065e77'],
                    data: [${statsRoleAndAutonomyGeneralFromAllTests}, ${statsRoleAndAutonomyAccomplishedFromAllTests}, ${statsRoleAndAutonomyExpertFromAllTests}]
                }]
            },
            options: {
                legend: {
                    display: false,
                }
            }
        });

        var ctx = document.getElementById('communicationChart').getContext('2d');
        var chart = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: ['Partial', 'Plain', 'Excellent'],
                datasets: [{
                    label: 'Communication results',
                    backgroundColor: ['#413e66', '#1bb1dc', '#065e77'],
                    borderColor: ['#413e66', '#1bb1dc', '#065e77'],
                    data: [${statsCommunicationPartialFromAllTests}, ${statsCommunicationPlainFromAllTests}, ${statsCommunicationExcellentFromAllTests}]
                }]
            },
            options: {
                legend: {
                    display: false,
                }
            }
        });

        var ctx = document.getElementById('flexibilityChart').getContext('2d');
        var chart = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: ['Partial', 'Plain', 'Excellent'],
                datasets: [{
                    label: 'Flexibility results',
                    backgroundColor: ['#413e66', '#1bb1dc', '#065e77'],
                    borderColor: ['#413e66', '#1bb1dc', '#065e77'],
                    data: [${statsFlexibilityPartialFromAllTests}, ${statsFlexibilityPlainFromAllTests}, ${statsFlexibilityExcellentFromAllTests}]
                }]
            },
            options: {
                legend: {
                    display: false,
                }
            }
        });

        var ctx = document.getElementById('teamworkChart').getContext('2d');
        var chart = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: ['Partial', 'Plain', 'Excellent'],
                datasets: [{
                    label: 'Teamwork results',
                    backgroundColor: ['#413e66', '#1bb1dc', '#065e77'],
                    borderColor: ['#413e66', '#1bb1dc', '#065e77'],
                    data: [${statsTeamworkPartialFromAllTests}, ${statsTeamworkPlainFromAllTests}, ${statsTeamworkExcellentFromAllTests}]
                }]
            },
            options: {
                legend: {
                    display: false,
                    fullWidth: false,
                }
            }
        });
    </script>
    <br>
    <br>
    <%@ include file="footer.jspf" %>
</body>
</html>
