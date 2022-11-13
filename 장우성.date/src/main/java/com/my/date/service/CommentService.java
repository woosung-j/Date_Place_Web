package com.my.date.service;

import java.util.List;

import com.my.date.domain.Comment;

public interface CommentService {
	List<Comment> getComments(int feedId);
}
