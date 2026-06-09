package com.xworkz.confynex.dao;

import com.xworkz.confynex.entity.CoordinatorEntity;

public interface CoordinatorDAO {

    boolean saveCoordinator(
            CoordinatorEntity coordinatorEntity);

    CoordinatorEntity checkExistCoordinatorByEmail(
            String email);
}