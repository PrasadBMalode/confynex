package com.xworkz.confynex.dao;

import com.xworkz.confynex.entity.CoordinatorEntity;
import com.xworkz.confynex.entity.HostEntity;

import java.util.List;

public interface ReadDataForDelegateFromDB {

    List<HostEntity> readHostFromDB();

    List<CoordinatorEntity> readCoordinatorFromDB();
}
