package com.my.date.service;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;

@Component
public class MailSendServiceFindPassword {
    @Autowired
    private JavaMailSender mailSender;
    private String tmpPassword;
 
    public void makeRandomPassword() {
    	char[] charSet = new char[] { '0', '1', '2', '3', '4', '5',
    								'6', '7', '8', '9', 'A', 'B',
    								'C', 'D', 'E', 'F', 'G', 'H',
    								'I', 'J', 'K', 'L', 'M', 'N',
    								'O', 'P', 'Q', 'R', 'S', 'T',
    								'U', 'V', 'W', 'X', 'Y', 'Z' };

        String str = "";
        
        int idx = 0;
        for (int i = 0; i < 10; i++) {
            idx = (int) (charSet.length * Math.random());
            str += charSet[idx];
            System.out.println("임시비밀번호 : " + tmpPassword);
            tmpPassword = str;
        }
    }

    public String emailWrite(String email) {
        makeRandomPassword();
        String setFrom = "dateweb1231321@gmail.com";
        String toMail = email;
        String title = "Date 웹 임시 비밀번호 전송 이메일 입니다.";
        String content =
                		"Date 장소 추천 웹을 이용해주셔서 감사합니다." +
                        "<br><br>" +
                        "회원님의 임시 비밀번호는 " + 
                        "<h3>" + tmpPassword + "</h3>" + "입니다." +
                        "<br>" +
                        "해당 비밀번호로 로그인 해주세요.";
        mailSend(setFrom, toMail, title, content);
        return tmpPassword;
    }

    public void mailSend(String setFrom, String toMail, String title, String content) {
        MimeMessage message = mailSender.createMimeMessage();
        try {
            MimeMessageHelper helper = new MimeMessageHelper(message,true,"utf-8");
            helper.setFrom(setFrom);
            helper.setTo(toMail);
            helper.setSubject(title);
            helper.setText(content,true);
            mailSender.send(message);
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }
}