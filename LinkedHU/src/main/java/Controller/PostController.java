package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import java.util.TreeMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Interfaces.IService;
import Model.Comment;
import Model.NonAdminUser;
import Model.Post;
import Model.PostCreator;
import Model.User;
import general.MyConstants;
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
		
		request.getRequestDispatcher("HomePage.jsp").forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		// When login is success load main page
		if(session.getAttribute("operation").equals("getPostsForDiscoverPage") ) {
			
			List<Post> allPosts = service.fetchAllPosts();
			List<User> allUsers = service.fetchAllUsers();
			TreeMap<Post,User> map = new TreeMap<>();
			for(Post p:allPosts) {
				map.put(p,getPostInfo(p,allUsers));
				
			}
			session.setAttribute("map",map);
			session.setAttribute("operation", "failgetPostsForDiscoverPage");
			request.getRequestDispatcher("MessageController").include(request, response);
		}
		
		// Create Post
		else if(request.getParameter("operation").equals(MyConstants.OPP_CREATE_POST)) {
			
			List<User> allUsers = service.fetchAllUsers();
			//TreeMap<Post,User> map = new TreeMap<>();
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
			TreeMap<Post,User> map1 = (TreeMap<Post,User>)session.getAttribute("map");
			map1.put(post, getPostInfo(post,allUsers));
			session.setAttribute("map",map1);
			createNewPost(post);
			response.sendRedirect("PostController");
			// to merge
		}
		// Delete Post
		else if(request.getParameter("operation").equals(MyConstants.OPP_DELETE_POST)) {
			
			int id = Integer.parseInt(request.getParameter("delPost"));
			TreeMap<Post,User> map1 = (TreeMap<Post,User>)session.getAttribute("map");
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
		
		else if(request.getParameter("operation").equals(MyConstants.OPP_LIKE_POST)) {
			int likedPostID = Integer.parseInt(request.getParameter("likedPost"));
			//Post post likedPostID; 
			Post p = service.readPost(likedPostID);
			p.setLikeCount(p.getLikeCount()+1);
			service.updatePost(p);
			TreeMap<Post,User> map1 = (TreeMap<Post,User>)session.getAttribute("map");
			for (Post post :  map1.keySet()) {
				if (post.getPostID() == likedPostID) {
					post.setLikeCount(post.getLikeCount()+1);
					break;
				}
			}
			session.setAttribute("map", map1);
			
			PostCreator user = (PostCreator)session.getAttribute("otherUser");
			for(Post post : user.getAuthorOf()) {
				if(post.getPostID() == likedPostID) {
					post.setLikeCount(post.getLikeCount()+1);
				}
			}
			session.setAttribute("otherUser", user);
			if(Integer.parseInt(request.getParameter("pageCode")) == MyConstants.CODE_DETAILPAGE) {
				Post currentPost = ((Post)session.getAttribute("currentPost"));
				currentPost.setLikeCount(currentPost.getLikeCount()+1);
				session.setAttribute("currentPost", currentPost);
			}
			
			
		}
		else if(request.getParameter("operation").equals(MyConstants.OPP_DISLIKE_POST)) {
			int dislikedPostID = Integer.parseInt(request.getParameter("dislikedPost"));
			//Post post likedPostID; 
			Post p = service.readPost(dislikedPostID);
			p.setLikeCount(p.getLikeCount()-1);
			service.updatePost(p);
			TreeMap<Post,User> map1 = (TreeMap<Post,User>)session.getAttribute("map");
			for (Post post :  map1.keySet()) {
				if (post.getPostID() == dislikedPostID) {
					post.setLikeCount(post.getLikeCount()-1);
					break;
				}
			}
			session.setAttribute("map", map1);
			
			PostCreator user = (PostCreator)session.getAttribute("otherUser");
			for(Post post : user.getAuthorOf()) {
				if(post.getPostID() == dislikedPostID) {
					post.setLikeCount(post.getLikeCount()-1);
				}
			}
			session.setAttribute("otherUser", user);
			if(Integer.parseInt(request.getParameter("pageCode")) ==MyConstants.CODE_DETAILPAGE) {
				Post currentPost = ((Post)session.getAttribute("currentPost"));
				currentPost.setLikeCount(currentPost.getLikeCount()-1);
				session.setAttribute("currentPost", currentPost);
			}
		}
		else if(request.getParameter("operation").equals(MyConstants.OPP_POST_DETAILS)) {
			int postID = Integer.parseInt( request.getParameter("postID") );
			
			// Creating the necessary post object and fetch its comments to display user
			Post p = service.readPost(postID);
			p.setComments(service.fetchAllComments(postID));
			
			session.setAttribute("allUsers", service.fetchAllUsers());
			session.setAttribute("currentPost", p);
			response.sendRedirect("DetailPage.jsp");
		}else if( request.getParameter("operation").equals(MyConstants.OPP_SHARE_COMMENT)) {
			
			Post p = (Post)session.getAttribute("currentPost");
			p.setCommentCount(p.getCommentCount()+1);
			List<Comment> comments = p.getComments();
			comments.add(0,((Comment)request.getAttribute("newComment")));
			p.setComments(comments);
			service.updatePost(p);
			session.setAttribute("currentPost", p);
			
			// Updating tree map to show updates in home page after comment is shared.
			TreeMap<Post,User> map = (TreeMap<Post,User>)session.getAttribute("map");
			for (Post post :  map.keySet()) {
				if (post.getPostID() == p.getPostID()) {
					post.setCommentCount(post.getCommentCount()+1);
					break;
				}
			}
			session.setAttribute("map", map);

			
			request.getRequestDispatcher("UserController").include(request, response);
			
			
		}
		else if( request.getParameter("operation").equals(MyConstants.OPP_DELETE_COMMENT)) {
					
			Post p = (Post)session.getAttribute("currentPost");
			p.setCommentCount(p.getCommentCount()-1);
			List<Comment> comments = p.getComments();
			int commentIndex = -1;
			for(Comment comment : comments) {
				if(comment.getCommentID() == ((Comment)request.getAttribute("deletedComment")).getCommentID()) {
					commentIndex = comments.indexOf(comment);
					break;
				}
			}
			
			
			comments.remove(commentIndex);
			p.setComments(comments);
			service.updatePost(p);
			session.setAttribute("currentPost", p);
			
			// Updating tree map to show updates in home page after comment is shared.
			TreeMap<Post,User> map = (TreeMap<Post,User>)session.getAttribute("map");
			for (Post post :  map.keySet()) {
				if (post.getPostID() == p.getPostID()) {
					post.setCommentCount(post.getCommentCount()-1);
					break;
				}
			}
			session.setAttribute("map", map);

			
			request.getRequestDispatcher("UserController").include(request, response);
			
			
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

