package com.xworkz.confynex.service;

import com.xworkz.confynex.dto.CoordinatorDTO;

public interface CoordinatorService {

    String coordinatorsRegistrationValidation(CoordinatorDTO coordinatorDTO);

    CoordinatorDTO checkEmailExist(String email);
}