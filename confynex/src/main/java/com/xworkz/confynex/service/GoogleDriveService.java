package com.xworkz.confynex.service;

import com.google.api.client.googleapis.javanet.GoogleNetHttpTransport;
import com.google.api.client.json.gson.GsonFactory;
import com.google.api.services.drive.Drive;

import com.google.auth.http.HttpCredentialsAdapter;
import com.google.auth.oauth2.GoogleCredentials;

import org.springframework.stereotype.Service;

import java.io.InputStream;
import java.util.Collections;

@Service
public class GoogleDriveService {

    private static final String APPLICATION_NAME = "ConfyNex";

    public Drive getDriveService() throws Exception {

        InputStream inputStream =
                getClass()
                        .getClassLoader()
                        .getResourceAsStream(
                                "confynex-google-key.json");

        if (inputStream == null) {

            throw new RuntimeException(
                    "confynex-google-key.json file not found");
        }

        GoogleCredentials credentials =
                GoogleCredentials
                        .fromStream(inputStream)
                        .createScoped(
                                Collections.singleton(
                                        "https://www.googleapis.com/auth/drive"));

        return new Drive.Builder(
                GoogleNetHttpTransport.newTrustedTransport(),
                GsonFactory.getDefaultInstance(),
                new HttpCredentialsAdapter(credentials))

                .setApplicationName(APPLICATION_NAME)

                .build();
    }
}