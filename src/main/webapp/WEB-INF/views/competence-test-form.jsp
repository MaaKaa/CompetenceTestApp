<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<html>
<head>
    <title>Competence Test</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>
<div class="container">
    <h2>Competence Test</h2>
    <form:form method="post" modelAttribute="solution">

        <b>What was your role in the project?</b><br>
        <form:radiobutton path="role" value="1"/>I carried out operational or simple tasks under the supervision or the direct guidance of others. <br>
        <form:radiobutton path="role" value="2"/>I completed easy tasks in autonomy.<br>
        <form:radiobutton path="role" value="3"/>I carried out complex tasks under given instructions; supervise and support the work and the performance of others.<br>
        <form:radiobutton path="role" value="4"/>I managed the professional development of people and teams; I managed and transformed the context; I developed new ideas and I fostered innovation. <br>


        <b>What kind of tasks were you in charge of?</b><br>
        <form:radiobutton path="autonomy" value="1"/>simple; recurrent that required easy tools and simple rules.<br>
        <form:radiobutton path="autonomy" value="2"/>recurrent that required the choice of proper resources and tools as well as to adapt the  behaviour accordingly.<br>
        <form:radiobutton path="autonomy" value="3"/>specialised; sometimes unexpected that required creative solutions.<br>
        <form:radiobutton path="autonomy" value="4"/>complex and unpredicatble, not necessarily specialised that integrated knowledge from different fields.<br>

        <input type="submit" value="Save"><br>
    </form:form>

</div>
</body>
</html>
