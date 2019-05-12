package pl.marzenakaa.app.fieldsOfActivity;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;

public class FieldOfActivityConverter implements Converter<String, FieldOfActivity> {

    @Autowired
    FIeldOfActivityService fIeldOfActivityService;

    @Override
    public FieldOfActivity convert(String s){
        return fIeldOfActivityService.read(Long.parseLong(s));
    }
}
