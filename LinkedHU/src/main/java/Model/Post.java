package Model;

import java.io.File;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

public class Post implements Comparable<Post>{
	private int postID;
	private String title;
	private String messageText;
	private Date createdAt;
	private int commentCount;
	private int likeCount;
	private String postType;
	private ArrayList<UploadedFile> uploadedFiles = new ArrayList<UploadedFile>(); // List attributes will not be used in demo.
	private List<Comment> comments = null;
	private int authorID;
	private String dateFormat;

	public int getPostID() {
		return postID;
	}
	public void setPostID(int postID) {
		this.postID = postID;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getMessageText() {
		//messageText = messageText.replaceAll("\"","@##>>>!!");
		return messageText;
	}
	public void setMessageText(String messageText) {
		this.messageText = messageText;
	}
	public Date getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Date createdAt) {
		DateFormat dateFormat = new SimpleDateFormat("yyyy.mm.dd hh:mm");  
        String strDate = dateFormat.format(createdAt); 
        this.dateFormat = strDate;
		this.createdAt = createdAt;
	}
	public int getCommentCount() {
		return commentCount;
	}
	public void setCommentCount(int commentCount) {
		this.commentCount = commentCount;
	}
	public int getLikeCount() {
		return likeCount;
	}
	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}
	public String getPostType() {
		return postType;
	}
	public void setPostType(String postType) {
		this.postType = postType;
	}
	public ArrayList<UploadedFile> getUploadedFiles() {
		return uploadedFiles;
	}
	public void setUploadedFiles(ArrayList<UploadedFile> uploadedFiles) {
		this.uploadedFiles = uploadedFiles;
	}
	public List<Comment> getComments() {
		return comments;
	}
	public void setComments(List<Comment> comments) {
		this.comments = comments;
	}
	public int getAuthorID() {
		return authorID;
	}
	public void setAuthorID(int authorID) {
		this.authorID = authorID;
	}
	
	public String getDateFormat() {
		Date date= new Date(createdAt.getTime());
        SimpleDateFormat formatter = new SimpleDateFormat("dd.MM.yyyy hh:mm aa",Locale.ENGLISH);
        dateFormat = formatter.format(date);
        return dateFormat;		
	}
	public void setDateFormat(String dateFormat) {
		this.dateFormat = dateFormat;
	}
	@Override
	public int compareTo(Post o) {
		// TODO Auto-generated method stub
		return o.getCreatedAt().compareTo(this.createdAt);
	}
	

	
	
	
	
}
