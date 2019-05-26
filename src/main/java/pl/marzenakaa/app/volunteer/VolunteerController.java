package pl.marzenakaa.app.volunteer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.marzenakaa.app.competenceTest.CompetenceTestService;
import pl.marzenakaa.app.solution.Solution;
import pl.marzenakaa.app.solution.SolutionService;

import javax.validation.Valid;

@Controller
@RequestMapping("/vol")
public class VolunteerController {
    @Autowired
    VolunteerService volunteerService;

    @Autowired
    CompetenceTestService competenceTestService;

    @Autowired
    SolutionService solutionService;

    @GetMapping("/logged/{id}")
    public String showVolunteerHomePage(@PathVariable Long id, Model model){
        Volunteer volunteer = volunteerService.readWithCompetenceTestsAndSolutions(id);
        model.addAttribute("volunteer", volunteer);
        model.addAttribute("competenceTestsWithoutSolutions", competenceTestService.readAllWithoutSolutionsByVolunteerId(id));
        return "dashboard-volunteer";
    }

    @GetMapping("/logged/{id}/competenceTest/{ctId}")
    public String showCompetenceTest(@PathVariable Long id, @PathVariable Long ctId, Model model){
        model.addAttribute("volunteer", volunteerService.readWithCompetenceTests(id));
        model.addAttribute("competenceTest", competenceTestService.read(ctId));
        model.addAttribute("solution", new Solution());
        return "competence-test-form";
    }

    @PostMapping("/logged/{id}/competenceTest/{ctId}")
    public String processCompetenceTest(@ModelAttribute("solution") @Valid Solution solution, BindingResult result){
        if (result.hasErrors()) {
            return "competence-test-form";
        }
        solutionService.create(solution);
        return "redirect:/vol/logged/{id}/competenceTest/{ctId}/results";
    }

    @GetMapping("/logged/{id}/competenceTest/{ctId}/results")
    public String showCompetenceTestResults(@PathVariable Long id, @PathVariable Long ctId, Model model){
        model.addAttribute("volunteer", volunteerService.readWithCompetenceTests(id));
        model.addAttribute("solutionByCompetenceTestIdAndVolunteerId", solutionService.readByCompetenceTestIdAndVolunteerId(ctId, id));
        return "competence-test-results";
    }
}
