package pl.marzenakaa.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.marzenakaa.app.solution.Solution;

public interface SolutionRepository extends JpaRepository<Solution, Long> {
}
