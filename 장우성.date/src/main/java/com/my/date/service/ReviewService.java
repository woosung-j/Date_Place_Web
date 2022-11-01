package com.my.date.service;

import java.util.List;

import com.my.date.domain.Review;

public interface ReviewService {
	List<Review> getReviews();
	List<Review> getDetailReviews(int reviewId);
	List<Review> getAdminReviews();
	List<Review> getDetailAdminReviews(int reviewId);
	void addReview(Review review);
	void delReview(int reviewId);
	void delAdminReview(int reviewId);
}
