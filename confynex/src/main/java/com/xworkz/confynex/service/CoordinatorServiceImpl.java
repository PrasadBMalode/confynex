package com.xworkz.confynex.service;

import com.xworkz.confynex.dao.CoordinatorDAO;
import com.xworkz.confynex.dto.CoordinatorDTO;
import com.xworkz.confynex.entity.CoordinatorEntity;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDateTime;

@Service
public class CoordinatorServiceImpl implements CoordinatorService {

    @Autowired
    private CoordinatorDAO coordinatorDAO;

    @Override
    public String coordinatorsRegistrationValidation(
            CoordinatorDTO coordinatorDTO) {

        CoordinatorDTO emailExist =
                checkEmailExist(coordinatorDTO.getEmail());

        if (emailExist == null) {

            try {

                CoordinatorEntity coordinatorEntity =
                        new CoordinatorEntity();

                BeanUtils.copyProperties(
                        coordinatorDTO,
                        coordinatorEntity);

                coordinatorEntity.setTimestamp(
                        LocalDateTime.now().toString());

                MultipartFile excelFile =
                        coordinatorDTO.getExcelFile();

                String fullPath = null;

                if (excelFile != null && !excelFile.isEmpty()) {

                    String originalFilename =
                            System.currentTimeMillis() + "_"
                                    + excelFile.getOriginalFilename();

                    fullPath =
                            "J:\\xworkz\\coordinatorFiles\\"
                                    + originalFilename;

                    Path filePath =
                            Paths.get(fullPath);

                    File directory =
                            new File(
                                    "J:\\xworkz\\coordinatorFiles\\");

                    if (!directory.exists()) {
                        directory.mkdirs();
                    }

                    excelFile.transferTo(
                            filePath.toFile());

                    coordinatorEntity.setExcelFileUrl(
                            fullPath);
                }

                boolean saved =
                        coordinatorDAO.saveCoordinator(
                                coordinatorEntity);

                if (saved) {

                    return "Coordinator Registration Done";
                }

            } catch (Exception e) {

                e.printStackTrace();
            }

            return "Coordinator Registration Failed";
        }

        return "Coordinator already exist";
    }

    @Override
    public CoordinatorDTO checkEmailExist(String email) {

        CoordinatorEntity coordinatorEntity =
                coordinatorDAO.checkExistCoordinatorByEmail(email);

        if (coordinatorEntity != null) {

            CoordinatorDTO coordinatorDTO = new CoordinatorDTO();

            BeanUtils.copyProperties(coordinatorEntity, coordinatorDTO);

            return coordinatorDTO;
        }

        return null;
    }
}