package com.my.date.dao;

import java.util.List;

import com.my.date.domain.Review;
import com.my.date.domain.ReviewDto;

public interface ReviewDao {
	List<ReviewDto> selectReviews();
	List<ReviewDto> selectReviewsByPlaceId(int placeId);
	List<ReviewDto> selectReviewsByUserId(int userId);
	String selectReviewAvg(int placeId);
	int insertReview(Review review);
	int deleteAdminReview(int reviewId);
}
