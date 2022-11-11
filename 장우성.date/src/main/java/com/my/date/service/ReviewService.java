package com.my.date.service;

import java.util.List;

import com.my.date.domain.Review;
import com.my.date.domain.ReviewDto;

public interface ReviewService {
	List<Review> getReviews();
	List<Review> getReviewsByPlaceId(int placeId);
	ReviewDto getLatestReviewByPlaceId(int placeId);
	double getReviewAvg(int placeId);
	int addReview(Review review);
	int delAdminReview(int reviewId);
}
