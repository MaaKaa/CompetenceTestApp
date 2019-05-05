package pl.marzenakaa.app.organisation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.marzenakaa.app.competenceTest.CompetenceTest;
import pl.marzenakaa.repository.CompetenceTestRepository;
import pl.marzenakaa.repository.OrganisationRepository;

import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping("/org/logged")
public class LoggedOrganisationController {
    @Autowired
    OrganisationRepository organisationRepository;

    @Autowired
    CompetenceTestRepository competenceTestRepository;

    @GetMapping("/{id}")
    public String showVolunteerHomePage(@PathVariable Long id, Model model){
        Organisation organisation = organisationRepository.findOne(id);
        model.addAttribute("organisation", organisation);
        CompetenceTest competenceTest = new CompetenceTest();
        competenceTest.setOrganisation(organisation); //nie działa ten setter
        model.addAttribute("competenceTest", competenceTest);
        List<CompetenceTest> competenceTestsByOrg = competenceTestRepository.findByOrganisationId(id);
        model.addAttribute("competenceTestsByOrg", competenceTestsByOrg);
        return "logged-organisation";
    }

    @PostMapping("/{id}")
    public String processCreateCompetenceTestForm(@PathVariable Long id, @ModelAttribute("competenceTest") @Valid CompetenceTest competenceTest, BindingResult result) {
        if (result.hasErrors()) {
            return "/{id}";
        }
        competenceTestRepository.save(competenceTest);
        return "redirect: ";
    }

    //dodanie akcji dla widoku strony testu kompetencji z możliwością zapraszania wolontariuszy
}
