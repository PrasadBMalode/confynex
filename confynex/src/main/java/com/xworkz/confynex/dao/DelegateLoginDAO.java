package com.xworkz.confynex.dao;

import com.xworkz.confynex.entity.DelegateLoginEntity;

public interface DelegateLoginDAO {

    boolean saveLogin(DelegateLoginEntity entity);

    DelegateLoginEntity findByEmail(String email);
}