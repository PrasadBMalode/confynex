package com.xworkz.confynex.controller;

import com.xworkz.confynex.dto.HostDTO;
import com.xworkz.confynex.dto.SignInDTO;
import com.xworkz.confynex.service.HostService;
import com.xworkz.confynex.service.HostSignInService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

@Controller
@RequestMapping("/")
public class HostSignInController {

    @Autowired
    HostSignInService hostSignInService;

    @Autowired
    HostService hostService;


    public HostSignInController(){
        System.out.println("Sign in controller...");
    }

    @PostMapping("/signin")
    public String signin(@Valid SignInDTO signInDTO, BindingResult bindingResult, Model model, HttpSession httpSession){

        if (bindingResult.hasErrors()){

            if (bindingResult.hasFieldErrors("email")) {
                model.addAttribute("emailError", bindingResult.getFieldError("email").getDefaultMessage());
            } else {
                model.addAttribute("emailError", "");
            }

            if (bindingResult.hasFieldErrors("password")) {
                model.addAttribute("passwordError", bindingResult.getFieldError("password").getDefaultMessage());
            } else {
                model.addAttribute("passwordError", "");
            }
            return "index";
        }

        String result = hostSignInService.signInValidation(signInDTO.getEmail(), signInDTO.getPassword());
        if (result.equalsIgnoreCase("LOGIN_SUCCESS")) {
            httpSession.setAttribute("loggedInEmail", signInDTO.getEmail());
            //model.addAttribute("email", loginDTO.getEmail());

            // FETCH USER DATA
            HostDTO hostDTO = hostService.checkEmailExist(signInDTO.getEmail());

            if (hostDTO != null && hostDTO.getFileEntity() != null) {
                model.addAttribute("imagePath", hostDTO.getFileEntity().getExcelFile());
            }
            return "loginSuccess";

        } else if (result.equalsIgnoreCase("EMAIL_NOT_FOUND")) {
            model.addAttribute("loginFailed", "Email not found");
            return "index";

        } else if (result.equalsIgnoreCase("INVALID_PASSWORD")) {
            model.addAttribute("loginFailed", "Invalid password");
            return "index";

        } else if (result.equalsIgnoreCase("ACCOUNT_BLOCKED")) {
            model.addAttribute("loginFailed", "Account is blocked after 3 failed attempts");
            return "index";
        }
        model.addAttribute("loginFailed", "Something went wrong");
        return "index";
    }

}
