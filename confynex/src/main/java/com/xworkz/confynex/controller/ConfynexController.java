package com.xworkz.confynex.controller;

import com.xworkz.confynex.dto.CoordinatorDTO;
import com.xworkz.confynex.dto.HostDTO;
import com.xworkz.confynex.service.ReadDataForDeligate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/")
public class ConfynexController {

    @Autowired
    ReadDataForDeligate readDataForDeligate;


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

    @PostMapping("/readConferenceDetails")
    public String readConferenceDetails(Model model){

        List<HostDTO> hostDTOS = readDataForDeligate.readHostDetails();

        List<CoordinatorDTO> coordinatorDTOS= readDataForDeligate.readCoordinatorDetails();

        model.addAttribute("hostDTO",hostDTOS);

        model.addAttribute("coordinatorDTO",coordinatorDTOS);

        return "fetchConferenceDetails";
    }

    @GetMapping("/forgotPassword")
    public String forgotPassword(){
        return "forgotPassword";
    }


}
