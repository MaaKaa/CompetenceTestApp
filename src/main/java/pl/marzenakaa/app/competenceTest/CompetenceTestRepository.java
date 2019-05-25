package pl.marzenakaa.app.competenceTest;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import pl.marzenakaa.app.volunteer.Volunteer;

import java.util.List;

public interface CompetenceTestRepository extends JpaRepository<CompetenceTest, Long> {

    @Query(value = "select * from competenceTests JOIN volunteers_competenceTests ON competenceTests.id=volunteers_competenceTests.competenceTests_id WHERE volunteers_competenceTests.volunteers_id =?1", nativeQuery = true)
    List<CompetenceTest> findByVolunteerId(Long id);

    @Query(value = "SELECT * FROM competenceTests WHERE organisation_id=?1 ORDER BY created DESC", nativeQuery = true)
    List<CompetenceTest> findAllByOrganisationId(Long id);

}
