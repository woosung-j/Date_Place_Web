package com.my.date.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.my.date.domain.Review;
import com.my.date.service.ReviewService;


@RestController
@RequestMapping("review")
public class ReviewController {
	@Autowired private ReviewService reviewService;	
	
	@GetMapping("list")
	public ModelAndView list(HttpSession session, ModelAndView mv) {
		mv.addObject("placeId", 1);
		mv.setViewName("review/list");
		
		return mv;
	}
	
	@GetMapping("list/{placeId}")
	public List<Review> getReviewsByPlaceId(@PathVariable int placeId) {
		return reviewService.getReviewsByPlaceId(placeId);
	}
	
	@GetMapping("avg/{placeId}")
	public double getReviewAvg(@PathVariable int placeId) {
		return reviewService.getReviewAvg(placeId);
	}	
}
