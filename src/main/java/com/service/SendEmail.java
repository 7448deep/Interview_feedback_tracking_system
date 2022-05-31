package com.service;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendEmail
{

	public static boolean setProperties(String toUserMail, String mailMainSubject, String mailMainMessage)
	{
		boolean success = false;
		String fromEmail = "iftsystem.spar@gmail.com";
		String password = "Spar@ifts$123";

		String toMail = toUserMail;
		String mailSubject = mailMainSubject;
		String mailMessage = mailMainMessage;
		try
		{
			Properties pr = new Properties();
			pr.setProperty("mail.smtp.host", "smtp.gmail.com"); // server
			pr.setProperty("mail.smtp.port", "587"); // port
			pr.setProperty("mail.smtp.auth", "true"); // authentication
			pr.setProperty("mail.smtp.starttls.enable", "true");
			pr.put("mail.smtp.socketFactory.port", "587");
			pr.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");

			Session session = Session.getInstance(pr, new Authenticator()
			{
				protected PasswordAuthentication getPasswordAuthentication()
				{
					return new PasswordAuthentication(fromEmail, password);
				}
			});

			Message message = new MimeMessage(session);

			message.setFrom(new InternetAddress(fromEmail));
			message.setRecipient(Message.RecipientType.TO, new InternetAddress(toMail));
			message.setSubject(mailSubject);
			message.setText(mailMessage);

			Transport.send(message);

			success = true;
		} catch (Exception e)
		{
			System.out.println(e);
		}
		return success;
	}

	// email to new user --OTP verification
	public static boolean sendVerficationCodeToUser(String email, String code)
	{
		boolean success = false;
		String toEmail = email;
		String mailSubject = "Registration Verification Code";
		String mailMessage = "Hii \n\t Welcome To IFTSystem \n\n\t For successful registration you need to verify using this OTP\n\t "
				+ code + "\n\n Thanks for Joining us";

		success = setProperties(toEmail, mailSubject, mailMessage);
		return success;
	}

	// email to panel --schedule is assigned to you
	public static boolean sendScheduleDeatilsToPanel(String panelEmail, String date, String time, String meetLink)
	{
		boolean success = false;
		String toEmail = panelEmail;
		String mailSubject = "Interview Schedule is Assigned";
		String mailMessage = "Hii \n\n\t Welcome to Spar-IFTSystem\n\t There is Interview assigned to you \n\t Date-"
				+ date + "\n\t Time" + time + "\n\tLink- " + meetLink + "\n\nThanks and Regards";

		success = setProperties(toEmail, mailSubject, mailMessage);
		return success;
	}

	// email to candidate interview is scheduled
	public static boolean sendNewScheduleDeatilsToCandidate(String candidateEmail, String date, String time,
			String meetLink)
	{
		boolean success = false;
		String toEmail = candidateEmail;
		String mailSubject = "Interview is Scheduled for you";
		String mailMessage = "Hii \n\n\t Welcome to  Spar-IFTSystem\n\t There is Interview Scheduled for you \n\t Date-"
				+ date + "\n\t Time" + time + "\n\tLink- " + meetLink + "\n\nThanks and Regards";

		success = setProperties(toEmail, mailSubject, mailMessage);
		return success;
	}

	// email to candidate interview is ReScheduled
	public static boolean sendReScheduleDeatilsToCandidate(String candidateEmail, String date, String time,
			String meetLink)
	{
		boolean success = false;
		String toEmail = candidateEmail;
		String mailSubject = "Interview is ReScheduled for you";
		String mailMessage = "Hii \n\n\t Welcome to  Spar-IFTSystem\n\t There is Interview Scheduled for you \n\t Date-"
				+ date + "\n\t Time" + time + "\n\tLink- " + meetLink + "\n\nThanks and Regards";

		success = setProperties(toEmail, mailSubject, mailMessage);
		return success;
	}

	// Email to HR -Interview is done
	public static boolean sendScheduleCompletedStatustoHR(String candidateName, String employeeName, String date,
			String time)
	{
		boolean success = false;
		String toEmail = "7448deep@gmail.com";
		String mailSubject = "Interview is completed";
		String mailMessage = "Hii \n\n\t Welcome to  Spar-IFTSystem\n\t Interview Schedule is completed \n\t Panel Name:- "
				+ employeeName + "\n\t Candidate Name:- " + candidateName + "\n\tDate:- " + date + "\n\t Time:- " + time
				+ "\n\nThanks and Regards";

		success = setProperties(toEmail, mailSubject, mailMessage);
		return success;
	}

}
