package Interfaces;

import java.sql.Timestamp;

import java.util.List;
import java.sql.Date;

import Model.User;

public interface IUserDao extends IDao<User>{
	List<Integer> fetchAllUserLikes(int userID);
	boolean likePost(int userID,int postID);
	boolean dislikePost(int userID,int postID);
	//boolean ban(int userID, Date ts, int type);
	int getTypefromID(int id);
	boolean ban(int ID, Date ts, int type);
	boolean liftBan(int ID,int type);
	
}

