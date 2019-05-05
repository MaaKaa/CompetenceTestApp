package pl.marzenakaa.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.marzenakaa.app.volunteer.Volunteer;

public interface VolunteerRepository extends JpaRepository<Volunteer, Long> {
}
