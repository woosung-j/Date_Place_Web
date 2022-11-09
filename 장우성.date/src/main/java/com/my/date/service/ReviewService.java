package com.my.date.service;

import java.util.List;

import com.my.date.domain.Review;

public interface ReviewService {
	List<Review> getReviews();
	List<Review> getReviewsByPlaceId(int placeId);
	double getReviewAvg(int placeId);
	int addReview(Review review);
	int delAdminReview(int reviewId);
}
