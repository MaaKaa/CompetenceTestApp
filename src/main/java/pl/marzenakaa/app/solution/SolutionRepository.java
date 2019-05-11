package pl.marzenakaa.app.solution;

import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface SolutionRepository extends JpaRepository<Solution, Long> {

    List<Solution> findByCompetenceTestId(Long id);

    List<Solution> findByVolunteerId(Long id);

    List<Solution> findByResultRoleAndAutonomy(String resultRoleAndAutonomy);

    List<Solution> findByCommunicationResult(String communicationResult);

    List<Solution> findByTeamWorkResult(String teamWorkResult);

    List<Solution> findByFlexibilityResult(String flexibilityResult);
}
