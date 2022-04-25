package DAO;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import Interfaces.ICommentDao;
import Model.Comment;
import Model.Post;

public class CommentDao implements ICommentDao {
	
	private String userName = "root";
	private String password = "";
	private String host = "127.0.0.1";
	private String dbName = "hello";
	private int port = 3306;
	private Connection connection;	
	private Statement statement;
	private PreparedStatement preparedStatement;
	
	public CommentDao() {
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
	public int getNextInt() {
		String sql = "SHOW TABLE STATUS LIKE 'comment'";
		
		int auto_id = 0;
		
		try {
			preparedStatement = connection.prepareStatement(sql);
			ResultSet rs = preparedStatement.executeQuery();
			
			while(rs.next()) {				
				auto_id = rs.getInt("Auto_increment");
			}
			
				
		} catch (SQLException e) {

			e.printStackTrace();
			return -1;
		}

		return auto_id;
		
	}
	
	/*
	 * String sql = "INSERT INTO table (commentID, postID) values(?, ?)";
		

		int auto_id = 0;
		
		try {
			preparedStatement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			preparedStatement.executeUpdate();
			ResultSet rs = statement.getGeneratedKeys();
		   rs.next();
		   auto_id = rs.getInt(1);
				
		} catch (SQLException e) {

			e.printStackTrace();
			return -1;
		}

		return auto_id;
	 */
	
	@Override 
	public List<Comment> fetchAllPostComment(int postID){
		List<Comment>  allPostComment = new ArrayList<Comment>();
		String query = "Select * from Comment WHERE postID = ? order by createdAt desc";
		try {
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setInt(1, postID);
			ResultSet rSet = preparedStatement.executeQuery();
			
			while(rSet.next()) {
				Comment comment = new Comment();
				comment.setCommentID(rSet.getInt("commentID"));
				comment.setPostID(rSet.getInt("postID"));
				comment.setUserID(rSet.getInt("userID"));
				comment.setText(rSet.getString("text"));
				Date date = new Date(rSet.getTimestamp(5).getTime());
				
				comment.setCreatedAt(date);
				
				allPostComment.add(comment);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return allPostComment;
	}
	
	@Override
	public List<Comment> fetchAll() {
		// TODO Auto-generated method stub
		return null;
	}

	/*
	 * comment id    postid     userid      text      creatat
	 */
	@Override
	public boolean create(Comment com) {
		String query = "Insert into comment(postID,userID,text) values(?,?,?)";
		try {
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setInt(1,com.getPostID());
			preparedStatement.setInt(2,com.getUserID());
			preparedStatement.setString(3,com.getText());
			preparedStatement.executeUpdate();
			return true;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}

	}

	@Override
	public Comment read(int id) {
		Comment comment = new Comment();
		String query = "Select * from Comment where commentID = ?";
		try {
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setInt(1, id);
			ResultSet rSet = preparedStatement.executeQuery();
			
			while(rSet.next()) {				
				comment.setCommentID(rSet.getInt("commentID"));
				comment.setPostID(rSet.getInt("postID"));
				comment.setUserID(rSet.getInt("userID"));
				comment.setText(rSet.getString("text"));
				comment.setCreatedAt(rSet.getTimestamp(5));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
		
		return comment;
	}

	@Override
	public boolean update(Comment t) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean delete(Comment t) {
		boolean control;
		String query = "Delete from Comment where commentID = ?";
		try {
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setInt(1,t.getCommentID());
			preparedStatement.executeUpdate();
			control = true;
		} catch (SQLException e) {
			
			control = false;		
			e.printStackTrace();
		}
		return control;
	}
	
}
