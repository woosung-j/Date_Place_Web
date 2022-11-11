package com.my.date.dao.map;

import java.util.List;

import com.my.date.domain.CommentDto;

public interface CommentMap {
	List<CommentDto> selectComments(int feedId);
}
