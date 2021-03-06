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

            <div class="row">
                <div class="col-sm-4">

                </div>
                <div class="col-sm-4">

                </div>
                <div class="col-sm-4 text-right">
                    <a href="<c:url value="/login"/>">Log out</a><br>
                </div>
            </div>

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
                            <th style="width: 5%">ID</th>
                            <th style="width: 20%">Name</th>
                            <th style="width: 45%">Description</th>
                            <th style="width: 15%">Organisation</th>
                            <th style="width: 15%">Actions</th>
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
                    <hr>
                    <br>

                    <h3 class="text-center">Completed:</h3>
                    <table class="table table-hover">
                        <thead>
                        <tr>
                            <th style="width: 5%">ID</th>
                            <th style="width: 20%">Name</th>
                            <th style="width: 45%">Description</th>
                            <th style="width: 15%">Organisation</th>
                            <th style="width: 15%">Actions</th>
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

                <div class="row">
                    <div class="col-sm">
                        <br>
                        <h5 class="text-center">Experience Complexity Level:</h5>
                        <h6 class="text-center">This outcome shows how advanced the volunteers are in terms of responsibility and autonomy.</h6>
                    </div>
                </div>

                <div class="row align-items-center">
                    <div class="col-sm">
                        <div class="card-body">
                            <canvas id="roleAndAutonomyChart"></canvas>
                        </div>
                    </div>

                    <div class="col-sm">
                        <div class="card-body">
                            <h6><b>General:</b> Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</h6>
                            <h6><b>Accomplished:</b> Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</h6>
                            <h6><b>Expert:</b> Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</h6>
                        </div>
                    </div>
                </div>

                <hr>
                <br>
                <div class="row">
                    <div class="col-sm">
                        <h5 class="text-center">Competencies results:</h5>
                        <h6 class="text-center">These outcomes show how advanced the volunteers are in using a particular competence. It was calculated on the basis of competence indicators that evaluate volunteer's skills and knowledge connected with a given competence.</h6>
                    </div>
                </div>

                <div class="row">
                    <div class="col-sm">
                        <div class="card-body">
                            <h6 class="text-center">Communication</h6>
                            <canvas id="communicationChart"></canvas>
                        </div>
                    </div>

                    <div class="col-sm">
                        <div class="card-body">
                            <h6 class="text-center">Flexibility</h6>
                            <canvas id="flexibilityChart"></canvas>
                        </div>
                    </div>

                    <div class="col-sm">
                        <div class="card-body">
                            <h6 class="text-center">Teamwork</h6>
                            <canvas id="teamworkChart"></canvas>
                        </div>
                    </div>
                </div>

                <hr>
                <br>
                <div class="row">
                    <div class="col-sm">
                        <h5 class="text-center">Invitations vs. completed</h5>
                    </div>
                </div>

                <div class="row">
                    <div class="col-sm">
                        <div class="card-body">
                            <c:set var="noOfInvitations" value="${volunteer.competenceTests}"/>
                            <c:set var="noOfSolutions" value="${volunteer.solutions}"/>
                            <p>You was invited to <b>${fn:length(noOfInvitations)}</b> competence test(s).</p>
                            <p>So far, you completed <b>${fn:length(noOfSolutions)}</b> test(s).</p>
                        </div>
                    </div>

                    <div class="col-sm">
                        <div class="card-body">
                            <canvas id="volunteersChart"></canvas>
                        </div>
                    </div>
                </div>

            </section>


    </div>

    <script>
        var ctxRoleAndAutonomy = document.getElementById('roleAndAutonomyChart').getContext('2d');
        var chartRoleAndAutonomy = new Chart(ctxRoleAndAutonomy, {
            type: 'bar',
            data: {
                labels: ['General', 'Accomplished', 'Expert'],
                datasets: [{
                    backgroundColor: ['#413e66', '#1bb1dc', '#065e77'],
                    borderColor: ['#413e66', '#1bb1dc', '#065e77'],
                    data: ['${roleAndAutonomyResultGeneral}', '${roleAndAutonomyResultAccomplished}', '${roleAndAutonomyResultExpert}']
                }]
            },
            options: {
                legend: {
                    display: false
                }
            }
        });

        var ctxCommunication = document.getElementById('communicationChart').getContext('2d');
        var chartComunication = new Chart(ctxCommunication, {
            type: 'bar',
            data: {
                labels: ['Partial', 'Plain', 'Excellent'],
                datasets: [{
                    label: 'Communication results',
                    backgroundColor: ['#413e66', '#1bb1dc', '#065e77'],
                    borderColor: ['#413e66', '#1bb1dc', '#065e77'],
                    data: ['${communicationResultPartial}', '${communicationResultPlain}', '${communicationResultExcellent}']
                }]
            },
            options: {
                legend: {
                    display: false
                }
            }
        });

        var ctxFlexibility = document.getElementById('flexibilityChart').getContext('2d');
        var chartFlexibility = new Chart(ctxFlexibility, {
            type: 'bar',
            data: {
                labels: ['Partial', 'Plain', 'Excellent'],
                datasets: [{
                    label: 'Flexibility results',
                    backgroundColor: ['#413e66', '#1bb1dc', '#065e77'],
                    borderColor: ['#413e66', '#1bb1dc', '#065e77'],
                    data: ['${flexibilityResultPartial}', '${flexibilityResultPlain}', '${flexibilityResultExcellent}']
                }]
            },
            options: {
                legend: {
                    display: false
                }
            }
        });

        var ctxTeamwork = document.getElementById('teamworkChart').getContext('2d');
        var chartTeamwork = new Chart(ctxTeamwork, {
            type: 'bar',
            data: {
                labels: ['Partial', 'Plain', 'Excellent'],
                datasets: [{
                    label: 'Teamwork results',
                    backgroundColor: ['#413e66', '#1bb1dc', '#065e77'],
                    borderColor: ['#413e66', '#1bb1dc', '#065e77'],
                    data: ['${teamworkResultPartial}', '${teamworkResultPlain}', '${teamworkResultExcellent}']
                }]
            },
            options: {
                legend: {
                    display: false,
                    fullWidth: false
                }
            }
        });

        var ctxVolunteers = document.getElementById('volunteersChart').getContext('2d');
        var chartVolunteers = new Chart(ctxVolunteers, {
            type: 'pie',
            data: {
                labels: ['No. of invitations received', 'No. of tests completed'],
                datasets: [{
                    label: 'Volunteers',
                    backgroundColor: ['#413e66', '#1bb1dc'],
                    borderColor: ['#413e66', '#1bb1dc'],
                    data: ['${numberOfVolunteers}', '${numberOfSolutions}']
                }]
            },
            options: {
                legend: {
                    position: 'right'
                }
            }
        });

    </script>

    <br>
    <br>
    <%@ include file="footer.jspf" %>

</body>
</html>
