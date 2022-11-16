package com.my.date.dao;

import java.util.List;
import com.my.date.domain.Review;
import com.my.date.domain.ReviewDto;

public interface ReviewDao {
	List<ReviewDto> selectReviews();
	List<ReviewDto> selectReviewsByPlaceId(int placeId);
	List<ReviewDto> selectReviewsByUserId(int userId);
	List<ReviewDto> selectDetailReviewByReviewId(int reviewId);
	List<ReviewDto> selectSearchReviewByPlaceName(String keyword);
	ReviewDto selectLatestReviewByPlaceId(int placeId);
	String selectReviewAvg(int placeId);
	int insertReview(Review review);
	int insertReviewImages(int reviewId, List<String> reviewImages);
	int deleteAdminReview(int reviewId);
	int deleteDetailReviewByReviewIdAndUserId(int reviewId, int userId);
}
