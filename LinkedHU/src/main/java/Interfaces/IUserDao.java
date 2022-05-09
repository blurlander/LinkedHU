package Interfaces;

import java.sql.Timestamp;

import java.util.List;
import java.sql.Date;

import Model.*;

public interface IUserDao extends IDao<User>{
	List<Integer> fetchAllUserLikes(int userID);
	boolean likePost(int userID,int postID);
	boolean dislikePost(int userID,int postID);
	List<UploadedFile> fetchAllUploadedFiles();
	boolean createFiles(List<UploadedFile> uploadedFiles);
	boolean deleteFile(int fileID);
	
	//boolean ban(int userID, Date ts, int type);
	int getTypefromID(int id);
	boolean ban(int ID, Date ts, int type);
	boolean liftBan(int ID,int type);
	boolean follow(int follower, int userID);
	int getFollowCount(int ID);
	boolean unfollow(int unfollower, int userID);
	List<Integer> getFollowedUserID(int studentID);
	int checkUserNameExists(String name);
	int checkEmailExists(String email);
	
}

