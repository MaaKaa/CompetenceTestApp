package pl.marzenakaa.app.solution;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service
@Transactional
public class SolutionService {
    @Autowired
    SolutionRepository solutionRepository;

    public void create(Solution solution) {
        solution.setResultRoleAndAutonomy(calculateResultRoleAndAutonomy(solution));
        solution.setCommunicationResult(calculateComminicationResult(solution));
        solution.setTeamWorkResult(calculateTeamWorkResult(solution));
        solution.setFlexibilityResult(calculateFlexibilityResult(solution));
        solutionRepository.save(solution);
    }

    public Solution read(Long id) {
        return solutionRepository.findOne(id);
    }

    public List<Solution> readAll(){
        return solutionRepository.findAll();
    }

    public List <Solution> readAllByCompetenceTestIdAndVolunteerId(Long id, Long vId){
        return solutionRepository.findAllByCompetenceTestIdAndVolunteerId(id, vId);
    }

    public void update(Solution solution) {
        solutionRepository.save(solution);
    }

    public void delete(Long id) {
        solutionRepository.delete(id);
    }

    public List<Solution> findAll() {
        return solutionRepository.findAll();
    }

    public String calculateResultRoleAndAutonomy(Solution solution){
        int sum = solution.getRole() + solution.getAutonomy();
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
        if (sum < 6){
            return "Unable to generate result";
        } else if (sum >= 6 && sum <= 11){
            return "Partial";
        } else if (sum >= 12 && sum <= 15){
            return "Plain";
        } else {
            return "Excellent";
        }
    }

    public String calculateTeamWorkResult(Solution solution){
        int sum = solution.getTeamWorkQ1()+solution.getTeamWorkQ2()+solution.getTeamWorkQ3()+solution.getTeamWorkQ4()+solution.getTeamWorkQ5();
        if (sum < 5){
            return "Unable to generate result";
        } else if (sum >= 5 && sum <= 9){
            return "Partial";
        } else if (sum >= 10 && sum <= 12){
            return "Plain";
        } else {
            return "Excellent";
        }
    }

    public String calculateFlexibilityResult(Solution solution){
        int sum = solution.getFlexibilityQ1()+solution.getFlexibilityQ2()+solution.getFlexibilityQ3();
        if (sum < 3){
            return "Unable to generate result";
        } else if (sum >= 3 && sum <= 5){
            return "Partial";
        } else if (sum >= 6 && sum <= 7){
            return "Plain";
        } else {
            return "Excellent";
        }
    }
}
