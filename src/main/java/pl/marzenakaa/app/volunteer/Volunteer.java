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

    @ManyToOne
    @JoinColumn(name="competenceTestInvitation_id")
    private CompetenceTest competenceTestInvitation;

    @OneToMany(mappedBy = "volunteer", cascade = CascadeType.ALL)
    private List<Solution> solutions;

    public Volunteer() {
    }
}
