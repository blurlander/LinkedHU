package Model;

import java.sql.Timestamp;
import java.sql.Date;
import java.util.List;
import java.util.TreeMap;

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
import DAO.AdminDao;

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
	public List<UploadedFile> fetchAllFiles() {
		return userDao.fetchAllUploadedFiles();
	}
	@Override
	public boolean createFiles(List<UploadedFile> uploadedFiles) {
		return userDao.createFiles(uploadedFiles);
	}
	
	@Override
	public boolean deleteFile(int fileID) {
		return userDao.deleteFile(fileID);
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
		boolean control1 = userDao.create(user);
		
		if(user.getUserType() == MyConstants.TYPE_STUDENT) {
			Student s = (Student)user;
			
			boolean control2 = studentDao.create(s);
			
			return control1 && control2;
		}
		else if(user.getUserType() == MyConstants.TYPE_ACADEMICIAN) {
			
			boolean control2 = academicianDao.create(((Academician)user));
			return control1 && control2;
		}
		else if(user.getUserType() == MyConstants.TYPE_GRADUATE) {
			
			boolean control2 = graduateDao.create(((Graduate)user));
			return control1 && control2;
		}else {
			return control1 ;
		}
				
	
		// if user type == student ,  
	}

	@Override
	public boolean updateUser(User user) {
		if(user.getUserType() == MyConstants.TYPE_ACADEMICIAN) {
			
			boolean academicanTableUpdate = academicianDao.update((Academician)user); 
			boolean userTableUpdate = userDao.update(user);
			return academicanTableUpdate && userTableUpdate;
		}else if(user.getUserType() == MyConstants.TYPE_STUDENT) {
			boolean studentUpdate = studentDao.update((Student)user);
			boolean userUpdate = userDao.update(user);
			return studentUpdate && userUpdate;
			
		}else if(user.getUserType() == MyConstants.TYPE_GRADUATE) {
			boolean graduateUpdate = graduateDao.update((Graduate)user);
			boolean userUpdate = userDao.update(user);
			return graduateUpdate && userUpdate;
		}
		
		return false;
	}

	@Override
	public boolean deleteUser(User user) {
		boolean key = userDao.delete(user);
		return key;
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
			Academician academician = (Academician)academicianDao.read(userID);
			
			// get likes of the user
			academician.setLikes(this.getLikes(userID));
			
			// get posts of the user
			academician.setAuthorOf(this.fetchUserPosts(userID));
			
			user = academician;
		}
		else if(user.getUserType() == MyConstants.TYPE_GRADUATE) {
			Graduate graduate = (Graduate)graduateDao.read(userID);
			
			// get likes of the user
			graduate.setLikes(this.getLikes(userID));
			
			// get posts of the user
			graduate.setAuthorOf(this.fetchUserPosts(userID));

			user = graduate;
		}
		else if(user.getUserType() == MyConstants.TYPE_STUDENT) {
			Student student = (Student)studentDao.read(userID);
			
			// get likes of the user
			student.setLikes(this.getLikes(userID));
			
			// get fallows of the student
			student.setFollows(this.getFollowedUserID(userID));

			user = student;
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

	
	public boolean banUser(int ID, Date ts, int type) {
		return userDao.ban(ID,ts,type);
		
	}
	
	public int getTypefromid(int ID) {
		return userDao.getTypefromID(ID);
	}

	@Override
	public boolean liftBan(int ID, int type) {
		return userDao.liftBan(ID, type);
	}
	
	@Override
	public boolean followUser(int follower, int userID) {
		return userDao.follow(follower,userID);
		
	}
		
	@Override
	public boolean unfollowUser(int unfollower, int userID) {
		return userDao.unfollow(unfollower,userID);
		
	}

	@Override
	public List<Integer> getFollowedUserID(int studentID) {
		
		return userDao.getFollowedUserID(studentID);
	}

	@Override
	public int getFollowCount(int ID) {
		
		return userDao.getFollowCount(ID);
	}
	
	@Override
	public int checkUserNameExists(String name) {
		int key = userDao.checkUserNameExists(name);
		return key;
	}
	
	@Override
	public int checkEmailExists(String email) {
		int key = userDao.checkEmailExists(email);
		return key;
	}
	
	

}
