package Model;

import java.util.List;

import Interfaces.IService;
import general.MyConstants;
import Interfaces.IDao;
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
	private IDao userDao = new UserDao();
	private IDao studentDao = new StudentDao();
	private IDao academicianDao = new AcademicianDao() ;
	private IDao graduateDao = new GraduateDao();
	private IDao postCreatorDao = new PostCreatorDao();
	private IDao nonAdminUserDao = new NonAdminUserDao();
	private IDao commentDao = new CommentDao();
	private IDao messageDao = new MessageDao();
	private IDao postDao = new PostDao();
	
	@Override
	public List<User> fetchAllUsers() {
		// TODO Auto-generated method stub
		return userDao.fetchAll();
	}

	@Override
	public List<Post> fetchAllPosts() {
		// TODO Auto-generated method stub
		return postDao.fetchAll();
	}

	@Override
	public List<Post> fetchUserPosts(int userID) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Comment> fetchAllComments(int postID) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Integer> getLikes() {
		// TODO Auto-generated method stub
		return null;
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
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean deleteUser(User user) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean createPost(Post post) {
		// TODO Auto-generated method stub
		return postDao.create(post);
	}

	@Override
	public boolean deletePost(Post post) {
		// TODO Auto-generated method stub
		postDao.delete(post);
		return false;
	}

	@Override
	public boolean createComment(Comment comment) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean deleteComment(Comment comment) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean createMessage(Message message) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean deleteMessage(Message message) {
		// TODO Auto-generated method stub
		return false;
	}
	
	public Post readPost(int t) {
		return (Post) postDao.read(t);
	}
		

}
