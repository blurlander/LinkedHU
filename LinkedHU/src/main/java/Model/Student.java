package Model;

import java.sql.Timestamp;

public class Student extends NonAdminUser {
	private String skills;
	private double gpa;
	private String graduation;
	private int type;
	private Timestamp bannedUntil;
	private String status;
	
	
	
	
	public Timestamp getBannedUntil() {
		return bannedUntil;
	}
	public void setBannedUntil(Timestamp bannedUntil) {
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
