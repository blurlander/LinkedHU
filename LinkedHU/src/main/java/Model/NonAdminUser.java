package Model;

import java.sql.Date;
import java.util.List;

public class NonAdminUser extends User{
	private String profilePictureSrc;
	private String status;
	private Date bannedUntil;
	private List<Integer> likes;
	private String bio;
	
	public String getProfilePictureSrc() {
		return profilePictureSrc;
	}
	public void setProfilePictureSrc(String profilePictureSrc) {
		this.profilePictureSrc = profilePictureSrc;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Date getBannedUntil() {
		return bannedUntil;
	}
	public void setBannedUntil(Date bannedUntil) {
		this.bannedUntil = bannedUntil;
	}
	public List<Integer> getLikes() {
		return likes;
	}
	public void setLikes(List<Integer> likes) {
		this.likes = likes;
	}
	public String getBio() {
		return bio;
	}
	public void setBio(String bio) {
		this.bio = bio;
	}
	
	
	

}
