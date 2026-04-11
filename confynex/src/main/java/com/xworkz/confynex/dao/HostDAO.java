package com.xworkz.confynex.dao;

import com.xworkz.confynex.entity.HostEntity;

public interface HostDAO {

    HostEntity checkExistUserByEmail(String email);

    Boolean hostSaveDB(HostEntity hostEntity);
}
