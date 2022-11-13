package com.my.date.dao;

import java.util.List;

import com.my.date.domain.Comment;

public interface CommentDao {
	List<Comment> selectComments(int feedId);
}
