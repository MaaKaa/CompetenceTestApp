package pl.marzenakaa.app.organisation;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "fieldsOdActivity")
public class FieldOfActivity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;

    @ManyToMany
    private List<Organisation> organisation;
}
