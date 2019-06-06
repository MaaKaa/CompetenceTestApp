package pl.marzenakaa.app.volunteer;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface VolunteerRepository extends JpaRepository<Volunteer, Long> {

    Volunteer findByEmail(String email);

    List<Volunteer> findAll();

    @Query(value = "SELECT COUNT(solutions.id) FROM solutions WHERE volunteer_id=?1 AND resultRoleAndAutonomy=?2", nativeQuery = true)
    int countVolunteersSolutionsByRoleAndAutonomyResult(Long id, String level);

    @Query(value = "SELECT COUNT(solutions.id) FROM solutions WHERE volunteer_id=?1 AND communicationResult=?2", nativeQuery = true)
    int countVolunteersSolutionsByCommunicationResult(Long id, String level);

    @Query(value = "SELECT COUNT(solutions.id) FROM solutions WHERE volunteer_id=?1 AND flexibilityResult=?2", nativeQuery = true)
    int countVolunteersSolutionsByFlexibilityResult(Long id, String level);

    @Query(value = "SELECT COUNT(solutions.id) FROM solutions WHERE volunteer_id=?1 AND teamWorkResult=?2", nativeQuery = true)
    int countVolunteersSolutionsByTeamworkResult(Long id, String level);
}
