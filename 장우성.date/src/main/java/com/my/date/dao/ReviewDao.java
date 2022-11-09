package com.my.date.dao;

import java.util.List;

import com.my.date.domain.Review;

public interface ReviewDao {
	List<Review> selectReviews();
	List<Review> selectReviewsByPlaceId(int placeId);
	String selectReviewAvg(int placeId);
	int insertReview(Review review);
	int deleteAdminReview(int reviewId);
}
