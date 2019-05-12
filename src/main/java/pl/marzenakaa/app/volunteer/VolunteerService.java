package pl.marzenakaa.app.volunteer;

import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pl.marzenakaa.app.competenceTest.CompetenceTest;

import javax.transaction.Transactional;
import java.util.List;

@Service
@Transactional
public class VolunteerService {
    @Autowired
    VolunteerRepository volunteerRepository;

    public void create(Volunteer volunteer) {
        volunteerRepository.save(volunteer);
    }

    public Volunteer read(Long id) {
        return volunteerRepository.findOne(id); //opcjonalnie: findById(id).orElse(null);
    }

    public Volunteer readWithInvitations(Long id){
        Volunteer volunteer = read(id);
        Hibernate.initialize(volunteer.getCompetenceTestInvitations());
        return volunteer;
    }

    public Volunteer readWithSolutions(Long id){
        Volunteer volunteer = read(id);
        Hibernate.initialize(volunteer.getSolutions());
        return volunteer;
    }

    public Volunteer readWithInvitationsAndSolutions(Long id){
        Volunteer volunteer = read(id);
        Hibernate.initialize(volunteer.getCompetenceTestInvitations());
        Hibernate.initialize(volunteer.getSolutions());
        return volunteer;
    }

    public List<CompetenceTest> readAllInvitationsByVolunteerId(Long id){
        return volunteerRepository.findAllInvitationsByVolunteerId(id);
    }

    public void update(Volunteer volunteer) {
        volunteerRepository.save(volunteer);
    }

    public void delete(Long id) {
        volunteerRepository.delete(id); //opcjonalnie: deleteById(id);
    }

    public List<Volunteer> findAll() {
        return volunteerRepository.findAll();
    }
}
