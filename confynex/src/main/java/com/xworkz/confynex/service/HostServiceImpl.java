package com.xworkz.confynex.service;

import com.xworkz.confynex.dao.HostDAO;
import com.xworkz.confynex.dto.HostDTO;
import com.xworkz.confynex.entity.HostEntity;
import com.xworkz.confynex.util.CryptoUtil;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class HostServiceImpl implements HostService {

    @Autowired
    HostDAO hostDAO;

    @Override
    public String hostRegistrationValidation(HostDTO hostDTO) {
        HostDTO emailExist = checkEmailExist(hostDTO.getEmail());
        if (emailExist == null) {
            try {
                String encrypted = CryptoUtil.encrypt(hostDTO.getPassword());
                hostDTO.setPassword(encrypted);

                HostEntity hostEntity = new HostEntity();
                BeanUtils.copyProperties(hostDTO, hostEntity);


                Boolean hostSaveDB = hostDAO.hostSaveDB(hostEntity);
                if (hostSaveDB){
                    return "Host Registration Done";
                }

            } catch (Exception e) {
                System.out.println(e.getMessage());
            }
            return "Host Registration Failed...!";
        }
        return "Host already exist";
    }

    @Override
    public HostDTO checkEmailExist(String email) {
        HostEntity hostEntity = hostDAO.checkExistUserByEmail(email);
        if (hostEntity != null) {
            HostDTO hostDTO = new HostDTO();
            BeanUtils.copyProperties(hostEntity, hostDTO);
            return hostDTO;

        }
        return null;
    }


}
