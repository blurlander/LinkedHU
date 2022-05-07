package Interfaces;

import java.sql.Timestamp;
import java.sql.Date;
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
	List<Message> fetchUserMessages(int userID);
	boolean likePost(int userID,int postID);
	boolean dislikePost(int userID,int postID);
	User readUser(int userID);
	boolean createUser(User user);
	boolean updateUser(User user);
	boolean deleteUser(User user);
	Post readPost(int postID);
	boolean createPost(Post post);
	boolean deletePost(Post post);
	boolean updatePost(Post post);
	int getLastCommentID();
	int getLastMessageID();
	boolean createComment(Comment comment);
	Comment readComment(int commentID);
	boolean deleteComment(Comment comment);
	Message readMessage(int messageID);
	boolean updateMessage(Message message);
	boolean createMessage(Message message);
	boolean deleteMessage(Message message);
	boolean banUser(int ID, Date ts,int type);
	int getTypefromid(int ID);
	boolean liftBan(int ID, int type);
	boolean followUser(int follower, int userID);
	boolean unfollowUser(int unfollower, int userID);
	List<Integer> getFollowedUserID(int studentID);
	int getFollowCount(int ID);
	int checkUserNameExists(String name);
	int checkEmailExists(String email);
}
