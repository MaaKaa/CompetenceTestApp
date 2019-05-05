package pl.marzenakaa.app.solution;

import pl.marzenakaa.app.competenceTest.CompetenceTest;
import pl.marzenakaa.app.volunteer.Volunteer;

import javax.persistence.*;
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

    //zmienne przechowujące odpowiedzi do pytań
    private String role; //do zastanowienia, czy zmienić typ na int

    private String autonomy; //do zastanowienia, czy zmienić typ na int

    private String resultRoleAndAutonomy;

    private String task;

    private String communicationQ1;
    private String communicationQ2;
    private String communicationQ3;
    private String communicationQ4;
    private String communicationQ5;
    private String communicationQ6;

    //Uzupełnić gettery i settery dla nowych pól oraz zaktualizować DB

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

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getAutonomy() {
        return autonomy;
    }

    public void setAutonomy(String autonomy) {
        this.autonomy = autonomy;
    }

    public String getResultRoleAndAutonomy() {
        return resultRoleAndAutonomy;
    }

    public void setResultRoleAndAutonomy(String resultRoleAndAutonomy) {
        this.resultRoleAndAutonomy = resultRoleAndAutonomy;
    }

    public String getTask() {
        return task;
    }

    public void setTask(String task) {
        this.task = task;
    }

    public String getCommunicationQ1() {
        return communicationQ1;
    }

    public void setCommunicationQ1(String communicationQ1) {
        this.communicationQ1 = communicationQ1;
    }

    public String getCommunicationQ2() {
        return communicationQ2;
    }

    public void setCommunicationQ2(String communicationQ2) {
        this.communicationQ2 = communicationQ2;
    }

    public String getCommunicationQ3() {
        return communicationQ3;
    }

    public void setCommunicationQ3(String communicationQ3) {
        this.communicationQ3 = communicationQ3;
    }

    public String getCommunicationQ4() {
        return communicationQ4;
    }

    public void setCommunicationQ4(String communicationQ4) {
        this.communicationQ4 = communicationQ4;
    }

    public String getCommunicationQ5() {
        return communicationQ5;
    }

    public void setCommunicationQ5(String communicationQ5) {
        this.communicationQ5 = communicationQ5;
    }

    public String getCommunicationQ6() {
        return communicationQ6;
    }

    public void setCommunicationQ6(String communicationQ6) {
        this.communicationQ6 = communicationQ6;
    }

    @Override
    public String toString() {
        return "Solution{" +
                "id=" + id +
                ", created=" + created +
                ", competenceTest=" + competenceTest +
                ", volunteer=" + volunteer +
                '}';
    }
}
