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
                            <input type="submit" value="Create Competence Test!" class="btn btn-save">
                        </form:form>
                    </div>
                </div>
            </div>
            <br>
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
                <br>
                <h3>Statistics:</h3>

                <div class="row">
                    <div class="col-sm">
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
                            <p><b>General:</b> Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                            <p><b>Accomplished:</b> Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                            <p><b>Expert:</b> Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
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
                            You created <b>[number]</b> of competence tests. Altogether, you invited <b>[number]</b> of volunteers to take these tests. Finally, <b>${fn:length(noOfCompleted)}</b> volunteers completed your tests.
                        </div>
                    </div>

                    <div class="col-sm">
                        <div class="card-body">
                            <canvas id="volunteersChart"></canvas>
                            </p><c:set var="noOfCompleted" value="${competenceTest.solutions}"/><!-- Do poprawy -->
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
                    data: [30, 15]
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
