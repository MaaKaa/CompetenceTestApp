package pl.marzenakaa.app.volunteer;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotBlank;
import pl.marzenakaa.app.competenceTest.CompetenceTest;
import pl.marzenakaa.app.solution.Solution;

import javax.persistence.*;
import javax.validation.constraints.Size;
import java.util.List;

@Entity
@Table(name = "volunteers")
public class Volunteer {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotBlank
    @Size(min = 3, max = 150)
    private String name;

    @Column(name = "email", unique = true)
    @Email
    private String email;

    private String temporaryPassword;

    private String password;

    private String age;

    private String gender;

    private String city;

    private String country;

    @ManyToMany(cascade = {CascadeType.MERGE})
    private List<CompetenceTest> competenceTests;

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

    public String getTemporaryPassword() {
        return temporaryPassword;
    }

    public void setTemporaryPassword(String temporaryPassword) {
        this.temporaryPassword = temporaryPassword;
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

    public List<CompetenceTest> getCompetenceTests() {
        return competenceTests;
    }

    public void setCompetenceTests(List<CompetenceTest> competenceTests) {
        this.competenceTests = competenceTests;
    }

    public List<Solution> getSolutions() {
        return solutions;
    }

    public void setSolutions(List<Solution> solutions) {
        this.solutions = solutions;
    }

    public void addCompetenceTestInvitation(CompetenceTest competenceTest){
        competenceTests.add(competenceTest);
        competenceTest.getVolunteers().add(this);
    }

    public void removeCompetenceTestInvitation(CompetenceTest competenceTest){
        competenceTests.remove(competenceTest);
        competenceTest.getVolunteers().remove(this);
    }

    @Override
    public String toString() {
        return name;
    }
}
