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
}
