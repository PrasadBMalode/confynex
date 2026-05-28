package com.xworkz.confynex.dao;

import com.xworkz.confynex.entity.HostEntity;
import com.xworkz.confynex.entity.coordinatorsEmailEntity;

public interface HostDAO {

    HostEntity checkExistUserByEmail(String email);

    HostEntity hostSaveDB(HostEntity hostEntity);

    boolean coordinatorEmails(coordinatorsEmailEntity coordinatorsEmail);
}
