package com.xworkz.confynex.dao;

import com.xworkz.confynex.entity.CoordinatorEntity;
import com.xworkz.confynex.entity.CoordinatorsEmailEntity;
import com.xworkz.confynex.entity.HostEntity;


public interface HostDAO {

    HostEntity checkExistUserByEmail(String email);

    HostEntity hostSaveDB(HostEntity hostEntity);

    boolean coordinatorEmails(CoordinatorsEmailEntity coordinatorEntity);

    HostEntity getLatestConference();
}
