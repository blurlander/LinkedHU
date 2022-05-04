package Model;


import java.sql.Timestamp;
import java.util.List;

public class NonAdminUser extends User{
	private String profilePictureSrc;
	private String status;
	private Timestamp bannedUntil;
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
	public Timestamp getBannedUntil() {
		return bannedUntil;
	}
	public void setBannedUntil(Timestamp bannedUntil) {
		this.bannedUntil = bannedUntil;
	}
	public List<Integer> getLikes() {
		return likes;
	}
	public void setLikes(List<Integer> likes){
		this.likes = likes;
	}
	public String getBio() {
		return bio;
	}
	public void setBio(String bio) {
		this.bio = bio;
	}
	
	
	

}
