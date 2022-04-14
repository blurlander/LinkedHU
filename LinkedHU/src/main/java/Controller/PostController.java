package Controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.List;

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
		HttpSession session = request.getSession();
		if(session.getAttribute("operation").equals("getPostsForDiscoverPage")) {
			User currentUser = (User)session.getAttribute("currentUser");
			List<Post> allPosts = service.fetchAllPosts();
			String viewData = "";
			for(int i=0;i<allPosts.size();i++) {
				if(allPosts.get(i).getAuthorID() == currentUser.getUserID()) {
					continue;
				}
				if(i != allPosts.size()-1) {
					viewData+= getPostInfo(allPosts.get(i))+"*";
					continue;
				}
				viewData+=getPostInfo(allPosts.get(i));
			}
			session.setAttribute("viewData", viewData);
		   	session.removeAttribute("operation");
		}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	public String getPostInfo(Post p) {
		User user = null;
		for(User u : service.fetchAllUsers()) {
			if(u.getUserID()== p.getAuthorID()) {
				user = u;
				break;
			}
		}
		String postInfo = "";
		SimpleDateFormat formatter = new SimpleDateFormat("dd.M.yyyy hh:mm");  
		postInfo+= user.getFullName()+"*"+p.getMessageText()+"*"+p.getCommentCount()+"*"+p.getLikeCount()+"*"+formatter.format(p.getCreatedAt());
		return postInfo;
		
	}
	
	
	
	

}
