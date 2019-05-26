package pl.marzenakaa.app.organisation;

import org.apache.commons.lang3.RandomStringUtils;
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
    public String processInviteVolunteersForm(@PathVariable Long id, @PathVariable Long ctId, @ModelAttribute("volunteer") @Valid Volunteer volunteer, BindingResult result){
        if (result.hasErrors()) {
            return "competence-test-management";
        }
        Volunteer volunteer1 = volunteerService.readByEmailWithCompetenceTests(volunteer.getEmail());
        if(volunteer1 == null){
            //Być może to generowane hasło trzeba przypisać do zmiennej i zapisać w bazie? A potem je zasolić? Bo teraz WOL nie może się jednak zalogować:
            volunteer.setPassword(RandomStringUtils.randomAlphanumeric(8));
            volunteerService.create(volunteer);
        }else{
            List<CompetenceTest> competenceTests = volunteer1.getCompetenceTests();
            competenceTests.add(competenceTestService.read(ctId));
            volunteer1.setCompetenceTests(competenceTests);
            volunteerService.update(volunteer1);
        }

        return "redirect: ";
    }
}
