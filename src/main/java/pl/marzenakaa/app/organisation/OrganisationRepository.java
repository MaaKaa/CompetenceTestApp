package pl.marzenakaa.app.organisation;

import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface OrganisationRepository extends JpaRepository <Organisation, Long> {

    Organisation findByName(String name);

}
