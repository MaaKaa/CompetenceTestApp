package pl.marzenakaa.app.organisation;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.URL;
import pl.marzenakaa.app.competenceTest.CompetenceTest;

import javax.persistence.*;
import javax.validation.constraints.Size;
import java.util.List;

@Entity
@Table(name="organisations")
public class Organisation {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotBlank
    @Size(min = 5, max = 150)
    private String name;

    @Column(name="email", unique = true)
    @Email
    private String email;

    @NotBlank
    private String password;

    @NotBlank
    @Size(min = 3, max = 500)
    private String description;

    @NotBlank
    @Size(min = 3, max = 100)
    private String city;

    private String country;

    @NotBlank
    @URL
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
