package pl.marzenakaa.app.competenceTest;

import org.apache.commons.lang3.RandomStringUtils;
import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pl.marzenakaa.app.solution.Solution;
import pl.marzenakaa.app.solution.SolutionRepository;

import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.List;

import static org.apache.commons.lang3.StringUtils.deleteWhitespace;

@Service
@Transactional
public class CompetenceTestService {
    @Autowired
    CompetenceTestRepository competenceTestRepository;

    @Autowired
    SolutionRepository solutionRepository;

    public void create(CompetenceTest competenceTest) {
        String link = competenceTest.getName();
        String linkModified = deleteWhitespace(link);
        competenceTest.setLink(linkModified + RandomStringUtils.randomAlphanumeric(10));
        competenceTestRepository.save(competenceTest);
    }

    public CompetenceTest read(Long id) {
        return competenceTestRepository.findOne(id);
    }

    public CompetenceTest readWithInvitedVolunteers(Long id){
        CompetenceTest competenceTest = read(id);
        Hibernate.initialize(competenceTest.getVolunteers());
        return competenceTest;
    }

    public CompetenceTest readWithSolutions(Long id){
        CompetenceTest competenceTest = read(id);
        Hibernate.initialize(competenceTest.getSolutions());
        return competenceTest;
    }

    public List<CompetenceTest> readAll(){
        return competenceTestRepository.findAll();
    }

    public List<CompetenceTest> readAllByOrganisationId(Long id){
        return competenceTestRepository.findAllByOrganisationId(id);
    }

    public List<CompetenceTest> readAllByInvitedVolunteerId(Long id){
        return competenceTestRepository.findByVolunteerId(id);
    }

    public List<CompetenceTest> readAllWithoutSolutionsByVolunteerId(Long id){
        List<CompetenceTest> competenceTestsWithoutSolutions = new ArrayList<>();
        List<CompetenceTest> competenceTests = competenceTestRepository.findByVolunteerId(id);
        for(CompetenceTest competenceTest : competenceTests){
            Solution solution = solutionRepository.findByCompetenceTestIdAndVolunteerId(competenceTest.getId(), id);
                if(solution == null){
                    competenceTestsWithoutSolutions.add(competenceTest);
                }
        }
        return competenceTestsWithoutSolutions;
    }

    public int readNumberOfSolutionsWhereRoleAndAutonomyResultIsGeneral(Long id){
        return competenceTestRepository.countSolutionsWhereRoleAndAutonomyResultIsGeneral(id);
    }

    public int readNumberOfSolutionsWhereRoleAndAutonomyResultIsAccomplished(Long id){
        return competenceTestRepository.countSolutionsWhereRoleAndAutonomyResultIsAccomplished(id);
    }

    public int readNumberOfSolutionsWhereRoleAndAutonomyResultIsExpert(Long id){
        return competenceTestRepository.countSolutionsWhereRoleAndAutonomyResultIsExpert(id);
    }

    public int readNumberOfSolutionsWhereFlexibilityResultIsPartial(Long id){
        return competenceTestRepository.countSolutionsWhereFlexibilityResultIsPartial(id);
    }

    public int readNumberOfSolutionsWhereFLexibilityResultIsPlain(Long id){
        return competenceTestRepository.countSolutionsWhereFlexibilityResultIsPlain(id);
    }

    public int readNumberOfSolutionsWhereFlexibilityResultIsExcellent(Long id){
        return competenceTestRepository.countSolutionsWhereFLexibilityResultIsExcellent(id);
    }

    public int readNumberOfSolutionsWhereTeamworkResultIsPartial(Long id){
        return competenceTestRepository.countSolutionsWhereTeamworkResultIsPartial(id);
    }

    public int readNumberOfSolutionsWhereTeamworkResultIsPlain(Long id){
        return competenceTestRepository.countSolutionsWhereTeamworkResultIsPlain(id);
    }

    public int readNumberOfSolutionsWhereTeamworkResultIsExcellent(Long id){
        return competenceTestRepository.countSolutionsWhereTeamworkResultIsExcellent(id);
    }

    public int readNumberOfSolutionsWhereCommunicationResultIsPartial(Long id){
        return competenceTestRepository.countSolutionsWhereCommunicationResultIsPartial(id);
    }

    public int readNumberOfSolutionsWhereCommunicationResultIsPlain(Long id){
        return competenceTestRepository.countSolutionsWhereCommunicationResultIsPlain(id);
    }

    public int readNumberOfSolutionsWhereCommunicationResultIsExcellent(Long id){
        return competenceTestRepository.countSolutionsWhereCommunicationResultIsExcellent(id);
    }


    public void update(CompetenceTest competenceTest) {
        competenceTestRepository.save(competenceTest);
    }

    public void delete(Long id) {
        competenceTestRepository.delete(id);
    }

    public List<CompetenceTest> findAll() {
        return competenceTestRepository.findAll();
    }
}
