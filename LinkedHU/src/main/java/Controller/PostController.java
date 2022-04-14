package Controller;

import java.io.IOException;

import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Random;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Interfaces.IService;
import Model.Post;
import Model.User;
import Model.SystemService;

@WebServlet("/PostController")
public class PostController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private IService service = new SystemService();
       
    /**
     * @see Http+Servlet#HttpServlet()
     */
    public PostController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		
		request.getRequestDispatcher("Final.jsp").forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		

		// When login is success load main page

		if(session.getAttribute("operation").equals("getPostsForDiscoverPage")) {
			User currentUser = (User)session.getAttribute("currentUser");
			List<Post> allPosts = service.fetchAllPosts();
			List<User> allUsers = service.fetchAllUsers();
			HashMap<Post,User> map = new HashMap<>();
			for(Post p:allPosts) {
				map.put(p,getPostInfo(p,allUsers));
				
			}
			session.setAttribute("map",map);
			session.setAttribute("operation", "failgetPostsForDiscoverPage");
		}

		
		// Create Post

		else if(request.getParameter("opp").equals("5")) {
			List<User> allUsers = service.fetchAllUsers();
			HashMap<Post,User> map = new HashMap<>();
			Random random = new Random();
			PrintWriter out = response.getWriter();
			int upperbound = 1000000;
			int int_random = random.nextInt(upperbound);
			String title = request.getParameter("title");
			String text = request.getParameter("text");
			User user = (User)session.getAttribute("currentUser");
			int authorID = user.getUserID();
			Post post = new Post();
			Timestamp timestamp = new Timestamp(System.currentTimeMillis());
			post.setCreatedAt(timestamp);
			post.setAuthorID(authorID);
			post.setTitle(title);
			post.setMessageText(text);
			post.setCommentCount(0);
			post.setLikeCount(0);
			post.setPostType("Normal");
			post.setPostID(int_random);
			HashMap<Post,User> map1 = (HashMap<Post,User>)session.getAttribute("map");
			map1.put(post, getPostInfo(post,allUsers));
			session.setAttribute("map",map1);
			createNewPost(post);
			response.sendRedirect("PostController");
			
		}

		// Delete Post

		else if(request.getParameter("opp").equals("6")) {
			int id = Integer.parseInt(request.getParameter("delPost"));
			HashMap<Post,User> map1 = (HashMap<Post,User>)session.getAttribute("map");
			for (Post p :  map1.keySet()) {
				if (p.getPostID() == id) {
					map1.remove(p);
					deletePost(p);
					break;
				}
			}
			session.setAttribute("map", map1);
			response.sendRedirect("PostController");
			
		}
	}
	
	public User getPostInfo(Post p,List<User> users) {
		for(User u : users) {
			if(u.getUserID()== p.getAuthorID()) {
				return u;
			}
		}
		return null;	
	}
	
	
	public boolean createNewPost(Post p) {
		if(service.createPost(p)) {
			return true;
		}
		return false;
	}
	
	public boolean deletePost(Post p) {
		return (service.deletePost(p));

	}
	
	
	
	


}

