package pl.marzenakaa.app.competenceTest;

import pl.marzenakaa.app.organisation.Organisation;
import pl.marzenakaa.app.solution.Solution;
import pl.marzenakaa.app.volunteer.Volunteer;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.List;

@Entity
@Table(name="competenceTests")
public class CompetenceTest {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;

    private LocalDateTime created;

    @ManyToOne
    @JoinColumn(name = "organisation_id")
    private Organisation organisation;

    private String link;

    @OneToMany(mappedBy = "competenceTestInvitation")
    private List<Volunteer> invitedVolunteers;

    @OneToMany(mappedBy = "competenceTest", cascade = CascadeType.ALL)
    private List<Solution> solutions;

    public CompetenceTest() {
    }
}
