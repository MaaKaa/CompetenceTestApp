package pl.marzenakaa.app.volunteer;

import pl.marzenakaa.app.competenceTest.CompetenceTest;
import pl.marzenakaa.app.solution.Solution;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "volunteers")
public class Volunteer {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;

    private String email;

    private String password;

    private String age;

    private String gender;

    private String city;

    private String country;

    @ManyToMany(cascade = {CascadeType.MERGE})
    private List<CompetenceTest> competenceTestInvitations;

    @OneToMany(mappedBy = "volunteer", cascade = CascadeType.ALL)
    private List<Solution> solutions;

    public Volunteer() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getAge() {
        return age;
    }

    public void setAge(String age) {
        this.age = age;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public List<CompetenceTest> getCompetenceTestInvitations() {
        return competenceTestInvitations;
    }

    public void setCompetenceTestInvitations(List<CompetenceTest> competenceTestInvitations) {
        this.competenceTestInvitations = competenceTestInvitations;
    }

    public List<Solution> getSolutions() {
        return solutions;
    }

    public void setSolutions(List<Solution> solutions) {
        this.solutions = solutions;
    }

    public void addCompetenceTestInvitation(CompetenceTest competenceTest){
        competenceTestInvitations.add(competenceTest);
        competenceTest.getInvitedVolunteers().add(this);
    }

    public void removeCompetenceTestInvitation(CompetenceTest competenceTest){
        competenceTestInvitations.remove(competenceTest);
        competenceTest.getInvitedVolunteers().remove(this);
    }

    @Override
    public String toString() {
        return name;
    }
}
