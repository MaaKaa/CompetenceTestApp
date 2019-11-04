package pl.marzenakaa.app.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.marzenakaa.app.competenceTest.CompetenceTestService;
import pl.marzenakaa.app.organisation.OrganisationService;
import pl.marzenakaa.app.solution.SolutionService;
import pl.marzenakaa.app.volunteer.VolunteerService;

@Controller
@RequestMapping("admin/")
public class AdminController {

    private final OrganisationService organisationService;
    private final VolunteerService volunteerService;
    private final CompetenceTestService competenceTestService;
    private final SolutionService solutionService;

    public AdminController(OrganisationService organisationService, VolunteerService volunteerService, CompetenceTestService competenceTestService, SolutionService solutionService) {
        this.organisationService = organisationService;
        this.volunteerService = volunteerService;
        this.competenceTestService = competenceTestService;
        this.solutionService = solutionService;
    }

    @GetMapping("/")
    public String showAdminDashboard(Model model){
        model.addAttribute("organisations", organisationService.readAll());
        model.addAttribute("volunteers", volunteerService.readAllWithCompetenceTestsAndSolutions());
        model.addAttribute("competenceTests", competenceTestService.readAll());
        model.addAttribute("solutions", solutionService.readAll());
        return "admin";
    }

    @GetMapping("/deleteOrganisation/{id}")
    public String processDeleteOrganisation(@PathVariable Long id) {
        organisationService.delete(id);
        return "redirect: /";
    }

    @GetMapping("/deleteVolunteer/{id}")
    public String processDeleteVolunteer(@PathVariable Long id) {
        volunteerService.delete(id);
        return "redirect: /";
    }

    @GetMapping("/deleteCompetenceTest/{id}")
    public String processDeleteCompetenceTest(@PathVariable Long id) {
        competenceTestService.delete(id);
        return "redirect: /";
    }

    @GetMapping("/deleteSolution/{id}")
    public String processDeleteSolution(@PathVariable Long id) {
        solutionService.delete(id);
        return "redirect: /";
    }

}
