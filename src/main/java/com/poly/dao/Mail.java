/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.poly.dao;

import java.io.File;
import java.util.Properties;
import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author LONG
 */
public class Mail {

    public static void sendEmail(String to, File file,String name) {
        
            Properties p = new Properties();

            p.put("mail.smtp.host", "smtp.gmail.com");
            p.put("mail.smtp.port", "587");
            p.put("mail.smtp.auth", "true");
            p.put("mail.smtp.starttls.enable", "true");
            p.put("mail.smtp.ssl.trust", "smtp.gmail.com");
            p.setProperty("mail.smtp.ssl.protocols", "TLSv1.2");
            p.put("mail.debug", "true");

            Authenticator auth = new Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication("mailps16784@gmail.com","kftchysgigcdbfgz");
                }
            };
            Session session = Session.getInstance(p, auth);
            try {
            Message msg = new MimeMessage(session);
            msg.addHeader("Content-type", "text/HTML; charset=UTF-8");
            msg.addHeader("format", "flowed");
            msg.addHeader("Content-Transfer-Encoding", "8bit");

            msg.setFrom(new InternetAddress("Hi","NoReply"));
            msg.setSubject("Đăng ký tài khoan thành công");

            msg.setRecipient(Message.RecipientType.TO, new InternetAddress(to));
            msg.setText("Chào " + name + ", chúc mừng bạn đã đăng ký thành công tài khoản cozmo coffee");

            if (file.length() != 0) {
                msg.setDataHandler(new DataHandler(new FileDataSource(file.getAbsoluteFile())));
            }
            Transport.send(msg);

        } catch (Exception e) {
            System.out.println("sendmail: " + e.getMessage());
            e.getStackTrace();
        }
    }
    
    public static void sendOrder(String to, File file,String content) {
        
        Properties p = new Properties();

        p.put("mail.smtp.host", "smtp.gmail.com");
        p.put("mail.smtp.port", "587");
        p.put("mail.smtp.auth", "true");
        p.put("mail.smtp.starttls.enable", "true");
        p.put("mail.smtp.ssl.trust", "smtp.gmail.com");
        p.setProperty("mail.smtp.ssl.protocols", "TLSv1.2");
        p.put("mail.debug", "true");

        Authenticator auth = new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("mailps16784@gmail.com","kftchysgigcdbfgz");
            }
        };
        Session session = Session.getInstance(p, auth);
        try {
        Message msg = new MimeMessage(session);

        

        msg.setRecipient(Message.RecipientType.TO, new InternetAddress(to));
        msg.setFrom(new InternetAddress("Hi","Cozmo Coffee"));
        
        msg.setSubject("Thank you for shopping at cozmo coffee");
       
        msg.setContent(content, "text/plain; charset=UTF-8");

        if (file.length() != 0) {
            msg.setDataHandler(new DataHandler(new FileDataSource(file.getAbsoluteFile())));
        }
        Transport.send(msg);

    } catch (Exception e) {
        System.out.println("sendmail: " + e.getMessage());
        e.getStackTrace();
    }
}
    }

   
