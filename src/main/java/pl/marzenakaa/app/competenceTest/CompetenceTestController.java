package pl.marzenakaa.app.competenceTest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import pl.marzenakaa.app.solution.Solution;
import pl.marzenakaa.repository.SolutionRepository;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.List;

@Controller
public class CompetenceTestController {
    @Autowired
    SolutionRepository solutionRepository;

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
        solutionRepository.save(solution);
        return "home";
    }

    @ModelAttribute("roles")
    public List<String> showRoles(){
        List<String> roles = new ArrayList<>();
        roles.add(0, "I carried out operational or simple tasks under the supervision or the direct guidance of others.");
        roles.add(1, "I completed easy tasks in autonomy.");
        roles.add(2, "I carried out complex tasks under given instructions; supervise and support the work and the performance of others.");
        roles.add(3, "I managed the professional development of people and teams; I managed and transformed the context; I developed new ideas and I fostered innovation.");
        return roles;
    }

    @ModelAttribute("autonomy")
    public List<String> showAutonomy(){
        List<String> autonomy = new ArrayList<>();
        autonomy.add(0, "simple; recurrent that required easy tools and simple rules.");
        autonomy.add(1, "recurrent that required the choice of proper resources and tools as well as to adapt the  behaviour accordingly.");
        autonomy.add(2, "specialised; sometimes unexpected that required creative solutions.");
        autonomy.add(3, "complex and unpredicatble, not necessarily specialised that integrated knowledge from different fields.");
        return autonomy;
    }
}
