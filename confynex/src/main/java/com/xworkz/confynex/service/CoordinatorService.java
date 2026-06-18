package com.xworkz.confynex.service;

import com.xworkz.confynex.dto.CoordinatorDTO;

import javax.servlet.http.HttpSession;

public interface CoordinatorService {

    String coordinatorsRegistrationValidation(CoordinatorDTO coordinatorDTO);

    CoordinatorDTO checkEmailExist(String email);
}