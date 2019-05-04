package pl.marzenakaa.app.organisation;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "fieldsOfActivity")
public class FieldOfActivity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;

    @ManyToMany(mappedBy = "fieldsOfActivity", fetch=FetchType.EAGER)
    private List<Organisation> organisations;

    public FieldOfActivity() {
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

    public List<Organisation> getOrganisations() {
        return organisations;
    }

    public void setOrganisations(List<Organisation> organisation) {
        this.organisations = organisation;
    }

    @Override
    public String toString() {
        return name;
    }
}
