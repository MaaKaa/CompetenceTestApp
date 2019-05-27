package pl.marzenakaa.app;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import pl.marzenakaa.app.volunteer.Volunteer;
import pl.marzenakaa.app.volunteer.VolunteerService;

@Controller
@SessionAttributes("volunteerSession")
public class LoginControllerVolunteer {
    @Autowired
    VolunteerService volunteerService;

    @GetMapping("/login-volunteer")
    public String login() {
        return "login";
    }

    @PostMapping("/login-volunteer")
    public String login(@RequestParam String email, @RequestParam String password, Model model) {
        Volunteer volunteer = volunteerService.readByEmail(email);
        model.addAttribute("isLogged", false);
        if (volunteer == null) {
            return "login-volunteer";
        }
        if (BCrypt.checkpw(password, volunteer.getPassword())) {
            model.addAttribute("volunteerSession", volunteer);
            model.addAttribute("isLogged", true);
            return "redirect:vol/logged/";
        }
        return "login-volunteer";
    }
}
