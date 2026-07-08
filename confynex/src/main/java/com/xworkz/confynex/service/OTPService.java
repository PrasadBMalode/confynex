package com.xworkz.confynex.service;


import com.xworkz.confynex.dto.HostDTO;

public interface OTPService {


    void sendOtp(String email);

    boolean verifyOtp(String email, String userOtp);

}
