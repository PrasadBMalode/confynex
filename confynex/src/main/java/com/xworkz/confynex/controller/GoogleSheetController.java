package com.xworkz.confynex.controller;

import com.xworkz.confynex.service.GoogleSheetService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class GoogleSheetController {

    @Autowired
    private GoogleSheetService googleSheetService;

    @GetMapping("/readSheet")
    @ResponseBody
    public String readSheet() {

        googleSheetService.readSheet().forEach(System.out::println);

        return "Google Sheet Read Successfully";
    }
}