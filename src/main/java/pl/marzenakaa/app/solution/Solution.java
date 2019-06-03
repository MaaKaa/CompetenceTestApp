package pl.marzenakaa.app.solution;

import org.hibernate.validator.constraints.NotBlank;
import pl.marzenakaa.app.competenceTest.CompetenceTest;
import pl.marzenakaa.app.volunteer.Volunteer;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.time.LocalDateTime;

@Entity
@Table(name = "solutions")
public class Solution {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private LocalDateTime created;

    @PrePersist
    public void prePersist(){
        created = LocalDateTime.now();
    }

    @ManyToOne
    @JoinColumn(name = "competenceTest_id")
    private CompetenceTest competenceTest;

    @ManyToOne
    @JoinColumn(name = "volunteer_id")
    private Volunteer volunteer;

    @NotNull
    private int role;

    @NotNull
    private int autonomy;

    private String resultRoleAndAutonomy;

    @NotBlank
    @Size(min = 3, max = 500)
    private String task;


    private int communicationQ1;

    private int communicationQ2;

    private int communicationQ3;

    private int communicationQ4;

    private int communicationQ5;

    private int communicationQ6;

    private String communicationResult;


    private int teamWorkQ1;

    private int teamWorkQ2;

    private int teamWorkQ3;

    private int teamWorkQ4;

    private int teamWorkQ5;

    private String teamWorkResult;

    private int flexibilityQ1;

    private int flexibilityQ2;

    private int flexibilityQ3;

    private String flexibilityResult;

    @NotBlank
    @Size(min = 3, max = 500)
    private String challenge;

    @NotBlank
    @Size(min = 3, max = 500)
    private String lessonLearned;

    private String comments;

    public Solution() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public LocalDateTime getCreated() {
        return created;
    }

    public void setCreated(LocalDateTime created) {
        this.created = created;
    }

    public CompetenceTest getCompetenceTest() {
        return competenceTest;
    }

    public void setCompetenceTest(CompetenceTest competenceTest) {
        this.competenceTest = competenceTest;
    }

    public Volunteer getVolunteer() {
        return volunteer;
    }

    public void setVolunteer(Volunteer volunteer) {
        this.volunteer = volunteer;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    public int getAutonomy() {
        return autonomy;
    }

    public void setAutonomy(int autonomy) {
        this.autonomy = autonomy;
    }

    public String getResultRoleAndAutonomy() {
        return resultRoleAndAutonomy;
    }

    void setResultRoleAndAutonomy(String resultRoleAndAutonomy) {
        this.resultRoleAndAutonomy = resultRoleAndAutonomy;
    }

    public String getTask() {
        return task;
    }

    public void setTask(String task) {
        this.task = task;
    }

    public int getCommunicationQ1() {
        return communicationQ1;
    }

    public void setCommunicationQ1(int communicationQ1) {
        this.communicationQ1 = communicationQ1;
    }

    public int getCommunicationQ2() {
        return communicationQ2;
    }

    public void setCommunicationQ2(int communicationQ2) {
        this.communicationQ2 = communicationQ2;
    }

    public int getCommunicationQ3() {
        return communicationQ3;
    }

    public void setCommunicationQ3(int communicationQ3) {
        this.communicationQ3 = communicationQ3;
    }

    public int getCommunicationQ4() {
        return communicationQ4;
    }

    public void setCommunicationQ4(int communicationQ4) {
        this.communicationQ4 = communicationQ4;
    }

    public int getCommunicationQ5() {
        return communicationQ5;
    }

    public void setCommunicationQ5(int communicationQ5) {
        this.communicationQ5 = communicationQ5;
    }

    public int getCommunicationQ6() {
        return communicationQ6;
    }

    public void setCommunicationQ6(int communicationQ6) {
        this.communicationQ6 = communicationQ6;
    }

    public String getCommunicationResult() {
        return communicationResult;
    }

    void setCommunicationResult(String communicationResult) {
        this.communicationResult = communicationResult;
    }

    public int getTeamWorkQ1() {
        return teamWorkQ1;
    }

    public void setTeamWorkQ1(int teamWorkQ1) {
        this.teamWorkQ1 = teamWorkQ1;
    }

    public int getTeamWorkQ2() {
        return teamWorkQ2;
    }

    public void setTeamWorkQ2(int teamWorkQ2) {
        this.teamWorkQ2 = teamWorkQ2;
    }

    public int getTeamWorkQ3() {
        return teamWorkQ3;
    }

    public void setTeamWorkQ3(int teamWorkQ3) {
        this.teamWorkQ3 = teamWorkQ3;
    }

    public int getTeamWorkQ4() {
        return teamWorkQ4;
    }

    public void setTeamWorkQ4(int teamWorkQ4) {
        this.teamWorkQ4 = teamWorkQ4;
    }

    public int getTeamWorkQ5() {
        return teamWorkQ5;
    }

    public void setTeamWorkQ5(int teamWorkQ5) {
        this.teamWorkQ5 = teamWorkQ5;
    }

    public String getTeamWorkResult() {
        return teamWorkResult;
    }

    void setTeamWorkResult(String teamWorkResult) {
        this.teamWorkResult = teamWorkResult;
    }

    public int getFlexibilityQ1() {
        return flexibilityQ1;
    }

    public void setFlexibilityQ1(int flexibilityQ1) {
        this.flexibilityQ1 = flexibilityQ1;
    }

    public int getFlexibilityQ2() {
        return flexibilityQ2;
    }

    public void setFlexibilityQ2(int flexibilityQ2) {
        this.flexibilityQ2 = flexibilityQ2;
    }

    public int getFlexibilityQ3() {
        return flexibilityQ3;
    }

    public void setFlexibilityQ3(int flexibilityQ3) {
        this.flexibilityQ3 = flexibilityQ3;
    }

    public String getFlexibilityResult() {
        return flexibilityResult;
    }

    void setFlexibilityResult(String flexibilityResult) {
        this.flexibilityResult = flexibilityResult;
    }

    public String getChallenge() {
        return challenge;
    }

    public void setChallenge(String challenge) {
        this.challenge = challenge;
    }

    public String getLessonLearned() {
        return lessonLearned;
    }

    public void setLessonLearned(String lessonLearned) {
        this.lessonLearned = lessonLearned;
    }

    public String getComments() {
        return comments;
    }

    public void setComments(String comments) {
        this.comments = comments;
    }

    @Override
    public String toString() {
        return "ID:" + id;
    }
}
