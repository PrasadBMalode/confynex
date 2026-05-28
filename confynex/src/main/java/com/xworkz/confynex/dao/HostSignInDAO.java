package com.xworkz.confynex.dao;

import com.xworkz.confynex.entity.HostEntity;

public interface HostSignInDAO {

    HostEntity findByEmailSignIn(String email);

    void updateUser (HostEntity user);
}
