package pl.marzenakaa.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.marzenakaa.app.organisation.FieldOfActivity;

public interface FieldOfActivityRepository extends JpaRepository<FieldOfActivity, Long> {
}
