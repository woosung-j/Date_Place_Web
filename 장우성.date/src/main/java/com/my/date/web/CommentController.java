package com.my.date.web;

import com.my.date.domain.Comment;
import com.my.date.domain.CommentDto;
import com.my.date.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@RestController
@RequestMapping("comment")
public class CommentController {
	@Autowired
	private CommentService commentService;

	@GetMapping("listComment/{feedId}") 
	public List<CommentDto> getComments(@PathVariable int feedId) {
		return commentService.getComments(feedId);
	}
	
	@PostMapping("add")
	public int addComment(@RequestBody Comment comment, HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		if(session == null || session.getAttribute("userId") == null) {
			return 0;
		}	
		int userId = (int)session.getAttribute("userId");
		comment.setUserId(userId);
		return commentService.addComment(comment);
	}
	
	@GetMapping("fix/{feedId}/{commentId}")
	public ModelAndView fix(ModelAndView mv, @PathVariable int feedId, @PathVariable int commentId) {
		mv.addObject("feedId", feedId);
		mv.addObject("commentId", commentId);
		mv.setViewName("comment/fix");		
		return mv;
	}
	
	@PatchMapping("fix")
	public int fixComment(@RequestBody Comment comment, HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		if(session == null || session.getAttribute("userId") == null) {
			return -1;
		}
		int userId = (int)session.getAttribute("userId");
		comment.setUserId(userId);
		return commentService.fixComment(comment);	
	}
	
	@DeleteMapping("del/{commentId}")
	public int delComment(@PathVariable int commentId, HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		if(session == null || session.getAttribute("userId") == null) {
			return -1;
		}
		int userId = (int)session.getAttribute("userId");
		return commentService.delComment(commentId, userId);
	}
}
