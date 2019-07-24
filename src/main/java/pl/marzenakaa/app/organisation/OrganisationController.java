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
import pl.marzenakaa.app.emails.EmailServiceImpl;
import pl.marzenakaa.app.solution.Solution;
import pl.marzenakaa.app.volunteer.Volunteer;
import pl.marzenakaa.app.volunteer.VolunteerService;

import javax.mail.SendFailedException;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/org/logged")
public class OrganisationController {

    private final OrganisationService organisationService;
    private final CompetenceTestService competenceTestService;
    private final VolunteerService volunteerService;
    private final EmailServiceImpl emailService;

    public OrganisationController(OrganisationService organisationService, CompetenceTestService competenceTestService, VolunteerService volunteerService, EmailServiceImpl emailService) {
        this.organisationService = organisationService;
        this.competenceTestService = competenceTestService;
        this.volunteerService = volunteerService;
        this.emailService = emailService;
    }

    @GetMapping("/")
    public String showOrganisationHomePage(HttpSession session, Model model) {
        Organisation organisationSession = (Organisation) session.getAttribute("organisationSession");
        Long organisationId = organisationSession.getId();
        Organisation organisation = organisationService.readWithCompetenceTests(organisationId);
        model.addAttribute("organisation", organisation);

        //Create new Competence Test form:
        CompetenceTest competenceTest = new CompetenceTest();
        competenceTest.setOrganisation(organisation);
        model.addAttribute("competenceTest", competenceTest);

        //Generate statistics:
        model.addAttribute("statsRoleAndAutonomyGeneralFromAllTests", competenceTestService.readOrgStatsForRoleAndAutonomy(organisationId, "General"));
        model.addAttribute("statsRoleAndAutonomyAccomplishedFromAllTests", competenceTestService.readOrgStatsForRoleAndAutonomy(organisationId, "Accomplished"));
        model.addAttribute("statsRoleAndAutonomyExpertFromAllTests", competenceTestService.readOrgStatsForRoleAndAutonomy(organisationId, "Expert"));
        model.addAttribute("statsCommunicationPartialFromAllTests", competenceTestService.readOrgStatsForCommunication(organisationId, "Partial"));
        model.addAttribute("statsCommunicationPlainFromAllTests", competenceTestService.readOrgStatsForCommunication(organisationId, "Plain"));
        model.addAttribute("statsCommunicationExcellentFromAllTests", competenceTestService.readOrgStatsForCommunication(organisationId, "Excellent"));
        model.addAttribute("statsFlexibilityPartialFromAllTests", competenceTestService.readOrgStatsForFlexibility(organisationId, "Partial"));
        model.addAttribute("statsFlexibilityPlainFromAllTests", competenceTestService.readOrgStatsForFlexibility(organisationId, "PLain"));
        model.addAttribute("statsFlexibilityExcellentFromAllTests", competenceTestService.readOrgStatsForFlexibility(organisationId, "Excellent"));
        model.addAttribute("statsTeamworkPartialFromAllTests", competenceTestService.readOrgStatsForTeamwork(organisationId, "Partial"));
        model.addAttribute("statsTeamworkPlainFromAllTests", competenceTestService.readOrgStatsForTeamwork(organisationId, "Plain"));
        model.addAttribute("statsTeamworkExcellentFromAllTests", competenceTestService.readOrgStatsForTeamwork(organisationId, "Excellent"));
        model.addAttribute("numberOfVolunteers", countInvitedVolunteers(organisationId));
        model.addAttribute("numberOfSolutions", countSolvedCompetenceTests(organisationId));
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
    public String showCompetenceTestManagementPage(HttpSession session, @PathVariable Long ctId, Model model) {
        model.addAttribute("organisation", session.getAttribute("organisationSession"));
        CompetenceTest competenceTest = competenceTestService.readWithSolutions(ctId);
        model.addAttribute("competenceTest", competenceTest);

        //Invite volunteers form:
        model.addAttribute("volunteer", new Volunteer());

        //Generate statistics:
        model.addAttribute("statsRoleAndAutonomyGeneral", competenceTestService.readTestStatsForRoleAndAutonomy(ctId, "General"));
        model.addAttribute("statsRoleAndAutonomyAccomplished", competenceTestService.readTestStatsForRoleAndAutonomy(ctId, "Accomplished"));
        model.addAttribute("statsRoleAndAutonomyExpert", competenceTestService.readTestStatsForRoleAndAutonomy(ctId, "Expert"));
        model.addAttribute("statsCommunicationPartial", competenceTestService.readTestStatsForCommunication(ctId, "Partial"));
        model.addAttribute("statsCommunicationPlain", competenceTestService.readTestStatsForCommunication(ctId, "Plain"));
        model.addAttribute("statsCommunicationExcellent", competenceTestService.readTestStatsForCommunication(ctId, "Excellent"));
        model.addAttribute("statsFlexibilityPartial", competenceTestService.readTestStatsForFlexibility(ctId, "Partial"));
        model.addAttribute("statsFlexibilityPlain", competenceTestService.readTestStatsForFlexibility(ctId, "Plain"));
        model.addAttribute("statsFlexibilityExcellent", competenceTestService.readTestStatsForFlexibility(ctId, "Excellent"));
        model.addAttribute("statsTeamworkPartial", competenceTestService.readTestStatsForTeamwork(ctId, "Partial"));
        model.addAttribute("statsTeamworkPlain", competenceTestService.readTestStatsForTeamwork(ctId, "Plain"));
        model.addAttribute("statsTeamworkExcellent", competenceTestService.readTestStatsForTeamwork(ctId, "Excellent"));

        /*
        //Get qualitative results:
        List<Solution> solutions = competenceTest.getSolutions();
        for(Solution solution : solutions){
            List<String> tasks = new ArrayList<>();
            tasks.add(solution.getTask());
            model.addAttribute("tasks", tasks.toString());
            List<String> challenges = new ArrayList<>();
            challenges.add(solution.getChallenge());
            model.addAttribute("challenges", challenges.toString());
            List<String> lessonsLearned = new ArrayList<>();
            lessonsLearned.add(solution.getLessonLearned());
            model.addAttribute("lessonsLearned", lessonsLearned.toString());
            List<String> comments = new ArrayList<>();
            comments.add(solution.getComments());
            model.addAttribute("comments", comments.toString());
        }*/

        return "competence-test-management";
    }

    @PostMapping("/competence-test/{ctId}")
    public String processInviteVolunteersForm(Model model, HttpSession session, @PathVariable Long ctId, @ModelAttribute("volunteer") @Valid Volunteer volunteer, BindingResult result) {
        if (result.hasErrors()) {
            return "competence-test-management";
        }

        Volunteer vol = volunteerService.readByEmail(volunteer.getEmail());

        if (vol == null) {
            String tempPassword = RandomStringUtils.randomAlphanumeric(8);
            volunteer.setTemporaryPassword(tempPassword);
            volunteer.setPassword(BCrypt.hashpw(tempPassword, BCrypt.gensalt()));
            volunteerService.create(volunteer);

            try {
                emailService.sendHtmlMessage(volunteer.getEmail(), "Competence test: New invitation", "<p>Hello " + volunteer.getName() + "! </p>" +
                        "<p> Organisation <b>" + session.getAttribute("organisationSession") + "</b> invites you to take the competence test concerning the <b>" + competenceTestService.read(ctId).getName() + "</b> project in which you volunteered.</p>" +
                        "<p>Log in to take the test and find out which competencies you developed thanks to this project!</p>" +
                        "<p><a href=\"http://competencetest.com/login\">http://competencetest.com/login</a></p>" +
                        "<p>Your temporary password: " + volunteer.getTemporaryPassword() + "</p>" +
                        "<p>If you have any questions, do not hesitate to contact us - we'll be happy to help :) </p>" +
                        "<p>Greetings,</p>" +
                        "<p>Competence Test App Team</p>");
                //model.addAttribute("sendingSuccessful", true);
                //model.addAttribute("sendingSuccessMsg", "Invitation sent successfully!");
            } catch (Exception e) {
                e.printStackTrace();
                //model.addAttribute("sendingFailed", true);
                //model.addAttribute("sendingFailedMsg", "Sorry, invitation couldn't be sent :(");
            }
        } else {
            vol = volunteerService.readByEmailWithCompetenceTests(volunteer.getEmail());
            List<CompetenceTest> competenceTests = vol.getCompetenceTests();
            competenceTests.add(competenceTestService.read(ctId));
            vol.setCompetenceTests(competenceTests);
            volunteerService.update(vol);

            try {
                emailService.sendHtmlMessage(vol.getEmail(), "Competence test: New invitation", "<p>Hello " + volunteer.getName() + "! </p>" +
                        "<p> Organisation <b>" + session.getAttribute("organisationSession") + "</b> invites you to take the competence test concerning the <b>" + competenceTestService.read(ctId).getName() + "</b> project in which you volunteered.</p>" +
                        "<p>Log in to take the test and find out which competencies you developed thanks to this project!</p>" +
                        "<p><a href=\"http://competencetest.com/login\">http://competencetest.com/login</a></p>" +
                        "<p>If you have any questions, do not hesitate to contact us - we'll be happy to help :) </p>" +
                        "<p>Greetings,</p>" +
                        "<p>Competence Test App Team</p>");
                //model.addAttribute("sendingSuccessful", true);
                //model.addAttribute("sendingSuccessMsg", "Invitation sent successfully!");
            } catch (Exception e) {
                e.printStackTrace();
                //model.addAttribute("sendingFailed", true);
                //model.addAttribute("sendingFailedMsg", "Sorry, invitation couldn't be sent :(");
            }
        }

        return "redirect: ";
    }

    private int countInvitedVolunteers(Long id) {
        int numberOfVolunteers = 0;
        Organisation organisation = organisationService.readWithCompetenceTests(id);
        List<CompetenceTest> competenceTests = organisation.getCompetenceTests();
        for (CompetenceTest competenceTest : competenceTests) {
            List<Volunteer> volunteers = competenceTest.getVolunteers();
            numberOfVolunteers = numberOfVolunteers + volunteers.size();
        }
        return numberOfVolunteers;
    }

    private int countSolvedCompetenceTests(Long id) {
        int numberOfSolved = 0;
        Organisation organisation = organisationService.readWithCompetenceTests(id);
        List<CompetenceTest> competenceTests = organisation.getCompetenceTests();
        for (CompetenceTest competenceTest : competenceTests) {
            List<Solution> solutions = competenceTestService.readWithSolutions(competenceTest.getId()).getSolutions();
            numberOfSolved = numberOfSolved + solutions.size();
        }
        return numberOfSolved;
    }

}