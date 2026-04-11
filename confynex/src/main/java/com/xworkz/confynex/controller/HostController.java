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

            if (bindingResult.hasFieldErrors("hostName")) {
                model.addAttribute("hostNameError", bindingResult.getFieldError("hostName").getDefaultMessage());
            } else {
                model.addAttribute("hostNameError", "");
            }

            if (bindingResult.hasFieldErrors("companyName")) {
                model.addAttribute("companyNameError", bindingResult.getFieldError("companyName").getDefaultMessage());
            } else {
                model.addAttribute("companyNameError", "");
            }

            if (bindingResult.hasFieldErrors("email")) {
                model.addAttribute("emailError", bindingResult.getFieldError("email").getDefaultMessage());
            } else {
                model.addAttribute("emailError", "");
            }

            if (bindingResult.hasFieldErrors("phNumber")) {
                model.addAttribute("phoneError", bindingResult.getFieldError("phNumber").getDefaultMessage());
            } else {
                model.addAttribute("phoneError", "");
            }

            if (bindingResult.hasFieldErrors("title")) {
                model.addAttribute("titleError", bindingResult.getFieldError("title").getDefaultMessage());
            } else {
                model.addAttribute("titleError", "");
            }

            if (bindingResult.hasFieldErrors("conferenceDate")) {
                model.addAttribute("conferenceDateError", bindingResult.getFieldError("conferenceDate").getDefaultMessage());
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
        if (!hostDTO.getPassword().equals(hostDTO.getConfirmPassword())) {
            model.addAttribute("confirmPasswordError", "Passwords do not match");
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
