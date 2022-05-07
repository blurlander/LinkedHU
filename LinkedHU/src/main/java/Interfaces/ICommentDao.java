package Interfaces;

import java.util.List;

import Model.Comment;

public interface ICommentDao extends IDao<Comment> {
	List<Comment> fetchAllPostComments(int postID);
	int getLastCreatedCommentID();
}
