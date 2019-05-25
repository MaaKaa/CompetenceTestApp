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

@Controller
@RequestMapping("/org/logged")
public class OrganisationController {
    @Autowired
    OrganisationService organisationService;

    @Autowired
    CompetenceTestService competenceTestService;

    @Autowired
    VolunteerService volunteerService;


    @GetMapping("/{id}")
    public String showOrganisationHomePage(@PathVariable Long id, Model model){
        Organisation organisation = organisationService.readWithCompetenceTests(id);
        model.addAttribute("organisation", organisation);
        CompetenceTest competenceTest = new CompetenceTest();
        competenceTest.setOrganisation(organisation);
        model.addAttribute("competenceTest", competenceTest);
        return "dashboard-organisation";
    }

    @PostMapping("/{id}")
    public String processCreateCompetenceTestForm(@PathVariable Long id, @ModelAttribute("competenceTest") @Valid CompetenceTest competenceTest, BindingResult result) {
        if (result.hasErrors()) {
            return "dashboard-organisation";
        }
        competenceTestService.create(competenceTest);
        return "redirect: ";
    }

    @GetMapping("/{id}/competence-test/{ctId}")
    public String showCompetenceTestManagementPage(@PathVariable Long id, @PathVariable Long ctId, Model model){
        model.addAttribute("organisation", organisationService.read(id));
        model.addAttribute("competenceTest", competenceTestService.read(ctId));
        model.addAttribute("volunteer", new Volunteer());
        return "competence-test-management";
    }

    @PostMapping("/{id}/competence-test/{ctId}")
    public String processInviteVolunteersForm(@PathVariable Long id, @ModelAttribute("volunteer") @Valid Volunteer volunteer, BindingResult result){
        if (result.hasErrors()) {
            return "competence-test-management";
        }
        volunteerService.create(volunteer);
        return "redirect: ";
    }
}
