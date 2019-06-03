package pl.marzenakaa.app.organisation;

import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface OrganisationRepository extends JpaRepository <Organisation, Long> {

    List<Organisation> findAll();

    Organisation findByEmail(String email);

}
