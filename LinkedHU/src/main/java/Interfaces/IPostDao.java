package Interfaces;
import java.util.List;

import Model.Post;

public interface IPostDao extends IDao<Post>{
	List<Post> fetchAllUserPosts(int userID);
	
}
