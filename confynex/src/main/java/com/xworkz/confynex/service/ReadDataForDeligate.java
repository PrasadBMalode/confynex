package com.xworkz.confynex.service;

import com.xworkz.confynex.dto.CoordinatorDTO;
import com.xworkz.confynex.dto.HostDTO;

import java.util.List;

public interface ReadDataForDeligate {

    List<HostDTO> readHostDetails();

    List<CoordinatorDTO> readCoordinatorDetails();


}
