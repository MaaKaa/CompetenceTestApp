package pl.marzenakaa.app.mails;

public interface EmailService {

    void sendHtmlMessage(String to, String subject, String text);
}
