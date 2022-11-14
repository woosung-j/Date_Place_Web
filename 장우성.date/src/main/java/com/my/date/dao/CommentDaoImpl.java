package com.my.date.dao;

import java.util.List;

import com.my.date.domain.CommentDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.date.dao.map.CommentMap;

@Repository
public class CommentDaoImpl implements CommentDao {
	@Autowired private CommentMap commentMap;
	
	@Override
	public List<CommentDto> selectComments(int feedId) {
		return commentMap.selectComments(feedId); 
	}
	
	@Override
	public int insertComment(Comment comment) {
		return commentMap.insertComment(comment);
	}
	
	@Override
	public int updateComment(Comment comment) {
		return commentMap.updateComment(comment);
	}
}
