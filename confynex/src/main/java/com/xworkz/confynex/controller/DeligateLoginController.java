package com.xworkz.confynex.controller;

import com.xworkz.confynex.service.DelegateLoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/")
public class DeligateLoginController {

    @Autowired
    DelegateLoginService delegateLoginService;

    @PostMapping("/delegateLogin")
    public String login(
            @RequestParam String email,
            @RequestParam Long password,
            HttpSession session) {

        boolean valid = delegateLoginService.login(email, password);

        if(valid){
            session.setAttribute("delegateEmail", email);
            return "delegateDashboard.jsp";
        }
        return "delegateLogin.jsp";
    }

}
