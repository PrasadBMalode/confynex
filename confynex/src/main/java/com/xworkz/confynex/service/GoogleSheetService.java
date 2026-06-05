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

    private static final String APPLICATION_NAME = "ConfyNex";

    public void readSheet() {

        try {

            InputStream inputStream =
                    getClass()
                            .getClassLoader()
                            .getResourceAsStream("confynex-google-key.json");

            GoogleCredentials credentials =
                    GoogleCredentials
                            .fromStream(inputStream)
                            .createScoped(SheetsScopes.SPREADSHEETS_READONLY);

            Sheets service =
                    new Sheets.Builder(
                            GoogleNetHttpTransport.newTrustedTransport(),
                            GsonFactory.getDefaultInstance(),
                            new HttpCredentialsAdapter(credentials))
                            .setApplicationName(APPLICATION_NAME)
                            .build();

            String spreadsheetId =
                    "11JMtovijdyWeABhi384NuzS1ny3YRVxGSe2WL-L54rY";

            String range = "Form Responses 1";

            ValueRange response =
                    service.spreadsheets()
                            .values()
                            .get(spreadsheetId, range)
                            .execute();

            List<List<Object>> values = response.getValues();
            System.out.println("Values Size = " + values.size());
            System.out.println("All Values = " + values);

            if (values == null || values.isEmpty()) {

                System.out.println("No data found");
                return;
            }

            for (int i = 1; i < values.size(); i++) {

                List<Object> row = values.get(i);

                if (row == null || row.isEmpty()) {
                    continue;
                }

                // SKIP EMPTY ROWS
                if (row.size() < 3 ||
                        row.get(1).toString().trim().isEmpty()) {

                    continue;
                }

                CoordinatorEntity coordinator =
                        new CoordinatorEntity();

                coordinator.setTimestamp(
                        getValue(row, 0));

                coordinator.setFullName(
                        getValue(row, 1));

                coordinator.setEmail(
                        getValue(row, 2));

                coordinator.setOrganisationName(
                        getValue(row, 3));

                coordinator.setPhoneNumber(
                        getValue(row, 4));

                coordinator.setDesignation(
                        getValue(row, 5));

                coordinator.setLinkedInUrl(
                        getValue(row, 6));

                coordinator.setExcelFileUrl(
                        getValue(row, 7));

                System.out.println("Saving Coordinator");

                System.out.println("Name = " + coordinator.getFullName());
                System.out.println("Email = " + coordinator.getEmail());

                coordinatorDAO.saveCoordinator(coordinator);

                System.out.println("Coordinator Save Method Completed");

                System.out.println("Coordinator Saved");

                String fileUrl =
                        coordinator.getExcelFileUrl();

                if (fileUrl != null &&
                        !fileUrl.trim().isEmpty()) {

                    String fileId =
                            extractFileId(fileUrl);

                    if (fileId != null) {

                        System.out.println(
                                "File ID : " + fileId);

                        downloadAndSaveDelegates(
                                fileId,
                                coordinator);

                    } else {

                        System.out.println(
                                "Invalid Google Drive URL");
                    }

                } else {

                    System.out.println(
                            "No Excel file uploaded");
                }
            }

        } catch (Exception e) {

            e.printStackTrace();
        }
    }

    private String getValue(
            List<Object> row,
            int index) {

        if (row.size() > index &&
                row.get(index) != null) {

            return row.get(index).toString();
        }

        return "";
    }

    // UPDATED METHOD
    private String extractFileId(String url) {

        try {

            // FORMAT:
            // https://drive.google.com/open?id=FILE_ID

            if (url.contains("id=")) {

                return url.split("id=")[1];
            }

            // FORMAT:
            // https://drive.google.com/file/d/FILE_ID/view

            if (url.contains("/d/")) {

                String[] parts = url.split("/d/");

                if (parts.length > 1) {

                    return parts[1].split("/")[0];
                }
            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return null;
    }

    private void downloadAndSaveDelegates(
            String fileId,
            CoordinatorEntity coordinator) {

        try {

            Drive driveService =
                    googleDriveService.getDriveService();

            FileOutputStream outputStream =
                    new FileOutputStream("delegates.xlsx");

            driveService.files()
                    .get(fileId)
                    .executeMediaAndDownloadTo(outputStream);

            outputStream.close();

            FileInputStream fis =
                    new FileInputStream("delegates.xlsx");

            Workbook workbook =
                    WorkbookFactory.create(fis);

            Sheet sheet =
                    workbook.getSheetAt(0);

            for (int i = 1;
                 i <= sheet.getLastRowNum();
                 i++) {

                Row excelRow = sheet.getRow(i);

                if (excelRow == null) {
                    continue;
                }

                DelegateEntity delegate =
                        new DelegateEntity();

                delegate.setDelegateName(
                        getCellValue(excelRow.getCell(0)));

                delegate.setDelegateEmail(
                        getCellValue(excelRow.getCell(1)));

                delegate.setDelegatePhone(
                        getCellValue(excelRow.getCell(2)));

                delegate.setOrganisation(
                        getCellValue(excelRow.getCell(3)));

                delegate.setCoordinator(coordinator);

                delegateDAO.saveDelegate(delegate);

                System.out.println("Delegate Saved");
            }

            workbook.close();
            fis.close();

            File file = new File("delegates.xlsx");

            if (file.exists()) {
                file.delete();
            }

        } catch (Exception e) {

            e.printStackTrace();
        }
    }

    private String getCellValue(Cell cell) {

        if (cell == null) {
            return "";
        }

        cell.setCellType(CellType.STRING);

        return cell.getStringCellValue();
    }
}