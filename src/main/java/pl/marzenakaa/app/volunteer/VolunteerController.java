package pl.marzenakaa.app.volunteer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/vol")
public class VolunteerController {
    @Autowired
    VolunteerService volunteerService;

    @GetMapping("/logged/{id}")
    public String showVolunteerHomePage(@PathVariable Long id, Model model){
        Volunteer volunteer = volunteerService.read(id);
        model.addAttribute(volunteer);
        //List<CompetenceTest> competenceTestInvitations = volunteerRepository.findAllInvitationsByVolunteerId(id);
        //model.addAttribute("competenceTestInvitations", competenceTestInvitations);
        //List<Solution> solutionsByVolunteer = volunteerRepository.finaAllSolutionsByVolunteerId(id);
        //model.addAttribute("solutionsByVolunteer", solutionsByVolunteer);
        return "logged-volunteer";
    }
}