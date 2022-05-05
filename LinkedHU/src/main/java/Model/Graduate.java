package Model;

import java.sql.Date;

public class Graduate extends PostCreator{
	
	private int graduationYear;
	private String proficiencies;
	private Date bannedUntil;
	private String status;
	
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
	public int getGraduationYear() {
		return graduationYear;
	}
	public void setGraduationYear(int graduationYear) {
		this.graduationYear = graduationYear;
	}
	public String getProficiencies() {
		return proficiencies;
	}
	public void setProficiencies(String proficiencies) {
		this.proficiencies = proficiencies;
	}

}
