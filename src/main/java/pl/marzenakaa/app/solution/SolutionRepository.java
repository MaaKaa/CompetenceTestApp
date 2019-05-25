package pl.marzenakaa.app.solution;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface SolutionRepository extends JpaRepository<Solution, Long> {

    Solution findByCompetenceTestIdAndVolunteerId(Long id, Long vId);

    List<Solution> findAllByCompetenceTestId(Long id);

    List<Solution> findAllByVolunteerId(Long id);

    @Query(value = "select * from solutions WHERE resultRoleAndAutonomy=?1", nativeQuery = true)
    List<Solution> findAllByResultRoleAndAutonomy(String resultRoleAndAutonomy);

    List<Solution> findAllByCommunicationResult(String communicationResult);

    List<Solution> findAllByTeamWorkResult(String teamWorkResult);

    List<Solution> findAllByFlexibilityResult(String flexibilityResult);
}
