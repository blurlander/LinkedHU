package Model;

public class Academician extends PostCreator{
	private String academicTitle;
	private String professionalHistory;
	private String researchHistory;
	private String proficiencies;
	private String officeNumber;
	
	public String getAcademicTitle() {
		return academicTitle;
	}
	public void setAcademicTitle(String academicTitle) {
		this.academicTitle = academicTitle;
	}
	public String getProfessionalHistory() {
		//professionalHistory = professionalHistory.replaceAll("\n","æ");
		return professionalHistory;
	}
	public void setProfessionalHistory(String professionalHistory) {
		this.professionalHistory = professionalHistory;
	}
	public String getResearchHistory() {
		//researchHistory = researchHistory.replaceAll("\n","æ");
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
