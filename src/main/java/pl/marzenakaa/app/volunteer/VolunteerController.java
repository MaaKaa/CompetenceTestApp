package pl.marzenakaa.app.volunteer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.marzenakaa.app.competenceTest.CompetenceTestService;
import pl.marzenakaa.app.solution.Solution;
import pl.marzenakaa.app.solution.SolutionService;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

@Controller
@RequestMapping("/vol/logged")
public class VolunteerController {
    @Autowired
    VolunteerService volunteerService;

    @Autowired
    CompetenceTestService competenceTestService;

    @Autowired
    SolutionService solutionService;

    @GetMapping("/")
    public String showVolunteerHomePage(HttpSession session, Model model){
        Volunteer volunteerSession = (Volunteer)session.getAttribute("volunteerSession");
        Volunteer volunteer = volunteerService.readWithCompetenceTestsAndSolutions(volunteerSession.getId());
        model.addAttribute("volunteer", volunteer);
        model.addAttribute("competenceTestsWithoutSolutions", competenceTestService.readAllWithoutSolutionsByVolunteerId(volunteerSession.getId()));
        return "dashboard-volunteer";
    }

    @GetMapping("/competenceTest/{ctId}")
    public String showCompetenceTest(HttpSession session, @PathVariable Long ctId, Model model){
        model.addAttribute("volunteer", session.getAttribute("volunteerSession"));
        model.addAttribute("competenceTest", competenceTestService.read(ctId));
        model.addAttribute("solution", new Solution());
        return "competence-test-form";
    }

    @PostMapping("/competenceTest/{ctId}")
    public String processCompetenceTest(@ModelAttribute("solution") @Valid Solution solution, BindingResult result){
        if (result.hasErrors()) {
            return "redirect:/vol/logged/competenceTest/{ctId}";
        }
        solutionService.create(solution);
        return "redirect:/vol/logged/competenceTest/{ctId}/results";
    }

    @GetMapping("/competenceTest/{ctId}/results")
    public String showCompetenceTestResults(HttpSession session, @PathVariable Long ctId, Model model){
        Volunteer volunteer = (Volunteer)session.getAttribute("volunteerSession");
        model.addAttribute("volunteer", volunteer);
        model.addAttribute("solutionByCompetenceTestIdAndVolunteerId", solutionService.readByCompetenceTestIdAndVolunteerId(ctId, volunteer.getId()));
        return "competence-test-results";
    }
}
