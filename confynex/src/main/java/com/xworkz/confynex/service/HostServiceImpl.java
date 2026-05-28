package com.xworkz.confynex.service;

import com.xworkz.confynex.dao.HostDAO;
import com.xworkz.confynex.dto.HostDTO;
import com.xworkz.confynex.entity.FileEntity;
import com.xworkz.confynex.entity.HostEntity;
import com.xworkz.confynex.entity.coordinatorsEmailEntity;
import com.xworkz.confynex.util.CryptoUtil;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.apache.poi.ss.usermodel.*;

import java.io.File;
import java.io.FileInputStream;

import java.nio.file.Path;
import java.nio.file.Paths;

@Service
public class HostServiceImpl implements HostService {

    @Autowired
    HostDAO hostDAO;

    @Autowired
    private EmailService emailService;

//    @Override
//    public String hostRegistrationValidation(HostDTO hostDTO) {
//        HostDTO emailExist = checkEmailExist(hostDTO.getEmail());
//        if (emailExist == null) {
//            try {
//                String encrypted = CryptoUtil.encrypt(hostDTO.getPassword());
//                hostDTO.setPassword(encrypted);
//
//                HostEntity hostEntity = new HostEntity();
//                BeanUtils.copyProperties(hostDTO, hostEntity);
//
//
//                //File related  logic
//                MultipartFile excelFile = hostDTO.getExcelFile();
//                if (excelFile!=null && !excelFile.isEmpty()){
//                    String originalFilename =System.currentTimeMillis()+"_"+ excelFile.getOriginalFilename();
//
//                    // File path
//                    String fullPath = "J:\\xworkz\\deligatesFile\\" + originalFilename;
//
//                    // Save file physically
//                    Path filePath = Paths.get(fullPath);
//                    excelFile.transferTo(filePath.toFile());
//
//                    // Save file metadata
//                    FileEntity fileEntity = new FileEntity();
//                    fileEntity.setExcelFile(originalFilename); // store name or full path
//                    fileEntity.setContentType(excelFile.getContentType());
//                    fileEntity.setSize(excelFile.getSize());
//                    fileEntity.setPath(fullPath);
//
//                    // Link with user
//                    fileEntity.setHost(hostEntity);   // if mapping exists
//                    hostEntity.setFileEntity(fileEntity);
//
//                }
//
//                boolean hostSaveDB = hostDAO.hostSaveDB(hostEntity);
//                if (hostSaveDB) {
//
//                    String fullPath = null;
//                    if (fullPath != null) {
//                        saveCoordinatorEmails(fullPath, hostEntity);
//                    }
//
//                    return "Host Registration Done";
//                }
//
//            } catch (Exception e) {
//                System.out.println(e.getMessage());
//            }
//            return "Host Registration Failed...!";
//        }
//        return "Host already exist";
//    }


    @Override
    public String hostRegistrationValidation(HostDTO hostDTO) {
        HostDTO emailExist = checkEmailExist(hostDTO.getEmail());
        if (emailExist == null) {
            try {

                String encrypted = CryptoUtil.encrypt(hostDTO.getPassword());
                hostDTO.setPassword(encrypted);
                HostEntity hostEntity = new HostEntity();
                BeanUtils.copyProperties(hostDTO, hostEntity);
                MultipartFile excelFile = hostDTO.getExcelFile();
                String fullPath = null;

                if (excelFile != null && !excelFile.isEmpty()) {

                    String originalFilename = System.currentTimeMillis() + "_" + excelFile.getOriginalFilename();
                    fullPath = "J:\\xworkz\\deligatesFile\\" + originalFilename;
                    Path filePath = Paths.get(fullPath);
                    File dir = new File("J:\\xworkz\\deligatesFile\\");
                    if (!dir.exists()) {
                        dir.mkdirs();
                    }

                    excelFile.transferTo(filePath.toFile());
                    FileEntity fileEntity = new FileEntity();
                    fileEntity.setExcelFile(originalFilename);
                    fileEntity.setContentType(excelFile.getContentType());
                    fileEntity.setSize(excelFile.getSize());
                    fileEntity.setPath(fullPath);
                    fileEntity.setHost(hostEntity);
                    hostEntity.setFileEntity(fileEntity);
                }
                HostEntity hostSaveDB = hostDAO.hostSaveDB(hostEntity);
                if (hostSaveDB != null) {
                    if (fullPath != null)
                    {
                        saveCoordinatorEmails(fullPath, hostSaveDB);;
                    }
                    return "Host Registration Done";
                }
            } catch (Exception e) {

                e.printStackTrace();
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

    @Override
    public void saveCoordinatorEmails(String filePath, HostEntity hostEntity) {

        try {

            FileInputStream fis = new FileInputStream(filePath);

            Workbook workbook = WorkbookFactory.create(fis);

            Sheet sheet = workbook.getSheetAt(0);

            for (Row row : sheet) {

                // Column A -> Name
                Cell nameCell = row.getCell(0);

                // Column B -> Email
                Cell emailCell = row.getCell(1);

                if (nameCell != null && emailCell != null) {

                    String name = nameCell.getStringCellValue().trim();

                    String email = emailCell.getStringCellValue().trim();

                    System.out.println("Name : " + name);
                    System.out.println("Email : " + email);

                    coordinatorsEmailEntity coordinator = new coordinatorsEmailEntity();

                    coordinator.setName(name);

                    coordinator.setEmail(email);

                    coordinator.setHost(hostEntity);

                    hostDAO.coordinatorEmails(coordinator);

                    // SEND MAIL
                    emailService.sendConferenceMail(
                            email,
                            name,
                            hostEntity.getConference_title(),
                            hostEntity.getConference_date().toString(),
                            hostEntity.getVenue()
                    );

                    System.out.println(
                            "Mail Triggered To : " + email);
                }
            }

            workbook.close();

            fis.close();

        } catch (Exception e) {

            e.printStackTrace();
        }
    }


}
