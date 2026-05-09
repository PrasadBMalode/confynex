package com.xworkz.confynex.service;

import com.xworkz.confynex.dao.LoginDAO;
import com.xworkz.confynex.entity.HostEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginServiceImpl implements LoginService {

    @Autowired
    LoginDAO loginDAO;

    @Override
    public String loginCheck(String email, String password) {
        HostEntity byEmail = loginDAO.findByEmail(email);

        if (byEmail == null) {
            return "Email Not Found";
        }
        return "";
    }
}
