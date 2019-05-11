package pl.marzenakaa.app.organisation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;

public class FieldOfActivityConverter implements Converter<String, FieldOfActivity> {
    @Autowired
    FieldOfActivityRepository fieldOfActivityRepository;

    @Override
    public FieldOfActivity convert(String s){
        return fieldOfActivityRepository.findOne(Long.parseLong(s));
    }
}
