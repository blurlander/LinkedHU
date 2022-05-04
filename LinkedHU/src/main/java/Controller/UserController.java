package Controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
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

import Interfaces.IService;
import Model.*;
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
				
				boolean typecheck = false; // False if student , true if Academician
				String acadTitle = "";
				String officeNumber = ""; 
				String professionalHistory = "";
				String researchHistory = "";
				String proficiencies = "";
				String skills = "";
				String gpa = "";
				String graduation = "";
				
				if(((NonAdminUser)session.getAttribute("currentUser")).getUserType() == MyConstants.TYPE_ACADEMICIAN) {
					typecheck = true;
					acadTitle = request.getParameter("acadTitle");
					officeNumber = request.getParameter("officeNumber");
					professionalHistory = request.getParameter("professionalHistory");
					researchHistory = request.getParameter("researchHistory");
					proficiencies = request.getParameter("proficiencies");
				}
				else if(((NonAdminUser)session.getAttribute("currentUser")).getUserType() == MyConstants.TYPE_STUDENT) {
					skills = request.getParameter("skills");
					gpa = request.getParameter("gpa");
					graduation = request.getParameter("graduation");
					
				}
									
				String bio = request.getParameter("bio");
				
				String username = request.getParameter("userName");
				String password1 = request.getParameter("password");
				String email1 = request.getParameter("email");
				
				Part filePart = request.getPart("profilePicture");
				String fileName = filePart.getSubmittedFileName();
				String destinationFolderSrc = request.getServletContext().getRealPath("ProfilePictures");
				Random random = new Random();
				String uploadedFileName = username+random.nextInt(10000)+".jpg";
				filePart.write(destinationFolderSrc+ File.separator + uploadedFileName);
				String profilePictureSrc ="";
				//After register operation,a default profile picture will be set to the user and this code piece will always work.
				// If no path is selected to update the profile picture,the last one will be selected.
				
				if(fileName.equals("")) {
					profilePictureSrc +=((NonAdminUser)session.getAttribute("currentUser")).getProfilePictureSrc();
				}
				else {
					profilePictureSrc += "./ProfilePictures/"+uploadedFileName;
				}

				List<String> infoList = new ArrayList<String>();
				
				infoList.add(username);
				infoList.add(email1);
				infoList.add(password1);
				infoList.add(fullName);
				infoList.add(profilePictureSrc);
				infoList.add(bio);
				
				if(typecheck) {				
				infoList.add(acadTitle);
				infoList.add(professionalHistory);
				infoList.add(researchHistory);
				infoList.add(proficiencies);
				infoList.add(officeNumber);				
				}
				else {
				infoList.add(skills);
				infoList.add(gpa);
				infoList.add(graduation);
				}
				
				
				
				
				
				updateAccountInfo(infoList);
				response.sendRedirect("Profile.jsp");
				
				break;
				
			case MyConstants.OPP_VIEW_PROFILE:

				//  userID of the user whose profile page we want to see
				int incomeUserID = Integer.parseInt(request.getParameter("userID"));
								
				// get the posts of the otherUser
				// read ile yap�lacak.
				User user1 = getUserFromID(incomeUserID);
				PostCreator otherUser;
				
				System.out.println("bu ben : " + incomeUserID);
				
				if(user1.getUserType() == MyConstants.TYPE_GRADUATE || user1.getUserType() == MyConstants.TYPE_ACADEMICIAN) {
					 otherUser =  (PostCreator)user1;
					
					// fill post of the other user
					otherUser.setAuthorOf(service.fetchUserPosts(incomeUserID));
					
					// fill likes of the other user
					otherUser.setLikes(service.getLikes(incomeUserID));
					
					session.setAttribute("otherUser",otherUser);
					response.sendRedirect("Profile.jsp");
				}
				
				if(user1.getUserType() == MyConstants.TYPE_STUDENT) {
					
					response.sendRedirect("Profile.jsp");
				}
				
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
				
			case MyConstants.OPP_SHARE_COMMENT:
				
				//increment the comment count of the post of current user.
				PostCreator pc = (PostCreator)session.getAttribute("otherUser");
				
				// fill currentUser's Posts
				pc.setAuthorOf(service.fetchUserPosts(pc.getUserID()));
				session.setAttribute("otherUser", pc);
				break;
			 case MyConstants.OPP_DELETE_COMMENT:
				 PostCreator postCreator = (PostCreator)session.getAttribute("otherUser");
					
				 // fill currentUser's Posts
				 postCreator.setAuthorOf(service.fetchUserPosts(postCreator.getUserID()));
				 session.setAttribute("otherUser", postCreator);
				 break;
				 
			 case MyConstants.OPP_REGISTER:
				 	
				 	email = request.getParameter("email");
					password = request.getParameter("password");
					String confPassword = request.getParameter("cpassword");
					username = request.getParameter("username");
					boolean check = (password.equals(confPassword));
					
					Student student = new Student();
					student.setEmail(email);
					student.setProfilePictureSrc("");
					student.setPassword(password);
					student.setUserType(MyConstants.TYPE_STUDENT);
					student.setUsername(username);
					//student.setProfilePictureSrc(".\\.\\webapp\\assets\\media\\users\\default.jpg");
					
					
					
					
					// if check = false, sendredirect login
					System.out.println(student.getUsername());
					
					if(check) {
						//service.createUser(student);
						session.setAttribute("currentUser",student);
						//session.setAttribute("otherUser", student);
						session.setAttribute("status", "registerContinue");
						response.sendRedirect("UpdateProfile.jsp");
					}
					else {
						session.setAttribute("status", "registerFail");
						response.sendRedirect("LoginPage.jsp");
					}				 
				 break;
				
			 case MyConstants.OPP_FINISH_REGISTER:	 
				 	firstName = request.getParameter("firstName");
				 	lastName = request.getParameter("lastName");
					fullName = firstName.concat(" ").concat(lastName);
					
					typecheck = false; // False if student , true if Academician
					acadTitle = "";
					officeNumber = ""; 
					professionalHistory = "";
					researchHistory = "";
					proficiencies = "";
					skills = "";
					gpa = "";
					graduation = "";
					
					if(((NonAdminUser)session.getAttribute("currentUser")).getUserType() == MyConstants.TYPE_ACADEMICIAN) {
						typecheck = true;
						acadTitle = request.getParameter("acadTitle");
						officeNumber = request.getParameter("officeNumber");
						professionalHistory = request.getParameter("professionalHistory");
						researchHistory = request.getParameter("researchHistory");
						proficiencies = request.getParameter("proficiencies");
					}
					else if(((NonAdminUser)session.getAttribute("currentUser")).getUserType() == MyConstants.TYPE_STUDENT) {
						skills = request.getParameter("skills");
						gpa = request.getParameter("gpa");
						graduation = request.getParameter("graduation");
						
					}
										
					bio = request.getParameter("bio");
					
					username = request.getParameter("userName");
					password1 = request.getParameter("password");
					email1 = request.getParameter("email");
					
					filePart = request.getPart("profilePicture");
					fileName = filePart.getSubmittedFileName();
					destinationFolderSrc = request.getServletContext().getRealPath("ProfilePictures");
					random = new Random();
					uploadedFileName = username+random.nextInt(10000)+".jpg";
					filePart.write(destinationFolderSrc+ File.separator + uploadedFileName);
					profilePictureSrc ="";
					//After register operation,a default profile picture will be set to the user and this code piece will always work.
					// If no path is selected to update the profile picture,the last one will be selected.
					
					if(fileName.equals("")) {
						profilePictureSrc +=((NonAdminUser)session.getAttribute("currentUser")).getProfilePictureSrc();
					}
					else {
						profilePictureSrc += "./ProfilePictures/"+uploadedFileName;
					}

					infoList = new ArrayList<String>();
					
					infoList.add(username);
					infoList.add(email1);
					infoList.add(password1);
					infoList.add(fullName);
					infoList.add(profilePictureSrc);
					infoList.add(bio);
					
					
					
					if(typecheck) {				
					infoList.add(acadTitle);
					infoList.add(professionalHistory);
					infoList.add(researchHistory);
					infoList.add(proficiencies);
					infoList.add(officeNumber);				
					}
					else {
					infoList.add(skills);
					infoList.add(gpa);
					infoList.add(graduation);
					}
					
					
					
					
					
					updateAccountInfo(infoList);
					response.sendRedirect("Profile.jsp");
				 
				 
				 
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
<<<<<<< Updated upstream
			if(u.getEmail().equals(email) && u.getPassword().equals(password)) {			
=======
			if(u.getEmail().equals(email) && u.getPassword().equals(password)) {
				
>>>>>>> Stashed changes
				if(u.getUserType() == MyConstants.TYPE_ACADEMICIAN || u.getUserType() == MyConstants.TYPE_GRADUATE ) {
					((PostCreator)u).setAuthorOf(service.fetchUserPosts(u.getUserID()));
					// Comments will be inserted too . Coming soon.
				}
				if(u.getUserType() != MyConstants.TYPE_ADMIN && u.getUserType() != MyConstants.TYPE_STUDENT) {
					((NonAdminUser)u).setLikes(service.getLikes(u.getUserID()));
				}
						
				session.setAttribute("currentUser", u);
<<<<<<< Updated upstream
				session.setAttribute("otherUser", u);
=======
				session.setAttribute("otherUser", u);	
>>>>>>> Stashed changes
				session.setAttribute("userList", allUsers);
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
			a.setProfilePictureSrc(infoList.get(4));
			a.setBio(infoList.get(5));	
			a.setAcademicTitle(infoList.get(6));
			a.setProfessionalHistory(infoList.get(7));
			a.setResearchHistory(infoList.get(8));
			a.setProficiencies(infoList.get(9));
			a.setOfficeNumber(infoList.get(10));
			
			
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
		}else if(u.getUserType() == MyConstants.TYPE_STUDENT) {
			Student s = (Student)u;
			s.setUsername(infoList.get(0));
			s.setEmail(infoList.get(1));
			s.setPassword(infoList.get(2));
			s.setFullName(infoList.get(3));
			s.setProfilePictureSrc(infoList.get(4));
			s.setBio(infoList.get(5));
			s.setSkills(infoList.get(6));
			s.setGpa(Double.parseDouble(infoList.get(7)));
			s.setGraduation(infoList.get(8));
			
			
			String stat = (String)session.getAttribute("status");			
			boolean isStillRegister = stat.equals("registerContinue");			
			
			if(isStillRegister) {
				
				if(service.createUser(s)) {
					session.setAttribute("currentUser", s);
					session.setAttribute("otherUser", s);
					session.setAttribute("status", "Success");
					return true;
				}
			}else {
				if(service.updateUser(s)) {
					session.setAttribute("currentUser", s);
					session.setAttribute("otherUser", s);
				}
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
