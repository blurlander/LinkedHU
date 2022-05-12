package Interfaces;
import java.util.ArrayList;
import java.util.List;

import Model.Post;
import Model.UploadedFile;

public interface IPostDao extends IDao<Post>{
	List<Post> fetchAllUserPosts(int userID);
	ArrayList<UploadedFile> fetchFilesWithPostID(int postID);
	
	
}
