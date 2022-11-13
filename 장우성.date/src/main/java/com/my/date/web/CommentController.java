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
import com.my.date.service.CommentService;

@RestController
@RequestMapping("comment")
public class CommentController {
	@Autowired
	private CommentService commentService;
	
	@GetMapping("")
	public ModelAndView comment(HttpSession session, ModelAndView mv) {
		mv.addObject("feedId", 1);
		mv.setViewName("comment/listComment");
		
		return mv;
	}
	
	@GetMapping("listComments/{feedId}") 
	public List<Comment> getComments(@PathVariable int feedId) {
		return commentService.getComments(feedId);
	}
}
