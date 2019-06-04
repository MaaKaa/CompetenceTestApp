<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
    <title>Manage Competence Test</title>
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
    <div class="container">
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <a href="<c:url value="/org/logged/"/>">Back to Organisation's Dashboard</a><br>
        <br>

        <h2 style="color:#1bb1dc;">Manage Competence Test</h2>

        <section id="project-info" class="section-bg">
            <div class="container">
                <div class="card">
                    <div class="card-body">
                        <h5>Project name: ${competenceTest.name}</h5>
                        <p>Project description: ${competenceTest.description}</p><br>
                    </div>
                </div>
            </div>
            <br>
        </section>


        <section id="invite-volunteers">
            <div class="container">
                <br>
                <h2>Invite volunteers!</h2><br>

                <form:form method="post" modelAttribute="volunteer">
                    <form:input type="hidden" path="id" name="id"/>
                    <form:input type="hidden" path="competenceTests" name="competenceTests" value="${competenceTest.id}"/>

                    <div class="row">
                        <div class="col">
                            <form:input path="name" class="form-control" placeholder="Name"/>
                            <form:errors path="name" cssClass="text-danger"/>
                        </div>

                        <div class="col">
                            <form:input path="email" class="form-control" placeholder="Email"/>
                            <form:errors path="email" cssClass="text-danger"/>
                        </div>

                        <div class="col">
                            <input type="submit" value="Save" class="btn btn-save">
                        </div>
                    </div>

                </form:form> <br>
            </div>
        </section>


        <section id="invited-volunteers" class="section-bg">
            <div class="container">
                <br>
                <h2>Invited Volunteers:</h2><br>

                <table class="table table-hover">
                    <thead>
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col">Name</th>
                        <th scope="col">E-mail</th>
                    </tr>
                    </thead>

                    <tbody>
                    <c:forEach items="${competenceTest.volunteers}" var="invitedVolunteer">
                        <tr>
                            <td>${invitedVolunteer.id}</td>
                            <td>${invitedVolunteer.name}</td>
                            <td>${invitedVolunteer.email}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <br>
            </div>
        </section>

    <section id="test-stats" class="section-bg">
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
                        <c:set var="noOfCompleted" value="${competenceTest.solutions}"/>
                        <c:set var="noOfInvited" value="${competenceTest.volunteers}"/>
                        You invited <b>${fn:length(noOfInvited)}</b> volunteers to take this tests. <b>${fn:length(noOfCompleted)}</b> of them completed this test.
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
                <a href="<c:url value="/org/logged/#create-competence-test"/>"><button class="btn btn-save">Create new Competence Test!</button></a>
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
                    data: ['${statsRoleAndAutonomyGeneral}', '${statsRoleAndAutonomyAccomplished}', '${statsRoleAndAutonomyExpert}']
                }]
            },
            options: {
                legend: {
                    display: false
                }
            }
        });

        var ctxCommunication = document.getElementById('communicationChart').getContext('2d');
        var chartCommunication = new Chart(ctxCommunication, {
            type: 'bar',
            data: {
                labels: ['Partial', 'Plain', 'Excellent'],
                datasets: [{
                    label: 'Communication results',
                    backgroundColor: ['#413e66', '#1bb1dc', '#065e77'],
                    borderColor: ['#413e66', '#1bb1dc', '#065e77'],
                    data: ['${statsCommunicationPartial}', '${statsCommunicationPlain}', '${statsCommunicationExcellent}']
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
                    data: ['${statsFlexibilityPartial}', '${statsFlexibilityPlain}', '${statsFlexibilityExcellent}']
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
                    data: ['${statsTeamworkPartial}', '${statsTeamworkPlain}', '${statsTeamworkExcellent}']
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
                    data: ['${fn:length(noOfInvited)}', '${fn:length(noOfCompleted)}']
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

