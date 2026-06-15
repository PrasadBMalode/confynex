package com.xworkz.confynex.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class ConfynexController {


    public ConfynexController(){
        System.out.println("Confynex Controller...");
    }

    @PostMapping("/login")
    public String login(){
        return "login";
    }

    @GetMapping("/index")
    public String index(){
        return "index";
    }
    @GetMapping("/homefromDelegate")
    public String homefromDelegate(){
        return "index";
    }

    @GetMapping("/featuresFromDelegate")
    public String featuresFromDelegate(){
        return "index";
    }

    @GetMapping("/contactFromDelegate")
    public String contactFromDelegate(){
        return "index";
    }

}
