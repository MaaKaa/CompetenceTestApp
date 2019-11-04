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
        Assert.assertEquals("Looks like the values assigned to the answers sum up to a negative number, which is not right.", expected, solutionService.calculateResultRoleAndAutonomy(solution));
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
        Assert.assertEquals("Looks like the values assigned to the answers sum up to 0, which is not right.", expected, solutionService.calculateResultRoleAndAutonomy(solution));
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
        Assert.assertEquals("Looks like the values assigned to the answers sum up to 1, which is not right.",expected, solutionService.calculateResultRoleAndAutonomy(solution));
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
        Assert.assertEquals("When the sum of the role and autonomy is 2, it should return General.", expected, solutionService.calculateResultRoleAndAutonomy(solution));
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
        Assert.assertEquals("When the sum of the role and autonomy is 3, it should return General.", expected, solutionService.calculateResultRoleAndAutonomy(solution));
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
        Assert.assertEquals("When the sum of the role and autonomy is 4, it should return Accomplished.", expected, solutionService.calculateResultRoleAndAutonomy(solution));
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
        Assert.assertEquals("When the sum of the role and autonomy is 4, it should return Accomplished.", expected, solutionService.calculateResultRoleAndAutonomy(solution));
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
        Assert.assertEquals("When the sum of the role and autonomy is 8, it should return Expert.", expected, solutionService.calculateResultRoleAndAutonomy(solution));
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
        Assert.assertEquals("Looks like the values assigned to the answers sum up to 9, which is not right.", expected, solutionService.calculateResultRoleAndAutonomy(solution));
    }

    @Test
    public void calculateCommunicationResult_givenNegativeNumber_shouldReturnUnableToGenerateResult() {
        //given
        int resultQ1 = -1;
        int resultQ2 = 0;
        int resultQ3 = 0;
        int resultQ4 = 0;
        int resultQ5 = 0;
        int resultQ6 = 0;
        String expected = "Unable to generate result";
        //when
        solution.setCommunicationQ1(resultQ1);
        solution.setCommunicationQ2(resultQ2);
        solution.setCommunicationQ3(resultQ3);
        solution.setCommunicationQ4(resultQ4);
        solution.setCommunicationQ5(resultQ5);
        solution.setCommunicationQ6(resultQ6);
        //then
        Assert.assertEquals("Looks like the values assigned to the answers sum up to a negative number, which is not right.", expected, solutionService.calculateResultRoleAndAutonomy(solution));
    }

    @Test
    public void calculateCommunicationResult_givenZero_shouldReturnUnableToGenerateResult() {
        //given
        int resultQ1 = 0;
        int resultQ2 = 0;
        int resultQ3 = 0;
        int resultQ4 = 0;
        int resultQ5 = 0;
        int resultQ6 = 0;
        String expected = "Unable to generate result";
        //when
        solution.setCommunicationQ1(resultQ1);
        solution.setCommunicationQ2(resultQ2);
        solution.setCommunicationQ3(resultQ3);
        solution.setCommunicationQ4(resultQ4);
        solution.setCommunicationQ5(resultQ5);
        solution.setCommunicationQ6(resultQ6);
        //then
        Assert.assertEquals("When the sum of the values assigned to the answers is 0, should return: Unable to generate result.", expected, solutionService.calculateCommunicationResult(solution));
    }

    @Test
    public void calculateCommunicationResult_givenFive_shouldReturnUnableToGenerateResult() {
        //given
        int resultQ1 = 1;
        int resultQ2 = 1;
        int resultQ3 = 1;
        int resultQ4 = 1;
        int resultQ5 = 1;
        int resultQ6 = 0;
        String expected = "Unable to generate result";
        //when
        solution.setCommunicationQ1(resultQ1);
        solution.setCommunicationQ2(resultQ2);
        solution.setCommunicationQ3(resultQ3);
        solution.setCommunicationQ4(resultQ4);
        solution.setCommunicationQ5(resultQ5);
        solution.setCommunicationQ6(resultQ6);
        //then
        Assert.assertEquals("When the sum of the values assigned to the answers is lower than 6, should return: Unable to generate result.", expected, solutionService.calculateCommunicationResult(solution));
    }

    @Test
    public void calculateCommunicationResult_givenSix_shouldReturnPartial() {
        //given
        int resultQ1 = 1;
        int resultQ2 = 1;
        int resultQ3 = 1;
        int resultQ4 = 1;
        int resultQ5 = 1;
        int resultQ6 = 1;
        String expected = "Partial";
        //when
        solution.setCommunicationQ1(resultQ1);
        solution.setCommunicationQ2(resultQ2);
        solution.setCommunicationQ3(resultQ3);
        solution.setCommunicationQ4(resultQ4);
        solution.setCommunicationQ5(resultQ5);
        solution.setCommunicationQ6(resultQ6);
        //then
        Assert.assertEquals("When the sum of the values assigned to the answers is 6, should return: Partial.", expected, solutionService.calculateCommunicationResult(solution));
    }

    @Test
    public void calculateCommunicationResult_givenEleven_shouldReturnPartial() {
        //given
        int resultQ1 = 2;
        int resultQ2 = 2;
        int resultQ3 = 2;
        int resultQ4 = 2;
        int resultQ5 = 2;
        int resultQ6 = 1;
        String expected = "Partial";
        //when
        solution.setCommunicationQ1(resultQ1);
        solution.setCommunicationQ2(resultQ2);
        solution.setCommunicationQ3(resultQ3);
        solution.setCommunicationQ4(resultQ4);
        solution.setCommunicationQ5(resultQ5);
        solution.setCommunicationQ6(resultQ6);
        //then
        Assert.assertEquals("When the sum of the values assigned to the answers is 11, should return: Partial.", expected, solutionService.calculateCommunicationResult(solution));
    }

    @Test
    public void calculateCommunicationResult_givenTwelve_shouldReturnPlain() {
        //given
        int resultQ1 = 2;
        int resultQ2 = 2;
        int resultQ3 = 2;
        int resultQ4 = 2;
        int resultQ5 = 2;
        int resultQ6 = 2;
        String expected = "Plain";
        //when
        solution.setCommunicationQ1(resultQ1);
        solution.setCommunicationQ2(resultQ2);
        solution.setCommunicationQ3(resultQ3);
        solution.setCommunicationQ4(resultQ4);
        solution.setCommunicationQ5(resultQ5);
        solution.setCommunicationQ6(resultQ6);
        //then
        Assert.assertEquals("When the sum of the values assigned to the answers is 12, should return: Plain.", expected, solutionService.calculateCommunicationResult(solution));
    }

    @Test
    public void calculateCommunicationResult_givenSeventeen_shouldReturnPlain() {
        //given
        int resultQ1 = 3;
        int resultQ2 = 3;
        int resultQ3 = 3;
        int resultQ4 = 3;
        int resultQ5 = 3;
        int resultQ6 = 2;
        String expected = "Plain";
        //when
        solution.setCommunicationQ1(resultQ1);
        solution.setCommunicationQ2(resultQ2);
        solution.setCommunicationQ3(resultQ3);
        solution.setCommunicationQ4(resultQ4);
        solution.setCommunicationQ5(resultQ5);
        solution.setCommunicationQ6(resultQ6);
        //then
        Assert.assertEquals("When the sum of the values assigned to the answers is 17, should return: Plain.", expected, solutionService.calculateCommunicationResult(solution));
    }

    @Test
    public void calculateCommunicationResult_givenEighteen_shouldReturnExcellent() {
        //given
        int resultQ1 = 3;
        int resultQ2 = 3;
        int resultQ3 = 3;
        int resultQ4 = 3;
        int resultQ5 = 3;
        int resultQ6 = 3;
        String expected = "Excellent";
        //when
        solution.setCommunicationQ1(resultQ1);
        solution.setCommunicationQ2(resultQ2);
        solution.setCommunicationQ3(resultQ3);
        solution.setCommunicationQ4(resultQ4);
        solution.setCommunicationQ5(resultQ5);
        solution.setCommunicationQ6(resultQ6);
        //then
        Assert.assertEquals("When the sum of the values assigned to the answers is 18, should return: Excellent.", expected, solutionService.calculateCommunicationResult(solution));
    }

    @Test
    public void calculateCommunicationResult_givenNineteen_shouldReturnUnableToGenerateResult() {
        //given
        int resultQ1 = 3;
        int resultQ2 = 3;
        int resultQ3 = 3;
        int resultQ4 = 3;
        int resultQ5 = 3;
        int resultQ6 = 4;
        String expected = "Unable to generate result";
        //when
        solution.setCommunicationQ1(resultQ1);
        solution.setCommunicationQ2(resultQ2);
        solution.setCommunicationQ3(resultQ3);
        solution.setCommunicationQ4(resultQ4);
        solution.setCommunicationQ5(resultQ5);
        solution.setCommunicationQ6(resultQ6);
        //then
        Assert.assertEquals("Looks like the values assigned to the answers sum up to 19, which is not right.", expected, solutionService.calculateCommunicationResult(solution));
    }

    @Test
    public void calculateTeamWorkResult() {
    }

    @Test
    public void calculateFlexibilityResult() {
    }
}