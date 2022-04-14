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
	public boolean create(Post t) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Post read(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean update(Post t) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean delete(Post t) {
		// TODO Auto-generated method stub
		return false;
	}
	
	

}
