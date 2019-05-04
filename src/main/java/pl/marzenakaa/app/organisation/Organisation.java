package pl.marzenakaa.app.organisation;

import pl.marzenakaa.app.FieldOfActivity;
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
}
