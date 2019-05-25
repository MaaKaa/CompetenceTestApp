package pl.marzenakaa.app.volunteer;

import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface VolunteerRepository extends JpaRepository<Volunteer, Long> {

    Volunteer findByEmail(String email);

    List<Volunteer> findAll();

}
