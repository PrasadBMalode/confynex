package com.xworkz.confynex.service;

import com.xworkz.confynex.dao.HostDAO;
import com.xworkz.confynex.dto.HostDTO;

import com.xworkz.confynex.entity.CoordinatorsEmailEntity;
import com.xworkz.confynex.entity.FileEntity;
import com.xworkz.confynex.entity.HostEntity;

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

        try (FileInputStream fis = new FileInputStream(filePath);
             Workbook workbook = WorkbookFactory.create(fis)) {

            Sheet sheet = workbook.getSheetAt(0);

            for (int i = 0; i <= sheet.getLastRowNum(); i++) {

                Row row = sheet.getRow(i);
                if (row == null) {
                    continue;
                }

                Cell nameCell = row.getCell(0);
                Cell emailCell = row.getCell(1);

                if (nameCell == null || emailCell == null) {
                    continue;
                }

                DataFormatter formatter = new DataFormatter();

                String name = formatter.formatCellValue(nameCell).trim();
                String email = formatter.formatCellValue(emailCell).trim();

                if (name.isEmpty() || email.isEmpty()) {
                    continue;
                }

                System.out.println("Name : " + name);
                System.out.println("Email : " + email);

                CoordinatorsEmailEntity coordinatorEntity = new CoordinatorsEmailEntity();

                coordinatorEntity.setName(name);
                coordinatorEntity.setEmail(email);
                coordinatorEntity.setHost(hostEntity);

                boolean saved = hostDAO.coordinatorEmails(coordinatorEntity);
                System.out.println("Coordinator Saved : " + saved);

                try {
                    if(saved) {
                        emailService.sendConferenceMail(
                                email,
                                name,
                                hostEntity.getConference_title(),
                                hostEntity.getConference_date().toString(),
                                hostEntity.getVenue()
                        );
                    }

                    System.out.println("Mail sent to: " + email);

                } catch (Exception e) {
                    System.out.println("Mail failed for: " + email);
                    e.printStackTrace();
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public boolean updatingPassword(HostDTO hostDTO) {

        System.out.println("========= RESET PASSWORD =========");
        System.out.println("Email from form : " + hostDTO.getEmail());
        System.out.println("Password from form : " + hostDTO.getPassword());

        try {

            String encryptedPassword = CryptoUtil.encrypt(hostDTO.getPassword());

            HostEntity hostEntity = hostDAO.checkExistUserByEmail(hostDTO.getEmail());

            System.out.println("Host ID : " + hostEntity.getHostId());
            System.out.println("Email : " + hostEntity.getEmail());

            if(hostEntity != null){

                System.out.println("User Found");

                hostEntity.setPassword(encryptedPassword);
                hostEntity.setAccountLocked(false);
                hostEntity.setLoginAttempts(0);

                return hostDAO.updatingPasswordInDB(hostEntity);
            }

            System.out.println("User NOT Found");

        } catch(Exception e){
            e.printStackTrace();
        }

        return false;
    }



}
