<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
    <title>Competence Test Results</title>
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
    <div class="container">

        <div class="row">
            <div class="col-sm-4">
                <a href="<c:url value="/vol/logged/"/>">Back to Dashboard</a><br>
                <br>
            </div>
            <div class="col-sm-4">

            </div>
            <div class="col-sm-4 text-right">
                <a href="<c:url value="/login"/>">Log out</a><br>
            </div>
        </div>

        <section id="test-info" class="section-bg">
            <div class="container">
                <br>
                <h2 style="color:#1bb1dc;" class="text-center">Competence Test: "${solutionByCompetenceTestIdAndVolunteerId.competenceTest.name}" Results</h2>
                <p class="text-center">Volunteer's name: ${volunteer.name}</p>
            </div>
            <br>
        </section>

        <hr>

        <section id="experience-complexity-level-result" class="section-bg">
            <div class="container">
                <h5 class="text-center">Experience Complexity Level:</h5>
                <h6 class="text-center">This outcome shows how advanced you were in this project in terms of responsibility and autonomy:</h6>
                <h3 class="text-center">${solutionByCompetenceTestIdAndVolunteerId.resultRoleAndAutonomy} </h3><br>
            </div>
        </section>

        <hr>

        <section id="competencies-level-result" class="section-bg">
            <div class="container">
                <br>
                <h5 class="text-center">Competencies results:</h5>
                <h6 class="text-center">These outcomes show how advanced you were in this project in using a particular competence. It was calculated on the basis of competence indicators that evaluate your skills and knowledge connected with a given competence.</h6>

                <br>

                <table class="table">
                    <thead>
                    <tr>
                        <th scope="col">Name</th>
                        <th scope="col">Result</th>
                        <th scope="col">Description</th>
                    </tr>
                    </thead>
                    <tr>
                        <td>Communication</td>
                        <td>${solutionByCompetenceTestIdAndVolunteerId.communicationResult}</td>
                        <td>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. </td>
                    </tr>
                    <tr>
                        <td>Flexibility</td>
                        <td>${solutionByCompetenceTestIdAndVolunteerId.flexibilityResult}</td>
                        <td>Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae.</td>
                    </tr>
                    <tr>
                        <td>Teamwork</td>
                        <td>${solutionByCompetenceTestIdAndVolunteerId.teamWorkResult}</td>
                        <td>Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.</td>
                    </tr>
                </table>

            </div>
        </section>

            <br>
            <br>
        </div>
    </div>

    <%@ include file="footer.jspf" %>

</body>
</html>