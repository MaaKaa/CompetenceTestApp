package pl.marzenakaa.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import pl.marzenakaa.app.competenceTest.CompetenceTest;

import java.util.List;

public interface CompetenceTestRepository extends JpaRepository<CompetenceTest, Long> {

    @Query(value = "SELECT * FROM competenceTests WHERE organisation_id=?1 ORDER BY created DESC", nativeQuery = true)
    List<CompetenceTest> findByOrganisationId(Long id);
}
