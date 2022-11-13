package com.my.date.dao;

import java.util.List;

import com.my.date.domain.CommentDto;

public interface CommentDao {
	List<CommentDto> selectComments(int feedId);
}
