package Interfaces;

import java.util.List;

import Model.User;

public interface IUserDao extends IDao<User>{
	List<Integer> fetchAllUserLikes(int userID);
	boolean likePost(int userID,int postID);
	boolean dislikePost(int userID,int postID);
}

