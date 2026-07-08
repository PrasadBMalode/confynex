package com.xworkz.confynex.dao;

import com.xworkz.confynex.entity.HostEntity;
import com.xworkz.confynex.entity.OTPEntity;

public interface OTPDAO {

    HostEntity checkingExistUserInDBByEmail(String email);

    void saveOtp(OTPEntity otpEntity);

    OTPEntity findByEmail(String email);
}
