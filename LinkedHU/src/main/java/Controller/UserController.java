package Controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.TreeMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.mysql.cj.Constants;

import Interfaces.IService;
import Model.Academician;
import Model.Post;
import Model.PostCreator;
import Model.SystemService;
import Model.User;
import Model.NonAdminUser;
import general.MyConstants;

@WebServlet("/UserController")
@MultipartConfig(
		  fileSizeThreshold = 1024 * 1024 * 1, 
		  maxRequestSize = 1024 * 1024 * 100 )
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	RequestDispatcher dispatcher = null;
	public HttpSession session;
	private IService service = new SystemService();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("LoginPage.jsp").forward(request, response);
	}
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String operation = request.getParameter("operation");
		session = request.getSession();
				
		switch(operation) 
		{
			case MyConstants.OPP_LOGOUT:
				doGet(request,response);
				return;
		
			case MyConstants.OPP_LOGIN:
				
				String email = request.getParameter("email");
				String password = request.getParameter("password");
				boolean control = checkUserLoginInfo(email, password);
				//dispatcher = request.getRequestDispatcher("LoginPage.jsp");
				if(control) {
					session.setAttribute("status","success");
					session.setAttribute("operation","getPostsForDiscoverPage");
					request.getRequestDispatcher("PostController").include(request, response);
					response.sendRedirect("HomePage.jsp");
					//dispatcher.include(request, response);
				}
				else {
					// To prevent re-submission of forms,this pattern is used here.
					// POST-REDIRECT-GET
					session.setAttribute("status","fail");
					response.sendRedirect("UserController");
				}
				
				break;
				
			case MyConstants.OPP_UPDATE_PROFILE:
				
				String firstName = request.getParameter("firstName");
				String lastName = request.getParameter("lastName");
				String fullName = firstName.concat(" ").concat(lastName);
				
				String acadTitle = request.getParameter("acadTitle");
				String officeNumber = request.getParameter("officeNumber");
				String professionalHistory = request.getParameter("professionalHistory");
				String researchHistory = request.getParameter("researchHistory");
				String proficiencies = request.getParameter("proficiencies");
				String bio = request.getParameter("bio");
				
				String username = request.getParameter("userName");
				String password1 = request.getParameter("password");
				String email1 = request.getParameter("email");
				
				Part filePart = request.getPart("profilePicture");
				String fileName = filePart.getSubmittedFileName();
				String profilePictureSrc ="";
				
				//After register operation,a default profile picture will be set to the user and this code piece will always work.
				// If no path is selected to update the profile picture,the last one will be selected.
				if(fileName.equals("")) {
					profilePictureSrc +=((NonAdminUser)session.getAttribute("currentUser")).getProfilePictureSrc();
				}
				else {
					profilePictureSrc += "./ProfilePictures/"+fileName;
				}
				
				// The lines below must be alive until the delivery!!! Don't forget Bahar HOCAAAAA
				//String destSRC = "C:\\Users\\dyavu\\Desktop\\Proje\\bbm384-2022-demo-final-hello-world-inc\\LinkedHU\\src\\main\\webapp\\ProfilePictures\\"+username+fileName;
				//filePart.write(destSRC);
				//String profilePictureSrc = "./ProfilePictures/"+fileName;
				//System.out.println(destSRC);
				
				
				List<String> infoList = new ArrayList<String>();
				
				infoList.add(username);
				infoList.add(email1);
				infoList.add(password1);
				infoList.add(fullName);
				infoList.add(bio);
				infoList.add(acadTitle);
				infoList.add(professionalHistory);
				infoList.add(researchHistory);
				infoList.add(proficiencies);
				infoList.add(officeNumber);
				infoList.add(profilePictureSrc);

				updateAccountInfo(infoList);
			
				
				response.sendRedirect("Profile.jsp");
				
				break;
			case MyConstants.OPP_VIEW_PROFILE:
				
				//  userID of the user whose profile page we want to see
				int incomeUserID = Integer.parseInt(request.getParameter("userID"));
								
				// get the posts of the otherUser
				// read ile yap�lacak.
				PostCreator otherUser =  (PostCreator)getUserFromID(incomeUserID);
				otherUser.setAuthorOf(service.fetchUserPosts(incomeUserID));
				otherUser.setLikes(service.getLikes(incomeUserID));
				
				session.setAttribute("otherUser",otherUser);
				response.sendRedirect("Profile.jsp");
				break;
			case MyConstants.OPP_LIKE_POST:
				int likedPostID = Integer.parseInt(request.getParameter("likedPost"));
				NonAdminUser user = ((NonAdminUser)session.getAttribute("currentUser"));
				user.getLikes().add(likedPostID);
				session.setAttribute("currentUser", user);
				service.likePost(user.getUserID(), likedPostID);
				request.getRequestDispatcher("PostController").include(request, response);
				break;
			case MyConstants.OPP_DISLIKE_POST:
				int dislikedPostID = Integer.parseInt(request.getParameter("dislikedPost"));
				NonAdminUser userDisliked = ((NonAdminUser)session.getAttribute("currentUser"));
				userDisliked.getLikes().remove((Integer)dislikedPostID);
				session.setAttribute("currentUser", userDisliked);
				service.dislikePost(userDisliked.getUserID(),dislikedPostID);
				request.getRequestDispatcher("PostController").include(request, response);	
				break;
		}
		
	}
		
	private User getUserFromID(int userID) {
		List<User> allUsers = service.fetchAllUsers();
		for (User user : allUsers) {
			if(user.getUserID() == userID) {
				return user;
			}
		}
		return null;
	}
	
	protected boolean checkUserLoginInfo(String email,String password) {
		List<User> allUsers = service.fetchAllUsers();
		for(User u : allUsers) 
		{	
			// Fetching all user posts.
			if(u.getEmail().equals(email) && u.getPassword().equals(password)) {
				if(u.getUserType() == MyConstants.TYPE_ACADEMICIAN || u.getUserType() == MyConstants.TYPE_GRADUATE ) {
					((PostCreator)u).setAuthorOf(service.fetchUserPosts(u.getUserID()));
					// Comments will be inserted too . Coming soon.
				}
				if(u.getUserType() != MyConstants.TYPE_ADMIN ) {
					((NonAdminUser)u).setLikes(service.getLikes(u.getUserID()));
				}
						
				session.setAttribute("currentUser", u);
				session.setAttribute("otherUser", u);				
				return true;
			}
		}
		return false;
	}
	
	public boolean updateAccountInfo(List<String> infoList) {
		
		User u = (User)session.getAttribute("currentUser");
		if(u.getUserType() == MyConstants.TYPE_ACADEMICIAN) {
			
			Academician a = (Academician)u;
			
			a.setUsername(infoList.get(0));
			a.setEmail(infoList.get(1));
			a.setPassword(infoList.get(2));
			a.setFullName(infoList.get(3));
			a.setBio(infoList.get(4));
			a.setAcademicTitle(infoList.get(5));
			a.setProfessionalHistory(infoList.get(6));
			a.setResearchHistory(infoList.get(7));
			a.setProficiencies(infoList.get(8));
			a.setOfficeNumber(infoList.get(9));
			a.setProfilePictureSrc(infoList.get(10));
			
			// All session attributes which is affected in any update process should be pulled from the database again.
			// and get the proper data for session attributes
			if(service.updateUser(a)) {
				session.setAttribute("currentUser", a);
				session.setAttribute("otherUser", a);
				TreeMap<Post,User> map = (TreeMap<Post,User>)session.getAttribute("map");
				for (Post p :  map.keySet()) {
					if (p.getAuthorID() == a.getUserID()) {
						map.replace(p, a);
					}
				}
				session.setAttribute("map",map);
				//((PostCreator)session.getAttribute("otherUser")).setAuthorOf(service.fetchUserPosts(((PostCreator)session.getAttribute("currentUser")).getUserID()));
			}
		}

		return true;
	}
	
	/*
	public boolean updateAccountInfo(String firstName, String lastName,String acadTitle, String phone, String mail, 
			String address, String username, String password, String email) {
			User u = new User();
			String fullname = firstName + " " + lastName;
			u.setFullName(fullname);
			u.setEmail(email);
			u.setPassword(password);
			if(service.updateUser(u)) {
				return true;
			};	
		
		return false;
	}
	*/
	
	
	/*protected boolean registerUser(String fullName,String email,String password) {
		class PasswordController
		{
			private String candidatePassword;
			public PasswordController(String candidatePassword) {
				this.candidatePassword = candidatePassword; 
			}
			public boolean controlPassword() {
				if(this.candidatePassword.length() < 5) {
					return false;
				}
				boolean control = this.candidatePassword.matches("[A-Z]+");
				boolean control1 = this.candidatePassword.matches("[a-z]+");
				boolean control2 = this.candidatePassword.matches("[0-9]+");

				boolean control3 = this.candidatePassword.matches("[<|>|�|#|$|@|+|-|?|!]+");

				return control&&control1&&control2&&control3;		
			}	
		}
		PasswordController passwordController = new PasswordController(password);
		if(passwordController.controlPassword()) {
			User newUser = new User();
			newUser.setFullName(fullName);
			newUser.setEmail(email);
			newUser.setPassword(password);
			
		}
		
		return false;
	}*/
	
	
	
	
	
	

}
