package com.xworkz.confynex.util;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Component;

import java.util.Random;

@Component
public class OTPVerificationMail {

    @Autowired
    JavaMailSender javaMailSender;

    public String getOTP() {
        Random random = new Random();
        int otp = 100000 + random.nextInt(900000);
        return String.valueOf(otp);
    }
    public String sendOTP(String toEmail) {

        String otp = getOTP();

        SimpleMailMessage mailMessage = new SimpleMailMessage();
        mailMessage.setFrom("malodeprasad666@gmail.com");
        mailMessage.setTo(toEmail);
        mailMessage.setSubject("OTP Verification");
        mailMessage.setText("Your OTP is: " + otp);

        javaMailSender.send(mailMessage);

        return otp;
    }


}
