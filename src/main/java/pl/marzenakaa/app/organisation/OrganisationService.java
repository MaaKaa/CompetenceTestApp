package pl.marzenakaa.app.organisation;

import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import javax.transaction.Transactional;
import java.util.List;

@Service
@Transactional
public class OrganisationService {

    @Autowired
    OrganisationRepository organisationRepository;

    public void create(Organisation organisation) {
        organisationRepository.save(organisation);
    }

    public Organisation read(Long id) {
        return organisationRepository.findOne(id);
    }

    public List<Organisation> readAllWithFieldsOfActivity(){
        List<Organisation> organisations = readAll();
        for (Organisation organisation : organisations){
            Hibernate.initialize(organisation.getFieldsOfActivity());
        }
        return organisations;
    }

    public Organisation readWithCompetenceTests(Long id){
        Organisation organisation = read(id);
        Hibernate.initialize(organisation.getCompetenceTests());
        return organisation;
    }

    public List<Organisation> readAll(){
        return organisationRepository.findAll();
    }

    public void update(Organisation organisation) {
        organisationRepository.save(organisation);
    }

    public void delete(Long id) {
        organisationRepository.delete(id);
    }

    public List<Organisation> findAll() {
        return organisationRepository.findAll();
    }
}
