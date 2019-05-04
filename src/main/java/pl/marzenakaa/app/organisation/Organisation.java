package pl.marzenakaa.app.organisation;

import pl.marzenakaa.app.competenceTest.CompetenceTest;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name="organisations")
public class Organisation {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;

    private String email;

    private String password;

    private String description;

    @ManyToMany
    @JoinTable(name = "organisation_fieldsOfActivity")
    private List<FieldOfActivity> fieldOfActivity;

    private String city;

    private String country;

    private String website;

    @OneToMany(mappedBy = "organisation", cascade = CascadeType.ALL)
    private List<CompetenceTest> competenceTests;

    public Organisation() {
    }

    public Long getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getEmail() {
        return email;
    }

    public String getPassword() {
        return password;
    }

    public String getDescription() {
        return description;
    }

    public List<FieldOfActivity> getFieldOfActivity() {
        return fieldOfActivity;
    }

    public String getCity() {
        return city;
    }

    public String getCountry() {
        return country;
    }

    public String getWebsite() {
        return website;
    }

    public List<CompetenceTest> getCompetenceTests() {
        return competenceTests;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setFieldOfActivity(List<FieldOfActivity> fieldOfActivity) {
        this.fieldOfActivity = fieldOfActivity;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public void setWebsite(String website) {
        this.website = website;
    }

    public void setCompetenceTests(List<CompetenceTest> competenceTests) {
        this.competenceTests = competenceTests;
    }

    @Override
    public String toString() {
        return name;
    }
}
