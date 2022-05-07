package DAO;

import Model.*;
import general.MyConstants;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;

import Interfaces.IDao;
import Interfaces.IUserDao;

public class UserDao implements IUserDao {
	private String userName = "root";
	private String password = "";
	private String host = "127.0.0.1";
	private String dbName = "hello";
	private int port = 3306;
	private Connection connection = null;	
	private Statement statement = null;
	private PreparedStatement preparedStatement = null;
	
	public UserDao() {
		connectDatabase();
	}
	
	public void connectDatabase() {
		String url = "jdbc:mysql://"+host+":"+port+"/"+dbName;
		try {
			Class.forName("com.mysql.jdbc.Driver");
		}catch(Exception e) {
			e.printStackTrace();
		}
		try {
			connection = DriverManager.getConnection(url,userName,password);
			System.out.println("Online!!!");
		}catch(Exception e) {
			e.printStackTrace();
		}

	}
	
	
	@Override
	public boolean createFiles(List<UploadedFile> uploadedFiles){
			
		for (int i = 0; i < uploadedFiles.size(); i++) {
			
			String query = "Insert into upload(uploaderID,uploadUrl,extension,name,idInfo) values(?,?,?,?,?)";
			try {
				preparedStatement = connection.prepareStatement(query);

				preparedStatement.setInt(1,uploadedFiles.get(i).getUploaderID());
				preparedStatement.setString(2,uploadedFiles.get(i).getUploadUrl());
				preparedStatement.setString(3,uploadedFiles.get(i).getExtension());
				preparedStatement.setString(4,uploadedFiles.get(i).getName());
				preparedStatement.setString(5,uploadedFiles.get(i).getIdInfo());
				
				preparedStatement.executeUpdate();

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
		
		return true;
	}
	
	@Override
	public List<UploadedFile> fetchAllUploadedFiles(){
		
		List<UploadedFile> uploadedFiles = new ArrayList<UploadedFile>();
		
		String query = "Select * from upload";
		ResultSet rs;
		try {
			statement = connection.createStatement();
			rs = statement.executeQuery(query);
			while(rs.next()) {
				UploadedFile uploadedFile = new UploadedFile();
				
				uploadedFile.setFileID(rs.getInt("fileID"));
				uploadedFile.setUploaderID(rs.getInt("uploaderID"));
				uploadedFile.setUploadUrl(rs.getString("uploadUrl"));
				uploadedFile.setExtension(rs.getString("extension"));
				uploadedFile.setName(rs.getString("name"));
				uploadedFile.setIdInfo(rs.getString("idInfo"));
				
				uploadedFiles.add(uploadedFile);
			}
		}
		catch(Exception e) {
			e.printStackTrace();		
		}
		
		return uploadedFiles;
	}
	
	@Override
	public List<User> fetchAll() {
		List<User> allUsers = new ArrayList<User>();
		String query = "Select * from User";
		ResultSet rs;
		try {
			statement = connection.createStatement();
			rs = statement.executeQuery(query);
			boolean breakAdmin = false;
			boolean breakAcademician = false;
			boolean breakGraduate = false;
			boolean breakStudent = false;
			while(rs.next()) {
				switch(rs.getInt("userType")) 
				{
					case MyConstants.TYPE_ADMIN : 
					breakAdmin = true;
					case MyConstants.TYPE_ACADEMICIAN :
					breakAcademician = true;
					case MyConstants.TYPE_GRADUATE:  
					breakGraduate = true;
					case MyConstants.TYPE_STUDENT: 
					breakStudent = true;	
					

				}
				//allUsers.add(user);
				
					
			}
			if(breakAdmin) {
				addAdmin(allUsers);
			}
			if(breakAcademician) {
				addAcademician(allUsers);
			}
			if(breakGraduate) {
				addGraduate(allUsers);
			}
			if(breakStudent) {

				addStudent(allUsers);
			}
			
			


		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return allUsers;
	}

	@Override
	public boolean create(User user) {
		boolean key = false;	   
	    String query = "INSERT INTO user(username,email,password,userType) VALUES (?,?,?,?)";
	    
	    //System.out.println(user.getUsername());
	    
	    try {
	    	this.preparedStatement = this.connection.prepareStatement(query);	    
		    this.preparedStatement.setString(1,user.getUsername());
			this.preparedStatement.setString(2,user.getEmail());
			this.preparedStatement.setString(3,user.getPassword());			
			this.preparedStatement.setInt(4,user.getUserType());
			
			if(this.preparedStatement.executeUpdate() > 0){
		        key = true;
		    }			
		    this.preparedStatement.close();
		    
		    int a = getIDfromUsername(user.getUsername());
		    user.setUserID(a);
		    
		    return key;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    return false;
	}

	@Override
	public User read(int userID) {
		String query = "Select * from User where userID ="+userID;
		ResultSet rs;
		try {
			statement = connection.createStatement();
			rs = statement.executeQuery(query);
			while(rs.next()) {
				User user = new User();
				user.setUserID(rs.getInt("userID"));
				user.setUsername(rs.getString("username"));
				user.setEmail(rs.getString("email"));
				user.setPassword(rs.getString("password"));
				user.setFullName(rs.getString("fullName"));
				user.setUserType(rs.getInt("userType"));
				
				return user;	
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			return null;
		}
		return null;
		
	}

	@Override
	public boolean update(User user) {
		String query = "UPDATE user SET "
				+ "username=?, email=?, password=?, "
				+ "fullName=? WHERE userID = ? ";
		try {
			preparedStatement = connection.prepareStatement(query);
			
			preparedStatement.setString(1,user.getUsername());
			preparedStatement.setString(2,user.getEmail());
			preparedStatement.setString(3,user.getPassword());
			preparedStatement.setString(4,user.getFullName());
			preparedStatement.setInt(5,user.getUserID());
			
			preparedStatement.executeUpdate();
			return true;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	

	}


	@Override
	public boolean delete(User user){
		boolean flag = true;
		
		if (user.getUserType() == 1)
		{
			try {
				String delete = "DELETE FROM academician WHERE userID = ?";
				PreparedStatement sql = connection.prepareStatement(delete);
				sql.setInt(1,user.getUserID());
				if(!(sql.executeUpdate() > 0))
				{
					flag = false;
				}
			}
			catch (SQLException e) {
			e.printStackTrace();
			}
		}
		
		if (user.getUserType() == 2)
		{
			try {
				String delete = "DELETE FROM student WHERE userID = ?";
				PreparedStatement sql = connection.prepareStatement(delete);
				sql.setInt(1,user.getUserID());
				if(!(sql.executeUpdate() > 0))
				{
					flag = false;
				}
			}
			catch (SQLException e) {
			e.printStackTrace();
			}
		}
		
		if (user.getUserType() == 3)
		{
			try {
				String delete = "DELETE FROM graduate WHERE userID = ?";
				PreparedStatement sql = connection.prepareStatement(delete);
				sql.setInt(1,user.getUserID());
				if(!(sql.executeUpdate() > 0))
				{
					flag = false;
				}
			}
			catch (SQLException e) {
			e.printStackTrace();
			}
		}
		
		
		try {
			String delete = "DELETE FROM comment WHERE userID = ?";
			PreparedStatement sql = connection.prepareStatement(delete);
			sql.setInt(1,user.getUserID());
			if(!(sql.executeUpdate() > 0))
			{
				flag = false;
			}
		}
		catch (SQLException e) {
		e.printStackTrace();
		}
		
		try {
			String delete = "DELETE FROM likes WHERE userID = ?";
			PreparedStatement sql = connection.prepareStatement(delete);
			sql.setInt(1,user.getUserID());
			if(!(sql.executeUpdate() > 0))
			{
				flag = false;
			}
		}
		catch (SQLException e) {
		e.printStackTrace();
		}
		
		try {
			String delete = "DELETE FROM post WHERE authorID = ?";
			PreparedStatement sql = connection.prepareStatement(delete);
			sql.setInt(1,user.getUserID());
			if(!(sql.executeUpdate() > 0))
			{
				flag = false;
			}
			//connection.close();
			//sql.close();
		}		
		catch (SQLException e) {
		e.printStackTrace();
		}
		
		try {
			String delete = "DELETE FROM user WHERE userID = ?";
			PreparedStatement sql = connection.prepareStatement(delete);
			sql.setInt(1,user.getUserID());
			if(!(sql.executeUpdate() > 0))
			{
				flag = false;
			}
			//connection.close();
			//sql.close();
		}
		catch (SQLException e) {
			e.printStackTrace();
			}
		
		
		return flag;
	}//END OF DELETE 
	
	private void addAcademician(List<User> allUsers) {
		String query = "Select * from Academician";
		
		ResultSet rs;
		try {
			statement = connection.createStatement();
			rs = statement.executeQuery(query);
			while(rs.next()) {
				Academician academician = new Academician();
				academician.setUserID(rs.getInt("userID"));
				academician.setUsername(rs.getString("username"));
				academician.setEmail(rs.getString("email"));
				academician.setPassword(rs.getString("password"));
				academician.setFullName(rs.getString("fullName"));
				academician.setUserType(rs.getInt("userType"));
				academician.setProfilePictureSrc(rs.getString("profilePictureSrc"));
				academician.setStatus(rs.getString("status"));
				academician.setBio(rs.getString("bio"));
				academician.setAcademicTitle(rs.getString("academicTitle"));
				academician.setProfessionalHistory(rs.getString("professionalHistory"));
				academician.setResearchHistory(rs.getString("researchHistory"));
				academician.setProficiencies(rs.getString("proficiencies"));
				academician.setOfficeNumber(rs.getString("officeNumber"));
				if(rs.getTimestamp("bannedUntil") != null) {
					academician.setBannedUntil(rs.getDate("bannedUntil"));
				}
				else {
					academician.setBannedUntil(null);
				}
				
			
				allUsers.add(academician);		
			}
		}
		catch(Exception e) {
			e.printStackTrace();		
		}
	}
	private void addGraduate(List<User> allUsers) {
		String query = "Select * from Graduate";
		ResultSet rs;
		try {
			statement = connection.createStatement();
			rs = statement.executeQuery(query);
			while(rs.next()) {
				Graduate graduate = new Graduate();
				graduate.setUserID(rs.getInt("userID"));
				graduate.setUsername(rs.getString("username"));
				graduate.setEmail(rs.getString("email"));
				graduate.setPassword(rs.getString("password"));
				graduate.setFullName(rs.getString("fullName"));
				graduate.setUserType(rs.getInt("userType"));
				graduate.setProfilePictureSrc(rs.getString("profilePictureSrc"));
				graduate.setStatus(rs.getString("status"));
				graduate.setBio(rs.getString("bio"));
				graduate.setProficiencies(rs.getString("proficiencies"));
				graduate.setGraduationYear(rs.getString("graduation"));
				if(rs.getTimestamp("bannedUntil") != null) {
					graduate.setBannedUntil(rs.getDate("bannedUntil"));
				}
				else {
					graduate.setBannedUntil(null);
				}
				
				
				allUsers.add(graduate);		
			}
		}
		catch(Exception e) {
			e.printStackTrace();		
		}
		
	}
	

	private int getIDfromUsername(String username) {
		String query = "Select * from user where username = ?";
		int answer = -1;
		try {			
			preparedStatement = connection.prepareStatement(query);
			
			preparedStatement.setString(1,username);

			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()) {
				answer = rs.getInt("userID");
			}
			//System.out.println(answer);
			return answer;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		return -1;
	}
	
	
	
	
	private void addStudent(List<User> allUsers) {
		String query = "Select * from student";
		ResultSet rs;
		try {
			statement = connection.createStatement();
			rs = statement.executeQuery(query);
			while(rs.next()) {

				Student student = new Student();
				student.setUserID(rs.getInt("userID"));
				student.setUsername(rs.getString("username"));
				student.setEmail(rs.getString("email"));
				student.setPassword(rs.getString("password"));
				student.setFullName(rs.getString("fullName"));
				student.setUserType(rs.getInt("userType"));
				student.setProfilePictureSrc(rs.getString("profilePictureSrc"));
				student.setStatus(rs.getString("status"));
				student.setBio(rs.getString("bio"));
				student.setSkills(rs.getString("skills"));
				student.setGpa(rs.getDouble("gpa"));
				student.setGraduation(rs.getString("graduation"));
				student.setType(rs.getInt("type"));
				
				
				if(rs.getTimestamp("bannedUntil") != null) {
					student.setBannedUntil(rs.getDate("bannedUntil"));
				}
				else {
					student.setBannedUntil(null);
				}
				
				
				allUsers.add(student);				

			}
		}
		catch(Exception e) {
			e.printStackTrace();		
		}
		
		
	}	
		

	


	@Override
	public List<Integer> fetchAllUserLikes(int userID) {
		String query = "Select postID from likes where userID = ?";
		try {
			preparedStatement = connection.prepareStatement(query);
			
			preparedStatement.setInt(1,userID);

			ResultSet rs = preparedStatement.executeQuery();
			
			List<Integer> likes = new ArrayList<Integer>();
			while(rs.next()) {
				likes.add(rs.getInt("postID"));
			}
			
			return likes;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}	
	}

	@Override
	public boolean likePost(int userID,int postID) {
		String query = "Insert into likes values(?,?)";
		try {
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setInt(1,userID);
			preparedStatement.setInt(2,postID);
			preparedStatement.executeUpdate();
			return true;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}
	@Override
	public boolean dislikePost(int userID, int postID) {
		String query = "Delete from likes where userID = ? and postID = ?";
		try {
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setInt(1,userID);
			preparedStatement.setInt(2,postID);
			preparedStatement.executeUpdate();
			return true;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}
	
	private void addAdmin(List<User> allUsers) {
		String query = "Select * from User where userType=0";
		ResultSet rs;
		
		try {
			statement = connection.createStatement();
			rs = statement.executeQuery(query);
			while(rs.next()) {
				Admin admin = new Admin();
				admin.setUserID(rs.getInt("userID"));
				admin.setUsername(rs.getString("username"));
				admin.setEmail(rs.getString("email"));
				admin.setPassword(rs.getString("password"));
				admin.setFullName(rs.getString("fullName"));
				admin.setUserType(rs.getInt("userType"));
				allUsers.add(admin);		
			}
		}
		catch(Exception e) {
			e.printStackTrace();		
		}
		
	}
	@Override
	public int getTypefromID(int ID){
		String query = "Select * from user where userID = ?";
		int ans = -1;
		
		try {
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setInt(1, ID);
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()) {
				ans = rs.getInt("userType");
			}
			return ans;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		return ans;
	}
	
	
	
	
	

	@Override
	public boolean ban(int ID, Date ts, int type) {
		String add = "";
		
		switch(type){
		case MyConstants.TYPE_ACADEMICIAN:
			add = "academician";
			break;
		case MyConstants.TYPE_GRADUATE:
			add = "graduate";
			break;
		case MyConstants.TYPE_STUDENT:
			add = "student";
			break;
	}			
		String query = "Update "+add+" set bannedUntil = ? where userID = ? ";
		
		try {
			preparedStatement = connection.prepareStatement(query);
			
			preparedStatement.setDate(1,ts);
			preparedStatement.setInt(2,ID);
			preparedStatement.executeUpdate();
			return true;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}	
	}

	@Override
	public boolean liftBan(int ID,int type) {
		String add = "";
		
		switch(type){
		case MyConstants.TYPE_ACADEMICIAN:
			add = "academician";
			break;
		case MyConstants.TYPE_GRADUATE:
			add = "graduate";
			break;
		case MyConstants.TYPE_STUDENT:
			add = "student";
			break;
		}			
		
		String query = "Update "+add+" set bannedUntil = NULL where userID = ? ";
		try {
			preparedStatement = connection.prepareStatement(query);
			
			
			preparedStatement.setInt(1,ID);
			preparedStatement.executeUpdate();
			return true;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}	
		
		
		
		
	}

	@Override
	public boolean follow(int follower, int userID) {
		String query = "Insert into follows values(?,?)";
		boolean key  = false;
		try {
	    	this.preparedStatement = this.connection.prepareStatement(query);	    
		    this.preparedStatement.setInt(1,userID);
			this.preparedStatement.setInt(2,follower);
			
			if(this.preparedStatement.executeUpdate() > 0){
		        key = true;
		    }			
		    this.preparedStatement.close();
		    
		  
		    
		    return key;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    return false;
		
		
	
	}
	@Override
	public boolean unfollow(int unfollower, int userID) {
		String query = "Delete from follows where userID = ? AND followerID = ?";
		boolean key  = false;
		try {
	    	this.preparedStatement = this.connection.prepareStatement(query);	    
		    this.preparedStatement.setInt(1,userID);
			this.preparedStatement.setInt(2,unfollower);
			
			if(this.preparedStatement.executeUpdate() > 0){
		        key = true;
		    }			
		    this.preparedStatement.close();
		    
		  
		    
		    return key;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    return false;
		
		
		
				
	}
	
	@Override
	public List<Integer> getFollowedUserID(int studentID){		
		List<Integer> followedList = new ArrayList<Integer>();
		String query = "SELECT * FROM follows WHERE followerID = " + studentID;
		ResultSet rs;
		
		try {
			statement = connection.createStatement();
			rs = statement.executeQuery(query);
			while(rs.next()) {
				int i = rs.getInt("userID");
				followedList.add(i);
			}
		}
		catch(Exception e) {
			e.printStackTrace();		
		}
		
		
		
		
		
		return followedList;
		
	}
	
	
	
	@Override
	public int getFollowCount(int ID) {
		String query = "SELECT COUNT(*) FROM follows where userID = ?";
		ResultSet rs;
		int answer = -1;
		try {
			this.preparedStatement = this.connection.prepareStatement(query);
			this.preparedStatement.setInt(1, ID);
			rs = this.preparedStatement.executeQuery();
			
			while(rs.next()) {
				answer = rs.getInt(1);
			}
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return answer;
	}
	
	@Override
	public int checkUserNameExists(String name) {
		String query = "SELECT COUNT(*) AS count FROM user where username = ?";
		ResultSet rs;
		int answer = -1;
		try {
			this.preparedStatement = this.connection.prepareStatement(query);
			this.preparedStatement.setString(1, name);
			rs = this.preparedStatement.executeQuery();
			
			while(rs.next()) {
				answer = rs.getInt("count");
			}
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return answer;
	}	
	
	@Override
	public int checkEmailExists(String email) {
		String query = "SELECT COUNT(*) AS count FROM user where email = ?";
		ResultSet rs;
		int answer = -1;
		try {
			this.preparedStatement = this.connection.prepareStatement(query);
			this.preparedStatement.setString(1, email);
			rs = this.preparedStatement.executeQuery();
			
			while(rs.next()) {
				answer = rs.getInt("count");
			}
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return answer;
	}	

	
	
	
	
}
