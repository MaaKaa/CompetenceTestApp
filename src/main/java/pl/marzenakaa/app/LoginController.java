package pl.marzenakaa.app;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import pl.marzenakaa.app.organisation.Organisation;
import pl.marzenakaa.app.organisation.OrganisationService;
import pl.marzenakaa.app.volunteer.Volunteer;
import pl.marzenakaa.app.volunteer.VolunteerService;

@Controller
@SessionAttributes({"organisationSession", "volunteerSession"})
public class LoginController {

    private final OrganisationService organisationService;
    private final VolunteerService volunteerService;

    public LoginController(OrganisationService organisationService, VolunteerService volunteerService) {
        this.organisationService = organisationService;
        this.volunteerService = volunteerService;
    }

    @GetMapping("/login")
    public String login() {
        return "login";
    }

    @PostMapping("/login")
    public String login(@RequestParam String email, @RequestParam String password, Model model) {

        model.addAttribute("isLogged", false);
        Volunteer volunteer = volunteerService.readByEmail(email);
        Organisation organisation = organisationService.readByEmail(email);

        if(organisation == null && volunteer == null){
            model.addAttribute("errorNoUser", true);
            model.addAttribute("errorNoUserMsg", "No such user. Try again.");
            return "login";
        }

        if(organisation != null){
            if (BCrypt.checkpw(password, organisation.getPassword())) {
                model.addAttribute("organisationSession", organisation);
                model.addAttribute("isLogged", true);
                return "redirect:org/logged/";
            }
        }

        if(volunteer != null){
            if (BCrypt.checkpw(password, volunteer.getPassword())) {
                model.addAttribute("volunteerSession", volunteer);
                model.addAttribute("isLogged", true);
                return "redirect:vol/logged/";
            }
        }

        model.addAttribute("errorWrongCredentials", true);
        model.addAttribute("errorWrongCredentialsMsg", "Email or password incorrect. Try again.");
        return "login";
    }
}
