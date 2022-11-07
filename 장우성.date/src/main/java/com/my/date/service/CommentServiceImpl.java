package com.my.date.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
}
