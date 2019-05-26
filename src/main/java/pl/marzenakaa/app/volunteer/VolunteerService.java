package pl.marzenakaa.app.volunteer;

import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
        return volunteerRepository.findOne(id);
    }

    public Volunteer readByEmail(String email){
        return volunteerRepository.findByEmail(email);
    }

    public Volunteer readByEmailWithCompetenceTests(String email){
        Volunteer volunteer = readByEmail(email);
        Hibernate.initialize(volunteer.getCompetenceTests());
        return volunteer;
    }

    public Volunteer readWithCompetenceTests(Long id){
        Volunteer volunteer = read(id);
        Hibernate.initialize(volunteer.getCompetenceTests());
        return volunteer;
    }

    public Volunteer readWithSolutions(Long id){
        Volunteer volunteer = read(id);
        Hibernate.initialize(volunteer.getSolutions());
        return volunteer;
    }

    public Volunteer readWithCompetenceTestsAndSolutions(Long id){
        Volunteer volunteer = read(id);
        Hibernate.initialize(volunteer.getCompetenceTests());
        Hibernate.initialize(volunteer.getSolutions());
        return volunteer;
    }

    public List<Volunteer> readAll(){
        return volunteerRepository.findAll();
    }

    public List<Volunteer> readAllWithCompetenceTestsAndSolutions(){
        List<Volunteer> volunteers = readAll();
        for(Volunteer volunteer : volunteers){
            Hibernate.initialize(volunteer.getCompetenceTests());
            Hibernate.initialize(volunteer.getSolutions());
        }
        return volunteers;
    }

    public void update(Volunteer volunteer) {
        volunteerRepository.save(volunteer);
    }

    public void delete(Long id) {
        volunteerRepository.delete(id);
    }

    public List<Volunteer> findAll() {
        return volunteerRepository.findAll();
    }
}
