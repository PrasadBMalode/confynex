package com.xworkz.confynex.service;

import com.xworkz.confynex.dao.CoordinatorDAO;
import com.xworkz.confynex.dao.DelegateLoginDAO;
import com.xworkz.confynex.dao.HostDAO;
import com.xworkz.confynex.dto.CoordinatorDTO;
import com.xworkz.confynex.entity.CoordinatorEntity;
import com.xworkz.confynex.entity.DelegateEntity;
import com.xworkz.confynex.entity.DelegateLoginEntity;
import com.xworkz.confynex.entity.HostEntity;
import org.apache.poi.ss.usermodel.*;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Service
public class CoordinatorServiceImpl implements CoordinatorService {

    @Autowired
    private CoordinatorDAO coordinatorDAO;

    @Autowired
    private DelegateLoginDAO delegateLoginDAO;

    @Autowired
    private EmailService emailService;

    @Autowired
    private HostDAO hostDAO;


    private Long generatePassword() {

        return (long)(100000 + Math.random() * 900000);
    }

    @Override
    public String coordinatorsRegistrationValidation(CoordinatorDTO coordinatorDTO) {

        CoordinatorDTO emailExist = checkEmailExist(coordinatorDTO.getEmail());

        if (emailExist != null) {
            return "Coordinator already exist";
        }

        try {

            CoordinatorEntity coordinatorEntity = new CoordinatorEntity();
            BeanUtils.copyProperties(coordinatorDTO, coordinatorEntity);
            coordinatorEntity.setTimestamp(LocalDateTime.now().toString());
            MultipartFile excelFile = coordinatorDTO.getExcelFile();

            List<DelegateEntity> delegates = new ArrayList<>();

            if (excelFile != null && !excelFile.isEmpty()) {
                String originalFilename = System.currentTimeMillis() + "_" + excelFile.getOriginalFilename();
                String uploadDir = "J:\\xworkz\\coordinatorFiles\\";
                File directory = new File(uploadDir);

                if (!directory.exists()) {
                    directory.mkdirs();
                }
                String fullPath = uploadDir + originalFilename;
                Path filePath = Paths.get(fullPath);
                excelFile.transferTo(filePath.toFile());
                coordinatorEntity.setExcelFileUrl(fullPath);


                DataFormatter formatter = new DataFormatter();
                try (Workbook workbook = WorkbookFactory.create(excelFile.getInputStream())) {

                    Sheet sheet = workbook.getSheetAt(0);
                    for (int i = 1; i <= sheet.getLastRowNum(); i++) {

                        Row row = sheet.getRow(i);
                        if (row == null) {
                            continue;
                        }
                        DelegateEntity delegate = new DelegateEntity();

                        delegate.setDelegateName(formatter.formatCellValue(row.getCell(0)));
                        delegate.setDelegatePhone(Long.valueOf(formatter.formatCellValue(row.getCell(2))));
                        delegate.setDelegateEmail(formatter.formatCellValue(row.getCell(3)));
                        delegate.setOrganisation(formatter.formatCellValue(row.getCell(4)));

                        Long password = generatePassword();

                        DelegateLoginEntity loginEntity = new DelegateLoginEntity();

                        loginEntity.setEmail(delegate.getDelegateEmail());
                        loginEntity.setPassword(password);

                        delegateLoginDAO.saveLogin(loginEntity);
                        delegate.setCoordinator(coordinatorEntity);
                        delegates.add(delegate);
                    }
                }
                coordinatorEntity.setDelegates(delegates);
                System.out.println("Delegates Parsed = " + delegates.size());
            }

            boolean saved = coordinatorDAO.saveCoordinator(coordinatorEntity);

            if(saved){
                for(DelegateEntity delegate : delegates){

                    DelegateLoginEntity login = delegateLoginDAO.findByEmail(delegate.getDelegateEmail());

                    HostEntity hostEntity = hostDAO.getLatestConference();


                    if(login != null){
                        emailService.sendDelegateMail(
                                delegate.getDelegateEmail(),
                                delegate.getDelegateName(),
                                hostEntity.getConference_title(),
                                hostEntity.getConference_date().toString(),
                                hostEntity.getVenue(),
                                login.getEmail(),
                                login.getPassword()
                        );

                    }
                }
                return "Coordinator Registration Done";
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "Coordinator Registration Failed";
    }

    @Override
    public CoordinatorDTO checkEmailExist(String email) {
        CoordinatorEntity coordinatorEntity = coordinatorDAO.checkExistCoordinatorByEmail(email);
        if (coordinatorEntity != null) {
            CoordinatorDTO coordinatorDTO = new CoordinatorDTO();
            BeanUtils.copyProperties(coordinatorEntity, coordinatorDTO);
            return coordinatorDTO;
        }
        return null;
    }
}