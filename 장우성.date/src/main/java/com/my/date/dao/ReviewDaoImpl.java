package com.my.date.dao;

import java.util.List;

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
	public ReviewDto selectLatestReviewByPlaceId(int placeId) {
		return reviewMap.selectLatestReviewByPlaceId(placeId);
	}

	@Override
	public List<ReviewDto> selectReviewsByUserId(int userId) {
		return reviewMap.selectReviewsByUserId(userId);
	}
	
	@Override
	public 	List<ReviewDto> selectDetailReviewByReviewId(int reviewId) {
		return reviewMap.selectDetailReviewByReviewId(reviewId);
	}
	
	@Override
	public List<ReviewDto> selectSearchReviewByPlaceName(String keyword){
		return reviewMap.selectSearchReviewByPlaceName(keyword);
	}
	
	@Override
	public String selectReviewAvg(int placeId) {
		return reviewMap.selectReviewAvg(placeId);
	}
	
	@Override
	public int insertReview(Review review) {
		return reviewMap.insertReview(review);
	}
	
	@Override
	public int insertReviewImages(int reviewId, List<String> reviewImages) {
		return reviewMap.insertReviewImages(reviewId, reviewImages);
	}
	
	@Override
	public int deleteAdminReview(int reviewId) {
		return reviewMap.deleteAdminReview(reviewId);
	}
	
	@Override
	public int deleteDetailReviewByReviewIdAndUserId(int reviewId, int userId) {
		return reviewMap.deleteDetailReviewByReviewIdAndUserId(reviewId, userId);
	}
}
