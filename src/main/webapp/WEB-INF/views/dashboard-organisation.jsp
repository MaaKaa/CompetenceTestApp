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

        <h3 style="color:#535074;">Hello ${organisation.name}!</h3>
        <p style="color: #535074">Welcome to your dashboard. Here's what you can do here:</p>

        <section id="instruction-org">
            <div class="row">
                <div class="col-sm">
                    <div class="card text-center">
                        <a href="#create-project"><b>Step 1:</b> <br>Create Project</a>
                    </div>
                </div>

                <div class="col-sm">
                    <div class="card text-center">
                        <a href="#your-competence-tests"><b>Step 2:</b> <br>Invite volunteers</a>
                    </div>
                </div>

                <div class="col-sm">
                    <div class="card text-center">
                        <a href="#view-results"><b>Step 3:</b> <br>View the results!</a>
                    </div>
                </div>
            </div>
            <br>
        </section>

        <hr>

        <section id="create-project" class="section-bg">
            <div class="container">
                <br>
                <br>
                <h2 class="text-center">Create Project</h2><br>

                <div class="row align-items-center">
                    <div class="col-sm-6">
                        <p>
                            We bet volunteers supported your organisation with many different projects: some office works, events, workshops, etc. Every project was a chance to develop crucial competencies.
                        </p>
                        <p>
                            To check their results, create a project and we will generate a competence test for your volunteers.
                        </p>
                        <p>
                            <b>Project Name:</b> e.g. Charity Run, Cooking workshops, Office works.
                        </p>
                        <p>
                            <b>Project description:</b> Short description that will remind volunteers what this project was about.
                        </p>
                    </div>

                    <div class="col-sm-6">
                        <div class="card">
                            <div class="card-body">
                                <form:form method="post" modelAttribute="competenceTest">
                                    <form:input type="hidden" name="id" path="id"/>
                                    <form:input type="hidden" name="${organisation.id}" path="organisation.id"/>


                                    <div class="form-group">
                                        <label>Project Name:</label>
                                        <form:input path="name" class="form-control"/>
                                        <form:errors path="name" cssClass="text-danger" />
                                    </div>

                                    <div class="form-group">
                                        <label>Project Description:</label>
                                        <form:textarea path="description" class="form-control"/>
                                        <form:errors path="description" cssClass="text-danger"/>
                                    </div>
                                    <div class="form-group">
                                        <input type="submit" value="Create Competence Test!" class="btn btn-save">
                                    </div>
                                </form:form>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
            <br>
            <br>
        </section>

        <hr>

        <section id="your-competence-tests" class="section-bg">
            <div class="container">
                <br>
                <br>
                <h2 class="text-center">Your Competence Tests:</h2>
                <p class="text-center">Here's the list of the Projects you created. Click "Manage | Invite volunteers" to view full project info <br>(including project's statistics)</p><br>

                <div class="row">
                    <table class="table table-hover">
                        <thead>
                        <tr>
                            <th style="width: 5%">ID</th>
                            <th style="width: 25%">Name</th>
                            <th style="width: 45%">Description</th>
                            <!-- <th scope="col">Organisation</th> -->
                            <th style="width: 25%">Actions</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${organisation.competenceTests}" var="competenceTest">
                            <tr>
                                <td>${competenceTest.id}</td>
                                <td>${competenceTest.name}</td>
                                <td>${competenceTest.description}</td>
                                <!-- <td>${competenceTest.organisation}</td> -->
                                <td><a href="/org/logged/competence-test/${competenceTest.id}">Manage | Invite volunteers</a>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>

            </div>
            <br>
            <br>
        </section>

        <hr>

        <section id="view-results" class="section-bg">
            <div class="container">
                <br>
                <br>
                <h2 class="text-center">View results:</h2>
                <p class="text-center">Here you can see the overall statistics for all the projects you created.<br>
                If you want to see stats for a particular project, click "Manage | Invite volunteers" in the section above.</p><br>

                <hr>

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
                        <h5 class="text-center">Volunteers</h5>
                    </div>
                </div>

                <div class="row">
                    <div class="col-sm">
                        <div class="card-body">
                            <c:set var="noOfCompetenceTests" value="${organisation.competenceTests}"/>
                            <p>You created <b>${fn:length(noOfCompetenceTests)}</b> competence test(s).</p>
                            <p>You invited <b>${numberOfVolunteers}</b> volunteer(s) to take the test(s).</p>
                            <p>So far, <b>${numberOfSolutions}</b> volunteer(s) completed your test(s).</p>
                        </div>
                    </div>

                    <div class="col-sm">
                        <div class="card-body">
                            <canvas id="volunteersChart"></canvas>
                        </div>
                    </div>
                </div>

                <hr>
                <br>
                <div class="row justify-content-center">
                    <a href="#create-competence-test"><button class="btn btn-save">Create new Competence Test!</button></a>
                </div>

                <br>
                <br>
            </div>
            <br>
            <br>
        </section>


    <script>
        var ctxRoleAndAutonomy = document.getElementById('roleAndAutonomyChart').getContext('2d');
        var chartRoleAndAutonomy = new Chart(ctxRoleAndAutonomy, {
            type: 'bar',
            data: {
                labels: ['General', 'Accomplished', 'Expert'],
                datasets: [{
                    backgroundColor: ['#413e66', '#1bb1dc', '#065e77'],
                    borderColor: ['#413e66', '#1bb1dc', '#065e77'],
                    data: ['${statsRoleAndAutonomyGeneralFromAllTests}', '${statsRoleAndAutonomyAccomplishedFromAllTests}', '${statsRoleAndAutonomyExpertFromAllTests}']
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
                    data: ['${statsCommunicationPartialFromAllTests}', '${statsCommunicationPlainFromAllTests}', '${statsCommunicationExcellentFromAllTests}']
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
                    data: ['${statsFlexibilityPartialFromAllTests}', '${statsFlexibilityPlainFromAllTests}', '${statsFlexibilityExcellentFromAllTests}']
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
                    data: ['${statsTeamworkPartialFromAllTests}', '${statsTeamworkPlainFromAllTests}', '${statsTeamworkExcellentFromAllTests}']
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
                labels: ['No. of invited volunteers', 'No. of tests completed'],
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

    </div>
    <br>
    <br>
    <%@ include file="footer.jspf" %>
</body>
</html>
