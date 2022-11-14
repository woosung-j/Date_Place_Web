package com.my.date.dao;

import java.util.List;

import com.my.date.domain.*;

public interface CommentDao {
	List<CommentDto> selectComments(int feedId);
	int insertComment(Comment comment);
	int updateComment(Comment comment);
}
