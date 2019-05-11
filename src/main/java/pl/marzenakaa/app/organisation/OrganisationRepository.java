package pl.marzenakaa.app.organisation;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import pl.marzenakaa.app.competenceTest.CompetenceTest;
import pl.marzenakaa.app.organisation.Organisation;

import java.util.List;

public interface OrganisationRepository extends JpaRepository <Organisation, Long> {

    Organisation findByName(String name);


}
