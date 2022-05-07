package DAO;
import Model.Academician;
import Model.Graduate;
import Model.UploadedFile;
import Model.User;
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
			while(rs.next()) {
				switch(rs.getInt("userType")) 
				{
					case MyConstants.TYPE_ADMIN : 
						break;
					case MyConstants.TYPE_ACADEMICIAN :
						addAcademician(allUsers);
						break;
					case MyConstants.TYPE_GRADUATE:  
						break;
					case MyConstants.TYPE_STUDENT: 
						break;
				}
				//allUsers.add(user);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return allUsers;
	}

	@Override
	public boolean create(User user) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public User read(int userID) {
		// TODO Auto-generated method stub
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
	public boolean delete(User user) {
		// TODO Auto-generated method stub
		return false;
	}
	
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
				allUsers.add(graduate);		
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
}
