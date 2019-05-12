package pl.marzenakaa.app.volunteer;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import pl.marzenakaa.app.competenceTest.CompetenceTest;
import pl.marzenakaa.app.solution.Solution;

import java.util.List;

public interface VolunteerRepository extends JpaRepository<Volunteer, Long> {

    @Query(value = "SELECT * FROM volunteers JOIN volunteers_competenceTests ON volunteers.id=volunteers_competenceTests.invitedVolunteers_id WHERE volunteers.id=?1", nativeQuery = true)
    List<CompetenceTest> findAllInvitationsByVolunteerId(Long id);

    @Query(value = "select * from solutions where volunteer_id=?1", nativeQuery = true)
    List<Solution> finaAllSolutionsByVolunteerId(Long id);
}
