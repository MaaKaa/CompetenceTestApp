package pl.marzenakaa.app.solution;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

import static org.junit.Assert.*;

public class SolutionServiceTest {
    private Solution solution;
    private SolutionService solutionService;
    private SolutionRepository solutionRepository;

    @Before
    public void setup(){
        solution = new Solution();
        solutionService = new SolutionService(solutionRepository);
    }

    @Test
    public void calculateResultRoleAndAutonomy_shouldReturnGeneral() {
        //given
        int autonomy = 0;
        int role = 3;
        String expected = "General";
        //when
        solution.setAutonomy(autonomy);
        solution.setRole(role);
        //then
        Assert.assertEquals(expected, solutionService.calculateResultRoleAndAutonomy(solution));
    }

    @Test
    public void calculateResultRoleAndAutonomy_shouldReturnAdvanced() {
        //given
        int autonomy = 1;
        int role = 3;
        String expected = "Accomplished";
        //when
        solution.setAutonomy(autonomy);
        solution.setRole(role);
        //then
        Assert.assertEquals(expected, solutionService.calculateResultRoleAndAutonomy(solution));
    }

    @Test
    public void calculateResultRoleAndAutonomy_shouldReturnExpert() {
        //given
        int autonomy = 5;
        int role = 3;
        String expected = "Expert";
        //when
        solution.setAutonomy(autonomy);
        solution.setRole(role);
        //then
        Assert.assertEquals(expected, solutionService.calculateResultRoleAndAutonomy(solution));
    }

    @Test
    public void calculateComminicationResult() {

    }

    @Test
    public void calculateTeamWorkResult() {
    }

    @Test
    public void calculateFlexibilityResult() {
    }
}