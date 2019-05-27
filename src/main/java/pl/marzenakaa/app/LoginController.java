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

@Controller
@SessionAttributes("organisationSession")
public class LoginController {
    @Autowired
    OrganisationService organisationService;

    @GetMapping("/login")
    public String login() {
        return "login";
    }

    @PostMapping("/login")
    public String login(@RequestParam String email, @RequestParam String password, Model model) {
        Organisation organisation = organisationService.readByEmail(email);
        model.addAttribute("isLogged", false);
        if (organisation == null) {
            return "login";
        }
        if (BCrypt.checkpw(password, organisation.getPassword())) {
            model.addAttribute("organisationSession", organisation);
            model.addAttribute("isLogged", true);
            return "redirect:org/logged/";
        }
        return "login";
    }
}
