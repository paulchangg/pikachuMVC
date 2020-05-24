package init;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendValidMail extends Thread {
	private String email;
	private String encryptId;
	
	public SendValidMail(String email, String encryptId) {
		super();
		this.email = email;
		this.encryptId = encryptId;
	}
	
	@Override
	public void run() {
		System.out.println("mail:"+encryptId);
		String host = "smtp.gmail.com";
		int port = 587;
//		String from = "ntutjava013.2@gmail.com";
		String from = "apostlesong1@gmail.com";
		String to = email;
//		final String username = "ntutjava013.2@gmail.com";
		final String username = "apostlesong1@gmail.com";
//		final String password = "Do!ng123";
		final String password = "song198004";
		
		Properties props = new Properties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.port", port);
		javax.mail.Session session = javax.mail.Session.getInstance(props, new Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		});

		try {

			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(from));
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
			message.setSubject("PIKACHU : Welcome to join us.");
			StringBuilder text = new StringBuilder();
			text.append("<br>");
			text.append("<p>Hello PIKACHU member</p>");
			text.append("<br>");
			text.append("<a href=\"http://localhost:8080/pikachuMVC/member/validId?id="+ encryptId + "\">Click me</a>\n");
			text.append("<br>");
			text.append("<p>點擊上面連結即可啟用會員帳號</p>\n");
			text.append("<br>");
			text.append("<p>Best regards</p>");
			text.append("<p>Your PIKACHU Team</p>");
			
			message.setContent(text.toString(), "text/html; charset=UTF-8");
			

			Transport transport = session.getTransport("smtp");
			transport.connect(host, port, username, password);

			Transport.send(message);

			System.out.println("寄送Valid Email結束.");
			
		} catch (MessagingException e) {
			throw new RuntimeException(e);
		}
	}
	
	

}
