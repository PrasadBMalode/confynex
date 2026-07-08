package com.xworkz.confynex.controller;

import com.xworkz.confynex.dto.DeligateLoginDTO;
import com.xworkz.confynex.service.DelegateLoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import javax.validation.constraints.Past;

@Controller
@RequestMapping("/")
public class DeligateLoginController {

    @Autowired
    DelegateLoginService delegateLoginService;

    @PostMapping("/delegateLogin")
    public String delegateLogin(@Valid DeligateLoginDTO dto,
            BindingResult bindingResult,
            Model model,
            HttpSession session) {

        if (bindingResult.hasErrors()) {

            if (bindingResult.hasFieldErrors("email")) {
                model.addAttribute("emailError",
                        bindingResult.getFieldError("email").getDefaultMessage());
            }

            if (bindingResult.hasFieldErrors("accessPIN")) {
                model.addAttribute("accessPINError",
                        bindingResult.getFieldError("accessPIN").getDefaultMessage());
            }
            return "delegateLogin";
        }

        boolean valid = delegateLoginService.login(dto.getEmail(), Long.valueOf(dto.getAccessPIN()));

        if (valid) {
            session.setAttribute("delegateEmail", dto.getEmail());
            return "delegateDashboard";
        }

        model.addAttribute("loginError", "Invalid Email or Access PIN");
        return "delegateLogin";
    }



}
