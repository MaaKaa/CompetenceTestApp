package pl.marzenakaa.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import pl.marzenakaa.app.competenceTest.CompetenceTest;
import pl.marzenakaa.app.solution.Solution;
import pl.marzenakaa.app.volunteer.Volunteer;

import java.util.List;

public interface VolunteerRepository extends JpaRepository<Volunteer, Long> {

    @Query(value = "select * from competenceTests where invitedVolunteers_id=?1", nativeQuery = true)
    List<CompetenceTest> findAllInvitationsByVolunteerId(Long id);

    @Query(value = "select * from solutions where volunteer_id=?1", nativeQuery = true)
    List<Solution> finaAllSolutionsByVolunteerId(Long id);
}
