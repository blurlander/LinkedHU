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

import Interfaces.IDao;
import Interfaces.IPostDao;
import Model.Post;
import Model.UploadedFile;

public class PostDao implements IPostDao{
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
	public List<Post> fetchAllUserPosts(int userID){
		List<Post>  allUserPosts = new ArrayList<Post>();
		String query = "Select * from Post WHERE authorID = ? order by createdAt desc";
		try {
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setInt(1, userID);
			ResultSet rSet = preparedStatement.executeQuery();
			
			while(rSet.next()) {
				Post post = new Post();
				post.setPostID(rSet.getInt("postID"));
				post.setTitle(rSet.getString("title"));
				post.setMessageText(rSet.getString("messageText"));
				Date date = new Date(rSet.getTimestamp(4).getTime());
				
				post.setCreatedAt(date);
				post.setCommentCount(rSet.getInt("commentCount"));
				post.setLikeCount(rSet.getInt("likeCount"));
				post.setPostType(rSet.getString("postType"));
				post.setAuthorID(rSet.getInt("authorID"));
				allUserPosts.add(post);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return allUserPosts;
		
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
				Date date = new Date(rSet.getTimestamp(4).getTime());
				
				post.setCreatedAt(date);
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
	public ArrayList<UploadedFile> fetchFilesWithPostID(int postID){
		
		ArrayList<UploadedFile>  uploadedFiles = new ArrayList<UploadedFile>();
		String query = "Select * from postFile WHERE postID = ?";
		try {
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setInt(1, postID);
			ResultSet rSet = preparedStatement.executeQuery();
			
			while(rSet.next()) {
				UploadedFile file = new UploadedFile();
				
				file.setName(rSet.getString("fileName"));
				file.setExtension(rSet.getString("fileExtension"));
				file.setUploadUrl(rSet.getString("fileUrl"));
				
				uploadedFiles.add(file);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return uploadedFiles;
		
	}

	@Override
	public boolean create(Post p) {
		String query = "Insert into post values(?,?,?,?,?,?,?,?,?,?)";
		try {
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setInt(1,p.getPostID());
			preparedStatement.setString(2,p.getTitle());
			preparedStatement.setString(3,p.getMessageText());
			preparedStatement.setTimestamp(4,(Timestamp)p.getCreatedAt());
			preparedStatement.setInt(5,0);
			preparedStatement.setInt(6,0);
			preparedStatement.setString(7,p.getPostType());
			preparedStatement.setString(8,"");
			preparedStatement.setString(9,"");
			preparedStatement.setInt(10,p.getAuthorID());
			preparedStatement.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	
		for (UploadedFile file : p.getUploadedFiles()) {
			
			query = "Insert into postFile values(?,?,?,?)";
			try {
				preparedStatement = connection.prepareStatement(query);
				preparedStatement.setInt(1,p.getPostID());
				preparedStatement.setString(2,file.getName());
				preparedStatement.setString(3,file.getExtension());
				preparedStatement.setString(4,file.getUploadUrl());

				preparedStatement.executeUpdate();
	
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return false;
			}
		}
		
		return true;
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
		String query = "UPDATE post SET "
				+ "commentCount=?, "
				+ "likeCount=? WHERE postID = ? ";
		try {
			preparedStatement = connection.prepareStatement(query);
			
			preparedStatement.setInt(1,t.getCommentCount());
			preparedStatement.setInt(2,t.getLikeCount());
			preparedStatement.setInt(3,t.getPostID());
			preparedStatement.executeUpdate();
			return true;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	
	}

	@Override
	public boolean delete(Post t) {
		
		String query = "Delete from Post where postID = ?";
		try {
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setInt(1,t.getPostID());
			preparedStatement.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
		
		query = "Delete from postFile where postID = ?";
		try {
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setInt(1,t.getPostID());
			
			preparedStatement.executeUpdate();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
			return false;
					
		}
		
		return true;
		
	}
	

}


