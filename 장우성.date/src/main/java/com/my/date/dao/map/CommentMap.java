package com.my.date.dao.map;

import java.util.List;

import com.my.date.domain.*;

public interface CommentMap {
	List<CommentDto> selectComments(int feedId);
	int insertComment(Comment comment);
	int updateComment(Comment comment);
}
