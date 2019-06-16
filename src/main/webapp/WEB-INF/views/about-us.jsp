<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
    <title>About us</title>
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
        <h3 style="color:#1bb1dc;">About us</h3>
        <p>
            Volunteers support non-governmental organisations (NGOs) with different activities: they do administrative works (e.g. project coordination, office assistance), (co-)organize events, do promotion and fundraising, share their skills, etc. There are different reasons they do it: sometimes NGO's mission is important for them (e.g. they care for ecology), sometimes they want to gain some job experience, and sometimes they just want to pay-off, because someone helped them in the past.
            But no matter the reason, the fact is that every volunteering experience is an opportunity for them to develop crucial soft skills and transversal competencies that may be valuable on the labour market.
            And through the Competence Test App we want to show them the value of their experience and help them to valuate it.
        </p>
        <p>Thanks to the Competence Test App NGOs can:</p>
            <ol>
                <li>Generate a competence test for a particular project,</li>
                <li>Ask volunteers to fill it in by sending them an automatic invitation,</li>
                <li>View the results: find out what volunteers learnt through this project.</li>
            </ol>

        <p>Benefits:</p>
            <ul>
                <li>NGO becomes more aware on which competencies can be developed within its projects - thus, it becomes more attractive for volunteers.</li>
                <li>Volunteers are empowered - they become more aware of their competencies and learn how to valuate their experience.</li>
            </ul>

        <p><b>***</b></p>
        <p>Competence Test App was designed and created by <a href="http://zrobtowinternecie.pl/marzena-kacprowicz/"> Marzena Kacprowicz </a> – co-author of the <a href="http://www.leverproject.eu/">Lever Model</a> - an international toolkit for the validation of soft competences, based on the Validation of Prior Learning process recommended by Cedefop, and author of <a href="https://leverbasic.pl/">Lever Basic</a> - free online course and competence test, dedicated to Polish volunteers.</p>

    </div>

    <br>
    <br>
    <br>
    <%@ include file="footer.jspf" %>

</body>
</html>
