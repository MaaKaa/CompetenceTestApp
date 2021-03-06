package pl.marzenakaa.app.competenceTest;

import org.hibernate.validator.constraints.NotBlank;
import pl.marzenakaa.app.organisation.Organisation;
import pl.marzenakaa.app.solution.Solution;
import pl.marzenakaa.app.volunteer.Volunteer;

import javax.persistence.*;
import javax.validation.constraints.Size;
import java.time.LocalDateTime;
import java.util.List;

@Entity
@Table(name="competenceTests")
public class CompetenceTest {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotBlank
    @Size(min = 3, max = 150)
    private String name;

    @NotBlank
    @Size(min = 3, max = 500)
    private String description;

    private LocalDateTime created;

    @PrePersist
    public void prePersist(){
        created = LocalDateTime.now();
    }

    @ManyToOne
    @JoinColumn(name = "organisation_id")
    private Organisation organisation;

    private String link;

    @ManyToMany(mappedBy = "competenceTests", fetch = FetchType.EAGER)
    private List<Volunteer> volunteers;

    @OneToMany(mappedBy = "competenceTest", cascade = CascadeType.ALL)
    private List<Solution> solutions;

    public CompetenceTest() {
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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public LocalDateTime getCreated() {
        return created;
    }

    public void setCreated(LocalDateTime created) {
        this.created = created;
    }

    public Organisation getOrganisation() {
        return organisation;
    }

    public void setOrganisation(Organisation organisation) {
        this.organisation = organisation;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    public List<Volunteer> getVolunteers() {
        return volunteers;
    }

    public void setVolunteers(List<Volunteer> volunteers) {
        this.volunteers = volunteers;
    }

    public List<Solution> getSolutions() {
        return solutions;
    }

    public void setSolutions(List<Solution> solutions) {
        this.solutions = solutions;
    }

    @Override
    public String toString() {
        return name;
    }
}
