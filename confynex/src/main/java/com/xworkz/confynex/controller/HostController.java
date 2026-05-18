package com.xworkz.confynex.controller;

import com.xworkz.confynex.dto.HostDTO;
import com.xworkz.confynex.service.HostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PostMapping;

import javax.validation.Valid;

@Controller
public class HostController {

    @Autowired
    HostService hostService;

    public HostController() {
        System.out.println("its Host Controller...");
    }

    @PostMapping("/registerHost")
    public String registerHost(@Valid HostDTO hostDTO, BindingResult bindingResult, Model model) {
        if (bindingResult.hasErrors()) {

            if (bindingResult.hasFieldErrors("full_name")) {
                model.addAttribute("hostNameError", bindingResult.getFieldError("full_name").getDefaultMessage());
            } else {
                model.addAttribute("hostNameError", "");
            }

            if (bindingResult.hasFieldErrors("company_name")) {
                model.addAttribute("companyNameError", bindingResult.getFieldError("company_name").getDefaultMessage());
            } else {
                model.addAttribute("companyNameError", "");
            }

            if (bindingResult.hasFieldErrors("email")) {
                model.addAttribute("emailError", bindingResult.getFieldError("email").getDefaultMessage());
            } else {
                model.addAttribute("emailError", "");
            }

            if (bindingResult.hasFieldErrors("phone")) {
                model.addAttribute("phNumberError", bindingResult.getFieldError("phone").getDefaultMessage());
            } else {
                model.addAttribute("phNumberError", "");
            }

            if (bindingResult.hasFieldErrors("conference_title")) {
                model.addAttribute("titleError", bindingResult.getFieldError("conference_title").getDefaultMessage());
            } else {
                model.addAttribute("titleError", "");
            }

            if (bindingResult.hasFieldErrors("conference_date")) {
                model.addAttribute("conferenceDateError", bindingResult.getFieldError("conference_date").getDefaultMessage());
            } else {
                model.addAttribute("conferenceDateError", "");
            }

            if (bindingResult.hasFieldErrors("venue")) {
                model.addAttribute("venueError", bindingResult.getFieldError("venue").getDefaultMessage());
            } else {
                model.addAttribute("venueError", "");
            }

            if (bindingResult.hasFieldErrors("password")) {
                model.addAttribute("passwordError", bindingResult.getFieldError("password").getDefaultMessage());
            } else {
                model.addAttribute("passwordError", "");
            }

            model.addAttribute("hostDTO", hostDTO);
            return "login";
        }

        // Confirm password validation
        if (hostDTO.getPassword() == null ||
                hostDTO.getConfirm_password() == null ||
                !hostDTO.getPassword().equals(hostDTO.getConfirm_password())) {

            model.addAttribute("confirmPasswordError",
                    "Passwords do not match");

            model.addAttribute("hostDTO", hostDTO);

            return "login";
        }

        String validation = hostService.hostRegistrationValidation(hostDTO);

        if (validation.equalsIgnoreCase("Host Registration Done")) {
            model.addAttribute("registerSuccess", validation);
        } else if (validation.equalsIgnoreCase("Host Registration Failed...!")) {
            model.addAttribute("registerFailed", validation);
        } else if (validation.equalsIgnoreCase("Host already exist")) {
            model.addAttribute("existData", validation);
        }
        return "login";
    }

}
