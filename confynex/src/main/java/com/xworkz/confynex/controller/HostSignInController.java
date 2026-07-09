package com.xworkz.confynex.controller;

import com.xworkz.confynex.dto.HostDTO;
import com.xworkz.confynex.dto.SignInDTO;
import com.xworkz.confynex.service.HostService;
import com.xworkz.confynex.service.HostSignInService;
import com.xworkz.confynex.service.OTPService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

@Controller
@RequestMapping("/")
public class HostSignInController {

    @Autowired
    private HostSignInService hostSignInService;

    @Autowired
    private HostService hostService;

    @Autowired
    private OTPService otpService;

    public HostSignInController() {
        System.out.println("HostSignInController created...");
    }

    // ========================= LOGIN =========================

    @PostMapping("/hostLogin")
    public String signin(@Valid SignInDTO signInDTO,
                         BindingResult bindingResult,
                         Model model,
                         HttpSession session) {

        if (bindingResult.hasErrors()) {

            model.addAttribute("emailError",
                    bindingResult.hasFieldErrors("email")
                            ? bindingResult.getFieldError("email").getDefaultMessage()
                            : "");

            model.addAttribute("passwordError",
                    bindingResult.hasFieldErrors("password")
                            ? bindingResult.getFieldError("password").getDefaultMessage()
                            : "");

            return "index";
        }

        String result = hostSignInService.signInValidation(
                signInDTO.getEmail(),
                signInDTO.getPassword());

        switch (result.toUpperCase()) {

            case "LOGIN_SUCCESS":

                session.setAttribute("loggedInEmail", signInDTO.getEmail());

                HostDTO hostDTO = hostService.checkEmailExist(signInDTO.getEmail());

                if (hostDTO != null && hostDTO.getFileEntity() != null) {
                    model.addAttribute("imagePath",
                            hostDTO.getFileEntity().getExcelFile());
                }

                return "hostLoginSuccess";

            case "EMAIL_NOT_FOUND":
                model.addAttribute("loginFailed", "Email not found");
                return "index";

            case "INVALID_PASSWORD":
                model.addAttribute("loginFailed", "Invalid password");
                return "index";

            case "ACCOUNT_BLOCKED":
                model.addAttribute("loginFailed",
                        "Account is blocked after 3 failed attempts");
                return "index";

            default:
                model.addAttribute("loginFailed", "Something went wrong");
                return "index";
        }
    }

    // ========================= SEND OTP =========================

    @PostMapping("/emailCheck")
    @ResponseBody
    public String emailCheck(String email) {

        System.out.println("Email received : " + email);

        HostDTO user = hostService.checkEmailExist(email);

        if (user == null) {
            System.out.println("Email not found");
            return "NOT_FOUND";
        }

        try {
            otpService.sendOtp(email);
            System.out.println("OTP Sent Successfully");
            return "SUCCESS";

        } catch (Exception e) {
            e.printStackTrace();
            return "ERROR";
        }
    }

    // ========================= VERIFY OTP =========================

    @PostMapping("/verifyOtp")
    public String verifyOtp(String email,
                            String otp,
                            Model model, HttpSession session) {

        System.out.println("Email : " + email);
        System.out.println("OTP : " + otp);

        boolean isValid = otpService.verifyOtp(email, otp);

        System.out.println("OTP Valid : " + isValid);

        if (isValid) {

            session.setAttribute("resetEmail", email);

            return "resetPassword";
        }

        model.addAttribute("otpError", "Invalid / Expired OTP");
        model.addAttribute("showOtpPopup", true);
        model.addAttribute("email", email);

        return "forgotPassword";
    }

    // ========================= RESEND OTP =========================

    @PostMapping("/resendOtp")
    @ResponseBody
    public String resendOtp(String email) {

        System.out.println("Resend OTP for : " + email);

        HostDTO user = hostService.checkEmailExist(email);

        if (user == null) {
            return "NOT_FOUND";
        }

        try {
            otpService.sendOtp(email);
            System.out.println("OTP Resent Successfully");
            return "SUCCESS";

        } catch (Exception e) {
            e.printStackTrace();
            return "ERROR";
        }
    }

    @PostMapping("/resetPassword")
    public String resetPassword(HostDTO hostDTO,
                                HttpSession session,
                                Model model) {

        String email = (String) session.getAttribute("resetEmail");

        hostDTO.setEmail(email);

        boolean updated = hostService.updatingPassword(hostDTO);

        if(updated){
            session.removeAttribute("resetEmail");
            model.addAttribute("updatedSuccessfully",
                    "Password Updated Successfully");
            return "index";
        }

        model.addAttribute("updateFail","Password Update Failed");
        return "resetPassword";
    }

}