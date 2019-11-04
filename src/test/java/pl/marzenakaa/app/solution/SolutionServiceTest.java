package pl.marzenakaa.app.solution;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.mockito.Mock;
import org.mockito.Mockito;

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
    public void calculateResultRoleAndAutonomy_givenNegativeNumber_shouldReturnUnableToGenerateResult() {
        //given
        int autonomy = -1;
        int role = 0;
        String expected = "Unable to generate result";
        //when
        solution.setAutonomy(autonomy);
        solution.setRole(role);
        //then
        Assert.assertEquals(expected, solutionService.calculateResultRoleAndAutonomy(solution));
    }

    @Test
    public void calculateResultRoleAndAutonomy_givenZero_shouldReturnUnableToGenerateResult() {
        //given
        int autonomy = 0;
        int role = 0;
        String expected = "Unable to generate result";
        //when
        solution.setAutonomy(autonomy);
        solution.setRole(role);
        //then
        Assert.assertEquals(expected, solutionService.calculateResultRoleAndAutonomy(solution));
    }

    @Test
    public void calculateResultRoleAndAutonomy_givenOne_shouldReturnUnableToGenerateResult() {
        //given
        int autonomy = 0;
        int role = 1;
        String expected = "Unable to generate result";
        //when
        solution.setAutonomy(autonomy);
        solution.setRole(role);
        //then
        Assert.assertEquals(expected, solutionService.calculateResultRoleAndAutonomy(solution));
    }

    @Test
    public void calculateResultRoleAndAutonomy_givenNine_shouldReturnUnableToGenerateResult() {
        //given
        int autonomy = 8;
        int role = 1;
        String expected = "Unable to generate result";
        //when
        solution.setAutonomy(autonomy);
        solution.setRole(role);
        //then
        Assert.assertEquals(expected, solutionService.calculateResultRoleAndAutonomy(solution));
    }

    @Test
    public void calculateResultRoleAndAutonomy_givenTwo_shouldReturnGeneral() {
        //given
        int autonomy = 1;
        int role = 1;
        String expected = "General";
        //when
        solution.setAutonomy(autonomy);
        solution.setRole(role);
        //then
        Assert.assertEquals(expected, solutionService.calculateResultRoleAndAutonomy(solution));
    }

    @Test
    public void calculateResultRoleAndAutonomy_givenThree_shouldReturnGeneral() {
        //given
        int autonomy = 1;
        int role = 2;
        String expected = "General";
        //when
        solution.setAutonomy(autonomy);
        solution.setRole(role);
        //then
        Assert.assertEquals(expected, solutionService.calculateResultRoleAndAutonomy(solution));
    }

    @Test
    public void calculateResultRoleAndAutonomy_givenFour_shouldReturnAccomplished() {
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
    public void calculateResultRoleAndAutonomy_givenSeven_shouldReturnAccomplished() {
        //given
        int autonomy = 4;
        int role = 3;
        String expected = "Accomplished";
        //when
        solution.setAutonomy(autonomy);
        solution.setRole(role);
        //then
        Assert.assertEquals(expected, solutionService.calculateResultRoleAndAutonomy(solution));
    }

    @Test
    public void calculateResultRoleAndAutonomy_givenEight_shouldReturnExpert() {
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
    public void calculateCommunicationResult() {

    }

    @Test
    public void calculateTeamWorkResult() {
    }

    @Test
    public void calculateFlexibilityResult() {
    }
}