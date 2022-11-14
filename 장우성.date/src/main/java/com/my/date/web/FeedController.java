package com.my.date.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.my.date.domain.Feed;
import com.my.date.domain.FeedDto;
import com.my.date.domain.FeedTagDto;
import com.my.date.domain.Hashtag;
import com.my.date.service.FeedService;

@RestController
@RequestMapping("community")
public class FeedController {
	@Autowired private FeedService feedService;
	
	@GetMapping("")
	public ModelAndView list(HttpSession session, ModelAndView mv) {
		mv.setViewName("community/listFeed");
		return mv;
	}
	
	@GetMapping("detail/{feedId}")
	public ModelAndView detail(HttpSession session, ModelAndView mv, @PathVariable int feedId) {
		mv.addObject(feedId);
		mv.setViewName("community/detailFeed");
		return mv;
	}
	
	@GetMapping("add")
	public ModelAndView addlist(HttpSession session, ModelAndView mv) {
		mv.setViewName("community/addFeed");
		return mv;
	}
		
	@GetMapping("getFeeds")
	public List<Feed> getFeeds() {
		return feedService.getFeeds();
	}
	
	@GetMapping("getFeed/{feedId}") 
	public FeedDto getDetailFeed(@PathVariable int feedId) { 
		return feedService.getFeed(feedId); 
	}
	
	@PostMapping("addFeed")
	public int addFeed(HttpServletRequest request, @RequestBody FeedTagDto feed) {
		HttpSession session = request.getSession(false);
        if(session == null || session.getAttribute("userId") == null) {
            return 0;
        }
        int userId = (int) session.getAttribute("userId");
        feed.setUserId(userId);
        
        int isFeed = feedService.addFeed(feed);
        if(isFeed > 0 && feed.getTags().size() > 0) {
        	return feedService.addHashtags(feed.getTags(), feed.getFeedId());
        }
		return isFeed; 
	}
	
	@GetMapping("myfeed")
	public ModelAndView myFeed(HttpServletRequest request, ModelAndView mv) {
		HttpSession session = request.getSession(false);
		if (session == null || session.getAttribute("userId") == null) {
			mv.setViewName("redirect:/user/login");
		} else {
			mv.setViewName("community/myFeed");
		}
		return mv;
	}
	
	@GetMapping("community/myFeed")
	public List<FeedDto> getMyFeed(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		if (session == null || session.getAttribute("userId") == null) {
			return null;
		}
		int userId = (int) session.getAttribute("userId");

		List<FeedDto> dto = feedService.getMyFeeds(userId);
		
		return dto;
	}
}