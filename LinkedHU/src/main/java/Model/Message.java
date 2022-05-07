package Model;

import java.io.File;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Locale;

public class Message implements Comparable<Message>{
	private int messageID;
	private int senderID;
	private int receiverID;
	private Timestamp createdAt;
	private String formattedDate;
	private String formattedDateWithoutHours;
	private String text;
	private String messageTopic;
	private List<File> uploadedFiles;
	private int deletionStatus = 0;
	private boolean isRead = false;
	private List<String> links;
	
	public int getMessageID() {
		return messageID;
	}
	public void setMessageID(int messageID) {
		this.messageID = messageID;
	}
	public int getSenderID() {
		return senderID;
	}
	public void setSenderID(int senderID) {
		this.senderID = senderID;
	}
	public int getReceiverID() {
		return receiverID;
	}
	public void setReceiverID(int receiverID) {
		this.receiverID = receiverID;
	}
	public Timestamp getCreatedAt() {
		return createdAt;
	}
	public String getFormattedDate() {
		Date date= new Date(createdAt.getTime());
		SimpleDateFormat formatter = new SimpleDateFormat("dd.MM.yyyy hh:mm aa",Locale.ENGLISH);  
	    formattedDate = formatter.format(date);
	    return formattedDate;
	}
	public void setFormattedDate(String formattedDate) {
		this.formattedDate = formattedDate;
	}
	public void setCreatedAt(Timestamp createdAt) {
		this.createdAt = createdAt;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public String getMessageTopic() {
		return messageTopic;
	}
	public void setMessageTopic(String messageTopic) {
		this.messageTopic = messageTopic;
	}
	public List<File> getUploadedFiles() {
		return uploadedFiles;
	}
	public void setUploadedFiles(List<File> uploadedFiles) {
		this.uploadedFiles = uploadedFiles;
	}
	public int getDeletionStatus() {
		return deletionStatus;
	}
	public void setDeletionStatus(int deletionStatus) {
		this.deletionStatus = deletionStatus;
	}
	public boolean getIsRead() {
		return isRead;
	}
	public void setIsRead(boolean isRead) {
		this.isRead = isRead;
	}
	public List<String> getLinks() {
		return links;
	}
	public void setLinks(List<String> links) {
		this.links = links;
	}
	@Override
	public int compareTo(Message o) {
		return o.getCreatedAt().compareTo(this.createdAt);
	}
	public String getFormattedDateWithoutHours() {
		Date date= new Date(createdAt.getTime());
		SimpleDateFormat formatter = new SimpleDateFormat("dd.MM.yyyy");  
	    formattedDateWithoutHours = formatter.format(date);
	    return formattedDateWithoutHours;
	}
	public void setFormattedDateWithoutHours(String formattedDateWithoutHours) {
		this.formattedDateWithoutHours = formattedDateWithoutHours;
	}
	
	
	
	
	

}
