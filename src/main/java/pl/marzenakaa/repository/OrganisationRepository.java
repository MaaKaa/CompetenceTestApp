package pl.marzenakaa.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.marzenakaa.app.organisation.Organisation;

public interface OrganisationRepository extends JpaRepository <Organisation, Long> {

    Organisation findByName(String name);
}
