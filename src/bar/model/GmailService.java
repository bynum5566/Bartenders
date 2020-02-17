package bar.model;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Properties;

import javax.mail.*;
import javax.mail.internet.*;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;



@Component
public class GmailService {
    private final Properties props = new Properties();

    private final String mailUser;
    
    private final String mailPassword;
    
    public GmailService(
            @Value("${mail.user}") String mailUser, 
            @Value("${mail.password}") String mailPassword) {
        
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.port", 587);
        this.mailUser = mailUser;
        this.mailPassword = mailPassword;
    }

    public void validationLinkUsers(Users users) {
        try {
            String link = String.format(
                "http://localhost:8080/Bartenders/verify?account=%s&email=%s&token=%s", 
                users.getAccount(),users.getEmail(), users.getPassword()
            );
            
            String anchor = String.format("<a href='%s'>驗證郵件</a>", link);
            
            String html = String.format("請按 %s 啟用帳戶或複製鏈結至網址列：<br><br> %s", anchor, link);
            
            javax.mail.Message message = createMessage(
                    mailUser, users.getEmail(), "Bartenders註冊結果", html);
            Transport.send(message);
        } catch (MessagingException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    public void validationLinkCompany(Company company) {
        try {
            String link = String.format(
                "http://localhost:8080/Bartenders/verifyCompany?account=%s&email=%s&token=%s", 
                company.getAccount(),company.getEmail(), company.getPassword()
            );
            
            String anchor = String.format("<a href='%s'>驗證郵件</a>", link);
            
            String html = String.format("請按 %s 啟用帳戶或複製鏈結至網址列：<br><br> %s", anchor, link);
            
            javax.mail.Message message = createMessage(
                    mailUser, company.getEmail(), "Bartenders註冊結果", html);
            Transport.send(message);
        } catch (MessagingException | IOException e) {
            throw new RuntimeException(e);
        }
    }
    

    private javax.mail.Message createMessage(
            String from, String to, String subject, String text) 
                    throws MessagingException, AddressException, IOException {
        Session sessionEmail = Session.getDefaultInstance(props, new Authenticator(){
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(mailUser, mailPassword);
            }}
        );
        
        Multipart multiPart = multiPart(text);
        
        javax.mail.Message message = new MimeMessage(sessionEmail);  
        message.setFrom(new InternetAddress(from));
        message.setRecipient(javax.mail.Message.RecipientType.TO, new InternetAddress(to));
        message.setSubject(subject);
        message.setSentDate(new Date());
        message.setContent(multiPart);
        
        return message;
    }

    private Multipart multiPart(String text)
            throws MessagingException, UnsupportedEncodingException, IOException {
       
        MimeBodyPart htmlPart = new MimeBodyPart(); 
        htmlPart.setContent(text, "text/html;charset=UTF-8");
        
        Multipart multiPart = new MimeMultipart();
        multiPart.addBodyPart(htmlPart);

        return multiPart;
    }

	

    
}
