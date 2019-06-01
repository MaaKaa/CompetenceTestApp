package pl.marzenakaa.app.competenceTest;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import java.util.List;

public interface CompetenceTestRepository extends JpaRepository<CompetenceTest, Long> {

    List<CompetenceTest> findAll();

    @Query(value = "SELECT * FROM competenceTests JOIN volunteers_competenceTests ON competenceTests.id=volunteers_competenceTests.competenceTests_id WHERE volunteers_competenceTests.volunteers_id =?1", nativeQuery = true)
    List<CompetenceTest> findByVolunteerId(Long id);

    @Query(value = "SELECT * FROM competenceTests WHERE organisation_id=?1 ORDER BY created DESC", nativeQuery = true)
    List<CompetenceTest> findAllByOrganisationId(Long id);

    //Statistics for a given Competence Test:
    @Query(value = "SELECT COUNT(solutions.id) FROM competenceTests JOIN solutions ON competenceTest_id=solutions.competenceTest_id WHERE competenceTest_id=?1 AND resultRoleAndAutonomy=?2", nativeQuery = true)
    int countSolutionsByRoleAndAutonomyResult(Long id, String level);

    @Query(value = "SELECT COUNT(solutions.id) FROM competenceTests JOIN solutions ON competenceTest_id=solutions.competenceTest_id WHERE competenceTest_id=?1 AND communicationResult=?2", nativeQuery = true)
    int countSolutionsByCommunicationResult(Long id, String level);

    @Query(value = "SELECT COUNT(solutions.id) FROM competenceTests JOIN solutions ON competenceTest_id=solutions.competenceTest_id WHERE competenceTest_id=?1 AND flexibilityResult=?2", nativeQuery = true)
    int countSolutionsByFlexibilityResult(Long id, String level);

    @Query(value = "SELECT COUNT(solutions.id) FROM competenceTests JOIN solutions ON competenceTest_id=solutions.competenceTest_id WHERE competenceTest_id=?1 AND teamWorkResult=?2", nativeQuery = true)
    int countSolutionsByTeamworkResult(Long id, String level);

    //Statistics for all the Competence Test of the given Organisation:
    @Query(value = "SELECT COUNT(solutions.id) FROM competenceTests JOIN solutions ON competenceTest_id=solutions.competenceTest_id WHERE organisation_id=?1 AND resultRoleAndAutonomy=?2", nativeQuery = true)
    int countAllSolutionsByRoleAndAutonomyResult(Long id, String level);

    @Query(value = "SELECT COUNT(solutions.id) FROM competenceTests JOIN solutions ON competenceTest_id=solutions.competenceTest_id WHERE organisation_id=?1 AND communicationResult=?2", nativeQuery = true)
    int countAllSolutionsByCommunicationResult(Long id, String level);

    @Query(value = "SELECT COUNT(solutions.id) FROM competenceTests JOIN solutions ON competenceTest_id=solutions.competenceTest_id WHERE organisation_id=?1 AND flexibilityResult=?2", nativeQuery = true)
    int countAllSolutionsByFlexibilityResult(Long id, String level);

    @Query(value = "SELECT COUNT(solutions.id) FROM competenceTests JOIN solutions ON competenceTest_id=solutions.competenceTest_id WHERE organisation_id=?1 AND teamWorkResult=?2", nativeQuery = true)
    int countAllSolutionsByTeamworkResult(Long id, String level);
}
