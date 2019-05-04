package pl.marzenakaa.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.marzenakaa.app.competenceTest.CompetenceTest;

public interface CompetenceTestRepository extends JpaRepository<CompetenceTest, Long> {
}
