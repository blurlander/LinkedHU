package Controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;

import Interfaces.IService;
import Model.*;


/**
 * Servlet implementation class FileController
 */
@WebServlet("/FileController")
public class FileController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public HttpSession session;
	private IService service = new SystemService();
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		//Parsing as json
		Gson gson = new Gson();
		
		JsonObject files = new JsonObject();
		
     
        List<UploadedFile> uploadedFiles = service.fetchAllFiles();
        
        
        for (int i = 0; i < uploadedFiles.size(); i++) {
        	
        	// fetch user from file uploader id
        	NonAdminUser user = (NonAdminUser) service.readUser(uploadedFiles.get(i).getUploaderID());
        	
        	
        	
        	uploadedFiles.get(i).setUploaderEmail(user.getEmail());
        	uploadedFiles.get(i).setUploaderName(user.getFullName());
        	uploadedFiles.get(i).setUploaderProfilePicture(user.getProfilePictureSrc());
        	
    		JsonElement firstElement = gson.toJsonTree(uploadedFiles.get(i));
            files.add(Integer.toString(i),firstElement);
		}
                       
               
        response.setContentType("text/html");
        response.setHeader("Cache-control", "no-cache, no-store");
        response.setHeader("Pragma", "no-cache");
        response.setHeader("Expires", "-1");
        response.setHeader("Access-Control-Allow-Origin", "*");
        response.setHeader("Access-Control-Allow-Methods", "POST");
        response.setHeader("Access-Control-Allow-Headers", "Content-Type");
        response.setHeader("Access-Control-Max-Age", "86400");
        
        session = request.getSession();
        session.setAttribute("fileCount", uploadedFiles.size() );
        
        PrintWriter out = response.getWriter();
		out.println(files);
		
	}

}
