package com.my.date.dao.map;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.my.date.domain.*;

public interface CommentMap {
	List<CommentDto> selectComments(int feedId);
	int insertComment(Comment comment);
	int updateComment(Comment comment);
	int deleteComment(@Param("commentId") int commentId, @Param("userId") int userId);
}
