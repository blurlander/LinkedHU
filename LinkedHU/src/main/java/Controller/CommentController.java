package Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;

import DAO.CommentDao;
import Interfaces.IService;
import Model.*;
import general.MyConstants;

@WebServlet("/CommentController")
public class CommentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private HttpSession session;
	private IService service = new SystemService();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		session = request.getSession();
		
		String operation = request.getParameter("operation");
		
		switch (operation) 
		{
		case MyConstants.OPP_SHARE_COMMENT:
			// Creating a new comment and send it to the database
			Comment comment = createNewComment(Integer.parseInt( request.getParameter("postID") ),request.getParameter("commentText"));
			// After auto increment value is assigned to the newly added comment,it is fetched and set our comment object here.
			comment.setCommentID(service.getLastCommentID());
			request.setAttribute("newComment",comment);
			request.getRequestDispatcher("PostController").include(request, response);
			
			// Creating the content for the view.
			NonAdminUser commentAuthor = ((NonAdminUser)session.getAttribute("currentUser"));
			
			//Parsing as json
			Gson gson = new Gson(); 
	        JsonObject jsonObject = new JsonObject();
	        JsonElement firstElement = gson.toJsonTree(comment);	        
	        JsonElement secondElement = gson.toJsonTree(commentAuthor);
	        jsonObject.add("commentInfo",firstElement);
	        jsonObject.add("authorInfo",secondElement);
	        System.out.println(jsonObject.toString());
	        request.removeAttribute("newComment");
	        response.setContentType("text/html");
	        response.setHeader("Cache-control", "no-cache, no-store");
	        response.setHeader("Pragma", "no-cache");
	        response.setHeader("Expires", "-1");
	        response.setHeader("Access-Control-Allow-Origin", "*");
	        response.setHeader("Access-Control-Allow-Methods", "POST");
	        response.setHeader("Access-Control-Allow-Headers", "Content-Type");
	        response.setHeader("Access-Control-Max-Age", "86400");
	        
	        PrintWriter out = response.getWriter();
			out.println(jsonObject);
			break;
			
		case MyConstants.OPP_DELETE_COMMENT:
			
			int commentID =  Integer.parseInt( request.getParameter("commentID"));
			Comment deletedComment = deleteComment(commentID);
			request.setAttribute("deletedComment",deletedComment);
			request.getRequestDispatcher("PostController").include(request, response);
		}
		
	}
	
	private Comment createNewComment(int postID, String text)
	{
		Comment comment = new Comment();
		comment.setPostID(postID);
		comment.setText(text);
		comment.setUserID(((User)session.getAttribute("currentUser")).getUserID());
		service.createComment(comment);
		return comment;
	}
	
	private Comment deleteComment(int commentID) {
		Comment deletedComment = service.readComment(commentID);
		service.deleteComment(deletedComment);
		return deletedComment;
	}
	
	

}
