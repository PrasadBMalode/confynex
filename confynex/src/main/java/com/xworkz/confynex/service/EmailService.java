package com.xworkz.confynex.service;

public interface EmailService {

    void sendConferenceMail(String toEmail, String coordinatorName, String conferenceTitle, String conferenceDate, String venue);
}