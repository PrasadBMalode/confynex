package com.xworkz.confynex.service;

public interface EmailService {

    void sendConferenceMail(String toEmail, String coordinatorName, String conferenceTitle, String conferenceDate, String venue);


    void sendDelegateMail(
            String toEmail,
            String delegateName,
            String conferenceTitle,
            String conferenceDate,
            String venue,
            String loginId,
            Long password);
}