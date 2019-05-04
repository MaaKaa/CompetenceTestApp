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

    @ManyToOne
    @JoinColumn(name = "competenceTest_id")
    private CompetenceTest competenceTest;

    @ManyToOne
    @JoinColumn(name = "volunteer_id")
    private Volunteer volunteer;

    //zmienne przechowujące odpowiedzi do pytań


    public Solution() {
    }
}
