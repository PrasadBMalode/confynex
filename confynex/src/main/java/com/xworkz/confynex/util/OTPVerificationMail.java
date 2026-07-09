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
        mailMessage.setSubject("OTP Verification - CONFYNEX");

        mailMessage.setText(
                "Dear User,\n\n" +
                        "Thank you for choosing CONFYNEX.\n\n" +
                        "Your One-Time Password (OTP) for verification is:\n\n" +
                        "          " + otp + "\n\n" +
                        "This OTP is valid for a limited time and can only be used once.\n\n" +
                        "For your security, please do not share this OTP with anyone. " +
                        "CONFYNEX will never ask for your OTP via phone, email, or message.\n\n" +
                        "If you did not request this verification, please ignore this email.\n\n" +
                        "Regards,\n" +
                        "CONFYNEX Team"
        );

        javaMailSender.send(mailMessage);
        return otp;
    }


}
