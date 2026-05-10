package com.xworkz.confynex.service;

import com.xworkz.confynex.dao.HostDAO;
import com.xworkz.confynex.dto.HostDTO;
import com.xworkz.confynex.entity.FileEntity;
import com.xworkz.confynex.entity.HostEntity;
import com.xworkz.confynex.util.CryptoUtil;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.nio.file.Path;
import java.nio.file.Paths;

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


                //File related  logic
                MultipartFile excelFile = hostDTO.getExcelFile();
                if (excelFile!=null && !excelFile.isEmpty()){
                    String originalFilename =System.currentTimeMillis()+"_"+ excelFile.getOriginalFilename();

                    // File path
                    String fullPath = "J:\\xworkz\\deligatesFile\\" + originalFilename;

                    // Save file physically
                    Path filePath = Paths.get(fullPath);
                    excelFile.transferTo(filePath.toFile());

                    // Save file metadata
                    FileEntity fileEntity = new FileEntity();
                    fileEntity.setExcelFile(originalFilename); // store name or full path
                    fileEntity.setContentType(excelFile.getContentType());
                    fileEntity.setSize(excelFile.getSize());
                    fileEntity.setPath(fullPath);

                    // Link with user
                    fileEntity.setHost(hostEntity);   // if mapping exists
                    hostEntity.setFileEntity(fileEntity);

                }

                boolean hostSaveDB = hostDAO.hostSaveDB(hostEntity);
                if (hostSaveDB) {
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
