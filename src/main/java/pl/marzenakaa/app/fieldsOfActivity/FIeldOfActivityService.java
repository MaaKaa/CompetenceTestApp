package pl.marzenakaa.app.fieldsOfActivity;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pl.marzenakaa.app.organisation.Organisation;

import javax.transaction.Transactional;
import java.util.List;

@Service
@Transactional
public class FIeldOfActivityService {

    @Autowired
    FieldOfActivityRepository fieldOfActivityRepository;

    public void create(FieldOfActivity fieldOfActivity) {
        fieldOfActivityRepository.save(fieldOfActivity);
    }

    public FieldOfActivity read(Long id) {
        return fieldOfActivityRepository.findOne(id); //opcjonalnie: findById(id).orElse(null);
    }

    public void update(FieldOfActivity fieldOfActivity) {
        fieldOfActivityRepository.save(fieldOfActivity);
    }

    public void delete(Long id) {
        fieldOfActivityRepository.delete(id); //opcjonalnie: deleteById(id);
    }

    public List<FieldOfActivity> findAll() {
        return fieldOfActivityRepository.findAll();
    }
}
