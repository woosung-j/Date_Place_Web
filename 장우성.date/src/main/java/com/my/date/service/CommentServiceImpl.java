package com.my.date.service;

import java.util.List;

import com.my.date.domain.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.date.dao.CommentDao;

@Service
public class CommentServiceImpl implements CommentService {
	@Autowired
	private CommentDao commentDao;
	
	@Override
	public List<CommentDto> getComments(int feedId) {
		return commentDao.selectComments(feedId); 
	}
	
	@Override
	public int addComment(Comment comment) {
		return commentDao.insertComment(comment);
	}
	
	@Override
	public int fixComment(Comment comment) {
		return commentDao.updateComment(comment);
	}
	
	@Override
	public int delComment(int commentId, int userId) {
		return commentDao.deleteComment(commentId, userId);
	}
}
