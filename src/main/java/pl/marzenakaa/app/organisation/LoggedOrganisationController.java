package pl.marzenakaa.app.organisation;

import org.omg.CORBA.COMM_FAILURE;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.marzenakaa.app.competenceTest.CompetenceTest;
import pl.marzenakaa.app.volunteer.Volunteer;
import pl.marzenakaa.repository.CompetenceTestRepository;
import pl.marzenakaa.repository.OrganisationRepository;
import pl.marzenakaa.repository.VolunteerRepository;

import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping("/org/logged")
public class LoggedOrganisationController {
    @Autowired
    OrganisationRepository organisationRepository;

    @Autowired
    CompetenceTestRepository competenceTestRepository;

    @Autowired
    VolunteerRepository volunteerRepository;

    @GetMapping("/{id}")
    public String showOrganisationHomePage(@PathVariable Long id, Model model){
        Organisation organisation = organisationRepository.findOne(id);
        model.addAttribute("organisation", organisation);
        CompetenceTest competenceTest = new CompetenceTest();
        competenceTest.setOrganisation(organisation);
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


    //widok strony testu kompetencji z możliwością zapraszania wolontariuszy
    @GetMapping("/{id}/competence-test/{ctId}")
    public String showCompetenceTestPage(@PathVariable Long id, @PathVariable Long ctId, Model model){
        Organisation organisation = organisationRepository.findOne(id);
        model.addAttribute("organisation", organisation);
        CompetenceTest competenceTest = competenceTestRepository.findOne(ctId);
        model.addAttribute(competenceTest);
        //nie działa dodawanie do wolontariusza competenceTestInvitation
        Volunteer volunteer = new Volunteer();
        model.addAttribute(volunteer);
        return "competence-test";
    }

    @PostMapping("/{id}/competence-test/{ctId}")
    public String processInviteVolunteersForm(@PathVariable Long id, @ModelAttribute("volunteer") @Valid Volunteer volunteer, BindingResult result){
        if (result.hasErrors()) {
            return "/{id}";
        }
        volunteerRepository.save(volunteer);
        return "redirect: ";
    }
}
