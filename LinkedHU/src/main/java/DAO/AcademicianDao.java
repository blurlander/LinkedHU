package DAO;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

import Interfaces.IDao;
import Model.Academician;

public class AcademicianDao implements IDao<Academician>{
	private String userName = "root";
	private String password = "";
	private String host = "127.0.0.1";
	private String dbName = "hello";
	private int port = 3306;
	private Connection connection = null;	
	private Statement statement = null;
	private PreparedStatement preparedStatement = null;
	
	public AcademicianDao() {
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
	public List<Academician> fetchAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean create(Academician t) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Academician read(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean update(Academician t) {
		

		String query = "UPDATE academician SET username = ?,email=?,password=?,"
				+ "fullName=?,profilePictureSrc=?,"
				+ "bio=?,academicTitle=?,professionalHistory=?,"
				+ "researchHistory=?,proficiencies=?,officeNumber=? WHERE userID = ? ";
		try {
			preparedStatement = connection.prepareStatement(query);
			
			preparedStatement.setString(1,t.getUsername());
			preparedStatement.setString(2,t.getEmail());
			preparedStatement.setString(3,t.getPassword());
			preparedStatement.setString(4,t.getFullName());
			preparedStatement.setString(5,t.getProfilePictureSrc());
			preparedStatement.setString(6,t.getBio());
			preparedStatement.setString(7,t.getAcademicTitle());
			preparedStatement.setString(8,t.getProfessionalHistory());
			preparedStatement.setString(9,t.getResearchHistory());
			preparedStatement.setString(10,t.getProficiencies());
			preparedStatement.setString(11,t.getOfficeNumber());
			preparedStatement.setInt(12,t.getUserID());
			
			preparedStatement.executeUpdate();
			return true;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Burda hata....");
			return false;
		}
	
	}

	@Override
	public boolean delete(Academician t) {
		// TODO Auto-generated method stub
		return false;
	}
	

}
