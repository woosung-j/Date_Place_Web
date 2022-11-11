package com.my.date.service;

import java.util.List;

import com.my.date.domain.CommentDto;
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
}
