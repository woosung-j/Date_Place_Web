package com.my.date.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.my.date.domain.Review;
import com.my.date.service.ReviewService;

@Controller
@RequestMapping("/review")
public class ReviewController {
	@Autowired private ReviewService reviewService;	
	
	@RequestMapping("/listreview")
	public String listReview() {
		return "review/listreview";
	}
	
	@ResponseBody
	@PostMapping("/listreview")
	public List<Review> getReviews() {
		return reviewService.getReviews();
	}
}
