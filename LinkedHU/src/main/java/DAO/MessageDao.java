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
import Interfaces.IMessageDao;
import Model.Message;
import Model.Post;


public class MessageDao implements IMessageDao{
	private String userName = "root";
	private String password = "";
	private String host = "127.0.0.1";
	private String dbName = "hello";
	private int port = 3306;
	private Connection connection;	
	private Statement statement;
	private PreparedStatement preparedStatement;
	
	
	
	public MessageDao() {
		connectDatabase();
	}
	
	public void connectDatabase() {
		String url = "jdbc:mysql://"+host+":"+port+"/"+dbName+"?characterEncoding=UTF8";
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
	public List<Message> fetchAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean create(Message t) {
		String query = "Insert into Message(senderID,receiverID,text,topic,deletionStatus,isRead,uploadedFiles) values(?,?,?,?,?,?,?)";
		try {
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setInt(1,t.getSenderID());
			preparedStatement.setInt(2,t.getReceiverID());
			preparedStatement.setString(3,t.getText());
			preparedStatement.setString(4,t.getMessageTopic());
			preparedStatement.setInt(5,t.getDeletionStatus());
			preparedStatement.setString(6,"false");
			String uploadedFiles = "";
			for(int i=0;i<t.getUploadedFiles().size();i++) {
				if(i== t.getUploadedFiles().size()-1) {
					uploadedFiles+=t.getUploadedFiles().get(i);
				}
				else {
					uploadedFiles+=t.getUploadedFiles().get(i)+"+";
				}
				
				
			}
			preparedStatement.setString(7,uploadedFiles);
			preparedStatement.executeUpdate();
			return true;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
		
	}

	@Override
	public Message read(int id) {
		String query = "Select * from Message WHERE messageID = ?";
		try {
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setInt(1,id);
			ResultSet rSet = preparedStatement.executeQuery();
			
			while(rSet.next()) {
				Message message = new Message();
				message.setMessageID(rSet.getInt("messageID"));
				message.setSenderID(rSet.getInt("senderID"));
				message.setReceiverID(rSet.getInt("receiverID"));
				message.setCreatedAt(rSet.getTimestamp(4));
				message.setText(rSet.getString("text"));
				message.setMessageTopic(rSet.getString("topic"));
				message.setDeletionStatus(rSet.getInt("deletionStatus"));
				String isRead = rSet.getString("isRead");
				if(isRead.equals("false")) {
					message.setIsRead(false);
				}
				else {
					message.setIsRead(true);
				}
				List<String> uploadedFiles = new ArrayList<String>();
				String uploadedFilesData = rSet.getString("uploadedFiles");
				if(uploadedFilesData.length() != 0) {
					String[] uploaded = uploadedFilesData.split("\\+");
					for(String s : uploaded) {
						uploadedFiles.add(s);
					}
					
				}
				message.setUploadedFiles(uploadedFiles);
				return message;
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;

	}

	@Override
	public boolean update(Message t) {
		String query = "UPDATE Message SET deletionStatus = ?,isRead = ? where messageID=?";
		try {
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setInt(1,t.getDeletionStatus());
			preparedStatement.setString(2,String.valueOf(t.getIsRead()));
			preparedStatement.setInt(3,t.getMessageID());
			preparedStatement.executeUpdate();
			return true;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Burda hata....");
			return false;
		}	
	}

	@Override
	public boolean delete(Message t) {
		boolean control;
		String query = "Delete from Message where messageID = ?";
		try {
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setInt(1,t.getMessageID());
			preparedStatement.executeUpdate();
			control = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			control = false;
					
			e.printStackTrace();
		}
		return control;
	}
	
	/*
	 * 
	 * 
	 * Links and uploads will be inserted after problems are solved
	 * 
	 * 
	 * 
	 * 
	 * */
	@Override
	public List<Message> fetchByUserID(int userID) {
		List<Message>  allUserMessages = new ArrayList<Message>();
		String query = "Select * from Message WHERE senderID = ? or receiverID = ? order by createdAt desc";
		try {
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setInt(1, userID);
			preparedStatement.setInt(2, userID);
			ResultSet rSet = preparedStatement.executeQuery();
			
			while(rSet.next()) {
				Message message = new Message();
				message.setMessageID(rSet.getInt("messageID"));
				message.setSenderID(rSet.getInt("senderID"));
				message.setReceiverID(rSet.getInt("receiverID"));
				message.setCreatedAt(rSet.getTimestamp(4));
				message.setText(rSet.getString("text"));
				message.setMessageTopic(rSet.getString("topic"));
				message.setDeletionStatus(rSet.getInt("deletionStatus"));
				String isRead = rSet.getString("isRead");
				if(isRead.equals("false")) {
					message.setIsRead(false);
				}
				else {
					message.setIsRead(true);
				}
				List<String> uploadedFiles = new ArrayList<String>();
				String uploadedFilesData = rSet.getString("uploadedFiles");
				if(uploadedFilesData.length() != 0) {
					String[] uploaded = uploadedFilesData.split("\\+");
					for(String s : uploaded) {
						uploadedFiles.add(s);
					}
					
				}
				message.setUploadedFiles(uploadedFiles);
				
				allUserMessages.add(message);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return allUserMessages;
		
	}
	@Override
	public int getLastCreatedMessageID() {
		String newMessageIDQuery = "Select messageID from message order by createdAt desc";
		int messageID = -1;
		try {
			preparedStatement = connection.prepareStatement(newMessageIDQuery);
			ResultSet rSet = preparedStatement.executeQuery();
			if(rSet.next()) {
				messageID = rSet.getInt("messageID");
			}
			return messageID;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return messageID;
		}
		
		
		
		
	}
}
