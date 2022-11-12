package com.my.date.service;

import java.util.List;

import com.my.date.domain.Review;
import com.my.date.domain.ReviewDto;

public interface ReviewService {
	List<ReviewDto> getReviews();
	List<ReviewDto> getReviewsByPlaceId(int placeId);
	List<ReviewDto> getReviewsByUserId(int userId);
	List<ReviewDto> getDetailReviewByReviewId(int reviewId);
	List<ReviewDto> getSearchReviewByPlaceName(String keyword);
	ReviewDto getLatestReviewByPlaceId(int placeId);
	double getReviewAvg(int placeId);
	int addReview(Review review);
	int delAdminReview(int reviewId);
	int delDetailReview(int reviewId, int userId);
}
