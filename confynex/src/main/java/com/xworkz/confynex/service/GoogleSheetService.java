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

            Sheets service =
                    new Sheets.Builder(
                            GoogleNetHttpTransport
                                    .newTrustedTransport(),

                            GsonFactory
                                    .getDefaultInstance(),

                            new HttpCredentialsAdapter(
                                    credentials))

                            .setApplicationName(
                                    APPLICATION_NAME)

                            .build();

            String spreadsheetId =
                    "11JMtovijdyWeABhi384NuzS1ny3YRVxGSe2WL-L54rY";

            String range =
                    "Form Responses 1";

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

                    if (row == null) {

                        continue;
                    }

                    CoordinatorEntity coordinator =
                            new CoordinatorEntity();

                    coordinator.setTimestamp(
                            row.size() > 0
                                    ? row.get(0).toString()
                                    : "");

                    coordinator.setFullName(
                            row.size() > 1
                                    ? row.get(1).toString()
                                    : "");

                    coordinator.setEmail(
                            row.size() > 2
                                    ? row.get(2).toString()
                                    : "");

                    coordinator.setOrganisationName(
                            row.size() > 3
                                    ? row.get(3).toString()
                                    : "");

                    coordinator.setPhoneNumber(
                            row.size() > 4
                                    ? row.get(4).toString()
                                    : "");

                    coordinator.setDesignation(
                            row.size() > 5
                                    ? row.get(5).toString()
                                    : "");

                    coordinator.setLinkedInUrl(
                            row.size() > 6
                                    ? row.get(6).toString()
                                    : "");

                    coordinator.setExcelFileUrl(
                            row.size() > 7
                                    ? row.get(7).toString()
                                    : "");

                    coordinatorDAO
                            .saveCoordinator(
                                    coordinator);

                    System.out.println(
                            "Coordinator Saved");

                    // EXCEL FILE URL

                    String fileUrl = "";

                    if (row.size() > 7 &&
                            row.get(7) != null) {

                        fileUrl =
                                row.get(7).toString();

                        String fileId =
                                extractFileId(
                                        fileUrl);

                        if (fileId != null) {

                            downloadAndSaveDelegates(
                                    fileId,
                                    coordinator);

                        } else {

                            System.out.println(
                                    "Invalid Google Drive URL");
                        }

                    } else {

                        System.out.println(
                                "No Excel file uploaded for : "
                                        + coordinator.getEmail());
                    }
                }

            } else {

                System.out.println(
                        "No data found in Google Sheet");
            }

        } catch (Exception e) {

            e.printStackTrace();
        }
    }

    private String extractFileId(
            String url) {

        try {

            String[] parts =
                    url.split("/d/");

            if (parts.length > 1) {

                return parts[1]
                        .split("/")[0];
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

                if (excelRow == null) {

                    continue;
                }

                DelegateEntity delegate =
                        new DelegateEntity();

                delegate.setDelegateName(
                        getCellValue(
                                excelRow.getCell(0)));

                delegate.setDelegateEmail(
                        getCellValue(
                                excelRow.getCell(1)));

                delegate.setDelegatePhone(
                        getCellValue(
                                excelRow.getCell(2)));

                delegate.setOrganisation(
                        getCellValue(
                                excelRow.getCell(3)));

                delegate.setCoordinator(
                        coordinator);

                delegateDAO.saveDelegate(
                        delegate);

                System.out.println(
                        "Delegate Saved");
            }

            workbook.close();

            fis.close();

            File file =
                    new File("delegates.xlsx");

            if (file.exists()) {

                file.delete();
            }

        } catch (Exception e) {

            e.printStackTrace();
        }
    }

    private String getCellValue(
            Cell cell) {

        if (cell == null) {

            return "";
        }

        cell.setCellType(
                CellType.STRING);

        return cell
                .getStringCellValue();
    }
}