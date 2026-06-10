package com.xworkz.confynex.controller;

import com.xworkz.confynex.dto.CoordinatorDTO;
import com.xworkz.confynex.entity.CoordinatorEntity;
import com.xworkz.confynex.service.CoordinatorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.validation.Valid;

@Controller
@RequestMapping("/")
public class CoordinatorController {

    @Autowired
    private CoordinatorService coordinatorService;

    @Autowired
    CoordinatorDTO coordinatorDTO;

    public CoordinatorController() {
        System.out.println("Coordinator Controller...");
    }

    @PostMapping("/registerCoordinator")
    public String registerCoordinator(@Valid CoordinatorEntity coordinatorEntity, BindingResult bindingResult, Model model) {

        if (bindingResult.hasErrors()) {

            if (bindingResult.hasFieldErrors("fullName")) {
                model.addAttribute("fullNameError", bindingResult.getFieldError("fullName").getDefaultMessage());
            }

            if (bindingResult.hasFieldErrors("email")) {
                model.addAttribute("emailError", bindingResult.getFieldError("email").getDefaultMessage());
            }

            if (bindingResult.hasFieldErrors("organisationName")) {
                model.addAttribute("organisationError", bindingResult.getFieldError("organisationName").getDefaultMessage());
            }

            if (bindingResult.hasFieldErrors("phoneNumber")) {
                model.addAttribute("phoneError", bindingResult.getFieldError("phoneNumber").getDefaultMessage());
            }

            if (bindingResult.hasFieldErrors("designation")) {
                model.addAttribute("designationError", bindingResult.getFieldError("designation").getDefaultMessage());
            }

            if (bindingResult.hasFieldErrors("linkedInUrl")) {
                model.addAttribute("linkedInError", bindingResult.getFieldError("linkedInUrl").getDefaultMessage());
            }

            model.addAttribute("coordinatorEntity", coordinatorEntity);
            return "coordinatorsRegistration";
        }

        String result = coordinatorService.coordinatorsRegistrationValidation(coordinatorDTO);

        if ("Coordinator Registration Done".equalsIgnoreCase(result)) {

            model.addAttribute("registerSuccess", result);

        } else {

            model.addAttribute("registerFailed", result);
        }

        return "coordinatorsRegistration";
    }
}