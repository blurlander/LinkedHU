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
import Model.SystemService;
import Model.User;

@WebServlet("/UserController")
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	RequestDispatcher dispatcher = null;
	public HttpSession session;
	private IService service = new SystemService();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("LoginPage.jsp").forward(request, response);
	}
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String operation = request.getParameter("operation");
		session = request.getSession();
		switch(operation) 
		{
			case "1":
				String email = request.getParameter("email");
				String password = request.getParameter("password");
				boolean control = checkUserLoginInfo(email, password);
				//dispatcher = request.getRequestDispatcher("LoginPage.jsp");
				if(control) {
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
			case "2":
				break;
		}
		
	}
	protected boolean checkUserLoginInfo(String email,String password) {
		List<User> allUsers = service.fetchAllUsers();
		for (int i = 0; i < allUsers.size(); i++) {
			System.out.println(allUsers.get(i).getFullName());
		}
		for(User u : allUsers) 
		{
			if(u.getEmail().equals(email) && u.getPassword().equals(password)) {
				session.setAttribute("currentUser", u);
				return true;
			}
		}
		return false;
	}
	
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
