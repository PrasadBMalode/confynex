package com.xworkz.confynex.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import javax.mail.internet.MimeMessage;

@Service
public class EmailServiceImpl implements EmailService {

    @Autowired
    private JavaMailSender javaMailSender;

    @Override
    public void sendConferenceMail(
            String toEmail,
            String coordinatorName,
            String conferenceTitle,
            String conferenceDate,
            String venue) {

        try {
            MimeMessage mimeMessage = javaMailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true);

            helper.setTo(toEmail);
            helper.setSubject("🎓 Conference Invitation - " + conferenceTitle + " | ConfyNex");

            String registrationLink = "http://localhost:6969/confynex/coordinatorsRegistration.jsp";

            // SVG icons encoded inline (no external image URLs needed)
            String calendarIcon = "&#128197;";  // 📅
            String locationIcon = "&#128205;";  // 📍
            String conferenceIcon = "&#127891;"; // 🎓
            String aiIcon = "&#129504;";         // 🧠

            String template =
                    "<!DOCTYPE html>" +
                            "<html lang='en'>" +
                            "<head>" +
                            "<meta charset='UTF-8'>" +
                            "<meta name='viewport' content='width=device-width, initial-scale=1.0'>" +
                            "<title>" + conferenceTitle + "</title>" +
                            "</head>" +
                            "<body style='margin:0;padding:0;background-color:#f0f4f8;font-family:Georgia,serif;'>" +

                            // ── Outer wrapper ──
                            "<table width='100%' cellpadding='0' cellspacing='0' border='0' style='background-color:#f0f4f8;'>" +
                            "<tr><td align='center' style='padding:30px 10px;'>" +

                            // ── Email card ──
                            "<table width='620' cellpadding='0' cellspacing='0' border='0' " +
                            "style='background:#ffffff;border-radius:12px;overflow:hidden;" +
                            "box-shadow:0 4px 24px rgba(0,0,0,0.10);max-width:620px;'>" +

                            // ── HEADER BANNER ──
                            "<tr>" +
                            "<td style='background:linear-gradient(135deg,#0d1b4b 0%,#1a3a8f 60%,#2563eb 100%);" +
                            "padding:40px 40px 30px 40px;text-align:center;'>" +

                            // Logo / Brand row
                            "<p style='margin:0 0 6px 0;font-size:13px;letter-spacing:4px;color:#93c5fd;" +
                            "text-transform:uppercase;font-family:Arial,sans-serif;'>ConfyNex Platform</p>" +

                            "<h1 style='margin:0 0 10px 0;font-size:28px;color:#ffffff;font-weight:bold;" +
                            "letter-spacing:1px;line-height:1.3;'>" + aiIcon + " " + "ConfyNex — Next Generation Conference Platform" + "</h1>" +

                            "<p style='margin:0;font-size:14px;color:#bfdbfe;font-family:Arial,sans-serif;'>" +
                            "Official Conference Invitation</p>" +

                            // Decorative divider
                            "<div style='margin:20px auto 0;width:60px;height:3px;" +
                            "background:linear-gradient(90deg,#60a5fa,#a78bfa);border-radius:2px;'></div>" +

                            "</td></tr>" +

                            // ── GREETING ──
                            "<tr><td style='padding:36px 40px 0 40px;'>" +
                            "<p style='margin:0 0 8px;font-size:15px;color:#374151;font-family:Arial,sans-serif;'>" +
                            "Dear <strong style='color:#1a3a8f;'>" + coordinatorName + "</strong>,</p>" +
                            "<p style='margin:0;font-size:15px;color:#4b5563;line-height:1.7;font-family:Arial,sans-serif;'>" +
                            "We are delighted to invite you to our upcoming conference hosted on the " +
                            "<strong>ConfyNex</strong> platform. This event brings together industry leaders, " +
                            "innovators, and technology enthusiasts for an enriching experience in AI software development." +
                            "</p>" +
                            "</td></tr>" +

                            // ── CONFERENCE DETAILS CARD ──
                            "<tr><td style='padding:28px 40px 0 40px;'>" +
                            "<table width='100%' cellpadding='0' cellspacing='0' border='0' " +
                            "style='background:#f8faff;border-radius:10px;border:1px solid #dbeafe;overflow:hidden;'>" +

                            // Card header
                            "<tr><td colspan='2' style='background:#1a3a8f;padding:12px 20px;'>" +
                            "<p style='margin:0;font-size:13px;color:#bfdbfe;letter-spacing:2px;" +
                            "text-transform:uppercase;font-family:Arial,sans-serif;'>Conference Details</p>" +
                            "</td></tr>" +

                            // Row 1 – Conference
                            "<tr>" +
                            "<td style='padding:16px 20px;width:160px;vertical-align:top;" +
                            "border-bottom:1px solid #dbeafe;'>" +
                            "<p style='margin:0;font-size:12px;color:#6b7280;font-family:Arial,sans-serif;" +
                            "text-transform:uppercase;letter-spacing:1px;'>Conference</p>" +
                            "<p style='margin:4px 0 0;font-size:14px;color:#374151;font-family:Arial,sans-serif;'>" +
                            conferenceIcon + " Topic</p>" +
                            "</td>" +
                            "<td style='padding:16px 20px;vertical-align:top;border-bottom:1px solid #dbeafe;'>" +
                            "<p style='margin:0;font-size:15px;color:#1a3a8f;font-weight:bold;font-family:Arial,sans-serif;'>" +
                            conferenceTitle + "</p>" +
                            "</td></tr>" +

                            // Row 2 – Date
                            "<tr>" +
                            "<td style='padding:16px 20px;width:160px;vertical-align:top;" +
                            "border-bottom:1px solid #dbeafe;'>" +
                            "<p style='margin:0;font-size:12px;color:#6b7280;font-family:Arial,sans-serif;" +
                            "text-transform:uppercase;letter-spacing:1px;'>Date &amp; Time</p>" +
                            "<p style='margin:4px 0 0;font-size:14px;color:#374151;font-family:Arial,sans-serif;'>" +
                            calendarIcon + " Schedule</p>" +
                            "</td>" +
                            "<td style='padding:16px 20px;vertical-align:top;border-bottom:1px solid #dbeafe;'>" +
                            "<p style='margin:0;font-size:15px;color:#1a3a8f;font-weight:bold;font-family:Arial,sans-serif;'>" +
                            conferenceDate + "</p>" +
                            "</td></tr>" +

                            // Row 3 – Venue
                            "<tr>" +
                            "<td style='padding:16px 20px;width:160px;vertical-align:top;'>" +
                            "<p style='margin:0;font-size:12px;color:#6b7280;font-family:Arial,sans-serif;" +
                            "text-transform:uppercase;letter-spacing:1px;'>Venue</p>" +
                            "<p style='margin:4px 0 0;font-size:14px;color:#374151;font-family:Arial,sans-serif;'>" +
                            locationIcon + " Location</p>" +
                            "</td>" +
                            "<td style='padding:16px 20px;vertical-align:top;'>" +
                            "<p style='margin:0;font-size:15px;color:#1a3a8f;font-weight:bold;font-family:Arial,sans-serif;'>" +
                            venue + "</p>" +
                            "</td></tr>" +

                            "</table>" +
                            "</td></tr>" +


                            // ── REGISTRATION CTA ──
                            "<tr><td style='padding:32px 40px 0 40px;'>" +
                            "<div style='background:linear-gradient(135deg,#1e40af,#2563eb);border-radius:10px;" +
                            "padding:28px;text-align:center;'>" +
                            "<p style='margin:0 0 8px;font-size:16px;color:#ffffff;font-family:Arial,sans-serif;" +
                            "font-weight:bold;'>Ready to Join Us?</p>" +
                            "<p style='margin:0 0 20px;font-size:13px;color:#bfdbfe;font-family:Arial,sans-serif;'>" +
                            "Click the link below to complete your Coordinator and Delegate registration." +
                            "</p>" +

                            // Blue hyperlink text (as requested)
                            "<a href='" + registrationLink + "' " +
                            "style='color:#60a5fa;font-size:14px;font-family:Arial,sans-serif;" +
                            "text-decoration:underline;word-break:break-all;'>" +
                            registrationLink +
                            "</a>" +

                            "<br><br>" +

                            // Optional button alongside
                            "<a href='" + registrationLink + "' " +
                            "style='display:inline-block;background:#ffffff;color:#1a3a8f;" +
                            "padding:13px 32px;text-decoration:none;border-radius:6px;" +
                            "font-size:15px;font-weight:bold;font-family:Arial,sans-serif;" +
                            "letter-spacing:0.5px;margin-top:4px;'>" +
                            "Register Now &#8594;" +
                            "</a>" +

                            "</div></td></tr>" +

                            // ── IMPORTANT NOTES ──
                            "<tr><td style='padding:24px 40px 0 40px;'>" +
                            "<div style='border-left:4px solid #2563eb;padding:12px 16px;" +
                            "background:#f0f7ff;border-radius:0 8px 8px 0;'>" +
                            "<p style='margin:0 0 4px;font-size:13px;color:#1a3a8f;font-weight:bold;" +
                            "font-family:Arial,sans-serif;'>Important Notes</p>" +
                            "<p style='margin:0;font-size:13px;color:#374151;font-family:Arial,sans-serif;line-height:1.6;'>" +
                            "&#10003; Registration is mandatory for all attendees<br>" +
                            "&#10003; Please carry a valid ID proof on the day of the event<br>" +
                            "&#10003; Seats are limited — register at the earliest" +
                            "</p></div>" +
                            "</td></tr>" +

                            // ── CLOSING ──
                            "<tr><td style='padding:28px 40px;'>" +
                            "<p style='margin:0 0 4px;font-size:15px;color:#374151;font-family:Arial,sans-serif;'>Thank You,</p>" +
                            "<p style='margin:0;font-size:15px;color:#1a3a8f;font-weight:bold;font-family:Arial,sans-serif;'>" +
                            "ConfyNex Team</p>" +
                            "<p style='margin:8px 0 0;font-size:12px;color:#9ca3af;font-family:Arial,sans-serif;'>" +
                            "Conference Delegate Management Platform | Powered by ConfyNex" +
                            "</p>" +
                            "</td></tr>" +

                            // ── FOOTER ──
                            "<tr><td style='background:#0d1b4b;padding:18px 40px;text-align:center;'>" +
                            "<p style='margin:0 0 6px;font-size:12px;color:#93c5fd;font-family:Arial,sans-serif;'>" +
                            "ConfyNex &mdash; Simplifying Conference Management</p>" +
                            "<p style='margin:0;font-size:11px;color:#FFFFFF;font-family:Arial,sans-serif;'>" +
                            "This is an automated invitation. Please do not reply to this email." +
                            "</p></td></tr>" +

                            "</table>" +
                            "</td></tr></table>" +
                            "</body></html>";

            helper.setText(template, true);
            javaMailSender.send(mimeMessage);
            System.out.println("Mail Sent Successfully To : " + toEmail);

        } catch (Exception e) {
            System.out.println("Failed to send mail to: " + toEmail);
            System.out.println("Error: " + e.getMessage());
            e.printStackTrace();
        }
    }


    @Override
    public void sendDelegateMail(
            String toEmail,
            String delegateName,
            String conferenceTitle,
            String conferenceDate,
            String venue,
            String loginId,
            Long password) {

        try {

            MimeMessage mimeMessage =
                    javaMailSender.createMimeMessage();

            MimeMessageHelper helper =
                    new MimeMessageHelper(mimeMessage, true);

            helper.setTo(toEmail);

            helper.setSubject(
                    "Delegate Registration Successful | ConfyNex");

            String template =
                    "<h2>Welcome to ConfyNex</h2>" +

                            "<p>Hello <b>" + delegateName + "</b>,</p>" +

                            "<p>You have been registered successfully.</p>" +

                            "<h3>Conference Details</h3>" +

                            "<p>Conference : "
                            + conferenceTitle + "</p>" +

                            "<p>Date : "
                            + conferenceDate + "</p>" +

                            "<p>Venue : "
                            + venue + "</p>" +

                            "<hr>" +

                            "<h3>Login Credentials</h3>" +

                            "<p><b>Login ID :</b> "
                            + loginId + "</p>" +

                            "<p><b>Password :</b> "
                            + password + "</p>" +

                            "<hr>" +

                            "<p>Please change your password after login.</p>";

            helper.setText(template, true);

            javaMailSender.send(mimeMessage);

        } catch (Exception e) {

            e.printStackTrace();
        }
    }
}