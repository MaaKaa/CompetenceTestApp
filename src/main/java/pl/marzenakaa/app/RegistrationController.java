package pl.marzenakaa.app;

import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import pl.marzenakaa.app.fieldsOfActivity.FIeldOfActivityService;
import pl.marzenakaa.app.fieldsOfActivity.FieldOfActivity;
import pl.marzenakaa.app.organisation.Organisation;
import pl.marzenakaa.app.organisation.OrganisationService;

import javax.validation.Valid;
import java.util.List;

@Controller
public class RegistrationController {

    private final OrganisationService organisationService;
    private final FIeldOfActivityService fieldOfActivityService;

    public RegistrationController(OrganisationService organisationService, FIeldOfActivityService fieldOfActivityService) {
        this.organisationService = organisationService;
        this.fieldOfActivityService = fieldOfActivityService;
    }

    @GetMapping("/register")
    public String showRegisterForm(Model model){
        model.addAttribute("organisation", new Organisation());
        return "registration-form";
    }

    @PostMapping("/register")
    public String processRegisterForm(Model model, @ModelAttribute("organisation") @Valid Organisation organisation, BindingResult result){
        if (result.hasErrors()) {
            return "registration-form";
        }

        Organisation organisation1 = organisationService.readByEmail(organisation.getEmail());
        if(organisation1 == null){
            organisation.setPassword(BCrypt.hashpw(organisation.getPassword(), BCrypt.gensalt()));
            organisationService.create(organisation);
        }else{
            model.addAttribute("error", true);
            model.addAttribute("errorMsg", "User with this email already exists. Choose different address.");
            return "registration-form";
        }

        model.addAttribute("success", true);
        model.addAttribute("successMsg", "Registration successful! Now you can log in:");
        return "redirect: /login";
    }

    @ModelAttribute("fieldsOfActivity")
    public List<FieldOfActivity> showFieldsOfActivity(){
        return fieldOfActivityService.findAll();
    }

}
