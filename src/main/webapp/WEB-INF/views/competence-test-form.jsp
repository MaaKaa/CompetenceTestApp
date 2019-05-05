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
        <form:radiobuttons items="${roles}" path="role" /><br>

        <b>What kind of tasks were you in charge of?</b><br>
        <form:radiobuttons items="${autonomy}" path="autonomy" /><br>

        <input type="submit" value="Save"><br>
    </form:form>

</div>
</body>
</html>
