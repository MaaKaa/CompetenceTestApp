package pl.marzenakaa.app.competenceTest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import pl.marzenakaa.app.solution.Solution;
import pl.marzenakaa.app.solution.SolutionService;
import pl.marzenakaa.app.volunteer.VolunteerService;

import javax.validation.Valid;

@Controller
public class CompetenceTestController {

    @Autowired
    SolutionService solutionService;

    @Autowired
    VolunteerService volunteerService;

    @GetMapping("/competenceTest")
    public String showCompetenceTest(Model model){
        model.addAttribute("solution", new Solution());
        return "competence-test-form";
    }

    @PostMapping("/competenceTest")
    public String processCompetenceTest(@ModelAttribute("solution") @Valid Solution solution, BindingResult result){
        if (result.hasErrors()) {
            return "competence-test-form";
        }
        solutionService.create(solution);
        return "redirect:competence-test-results";
    }

}
