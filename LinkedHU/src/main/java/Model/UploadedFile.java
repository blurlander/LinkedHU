package Model;

public class UploadedFile {
	
	private int fileID;
	private int uploaderID;
	private String uploadUrl;
	private String extension;
	private String name;
	private String idInfo;
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
	
	
	
}
