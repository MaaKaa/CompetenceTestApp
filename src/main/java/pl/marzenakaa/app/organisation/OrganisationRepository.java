package pl.marzenakaa.app.organisation;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface OrganisationRepository extends JpaRepository <Organisation, Long> {

    Organisation findByName(String name);

    @Query(value = "select * from organisations JOIN organisations_fieldsOfActivity ON organisations.id=organisations_fieldsOfActivity.organisations_id", nativeQuery = true)
    List<Organisation> findByFieldsOfActivityId(Long id);
}
