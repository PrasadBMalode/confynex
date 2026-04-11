package com.xworkz.confynex.service;


import com.xworkz.confynex.dto.HostDTO;

public interface HostService {

    String hostRegistrationValidation(HostDTO hostDTO);

    HostDTO checkEmailExist(String email);
}
