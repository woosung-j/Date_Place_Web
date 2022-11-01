package com.my.date.dao;

import java.util.List;

import com.my.date.domain.Review;

public interface ReviewDao {
	List<Review> selectReviews();
	List<Review> detailReviews(int reviewId);
	List<Review> selectAdminReviews();
	List<Review> detailAdminReviews(int reviewId);
	void insertReview(Review review);
	void deleteReview(int reviewId);
	void deleteAdminReview(int reviewId);
}
