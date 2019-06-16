<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
    <title>Pruvacy Policy</title>
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
        <h3 style="color:#1bb1dc;">Privacy policy</h3>

        <h4>BACKGROUND INFORMATION</h4>
        <p>The Privacy Policy describes the most important information concerning the principles of personal data processing by Competence Test App Team (hereinafter referred to as the Team).
            Team is the Administrator of the personal data. In order to contact the Team, please send an email to hi@competencetest.com. </p>

        <h4>PLACE AND METHOD OF PERSONAL DATA PROCESSING </h4>
        <p>The personal data processed by the Team is stored electronically on a rented server and, to a limited extent, on office computers.
            The Team ensures a high level of security in places where it processes personal data.</p>

        <h4>WHO IS ENTRUSTED WITH PERSONAL DATA?</h4>
        <p>The Team does not transfer the personal data to any third parties, third countries or international organisations.</p>

        <h4>THE RIGHTS OF DATA SUBJECTS</h4>
        <p>Every person whose data is processed by the Team has the right to do so:</p>
        <ul>
            <li>Access to the content of personal data, as well as their correction and updating.</li>
            <li>Withdrawal of consent to the processing of personal data at any time. The User's data may be removed from the Teams' database at the User's request. The Team will inform the applicant about the course of this process.</li>
            <li>Raising an objection, and demanding that the processing of personal data be limited.</li>
            <li>Submit a complaint to the supervisory authority responsible for personal data protection in the event that the User considers the processing of his personal data to be in breach of the law;</li>
            <li>Information on the right to data transfer.</li>
        </ul>
        <p>In order to contact the Team, please send an email to hi@competencetest.com.</p>

        <h4>WHAT PERSONAL DATA ARE PROCESSED?</h4>
        <ul>
            <li><u>Type of data collected:</u> Volunteer’s name and email address.</li>
            <li><u>Purpose of data collection:</u> sending a volunteer an invitation to take the competence test.</li>
            <li><u>Legal basis:</u> Processing of data is based on the consent of the participants, given during registration. In any case, the provision of data is voluntary, but failure to provide such data will result in the impossibility of using the Competence Test App.</li>
            <li><u>Recipients of the data:</u> The Team does not transfer the personal data to any third parties, third countries or international organisations.</li>
            <li><u>Data retention period:</u> based on the legitimate interest of the Team for the purpose of managing relations, the data of the users are stored until the withdrawal of their consent or until the end of the Teams’ activities. The data of a user may be deleted at his/her request at any time. In order to do so, the user should contact the Team at hi@competencetest.com.</li>
        </ul>
    </div>

    <br>
    <br>
    <br>
    <%@ include file="footer.jspf" %>

</body>
</html>
