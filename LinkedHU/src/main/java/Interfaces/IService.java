package Interfaces;

import java.util.List;

import Model.*;

public interface IService {
	//Minimum requirements for all services that will be used by this system.
	List<User> fetchAllUsers();
	List<Post> fetchAllPosts();
	List<UploadedFile> fetchAllFiles();
	boolean createFiles(List<UploadedFile> uploadedFiles);
	
	List<Post> fetchUserPosts(int userID);
	List<Comment> fetchAllComments(int postID);
	List<Integer> getLikes(int userID);
	boolean likePost(int userID,int postID);
	boolean dislikePost(int userID,int postID);
	boolean createUser(User user);
	boolean updateUser(User user);
	boolean deleteUser(User user);
	Post readPost(int postID);
	boolean createPost(Post post);
	boolean deletePost(Post post);
	boolean updatePost(Post post);
	int getLastCommentID();
	boolean createComment(Comment comment);
	Comment readComment(int commentID);
	boolean deleteComment(Comment comment);
	boolean createMessage(Message message);
	boolean deleteMessage(Message message);
}
