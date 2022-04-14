package Interfaces;

import java.util.List;

import Model.Comment;
import Model.Message;
import Model.Post;
import Model.User;

public interface IService {
	//Minimum requirements for all services that will be used by this system.
	List<User> fetchAllUsers();
	List<Post> fetchAllPosts();
	List<Post> fetchUserPosts(int userID);
	List<Comment> fetchAllComments(int postID);
	List<Integer> getLikes();
	boolean createUser(User user);
	boolean updateUser(User user);
	boolean deleteUser(User user);
	boolean createPost(Post post);
	boolean deletePost(Post post);
	boolean createComment(Comment comment);
	boolean deleteComment(Comment comment);
	boolean createMessage(Message message);
	boolean deleteMessage(Message message);

	Post readPost(int id);

}
