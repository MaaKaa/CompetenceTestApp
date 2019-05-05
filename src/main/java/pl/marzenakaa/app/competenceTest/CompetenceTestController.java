package pl.marzenakaa.app.competenceTest;

import com.sun.org.apache.bcel.internal.generic.RET;
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
        solution.setResultRoleAndAutonomy(calculateResultRoleAndAutonomy(solution));
        solution.setCommunicationResult(calculateComminicationResult(solution));
        solutionRepository.save(solution);
        return "home";
    }

    public String calculateResultRoleAndAutonomy(Solution solution){
        int sum = Integer.parseInt(solution.getRole()) + Integer.parseInt(solution.getAutonomy());
        if (sum <= 3){
            return "General";
        }else if(sum >= 4 && sum <= 7){
            return "Accomplished";
        }else{
            return "Expert";
        }
    }

    public String calculateComminicationResult(Solution solution){
        int sum = solution.getCommunicationQ1()+solution.getCommunicationQ2()+solution.getCommunicationQ3()+solution.getCommunicationQ4()+solution.getCommunicationQ5()+solution.getCommunicationQ6();
        if (sum <= 6){
            return "Unable to generate result";
        } else if (sum >= 6 && sum <= 11){
            return "Partial";
        } else if (sum >= 12 && sum <= 15){
            return "Plain";
        } else {
            return "Excelent";
        }
    }
}
