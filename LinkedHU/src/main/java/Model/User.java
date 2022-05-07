package Model;

import java.util.ArrayList;
import java.util.TreeMap;

public class User {
	private int userID;
	private String username;
	private String email;
	private String password; 
	private String fullName;
	private int userType;
	private ArrayList<Comment> comments = null;
	private TreeMap<Message,User> messages = new TreeMap<Message,User>();
	
	public int getUserID() {
		return userID;
	}
	public void setUserID(int userID) {
		this.userID = userID;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getFullName() {
		return fullName;
	}
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	public int getUserType() {
		return userType;
	}
	public void setUserType(int userType) {
		this.userType = userType;
	}
	public ArrayList<Comment> getComments() {
		return comments;
	}
	public void setComments(ArrayList<Comment> comments) {
		this.comments = comments;
	}
	public TreeMap<Message, User> getMessages() {
		return messages;
	}
	public void setMessages(TreeMap<Message, User> messages) {
		this.messages = messages;
	}

	
	

}
