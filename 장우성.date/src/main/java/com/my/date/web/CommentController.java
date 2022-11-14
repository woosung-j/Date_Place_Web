package com.my.date.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.my.date.domain.Comment;
import com.my.date.domain.CommentDto;
import com.my.date.service.CommentService;

@RestController
@RequestMapping("comment")
public class CommentController {
	@Autowired
	private CommentService commentService;
	
	@GetMapping("")
	public ModelAndView comment(HttpServletRequest request, ModelAndView mv) {
		HttpSession session = request.getSession(false);
		if(session == null || session.getAttribute("userId") == null) {
			mv.setViewName("redirect:/user/login");
		} else {
			
			mv.addObject("feedId", 1);
			mv.setViewName("comment/listComment");
		}
			return mv;
	}		
	
	@GetMapping("listComment/{feedId}") 
	public List<CommentDto> getComments(@PathVariable int feedId) {
		return commentService.getComments(feedId);
	}
	
	//추가
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
	
	//수정
	@GetMapping("fix/{commentId}")
	public ModelAndView fix(ModelAndView mv, @PathVariable int commentId) {
		mv.addObject("commentId", commentId);
		mv.setViewName("comment/fix");		
		return mv;
	}
	
	@PatchMapping("fix")
	public int fixComment(@RequestBody Comment comment, HttpServletRequest request) {
		comment.setUserId(1);
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
