package com.xworkz.confynex.service;

import com.xworkz.confynex.dao.ReadDataForDelegateFromDB;
import com.xworkz.confynex.dto.CoordinatorDTO;
import com.xworkz.confynex.dto.HostDTO;
import com.xworkz.confynex.entity.CoordinatorEntity;
import com.xworkz.confynex.entity.HostEntity;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@Service
public class ReadDataForDeligateImpl implements ReadDataForDeligate {

    @Autowired
    ReadDataForDelegateFromDB readDataForDelegateFromDB;


    @Override
    public List<HostDTO> readHostDetails() {

        List<HostEntity> hostEntities = readDataForDelegateFromDB.readHostFromDB();

        if (!hostEntities.isEmpty()) {
            List<HostDTO> hostDTOS = new ArrayList<>();

            hostEntities.forEach(hostEntity -> {

                HostDTO hostDTO=new HostDTO();
                BeanUtils.copyProperties(hostEntity, hostDTO);
                hostDTOS.add(hostDTO);
            });
            return hostDTOS;
        }
        return Collections.emptyList();
    }

    @Override
    public List<CoordinatorDTO> readCoordinatorDetails() {

        List<CoordinatorEntity> coordinatorEntities = readDataForDelegateFromDB.readCoordinatorFromDB();

        if (!coordinatorEntities.isEmpty()) {
            List<CoordinatorDTO> coordinatorDTOS = new ArrayList<>();

            coordinatorEntities.forEach(coordinatorEntity -> {

                CoordinatorDTO coordinatorDTO=new CoordinatorDTO();
                BeanUtils.copyProperties(coordinatorEntity, coordinatorDTO);
                coordinatorDTOS.add(coordinatorDTO);
            });
            return coordinatorDTOS;
        }
        return Collections.emptyList();
    }
}
