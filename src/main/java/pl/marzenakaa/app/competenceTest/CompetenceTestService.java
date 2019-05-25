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

    public List<CompetenceTest> readAllByOrganisationId(Long id){
        return competenceTestRepository.findAllByOrganisationId(id);
    }

    public List<CompetenceTest> readByInvitedVolunteerId(Long id){
        return competenceTestRepository.findByVolunteerId(id);
    }

    public List<CompetenceTest> readTestsWithoutSolutionsByVolunteerId(Long id){
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
