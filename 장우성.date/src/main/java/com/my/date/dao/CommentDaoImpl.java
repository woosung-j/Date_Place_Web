package com.my.date.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.date.dao.map.CommentMap;
import com.my.date.domain.Comment;

@Repository
public class CommentDaoImpl implements CommentDao {
	@Autowired
	private CommentMap commentMap; 
	
	@Override
	public List<Comment> selectComments(int feedId) {
		return commentMap.selectComments(feedId); 
	}	
}
