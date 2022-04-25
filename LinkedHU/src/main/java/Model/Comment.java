package Model;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Comment implements Comparable<Comment>{
	private int commentID;
	private int userID;
	private int postID;
	private String text;
	private Date createdAt;
	private String dateFormat;
	
	public Date getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Date createdAt) {
		DateFormat dateFormat = new SimpleDateFormat("yyyy.mm.dd hh:mm");  
        String strDate = dateFormat.format(createdAt); 
        this.dateFormat = strDate;
		this.createdAt = createdAt;
	}
	public String getDateFormat() {
		return dateFormat;
	}
	public void setDateFormat(String dateFormat) {
		this.dateFormat = dateFormat;
	}
	
	
	
	public int getCommentID() {
		return commentID;
	}
	public void setCommentID(int commentID) {
		this.commentID = commentID;
	}
	public int getUserID() {
		return userID;
	}
	public void setUserID(int userID) {
		this.userID = userID;
	}
	public int getPostID() {
		return postID;
	}
	public void setPostID(int postID) {
		this.postID = postID;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	
	@Override
	public int compareTo(Comment m) {
		return m.getCreatedAt().compareTo(this.createdAt);
	}
}
