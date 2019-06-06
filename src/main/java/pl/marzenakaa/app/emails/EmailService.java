package pl.marzenakaa.app.emails;

public interface EmailService {

    void sendHtmlMessage(String to, String subject, String text);
}
