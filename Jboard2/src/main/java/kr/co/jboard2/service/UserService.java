package kr.co.jboard2.service;

import java.util.Properties;
import java.util.concurrent.ThreadLocalRandom;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.jboard2.dao.UserDAO;
import kr.co.jboard2.dto.UserDTO;

public enum UserService {
	INSTANCE;
	
	private static String generatedCode;
	
	private UserDAO dao = UserDAO.getInstance();
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	public void insertUser(UserDTO dto) {
		dao.insertUser(dto);
	}
	
	public UserDTO selectUser(String uid, String pass) {
		return dao.selectUser(uid, pass);
	}
	
	public UserDTO selectUserByNameAndEmail(String name, String email) {
		return dao.selectUserByNameAndEmail(name, email);
	}
	
	public int selectCountUid(String uid) {
		return dao.selectCountUid(uid);
	}
	
	public int selectCountNick(String nick) {
		return dao.selectCountNick(nick);
	}
	
	public int selectCountEmail(String email) {
		return dao.selectCountEmail(email);
	}
	
	public int selectCountNameAndEmail(String name, String email) {
		return dao.selectCountNameAndEmail(name, email);
	}

	public int selectCountUidAndEmail(String uid, String email) {
		return dao.selectCountUidAndEmail(uid, email);
	}
	
	public void updateUser(UserDTO dto) {
		dao.updateUser(dto);
	}
	
	public int updateUserPass(String uid, String pass) {
		return dao.updateUserPass(uid, pass);
	}
	
	public int updateUserForWithdraw(String uid) {
		return dao.updateUserForWithdraw(uid);
	}
	
	public int sendCodeByEmail(String receiver) {
		
		// 인증코드 생성
		int code = ThreadLocalRandom.current().nextInt(100000, 1000000);
		
		generatedCode = ""+code;
		
		// 기본정보
		String sender = "iisk145@gmail.com";
		String password = "ujknbgaqurylovfy";
		String title = "Jboard2 인증코드 입니다.";
		String content = "<h1>인증코드는 "+code+"</h1>";
		
		// Gmail SMTP 서버 설정

		Properties props = new Properties();
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "465");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.ssl.enable", "true");
		props.put("mail.smtp.ssl.trust", "smtp.gmail.com");
		
		// Gmail SMTP 세션 생성
		
		Session gmailSession = Session.getInstance(props, new Authenticator(){
			
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(sender, password);
			}
		});
		
		
		// 메일 발송
		int status = 0;
		Message message = new MimeMessage(gmailSession);
		
		try{
			logger.info("here1...");
			message.setFrom(new InternetAddress(sender, "보내는 사람", "UTF-8"));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(receiver));
			message.setSubject(title);
			message.setContent(content, "text/html;charset=UTF-8");
			Transport.send(message);
			status = 1;
			
		}catch(Exception e){
			status = 0;
			logger.error("sendCodeByEmail() error : " + e.getMessage());
		}
		return status;
	}
	
	public int confirmCodeByEmail(String code) {
		
		if(code.equals(generatedCode)) {
			logger.info("return 1...");
			return 1;
		}else {
			logger.info("return 0...");
			return 0;
		}
	}
	
}
