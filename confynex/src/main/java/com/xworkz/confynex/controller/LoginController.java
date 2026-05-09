package com.xworkz.confynex.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class LoginController {
    public LoginController(){
        System.out.println("login controller...");
    }

    @PostMapping("/handleLogin(event)")
    public String login(String email, String password ){

        return "loginSuccess";
    }

}
