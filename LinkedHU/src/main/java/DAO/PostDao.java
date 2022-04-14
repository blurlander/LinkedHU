package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import Interfaces.IDao;
import Model.Post;

public class PostDao implements IDao<Post>{
	private String userName = "root";
	private String password = "";
	private String host = "127.0.0.1";
	private String dbName = "hello";
	private int port = 3306;
	private Connection connection;	
	private Statement statement;
	private PreparedStatement preparedStatement;
	
	public PostDao() {
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
	public List<Post> fetchAll() {
		List<Post>  allPosts = new ArrayList<Post>();
		String query = "Select * from Post order by createdAt desc";
		try {
			preparedStatement = connection.prepareStatement(query);
			ResultSet rSet = preparedStatement.executeQuery();
			
			while(rSet.next()) {
				Post post = new Post();
				post.setPostID(rSet.getInt("postID"));
				post.setTitle(rSet.getString("title"));
				post.setMessageText(rSet.getString("messageText"));
				post.setCreatedAt(rSet.getTimestamp(4));
				post.setCommentCount(rSet.getInt("commentCount"));
				post.setLikeCount(rSet.getInt("likeCount"));
				post.setPostType(rSet.getString("postType"));
				post.setAuthorID(rSet.getInt("authorID"));
				allPosts.add(post);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return allPosts;
		
	}

	@Override
	public boolean create(Post p) {
		String query = "Insert into post values(?,?,?,?,?,?,?,?,?,?)";
		try {
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setInt(1,p.getPostID());
			preparedStatement.setString(2,p.getTitle());
			preparedStatement.setString(3,p.getMessageText());
			preparedStatement.setTimestamp(4,p.t);
			preparedStatement.setInt(5,0);
			preparedStatement.setInt(6,0);
			preparedStatement.setString(7,"Normal");
			preparedStatement.setString(8,"");
			preparedStatement.setString(9,"");
			preparedStatement.setInt(10,p.getAuthorID());
			preparedStatement.executeUpdate();
			return true;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
		
	}

	@Override
	public Post read(int id) {
		Post post = new Post();
		String query = "Select * from Post where postID = ?";
		try {
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setInt(1, id);
			ResultSet rSet = preparedStatement.executeQuery();
			
			while(rSet.next()) {
				post.setPostID(rSet.getInt("postID"));
				post.setTitle(rSet.getString("title"));
				post.setMessageText(rSet.getString("messageText"));
				post.setCreatedAt(rSet.getTimestamp(4));
				post.setCommentCount(rSet.getInt("commentCount"));
				post.setLikeCount(rSet.getInt("likeCount"));
				post.setPostType(rSet.getString("postType"));
				post.setAuthorID(rSet.getInt("authorID"));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return post;
	}

	@Override
	public boolean update(Post t) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean delete(Post t) {
		boolean control;
		String query = "Delete from Post where postID = ?";
		try {
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setInt(1,t.getPostID());
			preparedStatement.executeUpdate();
			control = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			control = false;
					
			e.printStackTrace();
		}
		return control;
	}
	
	

}
