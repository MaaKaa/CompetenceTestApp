package pl.marzenakaa.app.emails;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

@Component
public class EmailServiceImpl implements EmailService {

    @Autowired
    public JavaMailSender emailSender;

    public void sendHtmlMessage(String to, String subject, String text) {

        try {
            JavaMailSenderImpl sender = new JavaMailSenderImpl();

            MimeMessage message = sender.createMimeMessage();

            MimeMessageHelper helper = new MimeMessageHelper(message);
            helper.setTo(to);
            helper.setSubject(subject);
            helper.setText(text, true);

            emailSender.send(message);
            System.out.println("Message was sent successfully!");

        } catch (MessagingException e) {
            e.printStackTrace();
            System.out.println("Sorry, message wasn't sent.");
        }

    }

}
