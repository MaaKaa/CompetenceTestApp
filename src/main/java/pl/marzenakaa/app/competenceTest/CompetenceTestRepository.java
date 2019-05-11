package pl.marzenakaa.app.competenceTest;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface CompetenceTestRepository extends JpaRepository<CompetenceTest, Long> {

    //do przetestowania:
    @Query(value = "SELECT * FROM competenceTests WHERE organisation_id=?1 ORDER BY created DESC", nativeQuery = true)
    List<CompetenceTest> findByOrganisationId(Long id);

    @Query(value = "select * from competenceTests JOIN volunteers_competenceTests ON competenceTests.id=volunteers_competenceTests.invitedVolunteers_id WHERE volunteers_competenceTests.invitedVolunteers_id = ?1", nativeQuery = true)
    CompetenceTest findByInvitedVolunteerId(Long id);

    @Query(value = "select * from competenceTests JOIN solutions ON competenceTests.id=solutions.competenceTest_id WHERE volunteer_id=?1", nativeQuery = true)
    CompetenceTest findByVolunteerId(Long id);
}
