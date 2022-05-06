package DAO;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

import Interfaces.IDao;
import Model.Academician;
import Model.Graduate;
import Model.Student;

public class GraduateDao implements IDao<Graduate>{
	private String userName = "root";
	private String password = "";
	private String host = "127.0.0.1";
	private String dbName = "hello";
	private int port = 3306;
	private Connection connection = null;	
	private Statement statement = null;
	private PreparedStatement preparedStatement = null;
	
	public GraduateDao() {
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
	
	
	// :)
	
	@Override
	public List<Graduate> fetchAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean create(Graduate g) {
		boolean key = false;	   
	    String query = "INSERT INTO graduate(userID,username,email,password,fullName,userType,profilePictureSrc,bio,graduation,proficiencies) VALUES (?,?,?,?,?,?,?,?,?,?)";
	    
	    //System.out.println(g.getUsername());
	    
	    try {
	    	this.preparedStatement = this.connection.prepareStatement(query);	
	    	this.preparedStatement.setInt(1,g.getUserID());
		    this.preparedStatement.setString(2,g.getUsername());
			this.preparedStatement.setString(3,g.getEmail());
			this.preparedStatement.setString(4,g.getPassword());
			this.preparedStatement.setString(5,g.getFullName());
			this.preparedStatement.setInt(6,g.getUserType());
			this.preparedStatement.setString(7,g.getProfilePictureSrc());			
			this.preparedStatement.setString(8,g.getBio());
			this.preparedStatement.setString(9,g.getGraduationYear());
			this.preparedStatement.setString(10,g.getProficiencies());
			
			
			
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
	public Graduate read(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean update(Graduate t) {
		

		String query = "UPDATE graduate SET username = ?,email=?,password=?,"
				+ "fullName=?,profilePictureSrc=?,"
				+ "bio=?,"
				+ "proficiencies=?,graduation=? WHERE userID = ? ";
		try {
			preparedStatement = connection.prepareStatement(query);
			
			preparedStatement.setString(1,t.getUsername());
			preparedStatement.setString(2,t.getEmail());
			preparedStatement.setString(3,t.getPassword());
			preparedStatement.setString(4,t.getFullName());
			preparedStatement.setString(5,t.getProfilePictureSrc());
			preparedStatement.setString(6,t.getBio());
			preparedStatement.setString(7,t.getProficiencies());
			preparedStatement.setString(8,t.getGraduationYear());		
			preparedStatement.setInt(9,t.getUserID());
			
			preparedStatement.executeUpdate();
			return true;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Burda hata....");
			return false;
		}
	
	}

	@Override
	public boolean delete(Graduate t) {
		// TODO Auto-generated method stub
		return false;
	}
	

}
