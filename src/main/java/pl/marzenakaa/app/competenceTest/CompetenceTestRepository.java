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

    //Statistics for a particular Competence Test:
    @Query(value = "SELECT COUNT(solutions.id) FROM competenceTests JOIN solutions ON competenceTest_id=solutions.competenceTest_id WHERE competenceTest_id=?1 AND resultRoleAndAutonomy=\"General\"", nativeQuery = true)
    int countSolutionsWhereRoleAndAutonomyResultIsGeneral(Long id);

    @Query(value = "SELECT COUNT(solutions.id) FROM competenceTests JOIN solutions ON competenceTest_id=solutions.competenceTest_id WHERE competenceTest_id=?1 AND resultRoleAndAutonomy=\"Accomplished\"", nativeQuery = true)
    int countSolutionsWhereRoleAndAutonomyResultIsAccomplished(Long id);

    @Query(value = "SELECT COUNT(solutions.id) FROM competenceTests JOIN solutions ON competenceTest_id=solutions.competenceTest_id WHERE competenceTest_id=?1 AND resultRoleAndAutonomy=\"Expert\"", nativeQuery = true)
    int countSolutionsWhereRoleAndAutonomyResultIsExpert(Long id);

    @Query(value = "SELECT COUNT(solutions.id) FROM competenceTests JOIN solutions ON competenceTest_id=solutions.competenceTest_id WHERE competenceTest_id=?1 AND communicationResult=\"Partial\"", nativeQuery = true)
    int countSolutionsWhereCommunicationResultIsPartial(Long id);

    @Query(value = "SELECT COUNT(solutions.id) FROM competenceTests JOIN solutions ON competenceTest_id=solutions.competenceTest_id WHERE competenceTest_id=?1 AND communicationResult=\"Plain\"", nativeQuery = true)
    int countSolutionsWhereCommunicationResultIsPlain(Long id);

    @Query(value = "SELECT COUNT(solutions.id) FROM competenceTests JOIN solutions ON competenceTest_id=solutions.competenceTest_id WHERE competenceTest_id=?1 AND communicationResult=\"Excellent\"", nativeQuery = true)
    int countSolutionsWhereCommunicationResultIsExcellent(Long id);

    @Query(value = "SELECT COUNT(solutions.id) FROM competenceTests JOIN solutions ON competenceTest_id=solutions.competenceTest_id WHERE competenceTest_id=?1 AND flexibilityResult=\"Partial\"", nativeQuery = true)
    int countSolutionsWhereFlexibilityResultIsPartial(Long id);

    @Query(value = "SELECT COUNT(solutions.id) FROM competenceTests JOIN solutions ON competenceTest_id=solutions.competenceTest_id WHERE competenceTest_id=?1 AND flexibilityResult=\"Plain\"", nativeQuery = true)
    int countSolutionsWhereFlexibilityResultIsPlain(Long id);

    @Query(value = "SELECT COUNT(solutions.id) FROM competenceTests JOIN solutions ON competenceTest_id=solutions.competenceTest_id WHERE competenceTest_id=?1 AND flexibilityResult=\"Excellent\"", nativeQuery = true)
    int countSolutionsWhereFLexibilityResultIsExcellent(Long id);

    @Query(value = "SELECT COUNT(solutions.id) FROM competenceTests JOIN solutions ON competenceTest_id=solutions.competenceTest_id WHERE competenceTest_id=?1 AND teamWorkResult=\"Partial\"", nativeQuery = true)
    int countSolutionsWhereTeamworkResultIsPartial(Long id);

    @Query(value = "SELECT COUNT(solutions.id) FROM competenceTests JOIN solutions ON competenceTest_id=solutions.competenceTest_id WHERE competenceTest_id=?1 AND teamWorkResult=\"Plain\"", nativeQuery = true)
    int countSolutionsWhereTeamworkResultIsPlain(Long id);

    @Query(value = "SELECT COUNT(solutions.id) FROM competenceTests JOIN solutions ON competenceTest_id=solutions.competenceTest_id WHERE competenceTest_id=?1 AND teamWorkResult=\"Excellent\"", nativeQuery = true)
    int countSolutionsWhereTeamworkResultIsExcellent(Long id);
}
