package Model;

import java.util.List;

import Interfaces.IService;
import Interfaces.IUserDao;
import general.MyConstants;
import Interfaces.ICommentDao;
import Interfaces.IDao;
import Interfaces.IMessageDao;
import Interfaces.IPostDao;
import DAO.UserDao;
import DAO.AcademicianDao;
import DAO.GraduateDao;
import DAO.CommentDao;
import DAO.MessageDao;
import DAO.NonAdminUserDao;
import DAO.PostCreatorDao;
import DAO.StudentDao;
import DAO.PostDao;

public class SystemService implements IService{
	private IUserDao userDao = new UserDao();
	private IDao studentDao = new StudentDao();
	private IDao academicianDao = new AcademicianDao() ;
	private IDao graduateDao = new GraduateDao();
	private IDao postCreatorDao = new PostCreatorDao();
	private IDao nonAdminUserDao = new NonAdminUserDao();
	private ICommentDao commentDao = new CommentDao();
	private IMessageDao messageDao = new MessageDao();
	private IPostDao postDao = new PostDao();
	@Override
	public List<User> fetchAllUsers() {
		return userDao.fetchAll();
	}

	@Override
	public List<Post> fetchAllPosts() {
		return postDao.fetchAll();
	}

	@Override
	public List<Post> fetchUserPosts(int userID) {
		return postDao.fetchAllUserPosts(userID);
	}

	@Override
	public List<Comment> fetchAllComments(int postID) {	
		return commentDao.fetchAllPostComments(postID);
	}

	@Override
	public List<Integer> getLikes(int userID) {
		return userDao.fetchAllUserLikes(userID);
	}

	@Override
	public boolean createUser(User user) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean updateUser(User user) {
		if(user.getUserType() == MyConstants.TYPE_ACADEMICIAN) {
			
			boolean academicanTableUpdate = academicianDao.update((Academician)user); 
			boolean userTableUpdate = userDao.update(user);
			return academicanTableUpdate && userTableUpdate;
		}
		return false;
	}

	@Override
	public boolean deleteUser(User user) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean createPost(Post post) {
		return postDao.create(post);
	}

	@Override
	public boolean deletePost(Post post) {

		postDao.delete(post);
		return false;
	}

	@Override
	public boolean createComment(Comment comment) {
		return commentDao.create(comment);
	}

	@Override
	public Comment readComment(int commentID) {
		return commentDao.read(commentID);
	}
	
	@Override
	public boolean deleteComment(Comment comment) {
		return commentDao.delete(comment);
	}
	@Override
	public int getLastCommentID() {
		return commentDao.getLastCreatedCommentID();
	}

	@Override
	public boolean createMessage(Message message) {
		System.out.println("Buraya geldi");
		return messageDao.create(message);
	}

	@Override
	public boolean deleteMessage(Message message) {
		return messageDao.delete(message);
	}
	
	@Override
	public Post readPost(int postID) {
		return postDao.read(postID);
	}

	@Override
	public boolean likePost(int userID, int postID) {
		return userDao.likePost(userID, postID);
	}
	
	@Override
	public boolean dislikePost(int userID, int postID) {
		// TODO Auto-generated method stub
		return userDao.dislikePost(userID, postID);
	}

	@Override
	public boolean updatePost(Post post) {
		return postDao.update(post);
	}

	@Override
	public List<Message> fetchUserMessages(int userID) {
		return messageDao.fetchByUserID(userID);
	}

	@Override
	public User readUser(int userID) {
		User user = userDao.read(userID);
		if(user.getUserType() == MyConstants.TYPE_ACADEMICIAN) {
			user = (Academician)academicianDao.read(userID);	
		}
		return user;
		
	}

	@Override
	public Message readMessage(int messageID) {
		return messageDao.read(messageID);
	}

	@Override
	public boolean updateMessage(Message message) {
		return messageDao.update(message);
	}

	@Override
	public int getLastMessageID() {
		return messageDao.getLastCreatedMessageID();
	}

	
		

}
