package com.xworkz.confynex.service;


import com.xworkz.confynex.dto.HostDTO;
import com.xworkz.confynex.entity.HostEntity;

public interface HostService {

    String hostRegistrationValidation(HostDTO hostDTO);

    HostDTO checkEmailExist(String email);

    void saveCoordinatorEmails(String filePath, HostEntity hostEntity);
}
