package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Interfaces.IService;
import Model.Academician;
import Model.SystemService;
import Model.User;

@WebServlet("/UserController")
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	RequestDispatcher dispatcher = null;
	public HttpSession session;
	private IService service = new SystemService();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("LoginPage.jsp").forward(request, response);
	}
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String operation = request.getParameter("operation");
		
		session = request.getSession();
		String opp = request.getParameter("opp");
		if(opp != null && opp.equals(("7"))) {			
			//session.invalidate();
			doGet(request,response);
			
			return;
		}
		
		
		
		switch(operation) 
		{
			case "1":
				String email = request.getParameter("email");
				String password = request.getParameter("password");
				boolean control = checkUserLoginInfo(email, password);
				//dispatcher = request.getRequestDispatcher("LoginPage.jsp");
				if(control) {
					session.setAttribute("login_status", "success");
					session.setAttribute("status","success");
					session.setAttribute("operation","getPostsForDiscoverPage");
					request.getRequestDispatcher("PostController").include(request, response);
					//dispatcher.include(request, response);
				}
				else {
					// To prevent re-submission of forms,this pattern is used here.
					// POST-REDIRECT-GET
					session.setAttribute("status","fail");
					
				}
				response.sendRedirect("UserController");
				break;
			case "10":
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

				updateAccountInfo(infoList);
				
				response.sendRedirect("Profile.jsp");
				
				break;
				
		}
		
	}
	
	protected boolean checkUserLoginInfo(String email,String password) {
		List<User> allUsers = service.fetchAllUsers();
		for(User u : allUsers) 
		{
			if(u.getEmail().equals(email) && u.getPassword().equals(password)) {
				session.setAttribute("currentUser", u);
				return true;
			}
		}
		return false;
	}
	
	public boolean updateAccountInfo(List<String> infoList) {
		
		User u = (User)session.getAttribute("currentUser");
		if(u.getUserType() == 1) {
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
			
			
			if(service.updateUser(a)) {
				session.setAttribute("currentUser", a);
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
				boolean control3 = this.candidatePassword.matches("[<|>|£|#|$|@|+|-|?|!]+");
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
