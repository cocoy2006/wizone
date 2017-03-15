package com.wicloud.main.java.util.mail;

import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

import org.springframework.mail.SimpleMailMessage;

import com.wicloud.main.java.util.SpringContextUtil;

public class Mail {
	
	private static final Logger LOG = Logger.getLogger(Mail.class.getName());
	private static final String TO_ADDRESS = "service@wicloud.cc";
	
	public Mail() {}
	
	public Mail(String username, String email, String fromUrl) {
//		this.id = id;
//		this.username = username;
//		this.email = email;
//		this.fromUrl = fromUrl;
//		initParameters();
	}
	
	public Mail(String username, String email) {
//		this.username = username;
//		this.email = email;
	}
	
	public boolean sendContacts() throws Exception {
		try {
			
			return true;
		} catch(Exception e) {
			LOG.log(Level.SEVERE, e.getMessage());
			throw e;
		}
	}
	
//	public boolean sendIframe(String applicationId, String packageName, String version) throws Exception {
//		try {
//			// data to fill
//			String src = parseUrl().concat("index#").concat(applicationId);
//			Map<String, Object> model = new HashMap<String, Object>();
//	        model.put("packageName", packageName);
//	        model.put("version", version);
//	        model.put("src", src);
//	        // to address
//	        String to = username.concat("<").concat(email).concat(">");
//	        // send email
//	        send(to, "iframe.vm", model);
//	        LOG.log(Level.INFO, "Iframe邮件成功发送给开发者:" + username);
//			return true;
//		} catch(Exception e) {
//			LOG.log(Level.SEVERE, e.getMessage());
//			throw e;
//		}
//	}
//	
//	public boolean sendActivation() throws Exception {
//		try {
//			String url = parseUrl().concat("user/active/").concat(username).concat("/").concat(email).concat("/");
//	        Map<String, Object> model = new HashMap<String, Object>();
//	        model.put("url", url);
//	        String to = username.concat("<").concat(email).concat(">");
//	        send(to, "activation.vm", model);
//	        LOG.log(Level.INFO, "激活邮件成功发送给开发者:" + username);
//	        return true;
//		} catch(Exception e) {
//			LOG.log(Level.SEVERE, e.getMessage());
//			throw e;
//		}
//	}
//	
//	public boolean sendNewPassword(String newPassword) throws Exception {
//		try {
//	        Map<String, Object> model = new HashMap<String, Object>();
//	        model.put("newPassword", newPassword);
//	        String to = username.concat("<").concat(email).concat(">");
//	        send(to, "pwdreset.vm", model);
//	        LOG.log(Level.INFO, "新密码成功发送给开发者:" + username);
//	        return true;
//		} catch(Exception e) {
//			LOG.log(Level.SEVERE, e.getMessage());
//			throw e;
//		}
//	}
//	
	public boolean send(String vm, Map<String, Object> model) throws Exception {
		try {
			SimpleMailMessage message = (SimpleMailMessage) SpringContextUtil.getBean("mailMessage");
			message.setSubject("Apptry");
	        message.setTo(TO_ADDRESS);
	        MailEngine engine = (MailEngine) SpringContextUtil.getBean("mailEngine");
	        engine.send(message, vm, model);
			return true;
		} catch(Exception e) {
			LOG.log(Level.SEVERE, "邮件发送失败:" + e.getMessage());
			throw e;
		}
	}

}
