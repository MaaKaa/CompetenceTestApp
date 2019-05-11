package pl.marzenakaa.app.volunteer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pl.marzenakaa.app.solution.Solution;

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
