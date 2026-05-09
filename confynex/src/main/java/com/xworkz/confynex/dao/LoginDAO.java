package com.xworkz.confynex.dao;

import com.xworkz.confynex.entity.HostEntity;

public interface LoginDAO {

    HostEntity findByEmail(String email);
}
