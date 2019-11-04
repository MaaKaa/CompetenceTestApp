package pl.marzenakaa.app.solution;

import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service
@Transactional
public class SolutionService {

    private final SolutionRepository solutionRepository;

    public SolutionService(SolutionRepository solutionRepository) {
        this.solutionRepository = solutionRepository;
    }

    public void create(Solution solution) {
        solution.setResultRoleAndAutonomy(calculateResultRoleAndAutonomy(solution));
        solution.setCommunicationResult(calculateCommunicationResult(solution));
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

    public Solution readByCompetenceTestIdAndVolunteerId(Long id, Long vId){
        return solutionRepository.findByCompetenceTestIdAndVolunteerId(id, vId);
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
        if (sum <= 1){
            return "Unable to generate result";
        }else if (sum <= 3){
            return "General";
        }else if(sum <= 7){
            return "Accomplished";
        }else if (sum == 8){
            return "Expert";
        } else {
            return "Unable to generate result";
        }
    }

    public String calculateCommunicationResult(Solution solution){
        int sum = solution.getCommunicationQ1()+solution.getCommunicationQ2()+solution.getCommunicationQ3()+solution.getCommunicationQ4()+solution.getCommunicationQ5()+solution.getCommunicationQ6();
        if (sum < 6){
            return "Unable to generate result";
        } else if (sum <= 11){
            return "Partial";
        } else if (sum <= 15){
            return "Plain";
        } else if (sum <= 16){
            return "Excellent";
        } else {
            return "Unable to generate result";
        }
    }

    public String calculateTeamWorkResult(Solution solution){
        int sum = solution.getTeamWorkQ1()+solution.getTeamWorkQ2()+solution.getTeamWorkQ3()+solution.getTeamWorkQ4()+solution.getTeamWorkQ5();
        if (sum < 5){
            return "Unable to generate result";
        } else if (sum <= 9){
            return "Partial";
        } else if (sum <= 12){
            return "Plain";
        } else if (sum <= 15){
            return "Excellent";
        } else {
            return "Unable to generate result";
        }
    }

    public String calculateFlexibilityResult(Solution solution){
        int sum = solution.getFlexibilityQ1()+solution.getFlexibilityQ2()+solution.getFlexibilityQ3();
        if (sum < 3){
            return "Unable to generate result";
        } else if (sum <= 5){
            return "Partial";
        } else if (sum <= 7){
            return "Plain";
        } else if (sum <= 9){
            return "Excellent";
        } else {
            return "Unable to generate result";
        }
    }

}
