package Model;

import java.util.Date;

public class UploadedFile {
	
	private int fileID;
	private int uploaderID;
	private String uploadUrl;
	private String extension;
	private String name;
	private String idInfo;
	private Date createdAt;
	
	private String uploaderProfilePicture;
	private String uploaderEmail;
	private String uploaderName;
	
	public int getFileID() {
		return fileID;
	}
	public void setFileID(int fileID) {
		this.fileID = fileID;
	}
	public int getUploaderID() {
		return uploaderID;
	}
	public void setUploaderID(int uploaderID) {
		this.uploaderID = uploaderID;
	}
	public String getUploadUrl() {
		return uploadUrl;
	}
	public void setUploadUrl(String uploadUrl) {
		this.uploadUrl = uploadUrl;
	}
	public String getExtension() {
		return extension;
	}
	public void setExtension(String extention) {
		this.extension = extention;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getIdInfo() {
		return idInfo;
	}
	public void setIdInfo(String idInfo) {
		this.idInfo = idInfo;
	}
	public String getUploaderProfilePicture() {
		return uploaderProfilePicture;
	}
	
	public Date getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
	
	public void setUploaderProfilePicture(String uploaderProfilePicture) {
		this.uploaderProfilePicture = uploaderProfilePicture;
	}
	public String getUploaderEmail() {
		return uploaderEmail;
	}
	public void setUploaderEmail(String uploaderEmail) {
		this.uploaderEmail = uploaderEmail;
	}
	public String getUploaderName() {
		return uploaderName;
	}
	public void setUploaderName(String uploaderName) {
		this.uploaderName = uploaderName;
	}
	
	
	
}
