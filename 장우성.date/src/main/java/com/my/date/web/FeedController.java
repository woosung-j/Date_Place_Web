package com.my.date.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.my.date.domain.Feed;
import com.my.date.domain.Hashtag;
import com.my.date.service.FeedService;


@RestController
@RequestMapping("community")
public class FeedController {
	@Autowired private FeedService feedService;
	
	@GetMapping("list")
	public ModelAndView main(HttpSession session, ModelAndView mv) {
		mv.setViewName("community/listFeed");
		return mv;
	}
		
	@GetMapping("getFeeds")
	public List<Feed> getFeeds() {
		return feedService.getFeeds();
	}
}