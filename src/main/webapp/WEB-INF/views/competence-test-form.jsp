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

        <b>What was your task within this project?</b><br>
        <form:input path="task"/>
        <form:errors path="task" cssClass="text-danger"/><br>

        <table class="table">
            <thead>
            <tr>
                <th scope="col"></th>
                <th scope="col">Never</th>
                <th scope="col">Sometimes</th>
                <th scope="col">Often</th>
                <th scope="col">Always</th>
                <th scope="col">Not applicable</th>
            </tr>
            </thead>
            <tr>
                <td>When I talked to other people they always understood my message - I delivered it in a complete and correct way (there were no misunderstandings).</td>
                <td><form:radiobutton path="communicationQ1" value="0"/></td>
                <td><form:radiobutton path="communicationQ1" value="1"/></td>
                <td><form:radiobutton path="communicationQ1" value="2"/></td>
                <td><form:radiobutton path="communicationQ1" value="3"/></td>
                <td><form:radiobutton path="communicationQ1" value="0"/></td>
            </tr>
            <tr>
                <td>When I talked to other people I used both verbal and non-verbal (body language) communication.</td>
                <td><form:radiobutton path="communicationQ2" value="0"/></td>
                <td><form:radiobutton path="communicationQ2" value="1"/></td>
                <td><form:radiobutton path="communicationQ2" value="2"/></td>
                <td><form:radiobutton path="communicationQ2" value="3"/></td>
                <td><form:radiobutton path="communicationQ2" value="0"/></td>
            </tr>
            <tr>
                <td>When I talked to people of different age groups and different backgrounds I adjusted my communication style to their needs, so everyone could understand my message.</td>
                <td><form:radiobutton path="communicationQ3" value="0"/></td>
                <td><form:radiobutton path="communicationQ3" value="1"/></td>
                <td><form:radiobutton path="communicationQ3" value="2"/></td>
                <td><form:radiobutton path="communicationQ3" value="3"/></td>
                <td><form:radiobutton path="communicationQ3" value="0"/></td>
            </tr>
            <tr>
                <td>When people had questions, I always answered in a coherent and comprehensive way and they and they found if satisfying. </td>
                <td><form:radiobutton path="communicationQ4" value="0"/></td>
                <td><form:radiobutton path="communicationQ4" value="1"/></td>
                <td><form:radiobutton path="communicationQ4" value="2"/></td>
                <td><form:radiobutton path="communicationQ4" value="3"/></td>
                <td><form:radiobutton path="communicationQ4" value="0"/></td>
            </tr>
            <tr>
                <td>Poeple said that my communication style encourages them to share their thoughts  which mutually stimulate ideas and interactions.</td>
                <td><form:radiobutton path="communicationQ5" value="0"/></td>
                <td><form:radiobutton path="communicationQ5" value="1"/></td>
                <td><form:radiobutton path="communicationQ5" value="2"/></td>
                <td><form:radiobutton path="communicationQ5" value="3"/></td>
                <td><form:radiobutton path="communicationQ5" value="0"/></td>
            </tr>
            <tr>
                <td>I always chose the best way of communication for the given context: face to face, telephone, mail or digital (e.g. e-mail).</td>
                <td><form:radiobutton path="communicationQ6" value="0"/></td>
                <td><form:radiobutton path="communicationQ6" value="1"/></td>
                <td><form:radiobutton path="communicationQ6" value="2"/></td>
                <td><form:radiobutton path="communicationQ6" value="3"/></td>
                <td><form:radiobutton path="communicationQ6" value="0"/></td>
            </tr>
            <tr>
                <td>I acted in a responsible way regarding the tasks I was in charge.</td>
                <td><form:radiobutton path="teamWorkQ1" value="0"/></td>
                <td><form:radiobutton path="teamWorkQ1" value="1"/></td>
                <td><form:radiobutton path="teamWorkQ1" value="2"/></td>
                <td><form:radiobutton path="teamWorkQ1" value="3"/></td>
                <td><form:radiobutton path="teamWorkQ1" value="0"/></td>
            </tr>
            <tr>
                <td>When I presented my ideas to the team, I also listened to others’ ideas and took into consideration their points of view.</td>
                <td><form:radiobutton path="teamWorkQ2" value="0"/></td>
                <td><form:radiobutton path="teamWorkQ2" value="1"/></td>
                <td><form:radiobutton path="teamWorkQ2" value="2"/></td>
                <td><form:radiobutton path="teamWorkQ2" value="3"/></td>
                <td><form:radiobutton path="teamWorkQ2" value="0"/></td>
            </tr>
            <tr>
                <td>When I was making decisions Iconcerning the team I always listened to other peoples’ opinion. </td>
                <td><form:radiobutton path="teamWorkQ3" value="0"/></td>
                <td><form:radiobutton path="teamWorkQ3" value="1"/></td>
                <td><form:radiobutton path="teamWorkQ3" value="2"/></td>
                <td><form:radiobutton path="teamWorkQ3" value="3"/></td>
                <td><form:radiobutton path="teamWorkQ3" value="0"/></td>
            </tr>
            <tr>
                <td>I respected other team members’ roles and the tasks assigned. </td>
                <td><form:radiobutton path="teamWorkQ4" value="0"/></td>
                <td><form:radiobutton path="teamWorkQ4" value="1"/></td>
                <td><form:radiobutton path="teamWorkQ4" value="2"/></td>
                <td><form:radiobutton path="teamWorkQ4" value="3"/></td>
                <td><form:radiobutton path="teamWorkQ4" value="0"/></td>
            </tr>
            <tr>
                <td>When the team members asked me for support I was there for them. </td>
                <td><form:radiobutton path="teamWorkQ5" value="0"/></td>
                <td><form:radiobutton path="teamWorkQ5" value="1"/></td>
                <td><form:radiobutton path="teamWorkQ5" value="2"/></td>
                <td><form:radiobutton path="teamWorkQ5" value="3"/></td>
                <td><form:radiobutton path="teamWorkQ5" value="0"/></td>
            </tr>
        </table>
        <input type="submit" value="Save"><br>
    </form:form>

</div>
</body>
</html>
