package Controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.sql.Date;
import java.util.List;
import java.util.Random;
import java.util.Set;
import java.util.TreeMap;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

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
	public boolean fromBan = false;
	
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
					if(!fromBan) {
						session.setAttribute("status","fail");
						response.sendRedirect("UserController");
					}
					if(fromBan) {
						session.setAttribute("status","banned");
						response.sendRedirect("UserController");
						fromBan = false;
					}
					
				}
				
				break;
				
			case MyConstants.OPP_UPDATE_PROFILE:
				String firstName = request.getParameter("firstName");
				String lastName = request.getParameter("lastName");
				String fullName = firstName.concat(" ").concat(lastName);
				
				int typecheck = 0; // False if student , true if Academician
				String acadTitle = "";
				String officeNumber = ""; 
				String professionalHistory = "";
				String researchHistory = "";
				String proficiencies = "";
				String skills = "";
				String gpa = "";
				String graduation = "";
				
				if(((NonAdminUser)session.getAttribute("otherUser")).getUserType() == MyConstants.TYPE_ACADEMICIAN) {
					typecheck = 1;
					acadTitle = request.getParameter("acadTitle");
					officeNumber = request.getParameter("officeNumber");
					professionalHistory = request.getParameter("professionalHistory");
					researchHistory = request.getParameter("researchHistory");
					proficiencies = request.getParameter("proficiencies");
				}
				else if(((NonAdminUser)session.getAttribute("otherUser")).getUserType() == MyConstants.TYPE_STUDENT) {
					typecheck = 2;
					skills = request.getParameter("skills");
					gpa = request.getParameter("gpa");
					graduation = request.getParameter("graduation");
					
				}
				else if(((NonAdminUser)session.getAttribute("otherUser")).getUserType() == MyConstants.TYPE_GRADUATE) {
					typecheck = 3;
					proficiencies = request.getParameter("proficiencies");
					graduation = request.getParameter("graduation");
					
				}
				
									
				String bio = request.getParameter("bio");
				
				String username = request.getParameter("userName");
				String password1 = request.getParameter("password");
				String email1 = request.getParameter("email");
				
				boolean changeEmail = !(((User)session.getAttribute("otherUser")).getEmail().equals(email1));
				boolean changeUsername = !(((User)session.getAttribute("otherUser")).getUsername().equals(username));
				
				int checkUserName1 = service.checkUserNameExists(username);
				int checkEmail1 = service.checkEmailExists(email1);
				boolean tryagain1 = false;
				if(changeUsername) {
					if(checkUserName1 > 0) {
						session.setAttribute("userexists", MyConstants.USERNAME_EXISTS);
						tryagain1 = true;
					}
				}
				if(changeEmail) {
					if(checkEmail1 > 0) {
						session.setAttribute("userexists", MyConstants.EMAIL_EXISTS);
						tryagain1 = true;
					}
				}
				if(tryagain1) {
					response.sendRedirect("UpdateProfile.jsp");
					break;
				}
				
				
				
				
				
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
					profilePictureSrc +=((NonAdminUser)session.getAttribute("otherUser")).getProfilePictureSrc();
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
				
				if(typecheck == 1) {				
				infoList.add(acadTitle);
				infoList.add(professionalHistory);
				infoList.add(researchHistory);
				infoList.add(proficiencies);
				infoList.add(officeNumber);				
				}
				else if(typecheck == 2) {
				infoList.add(skills);
				infoList.add(gpa);
				infoList.add(graduation);
				}
				else if(typecheck == 3) {				
				infoList.add(graduation);
				infoList.add(proficiencies);
				}
				
				
				
				
				
				updateAccountInfo(infoList);
				response.sendRedirect("Profile.jsp");
				
				break;
				
			case MyConstants.OPP_VIEW_PROFILE:

				//  userID of the user whose profile page we want to see
				int incomeUserID = Integer.parseInt(request.getParameter("userID"));
				
				
				int gf = getFollowCount(incomeUserID);
				
				
				
				session.setAttribute("followerCount", gf);
				
				// get the posts of the otherUser
				// read ile yap�lacak.
				User user1 = getUserFromID(incomeUserID);
				
								
				
				if(user1.getUserType() == MyConstants.TYPE_GRADUATE || user1.getUserType() == MyConstants.TYPE_ACADEMICIAN || user1.getUserType() == MyConstants.TYPE_ADMIN) {
					PostCreator otherUser =  (PostCreator)user1;
					
					// fill post of the other user
					otherUser.setAuthorOf(service.fetchUserPosts(incomeUserID));
					
					// fill likes of the other user
					otherUser.setLikes(service.getLikes(incomeUserID));
					
					session.setAttribute("targetType", MyConstants.TARGET_TYPE_CREATOR);
					session.setAttribute("otherUser",otherUser);
					response.sendRedirect("Profile.jsp");
					break;
				}
				
				if(user1.getUserType() == MyConstants.TYPE_STUDENT) {
					NonAdminUser otherUser1 = (NonAdminUser)user1;
					session.setAttribute("otherUser",otherUser1);
					List<Post> studentPosts = new ArrayList<Post>();
					Student student1 = (Student)user1;
					List<Integer> followeds = new ArrayList<Integer>();
					followeds = getFollowedUserID(student1.getUserID());
					student1.setFollows(followeds);
					System.out.println(followeds);
					if (followeds != null ) {
					for (int i :followeds ) {
						studentPosts.addAll(service.fetchUserPosts(i));						
						}
					}
					session.setAttribute("followedPosts", studentPosts);
					session.setAttribute("targetType", MyConstants.TARGET_TYPE_STUDENT);
					response.sendRedirect("Profile.jsp");
					
				}
				
				/*if(user1.getUserType() == MyConstants.TYPE_ADMIN) {
					User otheradmin = user1;
					session.setAttribute("otherUser",otheradmin);
					response.sendRedirect("Profile.jsp");
				}*/
								
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
			 case MyConstants.OPP_FILE_UPLOAD:
				 
				int uploaderUserID = Integer.parseInt(request.getParameter("userID"));

				String jsonString = request.getParameter("fileObject");

				List<UploadedFile> uploadedFiles = new ArrayList<UploadedFile>();
				
				
				try {

					JSONArray jsonArray = new JSONArray(jsonString);
					for (int i = 0; i < jsonArray.length(); ++i) {
						JSONObject jsonObject = jsonArray.getJSONObject(i);
						System.out.println(jsonObject);
						UploadedFile uploadedFile = new UploadedFile();

						uploadedFile.setExtension((String) jsonObject.get("extension"));
						uploadedFile.setIdInfo((String) jsonObject.get("id"));
						uploadedFile.setName((String) jsonObject.get("name"));
						uploadedFile.setUploaderID(uploaderUserID);
						uploadedFile.setUploadUrl((String) jsonObject.get("uploadURL"));

						uploadedFiles.add(uploadedFile);
						
					}
					
					for (int i = 0; i < uploadedFiles.size(); i++) {
						System.out.println(uploadedFiles.get(i).getUploadUrl());
					}
					service.createFiles(uploadedFiles);

				} catch (JSONException err) {
					System.out.println("Error" + err.toString());
				}
				
				response.sendRedirect("FileUpload.jsp");
				break;
				 
			 case MyConstants.OPP_REGISTER:
				 	email = request.getParameter("email");
					password = request.getParameter("password");
					String confPassword = request.getParameter("cpassword");
					username = request.getParameter("username");
					boolean check = (password.equals(confPassword));
					int checkUserName = service.checkUserNameExists(username);
					int checkEmail = service.checkEmailExists(email);
					
					
					PrintWriter out = response.getWriter();
					
					if(email == "" || password == "" || confPassword == "" || username == "") {
						out.print("-blank-message-");
						break;
					}
					
					if(checkUserName > 0) {
						session.setAttribute("userexists", MyConstants.USERNAME_EXISTS);
						out.print("-username-message-");
						return;
					}
					
					if(email.split("@").length != 2 ) {
						out.print("-invalidEmail-message-");
						return;
					}
					
					if(checkEmail > 0) {
						session.setAttribute("userexists", MyConstants.EMAIL_EXISTS);
						out.print("-email-message-");
						return;
					}
					
					
					if(password.length() <= 7) {
						out.print("-invalidPassword-message-");
						return;
					}
					
					if(!check) {
						out.print("-password-message-");
						return;
					}
					
					System.out.println("gecti");
					Student student = new Student();
					student.setEmail(email);
					student.setPassword(password);
					student.setUserType(MyConstants.TYPE_STUDENT);
					student.setUsername(username);
					student.setProfilePictureSrc("./assets/media/users/default.jpg");
					
					//service.createUser(student);
					session.setAttribute("currentUser",student);
					session.setAttribute("otherUser",student);
					
					session.setAttribute("status", MyConstants.CONTINUE_REGISTER);
					
				 break;
				
			 case MyConstants.OPP_FINISH_REGISTER:	 
				 	firstName = request.getParameter("firstName");
				 	lastName = request.getParameter("lastName");
					fullName = firstName.concat(" ").concat(lastName);
					
					typecheck = 0; // False if student , true if Academician
					acadTitle = "";
					officeNumber = ""; 
					professionalHistory = "";
					researchHistory = "";
					proficiencies = "";
					skills = "";
					gpa = "";
					graduation = "";
					
					if(((NonAdminUser)session.getAttribute("currentUser")).getUserType() == MyConstants.TYPE_ACADEMICIAN) {
						typecheck = 1;
						acadTitle = request.getParameter("acadTitle");
						officeNumber = request.getParameter("officeNumber");
						professionalHistory = request.getParameter("professionalHistory");
						researchHistory = request.getParameter("researchHistory");
						proficiencies = request.getParameter("proficiencies");
					}
					else if(((NonAdminUser)session.getAttribute("currentUser")).getUserType() == MyConstants.TYPE_STUDENT) {
						typecheck = 2;
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
					
					
					
					if(typecheck == 1) {				
					infoList.add(acadTitle);
					infoList.add(professionalHistory);
					infoList.add(researchHistory);
					infoList.add(proficiencies);
					infoList.add(officeNumber);				
					}
					else if(typecheck == 2) {
					infoList.add(skills);
					infoList.add(gpa);
					infoList.add(graduation);
					}				
					
					updateAccountInfo(infoList);
					session.setAttribute("operation","getPostsForDiscoverPage");
					request.getRequestDispatcher("PostController").include(request, response);
					response.sendRedirect("HomePage.jsp");
					break;
				 
				 
			 	case MyConstants.OPP_DELETE_USER:
					int deleteThisID = Integer.valueOf(request.getParameter("deleteID"));
					boolean isSuccessful = deleteUser(deleteThisID);
					List<User> allUsers = service.fetchAllUsers();
					List<Student> allStudents = new ArrayList<>();
					List<Academician> allAcads = new ArrayList<>();	
					List<Graduate> allGrads = new ArrayList<>();	
					Student s = null;
					Academician a = null;
					Graduate g = null;
					for(User uu : allUsers){	
						if(uu.getUserType() == MyConstants.TYPE_STUDENT) {
								s = (Student)uu;
								allStudents.add(s);
							}
						if(uu.getUserType() == MyConstants.TYPE_ACADEMICIAN) {
								a = (Academician)uu;
								allAcads.add(a);
						}	
						if(uu.getUserType() == MyConstants.TYPE_GRADUATE) {
								g = (Graduate)uu;
								allGrads.add(g);
						}	
					}			 
					if (isSuccessful == false)
					{
						session.setAttribute("userList", allUsers);
						session.setAttribute("studList", allStudents);
						session.setAttribute("gradList", allGrads);
						session.setAttribute("acadList", allAcads);
						
						response.sendRedirect("AdminPanel.jsp");
					}
					else
					{
					response.sendRedirect("AdminPanel.jsp");
					}
					break;	 
				 
			 	case MyConstants.OPP_BAN_USER:
			 		int banID = Integer.valueOf(request.getParameter("banID"));
			 		
			 		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			 		Date sqlDate = null;
			 		
			 		//
			 		try {
			 			java.util.Date utilDate = format.parse(request.getParameter("banDate"));
			 			sqlDate = new Date(utilDate.getTime());
			 		} catch (ParseException e) {
			 			// TODO Auto-generated catch block
			 			e.printStackTrace();
			 		}
			 		
			 		
			 		
			 		int utype = 0;
			 		utype = service.getTypefromid(banID);
			 		
			 		boolean ccc = banUser(banID , sqlDate,utype);
			 		
			 		if(ccc) {
			 			allUsers = service.fetchAllUsers();
						allStudents = new ArrayList<>();
						allAcads = new ArrayList<>();	
						allGrads = new ArrayList<>();	
						
						for(User uu : allUsers){	
							if(uu.getUserType() == MyConstants.TYPE_STUDENT) {
									s = (Student)uu;
									allStudents.add(s);
								}
							if(uu.getUserType() == MyConstants.TYPE_ACADEMICIAN) {
									a = (Academician)uu;
									allAcads.add(a);
							}	
							if(uu.getUserType() == MyConstants.TYPE_GRADUATE) {
									g = (Graduate)uu;
									allGrads.add(g);
							}	
						}
						session.setAttribute("userList", allUsers);
						session.setAttribute("studList", allStudents);
						session.setAttribute("gradList", allGrads);
						session.setAttribute("acadList", allAcads);
						
			 			response.sendRedirect("AdminPanel.jsp");
			 		}
			 		
			 		break;
				 
			 	case MyConstants.OPP_LIFT_BAN:
			 		int liftID = Integer.valueOf(request.getParameter("liftID"));
			 		int ltype = service.getTypefromid(liftID);
			 		boolean ddd = liftBan(liftID,ltype);
			 		if(ddd) {
			 			allUsers = service.fetchAllUsers();
						allStudents = new ArrayList<>();
						allAcads = new ArrayList<>();	
						allGrads = new ArrayList<>();	
						
						for(User uu : allUsers){	
							if(uu.getUserType() == MyConstants.TYPE_STUDENT) {
									s = (Student)uu;
									allStudents.add(s);
								}
							if(uu.getUserType() == MyConstants.TYPE_ACADEMICIAN) {
									a = (Academician)uu;
									allAcads.add(a);
							}	
							if(uu.getUserType() == MyConstants.TYPE_GRADUATE) {
									g = (Graduate)uu;
									allGrads.add(g);
							}	
						}
						session.setAttribute("userList", allUsers);
						session.setAttribute("studList", allStudents);
						session.setAttribute("gradList", allGrads);
						session.setAttribute("acadList", allAcads);
						
			 			
			 			response.sendRedirect("AdminPanel.jsp");
			 		}
			 		
			 		
			 		break;
			 	case MyConstants.OPP_DELETE_SELF:
			 		User u = (User)session.getAttribute("currentUser");
			 		int tbdID = u.getUserID();
			 		
			 		deleteUser(tbdID);
			 		response.sendRedirect("LoginPage.jsp");
			 		break;
			 		
			 	case MyConstants.OPP_CREATED_BY_ADMIN:
			 		email = request.getParameter("email");
					password = request.getParameter("password");
					firstName = request.getParameter("firstname");
					lastName = request.getParameter("lastname");
					username = request.getParameter("username");
					int userType = Integer.parseInt(request.getParameter("type"));					
					String fullname = firstName +" " +lastName;
					
					int checkUserName2 = service.checkUserNameExists(username);
					int checkEmail2 = service.checkEmailExists(email);
					boolean tryagain2 = false;
					if(checkUserName2 > 0) {
						session.setAttribute("userexists", MyConstants.USERNAME_EXISTS);
						tryagain2 = true;
					}
					if(checkEmail2 > 0) {
						session.setAttribute("userexists", MyConstants.EMAIL_EXISTS);
						tryagain2 = true;
					}
					if(tryagain2) {
						allUsers = service.fetchAllUsers();
						allStudents = new ArrayList<>();
						allAcads = new ArrayList<>();	
						allGrads = new ArrayList<>();	
						
						for(User uu : allUsers){	
							if(uu.getUserType() == MyConstants.TYPE_STUDENT) {
									s = (Student)uu;
									allStudents.add(s);
								}
							if(uu.getUserType() == MyConstants.TYPE_ACADEMICIAN) {
									a = (Academician)uu;
									allAcads.add(a);
							}	
							if(uu.getUserType() == MyConstants.TYPE_GRADUATE) {
									g = (Graduate)uu;
									allGrads.add(g);
							}	
						}
						session.setAttribute("userList", allUsers);
						session.setAttribute("studList", allStudents);
						session.setAttribute("gradList", allGrads);
						session.setAttribute("acadList", allAcads);
						
						response.sendRedirect("AdminPanel.jsp");
						
						break;
					}
					
					
					
					/*User us = new User();			
					
					us.setEmail(email);
					us.setUsername(username);
					us.setPassword(password);
					us.setFullName(fullname);
					us.setUserType(userType);
					
					addUser(us);*/
					switch(userType) {
						case MyConstants.TYPE_ACADEMICIAN:
							Academician aa = new Academician();
							aa.setEmail(email);
							aa.setUsername(username);
							aa.setPassword(password);
							aa.setFullName(fullname);
							aa.setUserType(userType);
							addUser(aa);
							break;
						case MyConstants.TYPE_GRADUATE:
							Graduate gg = new Graduate();
							gg.setEmail(email);
							gg.setUsername(username);
							gg.setPassword(password);
							gg.setFullName(fullname);
							gg.setUserType(userType);
							addUser(gg);
							break;
						case MyConstants.TYPE_STUDENT:
							Student ss = new Student();
							ss.setEmail(email);
							ss.setUsername(username);
							ss.setPassword(password);
							ss.setFullName(fullname);
							ss.setUserType(userType);
							addUser(ss);
							
							break;
					}
					
					allUsers = service.fetchAllUsers();
					allStudents = new ArrayList<>();
					allAcads = new ArrayList<>();	
					allGrads = new ArrayList<>();	
					
					for(User uu : allUsers){	
						if(uu.getUserType() == MyConstants.TYPE_STUDENT) {
								s = (Student)uu;
								allStudents.add(s);
							}
						if(uu.getUserType() == MyConstants.TYPE_ACADEMICIAN) {
								a = (Academician)uu;
								allAcads.add(a);
						}	
						if(uu.getUserType() == MyConstants.TYPE_GRADUATE) {
								g = (Graduate)uu;
								allGrads.add(g);
						}	
					}
					session.setAttribute("userList", allUsers);
					session.setAttribute("studList", allStudents);
					session.setAttribute("gradList", allGrads);
					session.setAttribute("acadList", allAcads);
					
					response.sendRedirect("AdminPanel.jsp");
			 		break;
			 		
			 		
			 	case MyConstants.OPP_FOLLOW:	
			 		int otherID = Integer.parseInt(request.getParameter("otherID"));
			 		int fuserID = Integer.parseInt(request.getParameter("userID"));
			 		
			 		boolean checkfollow = followUser(fuserID,otherID);
			 		
			 		List<Student> sstudlist = (List<Student>) session.getAttribute("studList");
			 		
			 		for(Student ss: sstudlist) {
			 			if(ss.getUserID() == fuserID) {
			 				List<Integer> flw = ss.getFollows();
			 				flw.add(otherID);
			 				ss.setFollows(flw);
			 				break;			 				
			 			}
			 		}
			 					 		
			 		
			 		if(checkfollow) {
			 			session.setAttribute("studList",sstudlist);
			 			
			 		}
			 		
			 		break;
			 		
			 		
			 	case MyConstants.OPP_UNFOLLOW:
			 		int anotherID = Integer.parseInt(request.getParameter("otherID"));
			 		int unfuserID = Integer.parseInt(request.getParameter("userID"));
			 		
			 		boolean checkfo1llow = unfollowUser(unfuserID,anotherID);
			 		
			 		List<Student> studlist = (List<Student>) session.getAttribute("studList");
			 		
			 		for(Student ss: studlist) {
			 			if(ss.getUserID() == unfuserID) {
			 				if(ss.getFollows().contains(anotherID)) {
			 					List<Integer> flw = ss.getFollows();
			 					for(int z = 0; z<flw.size();z++) {
			 						if(flw.get(z) == anotherID) {
			 							flw.remove(z);
			 							break;
			 						}
			 					} 					
			 					
			 					ss.setFollows(flw);
			 					break;
			 				}
			 			}
			 		}
			 		
			 		
			 		if(checkfo1llow) {
			 			session.setAttribute("studList",studlist);
			 			
			 		}
			 		
			 		break;
			 	case  MyConstants.OPP_DELETE_FILE:
			 		
			 		int fileID = Integer.parseInt(request.getParameter("input_name_deleteFile"));
			 		userType = Integer.parseInt(request.getParameter("input_name_userType"));
			 		
			 		if(userType != MyConstants.TYPE_STUDENT) {			 			
			 			service.deleteFile(fileID);
			 			 out = response.getWriter();
						out.println("success-deleteFile");
			 		}else {
			 			 out = response.getWriter();
						out.println("fail-deleteFile");
			 		}
			 		
			 		break;
			 		
		}		
		
	}
	
	
	public boolean followUser(int follower, int user) {
		return service.followUser(follower, user);
		
		
	}
	
	public boolean unfollowUser(int unfollower, int user) {
		return service.unfollowUser(unfollower, user);
		
		
	}
	
	public int getFollowCount(int ID) {
		return service.getFollowCount(ID);
		
	
	}
	
	public List<Integer> getFollowedUserID(int studentID) {
		
		return service.getFollowedUserID(studentID);
	}
	
	
	
	
	public boolean addUser(User u) {
		return service.createUser(u);
	}
	
	
	
	
	public boolean liftBan(int ID, int type) {
		return service.liftBan(ID, type);
	}
	
	
	
	
	
	public boolean banUser(int ID, Date until,int type) {
		return service.banUser(ID, until,type);		
	}
	
	
	
	
	public boolean deleteUser(int ID) //this function will take deleteThisID as parameter in case MyConstants.OPP_DELETE_USER
	{
		boolean chk = service.deleteUser(getUserFromID(ID));			
		return chk;
	}//if key = true delete process is successfull
	
	
	
	
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
		List<Student> allStudents = new ArrayList<>();
		List<Academician> allAcads = new ArrayList<>();	
		List<Graduate> allGrads = new ArrayList<>();	
		Timestamp timestamp = new Timestamp(System.currentTimeMillis());
		
		// zaman kontrol�
		
		
		Student s = null;
		Academician a = null;
		Graduate g = null;
		for(User uu : allUsers){	
			if(uu.getUserType() == MyConstants.TYPE_STUDENT) {
					s = (Student)uu;
					List<Integer> follows = getFollowedUserID(s.getUserID());
					s.setFollows(follows);					
					allStudents.add(s);
					
					
					
					
				}
			if(uu.getUserType() == MyConstants.TYPE_ACADEMICIAN) {
					a = (Academician)uu;
					allAcads.add(a);
			}	
			if(uu.getUserType() == MyConstants.TYPE_GRADUATE) {
					g = (Graduate)uu;
					allGrads.add(g);
			}	
		}
		
		
		
		
		for(User u : allUsers){	
						
			// Fetching all user posts.
			
			if(u.getEmail().equals(email) && u.getPassword().equals(password)) {
				if(u.getUserType() == MyConstants.TYPE_ACADEMICIAN) {
					if(a.getBannedUntil() != null && a.getBannedUntil().compareTo(timestamp) > 0){
						fromBan = true;
						return false;
					}
					if(a.getBannedUntil() != null) {
						liftBan(a.getUserID(),MyConstants.TYPE_ACADEMICIAN);
					}
				}
				if(u.getUserType() == MyConstants.TYPE_STUDENT) {
					if(s.getBannedUntil() != null && s.getBannedUntil().compareTo(timestamp) > 0){
						fromBan = true;
						return false;
					}
					if(s.getBannedUntil() != null) {
						liftBan(s.getUserID(),MyConstants.TYPE_STUDENT);
					}
					
				}
				if(u.getUserType() == MyConstants.TYPE_GRADUATE) {
					if(g.getBannedUntil() != null && g.getBannedUntil().compareTo(timestamp) > 0){
						fromBan = true;
						return false;
					}
					if(g.getBannedUntil() != null) {
						liftBan(g.getUserID(),MyConstants.TYPE_GRADUATE);
					}
				}
				

				if(u.getUserType() == MyConstants.TYPE_ACADEMICIAN || u.getUserType() == MyConstants.TYPE_GRADUATE ) {
					((PostCreator)u).setAuthorOf(service.fetchUserPosts(u.getUserID()));
					// Comments will be inserted too . Coming soon.
				}
				if(u.getUserType() != MyConstants.TYPE_ADMIN) {
					((NonAdminUser)u).setLikes(service.getLikes(u.getUserID()));
				}
						
				session.setAttribute("currentUser", u);

				session.setAttribute("otherUser", u);
	
				session.setAttribute("userList", allUsers);
				session.setAttribute("studList", allStudents);
				session.setAttribute("gradList", allGrads);
				session.setAttribute("acadList", allAcads);
				
				return true;
			}
			
			
		
			
		}
		return false;
	}
	
	public boolean updateAccountInfo(List<String> infoList) {
		User cond = (User)session.getAttribute("currentUser");
		User u = (User)session.getAttribute("otherUser");
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
				if(cond.getUserType() != MyConstants.TYPE_ADMIN) {
					session.setAttribute("currentUser", a);
				}				
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
			boolean isStillRegister = stat.equals(MyConstants.CONTINUE_REGISTER);			
			
			if(isStillRegister) {
				
				if(service.createUser(s)) {
					session.setAttribute("currentUser", s);
					session.setAttribute("otherUser", s);
					System.out.println(s.getBio());
					session.setAttribute("status", "Success");
					return true;
				}
			}else {
				if(service.updateUser(s)) {
					if(cond.getUserType() != MyConstants.TYPE_ADMIN) {
						session.setAttribute("currentUser", s);
					}		
					session.setAttribute("otherUser", s);
				}
			}
			
			
		}else if(u.getUserType() == MyConstants.TYPE_GRADUATE) {			
			Graduate g = (Graduate)u;
			
			g.setUsername(infoList.get(0));
			g.setEmail(infoList.get(1));
			g.setPassword(infoList.get(2));
			g.setFullName(infoList.get(3));
			g.setProfilePictureSrc(infoList.get(4));
			g.setBio(infoList.get(5));	
			g.setGraduationYear(infoList.get(6));
			g.setProficiencies(infoList.get(7));
			
			
			
			// All session attributes which is affected in any update process should be pulled from the database again.
			// and get the proper data for session attributes
			if(service.updateUser(g)) {
				if(cond.getUserType() != MyConstants.TYPE_ADMIN) {
					session.setAttribute("currentUser", g);
				}				
				session.setAttribute("otherUser", g);
				TreeMap<Post,User> map = (TreeMap<Post,User>)session.getAttribute("map");
				for (Post p :  map.keySet()) {
					if (p.getAuthorID() == g.getUserID()) {
						map.replace(p, g);
					}
				}
				session.setAttribute("map",map);
				//((PostCreator)session.getAttribute("otherUser")).setAuthorOf(service.fetchUserPosts(((PostCreator)session.getAttribute("currentUser")).getUserID()));
			}
		}
		
		
		
		
		return true;
	}
	
	
	
	
	

}
