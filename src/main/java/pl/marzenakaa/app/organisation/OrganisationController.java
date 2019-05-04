package pl.marzenakaa.app.organisation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import pl.marzenakaa.repository.FieldOfActivityRepository;
import pl.marzenakaa.repository.OrganisationRepository;

import javax.validation.Valid;
import java.util.List;

@Controller
public class OrganisationController {
    @Autowired
    OrganisationRepository organisationRepository;

    @Autowired
    FieldOfActivityRepository fieldOfActivityRepository;

    //REGISTRATION: TO BE FINISHED, WHEN THE LOG-IN WILL BE READY (now it only saves the user's details in the DB)
    @GetMapping("/register")
    public String showRegisterForm(Model model){
        model.addAttribute("organisation", new Organisation());
        return "registration-form-organisation";
    }

    @PostMapping("/register")
    public String processRegisterForm(@ModelAttribute("organisation") @Valid Organisation organisation, BindingResult result){
        if (result.hasErrors()) {
            return "registration-form-organisation";
        }
        organisationRepository.save(organisation);
        return "login-form-organisation";
    }

    @ModelAttribute("fieldsOfActivity")
    public List<FieldOfActivity> showFieldsOfActivity(){
        List<FieldOfActivity> fieldsOfActivity = fieldOfActivityRepository.findAll();
        return fieldsOfActivity;
    }

}
