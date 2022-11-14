package com.my.date.dao;

import java.util.List;

import com.my.date.domain.Comment;

public interface CommentDao {
	List<Comment> selectComments(int feedId);
	int insertComment(Comment comment);
	int updateComment(Comment comment);
}
