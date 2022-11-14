package com.my.date.service;

import java.util.List;

import com.my.date.domain.*;

public interface CommentService {
	List<CommentDto> getComments(int feedId);
	int addComment(Comment comment);
	int fixComment(Comment comment);
	int delComment(int commentId, int userId);
}
