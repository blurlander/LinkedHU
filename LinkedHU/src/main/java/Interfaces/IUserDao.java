package Interfaces;

import java.util.List;

import Model.*;

public interface IUserDao extends IDao<User>{
	List<Integer> fetchAllUserLikes(int userID);
	boolean likePost(int userID,int postID);
	boolean dislikePost(int userID,int postID);
	List<UploadedFile> fetchAllUploadedFiles();
	boolean createFiles(List<UploadedFile> uploadedFiles);
}

