package com.my.date.dao.map;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.my.date.domain.Comment;

public interface CommentMap {
	List<Comment> selectComments(@Param("feedId")int feedId);
	int insertComment(Comment comment);
	int updateComment(Comment comment);
}
