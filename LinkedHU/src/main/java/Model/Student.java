package Model;

import java.sql.Date;

import java.util.List;

public class Student extends NonAdminUser {
	private String skills;
	private double gpa;
	private String graduation;
	private int type;
	private Date bannedUntil;
	private String status;
	
	private List<Integer> follows;
	
	
	
	
	
	public List<Integer> getFollows() {
		return follows;
	}
	public void setFollows(List<Integer> follows) {
		this.follows = follows;
	}
	public Date getBannedUntil() {
		return bannedUntil;
	}
	public void setBannedUntil(Date bannedUntil) {
		this.bannedUntil = bannedUntil;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getSkills() {
		return skills;
	}
	public void setSkills(String skills) {
		this.skills = skills;
	}
	public double getGpa() {
		return gpa;
	}
	public void setGpa(double gpa) {
		this.gpa = gpa;
	}
	public String getGraduation() {
		return graduation;
	}
	public void setGraduation(String graduation) {
		this.graduation = graduation;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	
	
	
	
	
}
