package com.my.date.dao.map;

import java.util.List;

import com.my.date.domain.ReviewDto;
import org.apache.ibatis.annotations.Param;

import com.my.date.domain.Review;
import com.my.date.domain.ReviewDto;

public interface ReviewMap {
	List<ReviewDto> selectReviews();
	List<ReviewDto> selectReviewsByPlaceId(int placeId);
	List<ReviewDto> selectReviewsByUserId(int userId);
	List<ReviewDto> selectDetailReviewByReviewId(int reviewId);
	String selectReviewAvg(int placeId);
	ReviewDto selectLatestReviewByPlaceId(int placeId);
	int insertReview(Review review);
	int deleteAdminReview(int reviewId);
	int deleteDetailReviewByReviewIdAndUserId(@Param("reviewId") int reviewId, @Param("userId") int userId);
}
