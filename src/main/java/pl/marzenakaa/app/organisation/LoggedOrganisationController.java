package pl.marzenakaa.app.organisation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.marzenakaa.app.competenceTest.CompetenceTest;
import pl.marzenakaa.app.competenceTest.CompetenceTestService;
import pl.marzenakaa.app.volunteer.Volunteer;
import pl.marzenakaa.app.volunteer.VolunteerService;

import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping("/org/logged")
public class LoggedOrganisationController {
    @Autowired
    OrganisationService organisationService;

    @Autowired
    CompetenceTestService competenceTestService;

    @Autowired
    VolunteerService volunteerService;

    @GetMapping("/{id}")
    public String showOrganisationHomePage(@PathVariable Long id, Model model){
        Organisation organisation = organisationService.read(id);
        model.addAttribute("organisation", organisation);
        CompetenceTest competenceTest = new CompetenceTest();
        competenceTest.setOrganisation(organisation);
        model.addAttribute("competenceTest", competenceTest);
        List<CompetenceTest> competenceTestsByOrg = competenceTestService.readByOrganisationId(id);
        model.addAttribute("competenceTestsByOrg", competenceTestsByOrg);
        return "logged-organisation";
    }

    @PostMapping("/{id}")
    public String processCreateCompetenceTestForm(@PathVariable Long id, @ModelAttribute("competenceTest") @Valid CompetenceTest competenceTest, BindingResult result) {
        if (result.hasErrors()) {
            return "/{id}";
        }
        competenceTestService.create(competenceTest);
        return "redirect: ";
    }


    //widok strony zarządzania testem kompetencji z możliwością zapraszania wolontariuszy:
    @GetMapping("/{id}/competence-test/{ctId}")
    public String showCompetenceTestPage(@PathVariable Long id, @PathVariable Long ctId, Model model){
        model.addAttribute("organisation", organisationService.read(id));
        model.addAttribute("competenceTest", competenceTestService.read(ctId));
        model.addAttribute("volunteer", new Volunteer());
        //model.addAttribute("invitedVolunteers", competenceTestService.showInvitedVolunteers(c));
        return "competence-test";
    }

    @PostMapping("/{id}/competence-test/{ctId}")
    public String processInviteVolunteersForm(@PathVariable Long id, @ModelAttribute("volunteer") @Valid Volunteer volunteer, BindingResult result){
        if (result.hasErrors()) {
            return "competence-test";
        }
        volunteerService.create(volunteer);
        return "redirect: ";
    }
}
