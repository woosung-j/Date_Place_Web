package com.my.date.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.my.date.dao.CommentDao;
import com.my.date.domain.Comment;

@Service
public class CommentServiceImpl implements CommentService {
	@Autowired
	private CommentDao commentDao;
	
	@Override
	public List<Comment> getComments(int feedId) {
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
}
