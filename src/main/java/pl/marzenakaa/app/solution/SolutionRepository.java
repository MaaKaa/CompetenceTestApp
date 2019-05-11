package pl.marzenakaa.app.solution;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface SolutionRepository extends JpaRepository<Solution, Long> {

    List<Solution> findByCompetenceTestId(Long id);

    List<Solution> findByVolunteerId(Long id);

    @Query(value = "select * from solutions WHERE resultRoleAndAutonomy=?1", nativeQuery = true)
    List<Solution> findByResultRoleAndAutonomy(String resultRoleAndAutonomy);

    List<Solution> findByCommunicationResult(String communicationResult);

    List<Solution> findByTeamWorkResult(String teamWorkResult);

    List<Solution> findByFlexibilityResult(String flexibilityResult);
}
