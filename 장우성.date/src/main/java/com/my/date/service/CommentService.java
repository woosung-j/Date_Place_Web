package com.my.date.service;

import java.util.List;

import com.my.date.domain.CommentDto;

public interface CommentService {
	List<CommentDto> getComments(int feedId);
}
