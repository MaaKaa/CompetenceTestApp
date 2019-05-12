package pl.marzenakaa.app.volunteer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.marzenakaa.app.competenceTest.CompetenceTestService;

@Controller
@RequestMapping("/vol")
public class VolunteerController {
    @Autowired
    VolunteerService volunteerService;

    @Autowired
    CompetenceTestService competenceTestService;

    @GetMapping("/logged/{id}")
    public String showVolunteerHomePage(@PathVariable Long id, Model model){
        model.addAttribute("volunteer", volunteerService.readWithInvitationsAndSolutions(id));
        model.addAttribute("competenceTestInvitationsByVolunteerId", competenceTestService.readByInvitedVolunteerId(id));
        return "logged-volunteer";
    }
}
