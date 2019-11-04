<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<html>
<head>
    <title>Competence Test</title>
    <link href="<c:url value="/webjars/bootstrap/4.3.1/css/bootstrap.min.css"/>" rel="stylesheet">
    <script src="<c:url value="/webjars/bootstrap/4.3.1/js/bootstrap.min.js"/>"></script>
    <link href="<c:url value="/resources/css/main.css"/>" rel="stylesheet">
    <script src="<c:url value="/webjars/jquery/3.0.0/jquery.min.js"/>"></script>

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,500,600,700,700i|Montserrat:300,400,500,600,700" rel="stylesheet">

    <!-- Libraries CSS Files -->
    <link href="/resources/lib/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="/resources/lib/ionicons/css/ionicons.min.css" rel="stylesheet">
    <link href="/resources/lib/animate/animate.min.css" rel="stylesheet">
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
        <a href="<c:url value="/vol/logged/"/>">Back to the Dashboard</a>
        <br>
        <br>
        <h3 style="color:#1bb1dc;">Project name: ${competenceTest.name}</h3>
        <p>Project description: ${competenceTest.description}</p>


        <h3>Instructions</h3>
        <b>Filling in the questionnaire will take only few minutes. Try to do it in one go without interruptions.
        All questions need to be answered. Have fun! :)</b>
        <br>
        <hr>

        <h3>Questions</h3>
        <form:form method="post" modelAttribute="solution">

            <form:input type="hidden" path="id"/>
            <form:input type="hidden" path="competenceTest" name="ctId" value="${competenceTest.id}"/>
            <form:input type="hidden" path="volunteer.id" name="id" value="${volunteer.id}"/>

            <div class="form-group">
                <label><b>1. What was your role in this project?</b></label><br>
                <form:radiobutton path="role" value="1"/> I carried out operational or simple tasks under the supervision or the direct guidance of others. <br>
                <form:radiobutton path="role" value="2"/> I completed easy tasks in autonomy.<br>
                <form:radiobutton path="role" value="3"/> I carried out complex tasks under given instructions; supervise and support the work and the performance of others.<br>
                <form:radiobutton path="role" value="4"/> I managed the professional development of people and teams; I managed and transformed the context; I developed new ideas and I fostered innovation. <br>
            </div><br>

            <div class="form-group">
                <label><b>2. What kind of tasks were you in charge of?</b></label><br>
                <form:radiobutton path="autonomy" value="1"/> Simple; recurrent that required easy tools and simple rules.<br>
                <form:radiobutton path="autonomy" value="2"/> Recurrent that required the choice of proper resources and tools as well as to adapt the  behaviour accordingly.<br>
                <form:radiobutton path="autonomy" value="3"/> Specialised; sometimes unexpected that required creative solutions.<br>
                <form:radiobutton path="autonomy" value="4"/> Complex and unpredicatble, not necessarily specialised that integrated knowledge from different fields.<br>
            </div><br>

            <div class="form-group">
                <label><b>3. Describe briefly your tasks within this project:</b></label><br>
                <form:textarea path="task" class="form-control"/>
                <form:errors path="task" cssClass="text-danger"/><br>
            </div><br>

            <div class="form-group">
               <b>4. Below you will find 14 statements. Please indicate the extent to which you believe these statements apply to you.<br>
                    Ensure that you are describing what you are like rather than what you want to be like.
                   Don’t think too long about the statements; there are no right or wrong answers.</b><br>

                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th scope="col"></th>
                            <th scope="col"></th>
                            <th scope="col">Never</th>
                            <th scope="col">Sometimes</th>
                            <th scope="col">Often</th>
                            <th scope="col">Always</th>
                            <th scope="col">Not applicable</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>1</td>
                            <td>When I talked to other people they always understood my message - I delivered it in a complete and correct way (there were no misunderstandings).</td>
                            <td><form:radiobutton path="communicationQ1" value="0"/></td>
                            <td><form:radiobutton path="communicationQ1" value="1"/></td>
                            <td><form:radiobutton path="communicationQ1" value="2"/></td>
                            <td><form:radiobutton path="communicationQ1" value="3"/></td>
                            <td><form:radiobutton path="communicationQ1" value="0"/></td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td>When I talked to other people I used both verbal and non-verbal (body language) communication.</td>
                            <td><form:radiobutton path="communicationQ2" value="0"/></td>
                            <td><form:radiobutton path="communicationQ2" value="1"/></td>
                            <td><form:radiobutton path="communicationQ2" value="2"/></td>
                            <td><form:radiobutton path="communicationQ2" value="3"/></td>
                            <td><form:radiobutton path="communicationQ2" value="0"/></td>
                        </tr>
                        <tr>
                            <td>3</td>
                            <td>When I talked to people of different age groups and different backgrounds I adjusted my communication style to their needs, so everyone could understand my message.</td>
                            <td><form:radiobutton path="communicationQ3" value="0"/></td>
                            <td><form:radiobutton path="communicationQ3" value="1"/></td>
                            <td><form:radiobutton path="communicationQ3" value="2"/></td>
                            <td><form:radiobutton path="communicationQ3" value="3"/></td>
                            <td><form:radiobutton path="communicationQ3" value="0"/></td>
                        </tr>
                        <tr>
                            <td>4</td>
                            <td>When people had questions, I always answered in a coherent and comprehensive way and they and they found if satisfying. </td>
                            <td><form:radiobutton path="communicationQ4" value="0"/></td>
                            <td><form:radiobutton path="communicationQ4" value="1"/></td>
                            <td><form:radiobutton path="communicationQ4" value="2"/></td>
                            <td><form:radiobutton path="communicationQ4" value="3"/></td>
                            <td><form:radiobutton path="communicationQ4" value="0"/></td>
                        </tr>
                        <tr>
                            <td>5</td>
                            <td>People said that my communication style encourages them to share their thoughts  which mutually stimulate ideas and interactions.</td>
                            <td><form:radiobutton path="communicationQ5" value="0"/></td>
                            <td><form:radiobutton path="communicationQ5" value="1"/></td>
                            <td><form:radiobutton path="communicationQ5" value="2"/></td>
                            <td><form:radiobutton path="communicationQ5" value="3"/></td>
                            <td><form:radiobutton path="communicationQ5" value="0"/></td>
                        </tr>
                        <tr>
                            <td>6</td>
                            <td>I always chose the best way of communication for the given context: face to face, telephone, mail or digital (e.g. e-mail).</td>
                            <td><form:radiobutton path="communicationQ6" value="0"/></td>
                            <td><form:radiobutton path="communicationQ6" value="1"/></td>
                            <td><form:radiobutton path="communicationQ6" value="2"/></td>
                            <td><form:radiobutton path="communicationQ6" value="3"/></td>
                            <td><form:radiobutton path="communicationQ6" value="0"/></td>
                        </tr>
                        <tr>
                            <td>7</td>
                            <td>I acted in a responsible way regarding the tasks I was in charge.</td>
                            <td><form:radiobutton path="teamWorkQ1" value="0"/></td>
                            <td><form:radiobutton path="teamWorkQ1" value="1"/></td>
                            <td><form:radiobutton path="teamWorkQ1" value="2"/></td>
                            <td><form:radiobutton path="teamWorkQ1" value="3"/></td>
                            <td><form:radiobutton path="teamWorkQ1" value="0"/></td>
                        </tr>
                        <tr>
                            <td>8</td>
                            <td>When I presented my ideas to the team, I also listened to others’ ideas and took into consideration their points of view.</td>
                            <td><form:radiobutton path="teamWorkQ2" value="0"/></td>
                            <td><form:radiobutton path="teamWorkQ2" value="1"/></td>
                            <td><form:radiobutton path="teamWorkQ2" value="2"/></td>
                            <td><form:radiobutton path="teamWorkQ2" value="3"/></td>
                            <td><form:radiobutton path="teamWorkQ2" value="0"/></td>
                        </tr>
                        <tr>
                            <td>9</td>
                            <td>When I was making decisions concerning the team I always listened to other peoples’ opinion. </td>
                            <td><form:radiobutton path="teamWorkQ3" value="0"/></td>
                            <td><form:radiobutton path="teamWorkQ3" value="1"/></td>
                            <td><form:radiobutton path="teamWorkQ3" value="2"/></td>
                            <td><form:radiobutton path="teamWorkQ3" value="3"/></td>
                            <td><form:radiobutton path="teamWorkQ3" value="0"/></td>
                        </tr>
                        <tr>
                            <td>10</td>
                            <td>I respected other team members’ roles and the tasks assigned. </td>
                            <td><form:radiobutton path="teamWorkQ4" value="0"/></td>
                            <td><form:radiobutton path="teamWorkQ4" value="1"/></td>
                            <td><form:radiobutton path="teamWorkQ4" value="2"/></td>
                            <td><form:radiobutton path="teamWorkQ4" value="3"/></td>
                            <td><form:radiobutton path="teamWorkQ4" value="0"/></td>
                        </tr>
                        <tr>
                            <td>11</td>
                            <td>When the team members asked me for support I was there for them. </td>
                            <td><form:radiobutton path="teamWorkQ5" value="0"/></td>
                            <td><form:radiobutton path="teamWorkQ5" value="1"/></td>
                            <td><form:radiobutton path="teamWorkQ5" value="2"/></td>
                            <td><form:radiobutton path="teamWorkQ5" value="3"/></td>
                            <td><form:radiobutton path="teamWorkQ5" value="0"/></td>
                        </tr>
                        <tr>
                            <td>12</td>
                            <td>I collaborated with people who had different points of view than me, but I was able to find a compromise and effectively work on a given task. </td>
                            <td><form:radiobutton path="flexibilityQ1" value="0"/></td>
                            <td><form:radiobutton path="flexibilityQ1" value="1"/></td>
                            <td><form:radiobutton path="flexibilityQ1" value="2"/></td>
                            <td><form:radiobutton path="flexibilityQ1" value="3"/></td>
                            <td><form:radiobutton path="flexibilityQ1" value="0"/></td>
                        </tr>
                        <tr>
                            <td>13</td>
                            <td>When I had to use new tools, adopt new ideas or implement different scenario, it was not a problem at all for me – I could easily adjust to the new context. </td>
                            <td><form:radiobutton path="flexibilityQ2" value="0"/></td>
                            <td><form:radiobutton path="flexibilityQ2" value="1"/></td>
                            <td><form:radiobutton path="flexibilityQ2" value="2"/></td>
                            <td><form:radiobutton path="flexibilityQ2" value="3"/></td>
                            <td><form:radiobutton path="flexibilityQ2" value="0"/></td>
                        </tr>
                        <tr>
                            <td>14</td>
                            <td>I tried to find new, better alternate solutions, when I saw that my initial plan will not work. </td>
                            <td><form:radiobutton path="flexibilityQ3" value="0"/></td>
                            <td><form:radiobutton path="flexibilityQ3" value="1"/></td>
                            <td><form:radiobutton path="flexibilityQ3" value="2"/></td>
                            <td><form:radiobutton path="flexibilityQ3" value="3"/></td>
                            <td><form:radiobutton path="flexibilityQ3" value="0"/></td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <br>
            <div class="form-group">
                <label><b>5. What challenged you at most? Were there any critical moments you had to tackle? If so, how did you face them? What kind of resources did you use? </b></label><br>
                <form:textarea path="challenge" class="form-control"/>
                <form:errors path="challenge" cssClass="text-danger"/><br>
            </div><br>

            <div class="form-group">
                <label><b>6. What was the most important thing you have learnt thanks to this project? What would you do in the same way in a next, similar situation and what differently? Why? </b></label><br>
                <form:textarea path="lessonLearned" class="form-control"/>
                <form:errors path="lessonLearned" cssClass="text-danger"/><br>
            </div><br>

            <div class="form-group">
                <label><b>7. Additional comments:</b></label><br>
                <form:textarea path="comments" class="form-control"/>
                <form:errors path="comments" cssClass="text-danger"/><br>
            </div>
            <input type="submit" value="Save" class="btn btn-save"><br>
        </form:form>
    </div>

    <br>
    <br>
    <%@ include file="footer.jspf" %>
</body>
</html>
