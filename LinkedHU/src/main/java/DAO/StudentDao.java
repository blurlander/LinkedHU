package DAO;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

import Interfaces.IDao;
import Model.Student;
public class StudentDao implements IDao<Student> {
	private String userName = "root";
	private String password = "";
	private String host = "127.0.0.1";
	private String dbName = "hello";
	private int port = 3306;
	private Connection connection = null;	
	private Statement statement = null;
	private PreparedStatement preparedStatement = null;
	
	public StudentDao() {
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
	public List<Student> fetchAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean create(Student t) {
		boolean key = false;	   
	    String query = "INSERT INTO student(username,email,password,fullName,userType,profilePictureSrc,status,bio,skills,gpa,graduation,type) VALUES (?,?,?,?,?,?,?,?,?,?,?,?)";
	    
	    System.out.println(t.getUsername());
	    
	    try {
	    	this.preparedStatement = this.connection.prepareStatement(query);	    
		    this.preparedStatement.setString(1,t.getUsername());
			this.preparedStatement.setString(2,t.getEmail());
			this.preparedStatement.setString(3,t.getPassword());
			this.preparedStatement.setString(4,t.getFullName());
			this.preparedStatement.setInt(5,t.getUserType());
			this.preparedStatement.setString(6,t.getProfilePictureSrc());
			this.preparedStatement.setString(7,t.getStatus());
			this.preparedStatement.setString(8,t.getBio());
			this.preparedStatement.setString(9,t.getSkills());
			this.preparedStatement.setDouble(10,t.getGpa());
			this.preparedStatement.setString(11,t.getGraduation());
			this.preparedStatement.setInt(12,t.getType());			
			
			
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
	public Student read(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean update(Student t) {
		String query = "UPDATE student SET username = ?,email=?,password=?,"
				+ "fullName=?,userType=?,profilePictureSrc=?,"
				+ "bio=?,skills=?,gpa=?,"
				+ "graduation=?,type=? WHERE userID = ? ";
		try {
			this.preparedStatement = this.connection.prepareStatement(query);	    
		    this.preparedStatement.setString(1,t.getUsername());
			this.preparedStatement.setString(2,t.getEmail());
			this.preparedStatement.setString(3,t.getPassword());
			this.preparedStatement.setString(4,t.getFullName());
			this.preparedStatement.setInt(5,t.getUserType());
			this.preparedStatement.setString(6,t.getProfilePictureSrc());			
			this.preparedStatement.setString(7,t.getBio());
			this.preparedStatement.setString(8,t.getSkills());
			this.preparedStatement.setDouble(9,t.getGpa());
			this.preparedStatement.setString(10,t.getGraduation());
			this.preparedStatement.setInt(11,t.getType());
			this.preparedStatement.setInt(12,t.getUserID());
			
			preparedStatement.executeUpdate();
			return true;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Burda hata....");
			return false;
		}
	
	}

	@Override
	public boolean delete(Student t) {
		// TODO Auto-generated method stub
		return false;
	}
	
	

}
