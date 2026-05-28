package com.xworkz.confynex.service;

import com.google.api.client.googleapis.javanet.GoogleNetHttpTransport;
import com.google.api.client.json.gson.GsonFactory;
import com.google.api.services.sheets.v4.Sheets;
import com.google.api.services.sheets.v4.SheetsScopes;
import com.google.api.services.sheets.v4.model.ValueRange;
import com.google.auth.http.HttpCredentialsAdapter;
import com.google.auth.oauth2.GoogleCredentials;
import com.xworkz.confynex.dao.CoordinatorDAO;
import com.xworkz.confynex.entity.CoordinatorEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.FileInputStream;
import java.util.List;

@Service
public class GoogleSheetService {

    @Autowired
    CoordinatorDAO coordinatorDAO;

    private static final String APPLICATION_NAME = "ConfyNex";

    public List<List<Object>> readSheet() {

        try {

            GoogleCredentials credentials =
                    GoogleCredentials.fromStream(new FileInputStream("src/main/resources/confynex-google-key.json")).createScoped(SheetsScopes.SPREADSHEETS_READONLY);

            Sheets service = new Sheets.Builder(
                            GoogleNetHttpTransport.newTrustedTransport(),
                            GsonFactory.getDefaultInstance(),
                            new HttpCredentialsAdapter(credentials))
                            .setApplicationName(APPLICATION_NAME)
                            .build();

            String spreadsheetId = "11JMtovijdyWeABhi384NuzS1ny3YRVxGSe2WL-L54rY";

            String range = "Form Responses 1";

            ValueRange response = service.spreadsheets().values()
                            .get(spreadsheetId, range)
                            .execute();

            List<List<Object>> values = response.getValues();

            if (values != null) {

                for (int i = 1; i < values.size(); i++) {

                    List<Object> row = values.get(i);

                    CoordinatorEntity coordinator = new CoordinatorEntity();

                    coordinator.setTimestamp(row.get(0).toString());

                    coordinator.setFullName(row.get(1).toString());

                    coordinator.setEmail(row.get(2).toString());

                    coordinator.setPhone(row.get(3).toString());

                    coordinator.setCompany(row.get(4).toString());

                    coordinator.setDesignation(row.get(5).toString());

                    coordinatorDAO.saveDelegate(coordinator);

                    System.out.println("Saved : " + coordinator.getEmail());
                }
            }

            return values;

        } catch (Exception e) {

            e.printStackTrace();
        }

        return null;
    }
}