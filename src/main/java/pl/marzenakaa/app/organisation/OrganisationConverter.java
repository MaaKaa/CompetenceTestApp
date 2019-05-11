package pl.marzenakaa.app.organisation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;

public class OrganisationConverter implements Converter<String, Organisation> {
    @Autowired
    OrganisationRepository organisationRepository;

    @Override
    public Organisation convert(String s){
        return organisationRepository.findOne(Long.parseLong(s));
    }
}