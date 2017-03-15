package com.wicloud.main.java.util.mail;

import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.apache.velocity.app.VelocityEngine;
import org.apache.velocity.exception.VelocityException;
import org.springframework.core.io.ClassPathResource;
import org.springframework.mail.MailException;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.ui.velocity.VelocityEngineUtils;

public class MailEngine {
	
	private static final Logger LOG = Logger.getLogger(MailEngine.class.getName());
//	private FreeMarkerConfigurer freeMarkerConfigurer;
	private VelocityEngine velocityEngine;
	private MailSender mailSender;

//	public void setFreeMarkerConfigurer(
//			FreeMarkerConfigurer freeMarkerConfigurer) {
//		this.freeMarkerConfigurer = freeMarkerConfigurer;
//	}

	public void setMailSender(MailSender mailSender) {
		this.mailSender = mailSender;
	}

	public void setVelocityEngine(VelocityEngine velocityEngine) {
		this.velocityEngine = velocityEngine;
	}

	/**
	 * 通过模板产生邮件正文
	 * 
	 * @param templateName
	 *            邮件模板名称
	 * @param map
	 *            模板中要填充的对象
	 * @return 邮件正文（HTML）
	 */
	public String generateEmailContent(String templateName, Map map) {
//		 使用FreeMaker模板
//		try {
//			Configuration configuration = freeMarkerConfigurer
//					.getConfiguration();
//			Template t = configuration.getTemplate(templateName);
//			return FreeMarkerTemplateUtils.processTemplateIntoString(t, map);
//		} catch (TemplateException e) {
//			log.error("Error while processing FreeMarker template ", e);
//		} catch (FileNotFoundException e) {
//			e.printStackTrace();
//			// log.error("Error while open template file ", e);
//		} catch (IOException e) {
//			log.error("Error while generate Email Content ", e);
//		}

//		使用Vilocity模板
		try {
			return VelocityEngineUtils.mergeTemplateIntoString(velocityEngine,
					templateName, map);
		} catch (VelocityException e) {
			LOG.log(Level.SEVERE, "Error while processing Vilocity template: " + e.getMessage());
		}
		return null;
	}

	/**
	 * 发送邮件
	 * 
	 * @param emailAddress
	 *            收件人Email地址的数组
	 * @param fromEmail
	 *            寄件人Email地址, null为默认寄件人web@vnvtrip.com
	 * @param bodyText
	 *            邮件正文
	 * @param subject
	 *            邮件主题
	 * @param attachmentName
	 *            附件名
	 * @param resource
	 *            附件
	 * @throws MessagingException
	 */
	public void sendMessage(String[] emailAddresses, String fromEmail,
			String bodyText, String subject, String attachmentName,
			ClassPathResource resource) throws MessagingException {
		MimeMessage message = ((JavaMailSenderImpl) mailSender)
				.createMimeMessage();

		// use the true flag to indicate you need a multipart message
		MimeMessageHelper helper = new MimeMessageHelper(message, true);

		helper.setTo(emailAddresses);
		if (fromEmail != null) {
			helper.setFrom(fromEmail);
		}
		helper.setText(bodyText, true);
		helper.setSubject(subject);

		if (attachmentName != null && resource != null)
			helper.addAttachment(attachmentName, resource);

		((JavaMailSenderImpl) mailSender).send(message);
	}

	/**
	 * 发送简单邮件
	 * 
	 * @param msg
	 */
	public void send(SimpleMailMessage msg) {
		try {
			((JavaMailSenderImpl) mailSender).send(msg);
		} catch (MailException ex) {
			// log it and go on
			LOG.log(Level.SEVERE, ex.getMessage());
		}
	}

	/**
	 * 使用模版发送HTML格式的邮件
	 * 
	 * @param msg
	 *            装有to,from,subject信息的SimpleMailMessage
	 * @param templateName
	 *            模版名,模版根路径已在配置文件定义于freemakarengine中
	 * @param model
	 *            渲染模版所需的数据
	 */
	public void send(SimpleMailMessage msg, String templateName, Map model) {
		// 生成html邮件内容
		String content = generateEmailContent(templateName, model);
		MimeMessage mimeMsg = null;
		try {
			mimeMsg = ((JavaMailSenderImpl) mailSender).createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(mimeMsg, true,
					"utf-8");
			helper.setTo(msg.getTo());

			if (msg.getSubject() != null)
				helper.setSubject(msg.getSubject());

			if (msg.getFrom() != null)
				helper.setFrom(msg.getFrom());

			helper.setText(content, true);

			((JavaMailSenderImpl) mailSender).send(mimeMsg);
		} catch (MessagingException ex) {
			LOG.log(Level.SEVERE, ex.getMessage());
		}

	}
}
