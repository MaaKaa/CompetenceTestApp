package pl.marzenakaa.app.mails;

public interface EmailService {

    void sendSimpleMessage(String to,
                           String subject,
                           String text);
}
