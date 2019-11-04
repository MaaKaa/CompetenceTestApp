<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
    <title>Admin's Dashboard</title>
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
        <h3><header style="color:#1bb1dc;">Admin's Dashboard</header></h3><br>
    </div>

    <section id="users" class="section-bg" >
        <div class="container">

            <h3>Users</h3>

            <h5>Organisations</h5>

            <table class="table table-hover">
                <thead>
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">Name</th>
                    <th scope="col">E-mail</th>
                    <th scope="col">Description</th>
                    <th scope="col">Fields of Activity</th>
                    <th scope="col">City</th>
                    <th scope="col">Country</th>
                    <th scope="col">Website</th>
                    <th scope="col">Actions</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${organisations}" var="organisation">
                    <tr>
                        <td>${organisation.id}</td>
                        <td>${organisation.name}</td>
                        <td>${organisation.email}</td>
                        <td>${organisation.description}</td>
                        <td>To be updated</td>
                        <td>${organisation.city}</td>
                        <td>${organisation.country}</td>
                        <td>${organisation.website}</td>
                        <td><a href="/admin/deleteOrganisation/${organisation.id}">Delete</a>
                    </tr>
                </c:forEach>
                </tbody>
            </table>

            <h5>Volunteers</h5>

            <table class="table table-hover">
                <thead>
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">Name</th>
                    <th scope="col">E-mail</th>
                    <th scope="col">Age</th>
                    <th scope="col">Gender</th>
                    <th scope="col">City</th>
                    <th scope="col">Country</th>
                    <th scope="col">Competence Tests</th>
                    <th scope="col">Solutions</th>
                    <th scope="col">Actions</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${volunteers}" var="volunteer">
                    <tr>
                        <td>${volunteer.id}</td>
                        <td>${volunteer.name}</td>
                        <td>${volunteer.email}</td>
                        <td>${volunteer.age}</td>
                        <td>${volunteer.gender}</td>
                        <td>${volunteer.city}</td>
                        <td>${volunteer.country}</td>
                        <td>${volunteer.competenceTests}</td>
                        <td>${volunteer.solutions}</td>
                        <td><a href="/admin/deleteVolunteer/${volunteer.id}">Delete</a>
                    </tr>
                </c:forEach>
                </tbody>
            </table>

            <h3>Competence Tests</h3>

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
                <c:forEach items="${competenceTests}" var="competenceTest">
                    <tr>
                        <td>${competenceTest.id}</td>
                        <td>${competenceTest.name}</td>
                        <td>${competenceTest.description}</td>
                        <td>${competenceTest.organisation}</td>
                        <td><a href="/admin/deleteCompetenceTest/${competenceTest.id}">Delete</a>
                    </tr>
                </c:forEach>
                </tbody>
            </table>

            <h3>Solutions</h3>

            <table class="table table-hover">
                <thead>
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">Created</th>
                    <th scope="col">Competence Test's name</th>
                    <th scope="col">Volunteer's name</th>
                    <th scope="col">Actions</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${solutions}" var="solution">
                    <tr>
                        <td>${solution.id}</td>
                        <td>${solution.created}</td>
                        <td>${solution.competenceTest}</td>
                        <td>${solution.volunteer}</td>
                        <td><a href="/admin/deleteSolution/${solution.id}">Delete</a>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </section>

    <br>
    <br>
    <br>
    <%@ include file="footer.jspf" %>

</body>
</html>
