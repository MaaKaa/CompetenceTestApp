package pl.marzenakaa.app.organisation;

import org.hibernate.validator.constraints.Email;
import pl.marzenakaa.app.competenceTest.CompetenceTest;
import pl.marzenakaa.app.fieldsOfActivity.FieldOfActivity;

import javax.persistence.*;
import javax.validation.constraints.Size;
import java.util.List;

@Entity
@Table(name="organisations")
public class Organisation {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Size(min = 5)
    private String name;

    @Email
    private String email;

    private String password;

    @Size(min = 5)
    private String description;

    @ManyToMany(cascade = {CascadeType.MERGE})
    private List<FieldOfActivity> fieldsOfActivity;

    @Size(min = 3)
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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public List<FieldOfActivity> getFieldsOfActivity() {
        return fieldsOfActivity;
    }

    public void setFieldsOfActivity(List<FieldOfActivity> fieldsOfActivity) {
        this.fieldsOfActivity = fieldsOfActivity;
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

    public String getWebsite() {
        return website;
    }

    public void setWebsite(String website) {
        this.website = website;
    }

    public List<CompetenceTest> getCompetenceTests() {
        return competenceTests;
    }

    public void setCompetenceTests(List<CompetenceTest> competenceTests) {
        this.competenceTests = competenceTests;
    }

    @Override
    public String toString() {
        return name;
    }
}
