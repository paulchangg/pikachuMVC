package init;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendEmail extends Thread {
	
	private String email;
	private String newPW;
	
	public SendEmail(String email, String newPW) {
		super();
		this.email = email;
		this.newPW = newPW;
	}

	@Override
	public void run() {
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
//		props.put("mail.smtp.ssl.trust", "*");  //宋加
		props.put("mail.smtp.port", port);
//		props.put("mail.smtp.user", username); //宋加
		javax.mail.Session session = javax.mail.Session.getInstance(props, new Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		});

		try {

			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(from));
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
			message.setSubject("PIKACHU : update password successfully");
			StringBuilder text = new StringBuilder();
			text.append("<br>");
			text.append("<p>Hello PIKACHU member</p>");
			text.append("<br>");
			text.append("<p>************************************************************</p>\n");
			text.append("<p>This is your new password : [ &nbsp;" + newPW + "&nbsp; ]</p>\n");
			text.append("<p>************************************************************</p>\n");
			text.append("<p>Please update your password as soon as possible.</p>\n");
			text.append("<br>");
			text.append("<p>Best regards</p>");
			text.append("<p>Your PIKACHU Team</p>");
			
			message.setContent(text.toString(), "text/html; charset=UTF-8");
			

			Transport transport = session.getTransport("smtp");
//			transport.connect(host, port, username, password);
			transport.connect(username, password);  //宋用
			Transport.send(message);
			
			System.out.println("寄送email結束.");
			
		} catch (MessagingException e) {
			throw new RuntimeException(e);
		}
	}
	

	
	
	

}
