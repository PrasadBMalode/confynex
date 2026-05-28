package com.xworkz.confynex.service;

import com.google.api.client.googleapis.javanet.GoogleNetHttpTransport;
import com.google.api.client.json.gson.GsonFactory;
import com.google.api.services.drive.Drive;
import com.google.api.services.sheets.v4.Sheets;
import com.google.api.services.sheets.v4.SheetsScopes;
import com.google.api.services.sheets.v4.model.ValueRange;
import com.google.auth.http.HttpCredentialsAdapter;
import com.google.auth.oauth2.GoogleCredentials;

import com.xworkz.confynex.dao.CoordinatorDAO;
import com.xworkz.confynex.dao.DelegateDAO;
import com.xworkz.confynex.entity.CoordinatorEntity;
import com.xworkz.confynex.entity.DelegateEntity;

import org.apache.poi.ss.usermodel.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.*;
import java.util.List;

@Service
public class GoogleSheetService {

    @Autowired
    private CoordinatorDAO coordinatorDAO;

    @Autowired
    private DelegateDAO delegateDAO;

    @Autowired
    private GoogleDriveService googleDriveService;

    private static final String APPLICATION_NAME =
            "ConfyNex";

    public void readSheet() {

        try {

            GoogleCredentials credentials =
                    GoogleCredentials.fromStream(
                                    new FileInputStream(
                                            "src/main/resources/confynex-google-key.json"))
                            .createScoped(
                                    SheetsScopes.SPREADSHEETS_READONLY);

            Sheets service = new Sheets.Builder(
                    GoogleNetHttpTransport
                            .newTrustedTransport(),

                    GsonFactory.getDefaultInstance(),

                    new HttpCredentialsAdapter(credentials))

                    .setApplicationName(APPLICATION_NAME)
                    .build();

            String spreadsheetId =
                    "YOUR_SPREADSHEET_ID";

            String range = "Form Responses 1";

            ValueRange response =
                    service.spreadsheets()
                            .values()
                            .get(spreadsheetId, range)
                            .execute();

            List<List<Object>> values =
                    response.getValues();

            if (values != null) {

                for (int i = 1;
                     i < values.size();
                     i++) {

                    List<Object> row =
                            values.get(i);

                    CoordinatorEntity coordinator =
                            new CoordinatorEntity();

                    coordinator.setTimestamp(
                            row.get(0).toString());

                    coordinator.setFullName(
                            row.get(1).toString());

                    coordinator.setEmail(
                            row.get(2).toString());

                    coordinator.setOrganisationName(
                            row.get(3).toString());

                    coordinator.setPhoneNumber(
                            row.get(4).toString());

                    coordinator.setDesignation(
                            row.get(5).toString());

                    coordinator.setLinkedInUrl(
                            row.get(6).toString());

                    coordinator.setExcelFileUrl(
                            row.get(7).toString());

                    coordinatorDAO
                            .saveDelegate(coordinator);

                    // FILE LINK

                    String fileUrl =
                            row.get(6).toString();

                    String fileId =
                            extractFileId(fileUrl);

                    downloadAndSaveDelegates(
                            fileId,
                            coordinator);

                    System.out.println(
                            "Coordinator Saved");
                }
            }

        } catch (Exception e) {

            e.printStackTrace();
        }
    }

    private String extractFileId(String url) {

        String[] parts = url.split("/d/");

        if (parts.length > 1) {

            return parts[1].split("/")[0];
        }

        return null;
    }

    private void downloadAndSaveDelegates(
            String fileId,
            CoordinatorEntity coordinator) {

        try {

            Drive driveService =
                    googleDriveService
                            .getDriveService();

            OutputStream outputStream =
                    new FileOutputStream(
                            "delegates.xlsx");

            driveService.files()
                    .get(fileId)
                    .executeMediaAndDownloadTo(
                            outputStream);

            outputStream.close();

            FileInputStream fis =
                    new FileInputStream(
                            "delegates.xlsx");

            Workbook workbook =
                    WorkbookFactory.create(fis);

            Sheet sheet =
                    workbook.getSheetAt(0);

            for (int i = 1;
                 i <= sheet.getLastRowNum();
                 i++) {

                Row excelRow =
                        sheet.getRow(i);

                DelegateEntity delegate =
                        new DelegateEntity();

                delegate.setDelegateName(
                        excelRow.getCell(0)
                                .getStringCellValue());

                delegate.setDelegateEmail(
                        excelRow.getCell(1)
                                .getStringCellValue());

                delegate.setDelegatePhone(
                        excelRow.getCell(2)
                                .getStringCellValue());

                delegate.setOrganisation(
                        excelRow.getCell(3)
                                .getStringCellValue());

                delegate.setCoordinator(
                        coordinator);

                delegateDAO
                        .saveDelegate(delegate);

                System.out.println(
                        "Delegate Saved");
            }

            workbook.close();

            fis.close();

        } catch (Exception e) {

            e.printStackTrace();
        }
    }
}