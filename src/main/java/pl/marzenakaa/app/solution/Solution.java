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
    private String role;

    private String autonomy;

    private String resultRoleAndAutonomy;

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
