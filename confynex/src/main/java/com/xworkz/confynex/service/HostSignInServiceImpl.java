package com.xworkz.confynex.service;

import com.xworkz.confynex.dao.HostSignInDAO;
import com.xworkz.confynex.entity.HostEntity;
import com.xworkz.confynex.util.CryptoUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class HostSignInServiceImpl implements HostSignInService {
    @Autowired
    HostSignInDAO hostSignInDAO;

    @Override
    public String signInValidation(String email, String password) {

        HostEntity user = hostSignInDAO.findByEmailSignIn(email);

        // Check if user exists
        if (user == null) {
            return "EMAIL_NOT_FOUND";
        }

        // Check if account is already locked
        if (user.getAccountLocked() != null && user.getAccountLocked()) {
            // User already blocked due to previous failed attempts
            System.out.println("Account is blocked!");
            return "ACCOUNT_BLOCKED";
        }
        String decryptedPassword = CryptoUtil.decrypt(user.getPassword());
        if (decryptedPassword.equals(password)) {
            user.setLoginAttempts(0);
            hostSignInDAO.updateUser(user);
            return "LOGIN_SUCCESS";
        }else {

            //Password is incorrect
            Integer attempts = user.getLoginAttempts() == null ? 0 : user.getLoginAttempts();
            attempts++;
            user.setLoginAttempts(attempts);

            // if attempts reached limit (3)
            if (attempts >= 3) {
                user.setAccountLocked(true);
                System.out.println("Account blocked after 3 attempts!");
                hostSignInDAO.updateUser(user);
                return "ACCOUNT_BLOCKED";
            }

            hostSignInDAO.updateUser(user);
            return "INVALID_PASSWORD";
        }
    }
}
