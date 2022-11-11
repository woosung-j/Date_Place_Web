package com.my.date.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.my.date.domain.Feed;
import com.my.date.domain.FeedDto;
import com.my.date.service.FeedService;

@RestController
@RequestMapping("community")
public class FeedController {
	@Autowired private FeedService feedService;
	
	@GetMapping("list")
	public ModelAndView list(HttpSession session, ModelAndView mv) {
		mv.addObject("feedId", 1);
		mv.setViewName("community/listFeed");
		return mv;
	}
	
	@GetMapping("detail/{feedId}")
	public ModelAndView detail(HttpSession session, ModelAndView mv, @PathVariable int feedId) {
		mv.addObject(feedId);
		mv.setViewName("community/detailFeed");
		return mv;
	}
		
	@GetMapping("getFeeds/{feedId}")
	public List<Feed> getFeeds(@PathVariable int feedId) {
		return feedService.getFeeds(feedId);
	}
	
	@GetMapping("getFeed/{feedId}") 
	public FeedDto getDetailFeed(@PathVariable int feedId) { 
		return feedService.getFeed(feedId); 
	}
}