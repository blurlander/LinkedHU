package Model;

import java.io.File;
import java.util.List;

public class PostCreator extends NonAdminUser{
	private List<Post> authorOf;
	private List<File> uploads;
	
	
	
	public List<Post> getAuthorOf() {
		return authorOf;
	}
	public void setAuthorOf(List<Post> authorOf) {
		this.authorOf = authorOf;
	}
	public List<File> getUploads() {
		return uploads;
	}
	public void setUploads(List<File> uploads) {
		this.uploads = uploads;
	}
}
