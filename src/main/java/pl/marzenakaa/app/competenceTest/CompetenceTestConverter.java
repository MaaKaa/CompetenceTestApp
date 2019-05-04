package pl.marzenakaa.app.competenceTest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import pl.marzenakaa.repository.CompetenceTestRepository;

public class CompetenceTestConverter implements Converter<String, CompetenceTest> {
    @Autowired
    CompetenceTestRepository competenceTestRepository;

    @Override
    public CompetenceTest convert(String s){
        return competenceTestRepository.findOne(Long.parseLong(s));
    }
}
