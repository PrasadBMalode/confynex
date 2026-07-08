package com.xworkz.confynex.service;

import com.xworkz.confynex.dao.OTPDAO;
import com.xworkz.confynex.dto.HostDTO;
import com.xworkz.confynex.entity.OTPEntity;
import com.xworkz.confynex.util.OTPVerificationMail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OTPServiceImpl implements OTPService {

    @Autowired
    OTPDAO otpdao;

    @Autowired
    OTPVerificationMail mail;


    @Override
    public void sendOtp(String email) {
        String otp = mail.sendOTP(email);

        OTPEntity entity = new OTPEntity();
        entity.setEmail(email);
        entity.setOtp(otp);
        entity.setExpiryTime(System.currentTimeMillis() + (30 * 1000)); // 30 sec
        entity.setAttempts(0);

        otpdao.saveOtp(entity);
    }

    @Override
    public boolean verifyOtp(String email, String userOtp) {


        OTPEntity entity = otpdao.findByEmail(email);

        if (entity == null) return false;

        // expiry
        if (System.currentTimeMillis() > entity.getExpiryTime()) {
            return false; // no delete
        }

        // attempts
        if (entity.getAttempts() >= 3) {
            return false; // no delete
        }

        // correct OTP
        if (entity.getOtp().equals(userOtp)) {

            // ✔ clear only OTP fields (NOT delete row)
            entity.setOtp(null);
            entity.setExpiryTime(0);
            entity.setAttempts(0);

            otpdao.saveOtp(entity);
            return true;
        }

        // wrong OTP
        entity.setAttempts(entity.getAttempts() + 1);
        otpdao.saveOtp(entity);
        return false;
    }

}
