package pl.marzenakaa.app;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import pl.marzenakaa.app.competenceTest.CompetenceTestService;
import pl.marzenakaa.app.organisation.OrganisationService;
import pl.marzenakaa.app.solution.SolutionService;
import pl.marzenakaa.app.volunteer.VolunteerService;

@Controller
public class HomeController {

    private final VolunteerService volunteerService;
    private final OrganisationService organisationService;
    private final CompetenceTestService competenceTestService;
    private final SolutionService solutionService;

    public HomeController(VolunteerService volunteerService, OrganisationService organisationService, CompetenceTestService competenceTestService, SolutionService solutionService) {
        this.volunteerService = volunteerService;
        this.organisationService = organisationService;
        this.competenceTestService = competenceTestService;
        this.solutionService = solutionService;
    }

    @GetMapping("/")
    public String showHomePage(Model model){
        model.addAttribute("noOfVolunteers", volunteerService.readAll());
        model.addAttribute("noOfOrganisations", organisationService.readAll());
        model.addAttribute("noOfProjects", competenceTestService.readAll());
        model.addAttribute("noOfSolutions", solutionService.findAll());
        return "home";
    }

    @GetMapping("/about-us")
    public String showAboutUsPage(){
        return "about-us";
    }

    @GetMapping("/privacy-policy")
    public String showPrivacyPolicyPage(){
        return "privacy-policy";
    }
}
