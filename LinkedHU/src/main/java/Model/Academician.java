package Model;

import java.sql.Date;
import java.sql.Timestamp;

public class Academician extends PostCreator{
	private String academicTitle;
	private String professionalHistory;
	private String researchHistory;
	private String proficiencies;
	private String officeNumber;
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
	public String getAcademicTitle() {
		return academicTitle;
	}
	public void setAcademicTitle(String academicTitle) {
		this.academicTitle = academicTitle;
	}
	public String getProfessionalHistory() {

		//professionalHistory = professionalHistory.replaceAll("\n","�");

		return professionalHistory;
	}
	public void setProfessionalHistory(String professionalHistory) {
		this.professionalHistory = professionalHistory;
	}
	public String getResearchHistory() {

		//researchHistory = researchHistory.replaceAll("\n","�");

		return researchHistory;
	}
	public void setResearchHistory(String researchHistory) {
		this.researchHistory = researchHistory;
	}
	public String getProficiencies() {
		return proficiencies;
	}
	public void setProficiencies(String proficiencies) {
		this.proficiencies = proficiencies;
	}
	public String getOfficeNumber() {
		return officeNumber;
	}
	public void setOfficeNumber(String officeNumber) {
		this.officeNumber = officeNumber;
	}
	
}
