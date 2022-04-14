package Model;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

public class Post {
	private int postID;
	private String title;
	private String messageText;
	private Date createdAt;
	private int commentCount;
	private int likeCount;
	private String postType;
	private ArrayList<File> uploadedFiles = null; // List attributes will not be used in demo.
	private ArrayList<String> links = null;
	private ArrayList<Comment> comments = null;
	private int authorID;
	
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
		messageText = messageText.replaceAll("\"","@##>>>!!");
		return messageText;
	}
	public void setMessageText(String messageText) {
		this.messageText = messageText;
	}
	public Date getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Date createdAt) {
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
	public ArrayList<File> getUploadedFiles() {
		return uploadedFiles;
	}
	public void setUploadedFiles(ArrayList<File> uploadedFiles) {
		this.uploadedFiles = uploadedFiles;
	}
	public ArrayList<String> getLinks() {
		return links;
	}
	public void setLinks(ArrayList<String> links) {
		this.links = links;
	}
	public ArrayList<Comment> getComments() {
		return comments;
	}
	public void setComments(ArrayList<Comment> comments) {
		this.comments = comments;
	}
	public int getAuthorID() {
		return authorID;
	}
	public void setAuthorID(int authorID) {
		this.authorID = authorID;
	}
	

	
	
	
	
}
