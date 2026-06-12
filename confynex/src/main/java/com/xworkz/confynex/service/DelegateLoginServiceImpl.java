package com.xworkz.confynex.service;

import com.xworkz.confynex.dao.DelegateLoginDAO;
import com.xworkz.confynex.entity.DelegateLoginEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DelegateLoginServiceImpl
        implements DelegateLoginService {

    @Autowired
    private DelegateLoginDAO delegateLoginDAO;

    @Override
    public boolean login(String email, Long password) {

        DelegateLoginEntity entity = delegateLoginDAO.findByEmail(email);

        if(entity != null && entity.getPassword().equals(password)) {
            return true;
        }
        return false;
    }
}