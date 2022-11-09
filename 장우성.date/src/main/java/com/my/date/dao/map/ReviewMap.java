package com.my.date.dao.map;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.my.date.domain.Review;
import com.my.date.domain.ReviewDto;

public interface ReviewMap {
	List<ReviewDto> selectReviews();
	List<ReviewDto> selectReviewsByPlaceId(@Param("placeId") int placeId);
	List<ReviewDto> selectReviewsByUserId(int userId);
	String selectReviewAvg(@Param("placeId") int placeId);
	int insertReview(Review review);
	int deleteAdminReview(int reviewId);
}
