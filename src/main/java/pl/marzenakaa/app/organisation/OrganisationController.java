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
        Long organisationId = organisationSession.getId();
        Organisation organisation = organisationService.readWithCompetenceTests(organisationId);
        model.addAttribute("organisation", organisation);
        CompetenceTest competenceTest = new CompetenceTest();
        competenceTest.setOrganisation(organisation);
        model.addAttribute("competenceTest", competenceTest);
        //Statistics:
        model.addAttribute("statsRoleAndAutonomyGeneralFromAllTests", competenceTestService.readAllNumberOfSolutionsByRoleAndAutonomyResult(organisationId, "General"));
        model.addAttribute("statsRoleAndAutonomyAccomplishedFromAllTests", competenceTestService.readAllNumberOfSolutionsByRoleAndAutonomyResult(organisationId, "Accomplished"));
        model.addAttribute("statsRoleAndAutonomyExpertFromAllTests", competenceTestService.readAllNumberOfSolutionsByRoleAndAutonomyResult(organisationId, "Expert"));
        model.addAttribute("statsCommunicationPartialFromAllTests", competenceTestService.readAllNumberOfSolutionsByCommunicationResult(organisationId, "Partial"));
        model.addAttribute("statsCommunicationPlainFromAllTests", competenceTestService.readAllNumberOfSolutionsByCommunicationResult(organisationId, "Plain"));
        model.addAttribute("statsCommunicationExcellentFromAllTests", competenceTestService.readAllNumberOfSolutionsByCommunicationResult(organisationId, "Excellent"));
        model.addAttribute("statsFlexibilityPartialFromAllTests", competenceTestService.readAllNumberOfSolutionsByFlexibilityResult(organisationId, "Partial"));
        model.addAttribute("statsFlexibilityPlainFromAllTests", competenceTestService.readAllNumberOfSolutionsByFlexibilityResult(organisationId, "PLain"));
        model.addAttribute("statsFlexibilityExcellentFromAllTests", competenceTestService.readAllNumberOfSolutionsByFlexibilityResult(organisationId, "Excellent"));
        model.addAttribute("statsTeamworkPartialFromAllTests", competenceTestService.readAllNumberOfSolutionsByTeamworkResult(organisationId, "Partial"));
        model.addAttribute("statsTeamworkPlainFromAllTests", competenceTestService.readAllNumberOfSolutionsByTeamworkResult(organisationId, "Plain"));
        model.addAttribute("statsTeamworkExcellentFromAllTests", competenceTestService.readAllNumberOfSolutionsByTeamworkResult(organisationId, "Excellent"));
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
        model.addAttribute("competenceTest", competenceTestService.readWithSolutions(ctId));
        model.addAttribute("volunteer", new Volunteer());
        //Statistics:
        model.addAttribute("statsRoleAndAutonomyGeneral", competenceTestService.readNumberOfSolutionsByRoleAndAutonomyResult(ctId, "General"));
        model.addAttribute("statsRoleAndAutonomyAccomplished", competenceTestService.readNumberOfSolutionsByRoleAndAutonomyResult(ctId, "Accomplished"));
        model.addAttribute("statsRoleAndAutonomyExpert", competenceTestService.readNumberOfSolutionsByRoleAndAutonomyResult(ctId, "Expert"));
        model.addAttribute("statsCommunicationPartial", competenceTestService.readNumberOfSolutionsByCommunicationResult(ctId, "Partial"));
        model.addAttribute("statsCommunicationPlain", competenceTestService.readNumberOfSolutionsByCommunicationResult(ctId, "Plain"));
        model.addAttribute("statsCommunicationExcellent", competenceTestService.readNumberOfSolutionsByCommunicationResult(ctId, "Excellent"));
        model.addAttribute("statsFlexibilityPartial", competenceTestService.readNumberOfSolutionsByFlexibilityResult(ctId, "Partial"));
        model.addAttribute("statsFlexibilityPlain", competenceTestService.readNumberOfSolutionsByFlexibilityResult(ctId, "Plain"));
        model.addAttribute("statsFlexibilityExcellent", competenceTestService.readNumberOfSolutionsByFlexibilityResult(ctId, "Excellent"));
        model.addAttribute("statsTeamworkPartial", competenceTestService.readNumberOfSolutionsByTeamworkResult(ctId, "Partial"));
        model.addAttribute("statsTeamworkPlain", competenceTestService.readNumberOfSolutionsByTeamworkResult(ctId, "Plain"));
        model.addAttribute("statsTeamworkExcellent", competenceTestService.readNumberOfSolutionsByTeamworkResult(ctId, "Excellent"));
        return "competence-test-management";
    }

    @PostMapping("/competence-test/{ctId}")
    public String processInviteVolunteersForm(@PathVariable Long ctId, @ModelAttribute("volunteer") @Valid Volunteer volunteer, BindingResult result){
        if (result.hasErrors()) {
            return "competence-test-management";
        }

        Volunteer volunteer1 = volunteerService.readByEmail(volunteer.getEmail());

        if(volunteer1 == null){
            String tempPassword = RandomStringUtils.randomAlphanumeric(8);
            volunteer.setTemporaryPassword(tempPassword);
            volunteer.setPassword(BCrypt.hashpw(tempPassword, BCrypt.gensalt()));
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
