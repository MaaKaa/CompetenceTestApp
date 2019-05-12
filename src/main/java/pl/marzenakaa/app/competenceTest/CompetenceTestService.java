package pl.marzenakaa.app.competenceTest;

import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pl.marzenakaa.app.volunteer.Volunteer;

import javax.transaction.Transactional;
import java.util.List;

@Service
@Transactional
public class CompetenceTestService {
    @Autowired
    CompetenceTestRepository competenceTestRepository;

    public void create(CompetenceTest competenceTest) {
        competenceTestRepository.save(competenceTest);
    }

    public CompetenceTest read(Long id) {
        return competenceTestRepository.findOne(id); //opcjonalnie: findById(id).orElse(null);
    }

    public CompetenceTest readWithInvitedVolunteers(Long id){
        CompetenceTest competenceTest = read(id);
        Hibernate.initialize(competenceTest.getInvitedVolunteers());
        return competenceTest;
    }

    public CompetenceTest readWithSolutions(Long id){
        CompetenceTest competenceTest = read(id);
        Hibernate.initialize(competenceTest.getSolutions());
        return competenceTest;
    }

    public List<CompetenceTest> readByOrganisationId(Long id){
        return competenceTestRepository.findByOrganisationId(id);
    }

    public List<Volunteer> readByInvitedVolunteers(Long id){
        return competenceTestRepository.findInvitedVolunteers(id);
    }

    public CompetenceTest readByInvitedVolunteerId(Long id){
        return competenceTestRepository.findByInvitedVolunteerId(id);
    }

    public CompetenceTest readByVolunteerId(Long id){
        return competenceTestRepository.findByVolunteerId(id);
    }

    public void update(CompetenceTest competenceTest) {
        competenceTestRepository.save(competenceTest);
    }

    public void delete(Long id) {
        competenceTestRepository.delete(id); //opcjonalnie: deleteById(id);
    }

    public List<CompetenceTest> findAll() {
        return competenceTestRepository.findAll();
    }
}
