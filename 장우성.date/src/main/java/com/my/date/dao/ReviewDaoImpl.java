package com.my.date.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.date.dao.map.ReviewMap;
import com.my.date.domain.Review;
import com.my.date.domain.ReviewDto;

@Repository
public class ReviewDaoImpl implements ReviewDao{
	@Autowired private ReviewMap reviewMap;
	
	@Override
	public List<ReviewDto> selectReviews() {
		return reviewMap.selectReviews();
	}
	
	@Override
	public List<ReviewDto> selectReviewsByPlaceId(int placeId) {
		return reviewMap.selectReviewsByPlaceId(placeId);
	}
	
	@Override
	public List<ReviewDto> selectReviewsByUserId(int userId) {
		return reviewMap.selectReviewsByUserId(userId);
	}
	
	@Override
	public String selectReviewAvg(@Param("placeId") int placeId) {
		return reviewMap.selectReviewAvg(placeId);
	}
	
	@Override
	public int insertReview(Review review) {
		return reviewMap.insertReview(review);
	}
	
	@Override
	public int deleteAdminReview(int reviewId) {
		return reviewMap.deleteAdminReview(reviewId);
	}
}
