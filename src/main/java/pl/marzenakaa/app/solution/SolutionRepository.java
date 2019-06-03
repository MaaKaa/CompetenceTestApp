package pl.marzenakaa.app.solution;

import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface SolutionRepository extends JpaRepository<Solution, Long> {

    List<Solution> findAll();

    Solution findByCompetenceTestIdAndVolunteerId(Long id, Long vId);

    //do poprawienia:
    List<Solution> findAllByCompetenceTestIdAndVolunteerId(Long id, Long vId);


}
