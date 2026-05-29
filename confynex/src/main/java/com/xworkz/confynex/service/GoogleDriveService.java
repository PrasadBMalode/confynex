package com.xworkz.confynex.service;

import com.google.api.client.googleapis.javanet.GoogleNetHttpTransport;
import com.google.api.client.json.gson.GsonFactory;
import com.google.api.services.drive.Drive;
import com.google.auth.http.HttpCredentialsAdapter;
import com.google.auth.oauth2.GoogleCredentials;
import org.springframework.stereotype.Service;

import java.io.FileInputStream;

@Service
public class GoogleDriveService {

    public Drive getDriveService() throws Exception {

        GoogleCredentials credentials = GoogleCredentials.fromStream(new FileInputStream("src/main/resources/confynex-google-key.json")).createScoped("https://www.googleapis.com/auth/drive");

        return new Drive.Builder(GoogleNetHttpTransport.newTrustedTransport(),
                GsonFactory.getDefaultInstance(), new HttpCredentialsAdapter(credentials)).setApplicationName("ConfyNex").build();
    }
}