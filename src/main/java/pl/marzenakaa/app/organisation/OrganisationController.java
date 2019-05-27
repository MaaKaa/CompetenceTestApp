package pl.marzenakaa.app.organisation;

import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.marzenakaa.app.competenceTest.CompetenceTest;
import pl.marzenakaa.app.competenceTest.CompetenceTestService;
import pl.marzenakaa.app.volunteer.Volunteer;
import pl.marzenakaa.app.volunteer.VolunteerService;

import javax.servlet.http.HttpSession;
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

    @GetMapping("/")
    public String showOrganisationHomePage(HttpSession session, Model model){
        Organisation organisationSession = (Organisation)session.getAttribute("organisationSession");
        Organisation organisation = organisationService.readWithCompetenceTests(organisationSession.getId());
        model.addAttribute("organisation", organisation);
        CompetenceTest competenceTest = new CompetenceTest();
        competenceTest.setOrganisation(organisation);
        model.addAttribute("competenceTest", competenceTest);
        return "dashboard-organisation";
    }

    @PostMapping("/")
    public String processCreateCompetenceTestForm(@ModelAttribute("competenceTest") @Valid CompetenceTest competenceTest, BindingResult result) {
        if (result.hasErrors()) {
            return "dashboard-organisation";
        }
        competenceTestService.create(competenceTest);
        return "redirect: ";
    }

    @GetMapping("/competence-test/{ctId}")
    public String showCompetenceTestManagementPage(HttpSession session, @PathVariable Long ctId, Model model){
        model.addAttribute("organisation", session.getAttribute("organisationSession"));
        model.addAttribute("competenceTest", competenceTestService.read(ctId));
        model.addAttribute("volunteer", new Volunteer());
        return "competence-test-management";
    }

    @PostMapping("/competence-test/{ctId}")
    public String processInviteVolunteersForm(@PathVariable Long ctId, @ModelAttribute("volunteer") @Valid Volunteer volunteer, BindingResult result){
        if (result.hasErrors()) {
            return "competence-test-management";
        }

        Volunteer volunteer1 = volunteerService.readByEmail(volunteer.getEmail());
        if(volunteer1 == null){
            //Być może to generowane hasło trzeba przypisać do zmiennej i zapisać w bazie? A potem je zasolić? Bo teraz WOL nie może się jednak zalogować:
            //volunteer.setPassword(RandomStringUtils.randomAlphanumeric(8));
            volunteer.setPassword(BCrypt.hashpw(volunteer.getPassword(), BCrypt.gensalt()));
            volunteerService.create(volunteer);
        }else{
            volunteer1 = volunteerService.readByEmailWithCompetenceTests(volunteer.getEmail());
            List<CompetenceTest> competenceTests = volunteer1.getCompetenceTests();
            competenceTests.add(competenceTestService.read(ctId));
            volunteer1.setCompetenceTests(competenceTests);
            volunteerService.update(volunteer1);
        }

        return "redirect: ";
    }

}
