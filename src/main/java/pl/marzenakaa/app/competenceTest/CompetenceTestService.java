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

    public int readNumberOfSolutionsByRoleAndAutonomyResult(Long id, String level){
        return competenceTestRepository.countSolutionsByRoleAndAutonomyResult(id, level);
    }

    public int readNumberOfSolutionsByCommunicationResult(Long id, String level){
        return competenceTestRepository.countSolutionsByCommunicationResult(id, level);
    }

    public int readNumberOfSolutionsByFlexibilityResult(Long id, String level){
        return competenceTestRepository.countSolutionsByFlexibilityResult(id, level);
    }

    public int readNumberOfSolutionsByTeamworkResult(Long id, String level){
        return competenceTestRepository.countSolutionsByTeamworkResult(id, level);
    }

    public int readAllNumberOfSolutionsByRoleAndAutonomyResult(Long id, String level){
        return competenceTestRepository.countAllSolutionsByRoleAndAutonomyResult(id, level);
    }

    public int readAllNumberOfSolutionsByCommunicationResult(Long id, String level){
        return competenceTestRepository.countAllSolutionsByCommunicationResult(id, level);
    }

    public int readAllNumberOfSolutionsByFlexibilityResult(Long id, String level){
        return competenceTestRepository.countAllSolutionsByFlexibilityResult(id, level);
    }

    public int readAllNumberOfSolutionsByTeamworkResult(Long id, String level){
        return competenceTestRepository.countAllSolutionsByTeamworkResult(id, level);
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
